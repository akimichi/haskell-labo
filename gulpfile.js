var gulp = require('gulp');
var gutil = require('gulp-util');
var mocha = require('gulp-mocha');
var coffee = require('gulp-coffee');
var foreach = require('gulp-foreach');
var tap = require('gulp-tap');
var docco = require("gulp-docco");
var ghPages = require('gulp-gh-pages');
var exec = require('child_process').exec;
// var runSequence = require('run-sequence');


// gulp.task('test', function (cb) {
//   exec('stack test', function (err, stdout, stderr) {
//     console.log(stdout);
//     // console.log(stderr);
//     cb(err);
//   });
// });

// gulp.task('default', ['test']);
