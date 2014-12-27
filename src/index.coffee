gutil = require 'gulp-util'
through = require 'through2'

module.exports = ->
  transform = (file, encoding, callback)->

  flush = (callback)->

  through.obj transform, flush
