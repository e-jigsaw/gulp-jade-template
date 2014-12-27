(function() {
  var fs, gutil, jade, path, through;

  gutil = require('gulp-util');

  through = require('through2');

  jade = require('jade');

  fs = require('fs');

  path = require('path');

  module.exports = function(template) {
    var flush, transform;
    transform = function(file, encoding, callback) {
      var err, html;
      if (template == null) {
        return callback(new gutil.PluginError('gulp-jade-template', 'Template not found'));
      }
      if (file.isNull()) {
        return callback(null, file);
      }
      if (file.isStream()) {
        return callback(new gutil.PluginError('gulp-jade-template', 'Stream not supported'));
      }
      try {
        html = jade.compileFile(path.resolve(process.cwd(), template))(JSON.parse(file.contents.toString()));
      } catch (_error) {
        err = _error;
        console.log(err);
        return callback(new gutil.PluginError('gulp-jade-template', 'Jade compile error'));
      }
      file.contents = new Buffer(html);
      return callback(null, file);
    };
    flush = function(callback) {};
    return through.obj(transform, flush);
  };

}).call(this);
