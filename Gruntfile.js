var path = require("path");
// Not really necessary, but using the path normalize between Windows and Unix.

module.exports = function(grunt) {

    // Load all the task managers for grunt.
    require("load-grunt-tasks")(grunt);
    var timer = require("grunt-timer"),
        now = new Date(),
        jsonDate = 'The tasks have all started at: ' + now;
    timer.init(grunt);
    grunt.log.writeln(jsonDate);

    grunt.config.init({
        pkg: grunt.file.readJSON("package.json"),
        "watch": {
            styles: {
                files: ["public/sass/**/*.scss"],
                tasks: ["sassify"],
                options: {
                    spawn: false
                }
            },
            javaScript: {
                files: ["public/js/**/*.js"],
                tasks: ["jsminify"]
            },
            cssStyles: {
                files: ["public/css/**/*.css"]
                // Currently this is handled in sass and we don't want to spawn multiple processes.
            }
        },
        /* end watch */
        copy: {
            fonts: {
                nonull: true,
                expand: true,
                flatten: true,
                cwd: 'bower_components/bootstrap-sass-official/assets/fonts/bootstrap/',
                src: ['**'],
                dest: 'public/fonts/bootstrap/'
            },
            sassFiles: {
                expand: true,
                flatten: false,
                cwd: 'bower_components/bootstrap-sass-official/assets/stylesheets/',
                src: ['**'],
                dest: 'tmp/sass/'
            },
            cssFiles: {
                src: 'bower_components/bootstrap-sweetalert/lib/sweet-alert.css',
                dest: 'tmp/css/sweet-alert.css'
            },
            javaScript: {
                src: "bower_components/jquery/dist/jquery.min.map",
                dest: "public/js/jquery.min.map"
            }
        },
        sass: {
            app: {
                options: { // Target options

                },
                files: [{
                    "tmp/css/bootstrap.css": ["tmp/sass/main.scss"]
                }, {
                    "tmp/css/style.css": ["public/sass/style.scss"],
                    "tmp/css/vieworders.css": ["public/sass/vieworders.scss"]
                }]
            }
        },
        scsslint: {
            allFiles: [
                'public/sass/**/*.scss',
            ]
        },
        svgmin: {
            dist: {
                files: {
                    'svg/widgetCompressed.svg': 'svg/widget.svg'
                }
            }
        },
        cssmin: {
            options: {
                keepSpecialComments: 0,
                banner: "/* Css min begin */"
            },
            app: {
                files: {
                    'tmp/css/bootstrap.min.css': "tmp/css/bootstrap.css",
                    'tmp/css/style.min.css': 'tmp/css/style.css',
                    'tmp/css/vieworders.min.css': 'tmp/css/vieworders.css'
                }
            } /* End app */
        },
        concat_css: {
            options: {
                nonull: true
            },
            dist: {
                files: {
                    'public/css/catcss.css': [
                        "tmp/css/bootstrap.min.css",
                        "tmp/css/sweet-alert.css",
                        "tmp/css/style.min.css",
                        "tmp/css/vieworders.min.css"
                    ]
                }
            }
        }, // end concat css
        /* End css min */
        jshint: {
            options: {
                reporter: require("jshint-stylish")
            },
            all: ["Gruntfile.js", "public/js/scripts.js"]
        },
        concat: {
            options: {
                nonull: true
            },
            dist: {
                files: [{
                    "public/js/fullAssets.js": [
                        "bower_components/jquery/dist/jquery.js",
                        "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap.js",
                        "bower_components/bootstrap-sweetalert/lib/sweet-alert.js",
                        "bower_components/spinner/spin.js"
                    ]
                }] // end files
            } // end dist
        },
        /* End concat */
        uglify: {
            scripts: {
                files: {
                    "public/js/scripts.min.js": [
                        "public/js/fullAssets.js",
                        "public/js/scripts.js"
                    ]
                }
            },
            options: {
                mangle: false,
                nonull: true
            }
        },
        clean: ["tmp"]
    });
    // Grunt default is what grunt will do if you just use grunt from the command-line.
    grunt.registerTask('sassify', ['copy', 'sass', 'cssmin', 'concat_css', 'clean']);
    grunt.registerTask('jsminify', ['jshint', "concat", "uglify"]);
    grunt.registerTask('build', ['sassify', 'jsminify']);
    grunt.registerTask("default", ["build"]);
}; /* end modules.export */
