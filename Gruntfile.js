'use strict';
var LIVERELOAD_PORT = 35729;

module.exports = function (grunt) {
    require('load-grunt-tasks')(grunt);
    require('time-grunt')(grunt);

    // configurable paths
    grunt.initConfig({
        watch: {
            rst: {
                files: ['source/{,*/}*.rst'],
                tasks: ['shell:makeHTML']
            },
            livereload: {
                options: {
                    livereload: LIVERELOAD_PORT
                },
                files: [
                    'build/html/{,*/}*.html'
                ]
            }
        },
        clean: {
            dist: {
                files: [{
                    dot: true,
                    src: [
                        '.tmp',
                        '<%= yeoman.dist %>/*',
                        '!<%= yeoman.dist %>/.git*'
                    ]
                }]
            },
            server: '.tmp'
        },
        shell: {
            makeHTML: {
                command: 'make html'
            },
        },
        connect: {
            options: {
                port: 9000,
            },
            livereload: {
                options: {
                    livereload: LIVERELOAD_PORT,
                    base: [
                        'build/html',
                    ]
                }
            }
        },
				open: {
	        server: {
	            path: 'http://localhost:9000'
	        }
				}


    });

    grunt.registerTask('server', function (target) {
        grunt.task.run([
            'shell:makeHTML',
            'connect:livereload',
            'open',
            'watch'
        ]);
    });

    grunt.registerTask('default', [
        'server'
    ]);
};
