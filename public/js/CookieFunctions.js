/*jslint
browser: true,
couch: false,
devel: false,
node: false,
rhino: false,
passfail: false,
ass: false,
bitwise: false,
closure: true,
continue: false,
debug: true,
eqeq: false,
evil: false,
forin: false,
newcap: false,
nomen: false,
plusplus: false,
regexp: false,
unparam: false,
sloppy: false,
stupid: false,
sub: false,
todo: true,
vars: true,
white: false
*/
/*global $, jQuery, alert, Spinner, qbaka */
(function setCookies() {
    'use strict';
    // Code taken from: https://developer.mozilla.org/en-US/docs/Web/API/document.cookie
    // Note:  For this to work with PHP, the PHP values have to be stored in a different way.  Updating to fix.
    if (!window.localStorage) {
        Object.defineProperty(window, "localStorage", new (function () {
            var aKeys = [], oStorage = {};
            Object.defineProperty(oStorage, "getItem", {
                value: function (sKey) { return sKey ? this[sKey] : null; },
                writable: false,
                configurable: false,
                enumerable: false
            });
            Object.defineProperty(oStorage, "key", {
                value: function (nKeyId) { return aKeys[nKeyId]; },
                writable: false,
                configurable: false,
                enumerable: false
            });
            Object.defineProperty(oStorage, "setItem", {
                value: function (sKey, sValue) {
                    if (!sKey) { return; }
                    document.cookie = escape(sKey) + "=" + escape(sValue) + "; expires=Tue, 19 Jan 2038 03:14:07 GMT; path=/";
                },
                writable: false,
                configurable: false,
                enumerable: false
            });
            Object.defineProperty(oStorage, "length", {
                get: function () { return aKeys.length; },
                configurable: false,
                enumerable: false
            });
            Object.defineProperty(oStorage, "removeItem", {
                value: function (sKey) {
                  if(!sKey) { return; }
                  document.cookie = escape(sKey) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
                },
                writable: false,
                configurable: false,
                enumerable: false
            });
            this.get = function () {
              var iThisIndx;
              for (var sKey in oStorage) {
                iThisIndx = aKeys.indexOf(sKey);
                if (iThisIndx === -1) { oStorage.setItem(sKey, oStorage[sKey]); }
                else { aKeys.splice(iThisIndx, 1); }
                delete oStorage[sKey];
              }
              for (aKeys; aKeys.length > 0; aKeys.splice(0, 1)) { oStorage.removeItem(aKeys[0]); }
              for (var aCouple, iKey, nIdx = 0, aCouples = document.cookie.split(/\s*;\s*/); nIdx < aCouples.length; nIdx++) {
                aCouple = aCouples[nIdx].split(/\s*=\s*/);
                if (aCouple.length > 1) {
                  oStorage[iKey = unescape(aCouple[0])] = unescape(aCouple[1]);
                  aKeys.push(iKey);
                }
              }
              return oStorage;
            };
            this.configurable = false;
            this.enumerable = true;
          })());
    }

    Storage.prototype.setObject = function (key, value) {
        this.setItem(key, JSON.stringify(value));
    };
    Storage.prototype.getObject = function (key) {
        var value = this.getItem(key);
        return value && JSON.parse(value);
    };
    var CookieFunctions = {
        getCookie: function (sKey) {
            if (!sKey) { return null; }
            // if (sessionStorage) {
            //     return sessionStorage.getItem(sKey);
            // }
            return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
        },
        setCookie: function (sKey, sValue, vEnd, sPath, sDomain, bSecure) {
            if (sessionStorage) {
                sessionStorage.setItem(sKey, sValue);
            }

            if (!sKey || /^(?:expires|max\-age|path|domain|secure)$/i.test(sKey)) { return false; }
            var sExpires = "";
            if (vEnd) {
                switch (vEnd.constructor) {
                case Number:
                    sExpires = vEnd === Infinity ? "; expires=Fri, 31 Dec 9999 23:59:59 GMT" : "; max-age=" + vEnd;
                    break;
                case String:
                    sExpires = "; expires=" + vEnd;
                    break;
                case Date:
                    sExpires = "; expires=" + vEnd.toUTCString();
                    break;
                }
            }
            document.cookie = encodeURIComponent(sKey) + "=" + encodeURIComponent(sValue) + sExpires + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "") + (bSecure ? "; secure" : "");
            return true;
        },
        removeItem: function (sKey, sPath, sDomain) {
            if (sessionStorage && !sessionStorage.getItem(sKey)) { return false; }
            if (!this.hasItem(sKey)) { return false; }
            if (sessionStorage) {sessionStorage.removeItem(sKey); }
            document.cookie = encodeURIComponent(sKey) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "");
            return true;
        },
        hasItem: function (sKey) {
            if (!sKey) { return false; }
            if (sessionStorage) {  }
            return (new RegExp("(?:^|;\\s*)" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=")).test(document.cookie);
        },
        keys: function () {
            var aKeys = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/);
            for (var nLen = aKeys.length, nIdx = 0; nIdx < nLen; nIdx++) { aKeys[nIdx] = decodeURIComponent(aKeys[nIdx]); }
            return aKeys;
        },
        relPathToAbs : function (sRelPath) {
            var nUpLn, sDir = "", sPath = location.pathname.replace(/[^\/]*$/, sRelPath.replace(/(\/|^)(?:\.?\/+)+/g, "$1"));
            for (var nEnd, nStart = 0; nEnd = sPath.indexOf("/../", nStart), nEnd > -1; nStart = nEnd + nUpLn) {
                nUpLn = /^\/(?:\.\.\/)*/.exec(sPath.slice(nEnd))[0].length;
                sDir = (sDir + sPath.substring(nStart, nEnd)).replace(new RegExp("(?:\\\/+[^\\\/]*){0," + ((nUpLn - 1) / 3) + "}$"), "/");
            }
            return sDir + sPath.substr(nStart);
        }
    },
        objHolder = {},
        checkStorage = function() {
            if (typeof Storage !== undefined) {
                if (typeof sessionStorage === "object") { return sessionStorage;}
                if (typeof localStorage === "object") { return localStorage;}
            }
            return false;
        },
        setCookieProperties = function (obj) {
            obj = obj || {};
            if (obj.rootPath === null) {
                return false;
            }
            if (window.sessionStorage) {
                sessionStorage.setItem("rootPath", obj.rootPath);
                sessionStorage.setItem("reroutePath", obj.reroutePath);
            }
            Object.defineProperties(CookieFunctions, {
                "rootPath": {
                    value: obj.rootPath,
                    writable: false,
                    configurable: false,
                    enumerable: true
                },
                "reroutePath": {
                    value: obj.reroutePath,
                    writable: false,
                    configurable: false,
                    enumerable: true
                },
                "passwordStrength": {
                    value : function(password)  {
                        var res = password.match(/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/);
                        if (res) {
                            return true;
                        }
                        return false;
                    },
                    writable: false,
                    configurable: false,
                    enumerable: false
                },
                "passwordExpression": {
                    value : "Must be at least 8 characters, two uppercase, two lowercase, two special characters or numbers.",
                    writable: false,
                    configurable: false,
                    enumerable: false
                }
            });
            window.CookieFunctions = CookieFunctions;
        }, // End CookieFunctions
        testCookiesEnabled = function() {
            var cookieEnabled = (navigator.cookieEnabled) ? true : false;
            if (typeof navigator.cookieEnabled === "undefined" && !cookieEnabled) {
                document.cookie="testcookie";
                cookieEnabled = (document.cookie.indexOf("testcookie") !== -1) ? true : false;
            }
            return cookieEnabled;
        };
    objHolder.rootPath = window.location.origin + '/';
    objHolder.reroutePath = objHolder.rootPath + 'public/jsHelper/reroute.php';
    setCookieProperties(objHolder);
}());