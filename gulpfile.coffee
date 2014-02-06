gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'gulp-browserify'

gulp.task 'browserify', ->
  gulp.src 'script/app/toilets.coffee', read: false
    .pipe browserify
      transform: ['coffeeify', 'reactify']
      extensions: ['.coffee']
    .pipe gulp.dest 'build/js'

