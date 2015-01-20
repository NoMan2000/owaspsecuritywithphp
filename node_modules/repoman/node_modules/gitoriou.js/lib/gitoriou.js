/**
 *
 * Copyright(c) 2012 Christophe Hamerling <christophe.hamerling@gmail.com>
 * MIT Licensed
 */
var util = require('util')
  , xml2js = require('xml2js')
  , request = require('request');


var Gitorious = function Gitorious(options) {
  this.options = options || {};
  if (!this.options.url) throw new Error('url is mandatory');
  
  this.parser = new xml2js.Parser({ignoreAttrs : true, explicitArray:false});
}
exports.Gitorious = Gitorious;

/**
 * Get all the projects information
 */
Gitorious.prototype.getProjects = function(done) {
  var url = this.options.url + '/projects.xml';
  var self = this;
  request(url, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      //console.log(body)
      self.parser.parseString(body, done);
    } else {
      handleError(error, response, done);
    }
  });  
}

/**
 * Get a project information
 */
Gitorious.prototype.getProject = function(name, done) {
  var url = this.options.url + '/' + name + '.xml';
  var self = this;
  request(url, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      //console.log(body)
      self.parser.parseString(body, done);
    } else {
      handleError(error, response, done);
    }
  });  
}

var handleError = function(error, response, done) {
  if (error) {
    done(error)
  } else {
    done(new Error('Bad HTTP response : ' + response.statusCode))
  }
}