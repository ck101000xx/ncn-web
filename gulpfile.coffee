gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'gulp-browserify'
concat = require 'gulp-concat'
jade = require 'gulp-jade'
clean = require 'gulp-clean'

bower = "bower_components"
build = 'build'
js = build + '/js'
lib = build + '/lib'

gulp.task 'jquery', ->
  gulp.src bower + '/jquery/jquery.js'
    .pipe gulp.dest lib + '/jquery'

gulp.task 'q', ->
  gulp.src bower + '/q/q.js'
    .pipe gulp.dest lib + '/q'

gulp.task 'react', ->
  gulp.src bower + '/react/react.js'
    .pipe gulp.dest lib + '/react'

gulp.task 'ratchet', ->
  gulp.src bower + '/ratchet/dist/ratchet.*'
    .pipe gulp.dest lib + '/ratchet'

gulp.task 'toilets', ['ratchet', 'react', 'q', 'jquery'], ->
  gulp.src 'script/app/toilets.coffee', read: false
    .pipe browserify
      standalone: "toilets"
      transform: ['coffeeify', 'reactify', 'browserify-shim']
      extensions: ['.coffee']
    .pipe concat 'toilets.js'
    .pipe gulp.dest js
  gulp.src 'template/toilets.jade'
    .pipe jade {}
    .pipe gulp.dest build

gulp.task 'clean', ->
  gulp.src(build, {read: false})
    .pipe do clean
