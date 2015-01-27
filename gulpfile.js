'use strict';

var gulp = require('gulp'),
    livereload = require('gulp-livereload'),
    runSequence = require('run-sequence');

// Process our CFML files
gulp.task('cfml', function() {
    return gulp.src('./src/**/**')
        .pipe( gulp.dest('./dist') );
});


// Process the source for distribution
gulp.task('dist', [ 'cfml' ]);

// Clean our distribution folder
gulp.task('dist:clean', function( cb ) {
    var del = require('del');

    del( './dist', cb );
});


// Watch our assets, then distribute and deploy when they change
gulp.task('watch', [ 'dist' ], function() {

    // This helper lets us run a specific sequence of tasks.
    // First, we run the task supplied (like 'html')
    // Then we run dist
    // Then we check for 'changed' events and reload our shizzle
    var watchHelper = function( firstTask, ev ) {
        runSequence( firstTask, 'dist', function() {
            if ( ev.type === 'changed' ) {
                livereload.changed( ev );
            }
        });
    };

    livereload.listen();

    gulp.watch([ './src/**/**', './test/cfml/**/*.cfc' ], function( ev ) {
        watchHelper('cfml', ev );
    });
});


// Default task
gulp.task('default', [ 'dist' ]);
