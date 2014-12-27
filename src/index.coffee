gutil = require 'gulp-util'
through = require 'through2'
jade = require 'jade'
fs = require 'fs'
path = require 'path'

module.exports = (template)->
  transform = (file, encoding, callback)->
    if !template? then return callback new gutil.PluginError('gulp-jade-template', 'Template not found')
    if file.isNull() then return callback null, file
    if file.isStream() then return callback new gutil.PluginError('gulp-jade-template', 'Stream not supported')

    try
      html = jade.compileFile(path.resolve(process.cwd(), template))(JSON.parse file.contents.toString())
    catch err
      console.log err
      return callback new gutil.PluginError('gulp-jade-template', 'Jade compile error')

    file.contents = new Buffer html
    callback null, file

  through.obj transform
