<img align="right" src="https://raw.github.com/cliffano/bagofcli/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://secure.travis-ci.org/cliffano/bagofcli.png?branch=master)](http://travis-ci.org/cliffano/bagofcli)
[![Dependencies Status](https://david-dm.org/cliffano/bagofcli.png)](http://david-dm.org/cliffano/bagofcli)
[![Coverage Status](https://coveralls.io/repos/cliffano/bagofcli/badge.png?branch=master)](https://coveralls.io/r/cliffano/bagofcli?branch=master)
[![Published Version](https://badge.fury.io/js/bagofcli.png)](http://badge.fury.io/js/bagofcli)
<br/>
[![npm Badge](https://nodei.co/npm/bagofcli.png)](http://npmjs.org/package/bagofcli)

Bag Of CLI
----------

Bag Of CLI contains CLI utility functions.

Installation
------------

    npm install bagofcli

or as a dependency in package.json file:

    "dependencies": {
      "bagofcli": "x.y.z"
    }

Usage
-----

Commands:

    // create conf/commands.json file containing commands configuration

    {
      "options": [
        { "arg": "-f, --file <file>", "desc": "This is a global option, applicable to all commands." }
      ],
      "commands": {
        "command1": {
          "desc": "This is the first command",
          "options": [
            { "arg": "-r, --registry <registry>", "desc": "This is a command option, applicable only to command1"}
          ],
          "examples": [
            "<bin> command1 --registry someregistry"
          ]
        },
        "command2": {
          "desc": "This is the second command",
          "options": [
            { "arg": "-d, --debug", "desc": "This is a command option, applicable only to command2"}
          ],
          "examples": [
            "<bin> command2 --debug"
          ]
        }
      }
    }

    // setup command handlers

    var bag = require('bagofcli');

    var actions = {
      commands: {
        command1: {
          action: function (args) {
            console.log(args.registry);
          }
        },
        command2: {
          action: function (args) {
            console.log(args.debug); 
          }
        }
      }
    };

    bag.command(__dirname, actions);

Check out [lib/bagofcli.js](https://github.com/cliffano/bagofcli/blob/master/lib/bagofcli.js) for more utility functions.