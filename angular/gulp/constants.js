'use strict';

var path = require('path');
var gulp = require('gulp');
var conf = require('./conf');

var browserSync = require('browser-sync');

var $ = require('gulp-load-plugins')();

gulp.task('set-env', function () {
  $.env({ file: '.env.json' });
});

gulp.task('constants', ['set-env'], function () {
  var constants = {
    API_URL: process.env.API_URL
  };

  return $.ngConstant({
    name: 'rstatus.constants',
    constants: constants,
    stream: true
  })
    .pipe(gulp.dest(path.join(conf.paths.tmp, '/serve/app')));
});
