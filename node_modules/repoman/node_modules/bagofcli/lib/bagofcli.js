var _ = require('lodash'),
  async = require('async'),
  child = require('child_process'),
  colors = require('colors'),
  commander = require('commander'),
  fs = require('fs'),
  p = require('path'),
  util = require('util'),
  validator = require('validator'),
  wrench = require('wrench');

/**
 * Parse command line arguments and execute actions based on the specified commands.
 * Uses commander.js to provide -V / --version to display version number,
 * and -h / --help to display help info.
 *
 * @param {String} base: base directory where the client module is located,
 *   used as a base directory to read command file and package.json file,
 *   ideally the value would be the client's __dirname
 * @param {Object} actions: action function for each command in format: { command: { action: function () {} }},
 *   the command name in actions object is then mapped to the command name specified in commandFile
 * @param {Object} opts: optional
 *   - commandFile: relative path to command file from base directory, defaults to 'conf/commands.json'
 */
function command(base, actions, opts) {

  actions = actions || {};
  opts = opts || {};

  var commands = JSON.parse(fs.readFileSync(p.join(base, opts.commandFile || '../conf/commands.json'))),
    pkg = JSON.parse(fs.readFileSync(p.join(base, '../package.json')));

  if (actions.commands && commands.commands) {
    _.each(actions.commands, function (command, name) {
      if (commands.commands[name]) {
        commands.commands[name].action = command.action; 
      }
    });
  }

  commander.version(pkg.version);

  if (commands.options) {
    _.each(commands.options, function (option) {
      commander.option(option.arg, option.desc, option.action);
    });
  }

  _.each(commands.commands, function (command, name) {
    var program = commander
      .command(name)
      .description(command.desc);

    _.each(command.options, function (option) {
      program.option(option.arg, option.desc, option.action);
    });

    program.action(command.action);
  });

  _preCommand(commands.commands);

  commander.parse(process.argv);

  // NOTE: commander.args is populated by commander#parse,
  // hence _postCommand relies on commander#parse finishing without exiting or throwing error,
  // otherwise _postCommand won't be executed
  _postCommand(commander.args, commands.commands);
}

// Pre-command tasks:
// - if --help flag is specified, append examples after standard help output
function _preCommand(commands) {
  commander.on('--help', function () {

    var hasExample = _.pluck(_.values(commands), 'examples')
      .filter(function (elem) {
        return elem !== undefined;
      });
    if (hasExample.length > 0) {
      hasExample = hasExample.reduce(function (a, b) {
        return a.concat(b);
      });
    }
    hasExample = hasExample.length > 0;

    if (hasExample) {
      
      console.log('  Examples:\n');

      Object.keys(commands).forEach(function (command) {
        if (!_.isEmpty(commands[command].examples)) {
          console.log('    %s:', command);
          commands[command].examples.forEach(function (example) {
            console.log('      %s', example);
          });
        }
      });
    }
  });
}


// Post-command tasks:
// - if there's no command, display help then exit
// - if command is unknown, display error message then exit
// - if there's command, validate arguments then exit
function _postCommand(args, commands) {

  function _validate(arg, commandArg) {
    return function (rule) {
      if (validator.validators.hasOwnProperty(rule)) {
        var isValid = validator.validators[rule](arg);
        if (isValid === null || isValid === false) {
          exit(new Error(util.format('Invalid argument: <%s> must be %s', commandArg.name, rule)));
        }
      } else {
        exit(new Error(util.format('Invalid argument rule: %s', rule)));
      }
    };
  }

  if (!args) {
    return;

  } else if (args.length === 0) {
    // 2 -> 'node' and 'somecommand'
    // which means that the command is executed without args, hence display help menu
    // NOTE: this check is needed because for some reason commander.args
    // also returns empty array when one of the args is an opt (-- prefixed)
    if (process.argv.length === 2) {
      commander.help();
    }

  } else {
    var lastArg = args[args.length - 1],
      commandName = lastArg._name,
      commandArgs = (commands[commandName]) ? commands[commandName].args : undefined;

    // non-object last arg means command is not configured in setup
    if (typeof lastArg !== 'object') {
      exit(new Error(util.format('Unknown command: %s, use --help for more info', lastArg)));

    } else if (commandArgs && commandArgs.length > 0) {
      var programName = lastArg.parent._name;

      // display usage info when expected arguments don't exist
      if (args.length === 1) {
        exit(new Error(util.format('Usage: %s %s %s', programName, commandName, commandArgs.map(function (arg) {
          return util.format((arg.optional) ? '[%s]' : '<%s>', arg.name);
        }).join(' '))));
      } else {
        // validate arguments as configured in commands setup
        for (var i = 0, ln = commandArgs.length; i < ln; i += 1) {
          if (!commandArgs[i].optional) {
            commandArgs[i].rules.forEach(_validate(args[i], commandArgs[i]));
          }
        }
      }
    }
  }
}

/**
 * Execute a one-liner command.
 * Both stderr and stdout will be logged via console.error/log accordingly.
 * Fallthrough is handy in situation where there are multiple execs running in sequence/parallel,
 * and they all have to be executed regardless of success/error on either one of them.
 *
 * @param {String} command: command to execute
 * @param {Boolean} fallthrough: allow error to be camouflaged as a non-error
 * @param {Function} cb: standard cb(err, result) callback
 */
function exec(command, fallthrough, cb) {

  var _exec = child.exec(command, function (err) {
    var result;
    if (err && fallthrough) {
      // camouflage error to allow other execs to keep running
      result = err;
      err = null;
    }
    cb(err, result);
  });

  _exec.stdout.on('data', function (data) {
    process.stdout.write(data.green);
  });

  _exec.stderr.on('data', function (data) {
    process.stderr.write(data.red);
  });
}

/**
 * Handle process exit based on the existence of error.
 * This is handy for command-line tools to use as the final callback.
 * Exit status code 1 indicates an error, exit status code 0 indicates a success.
 * Error message will be logged to the console. Result object is only used for convenient debugging.
 *
 * @param {Error} err: error object existence indicates the occurence of an error
 * @param {Object} result: result object
 */
function exit(err, result) {
  if (err) {
    console.error(err.message.red);
    process.exit(1);
  } else {
    process.exit(0);
  }
}

/**
 * A higher order function that returns a process exit callback,
 * with error and success callbacks to handle error and result accordingly.
 * Exit status code 1 indicates an error, exit status code 0 indicates a success.
 *
 * @param {Function} errorCb: error callback accepts error argument, defaults to logging to console error
 * @param {Function} successCb: success callback accepts result argument, defaults to logging to console log
 */
function exitCb(errorCb, successCb) {

  if (!errorCb) {
    errorCb = function (err) {
      console.error(err.message.red);
    };
  }

  if (!successCb) {
    successCb = function (result) {
      console.log(result.green);
    };
  }

  return function (err, result) {
    if (err) {
      errorCb(err);
      process.exit(1);
    } else {
      successCb(result);
      process.exit(0);
    }
  };
}

/**
 * Get an array of files contained in specified items.
 * When a directory is specified, all files contained within that directory and its sub-directories will be included.
 *
 * @param {Array} items: an array of files and/or directories
 * @param {Object} opts: optional
 *   - match: regular expression to match against the file name
 * @return {Array} all files
 */
function files(items, opts) {
  opts = opts || {};
  var data = [];

  function addMatch(item) {
    if (opts.match === undefined || (opts.match && item.match(new RegExp(opts.match)))) {
      data.push(item);
    }
  }

  items.forEach(function (item) {
    var stat = fs.statSync(item);

    if (stat.isFile()) {
      addMatch(item);

    } else if (stat.isDirectory()) {
      var _items = wrench.readdirSyncRecursive(item);
      _items.forEach(function (_item) {
        _item = p.join(item, _item);
        if (fs.statSync(_item).isFile()) {
          addMatch(_item);
        }
      });
    }
  });
  return data;
}

/**
 * Synchronously read file based on these rules:
 * - if path is absolute, then check file at absolute path first
 * - if path is relative, then check file at current working directory
 * - if none of the above exists, check file at user home directory
 * - if none exists, throw an error
 * This allows simple file lookup which allows various locations.
 *
 * @param {String} file: the file name to read
 * @param {Object} opts: optional
 * - platform: needed for unit tests to override platform since node v0.11.x
 *             https://github.com/trevnorris/node/commit/c80f8fa8f108d8db598b260ddf26bafd2ec8a1f8
 * @return {String} content of the file
 */
function lookupFile(file, opts) {
  opts = opts || {};
  var data,
    platform = opts.platform || process.platform,
    baseDir = file.match(/^\//) ? p.dirname(file) : process.cwd(),
    homeDir = process.env[(platform === 'win32') ? 'USERPROFILE' : 'HOME'],
    files = _.map([ baseDir, homeDir ], function (dir) {
      return p.join(dir, file.match(/^\//) ? p.basename(file) : file);
    });

  for (var i = 0, ln = files.length; i < ln; i += 1) {
    try {
      data = fs.readFileSync(files[i]);
      break;
    } catch (err) {
    }
  }

  if (data) {
    return data;
  } else {
    throw new Error('Unable to lookup file in ' + files.join(', '));
  }
}

/**
 * Execute a command with an array of arguments.
 * E.g. command: make, arguments: -f somemakefile target1 target2 target3
 *      will be executed as: make -f somemakefile target1 target2 target3
 * NOTE: process.stdout.write and process.stderr.write are used because console.log adds a newline
 *
 * @param {String} command: command to execute
 * @param {Array} args: command arguments
 * @param {Function} cb: standard cb(err, result) callback
 */
function spawn(command, args, cb) {

  var _spawn = child.spawn(command, args);

  _spawn.stdout.on('data', function (data) {
    process.stdout.write(data.green);
  });

  _spawn.stderr.on('data', function (data) {
    process.stderr.write(data.red);
  });

  _spawn.on('exit', function (code) {
    cb((code !== 0) ? new Error(code) : undefined, code);
  });
}

exports.command = command;
exports._preCommand = _preCommand;
exports._postCommand = _postCommand;
exports.exec = exec;
exports.exit = exit;
exports.exitCb = exitCb;
exports.files = files;
exports.lookupFile = lookupFile;
exports.spawn = spawn;
