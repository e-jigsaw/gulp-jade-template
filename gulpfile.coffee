gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'coffee', ->
  gulp.src 'src/*.coffee'
    .pipe coffee()
    .pipe gulp.dest('build/')

gulp.task 'default', ['coffee']
gulp.task 'watch', ['default'], ->
  gulp.watch paths.coffee, ['coffee']
