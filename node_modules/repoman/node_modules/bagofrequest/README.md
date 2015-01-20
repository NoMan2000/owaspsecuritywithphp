<img align="right" src="https://raw.github.com/cliffano/bagofrequest/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://secure.travis-ci.org/cliffano/bagofrequest.png?branch=master)](http://travis-ci.org/cliffano/bagofrequest)
[![Dependencies Status](https://david-dm.org/cliffano/bagofrequest.png)](http://david-dm.org/cliffano/bagofrequest)
[![Published Version](https://badge.fury.io/js/bagofrequest.png)](http://badge.fury.io/js/bagofrequest)
<br/>
[![npm Badge](https://nodei.co/npm/bagofrequest.png)](http://npmjs.org/package/bagofrequest)

Bag Of Request
--------------
<img align="right" src="https://raw.github.com/cliffano/bagofrequest/master/avatar.jpg" alt="Avatar"/>

Bag Of Request contains request utility functions.

bag.request uses [http://github.com/mikeal/request](mikeal/request), with:

* proxy setting based on environment variables http_proxy, HTTP_PROXY, https_proxy, HTTPS_PROXY
* excludes proxy if URL host is localhost or 127.0.0.1
* thirty seconds default timeout
* accepts self-signed SSL certificates
* follow redirects by default
* wildcard status code matching (e.g. 2xx, 50x)
* custom handlers based on status code
* default unexpected status code error with request body included in message
* all bag.request defaults can be overriden by passing mikeal/request options
* retry support with configurable delay 

bag.proxy is a convenient function to retrieve proxy based on URL and environment value:

* if URL uses http, then sets proxy to http_proxy or HTTP_PROXY
* if URL uses https, then sets proxy to htps_proxy or HTTPS_PROXY or http_proxy or HTTP_PROXY
* if URL does not have a protocol, then assume http protocol
* if URL is not provided, then sets proxy to http_proxy or HTTP_PROXY or https_proxy or HTTPS_PROXY

Installation
------------

    npm install bagofrequest

or as a dependency in package.json file:

    "dependencies": {
      "bagofrequest": "x.y.z"
    }

Usage
-----

    var bag = require('bagofrequest');

    bag.request('get', 'http://google.com.au', { timeout: 30000 }, function (err, result) {
    });

    var proxy = bag.proxy('https://google.com.au');
