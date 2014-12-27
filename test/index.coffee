assert = require 'power-assert'
jade = require '../src/index.coffee'
gutil = require 'gulp-util'

it 'should compile with template', (callback)->
  stream = jade 'test/fixture.jade'
  contents =
    title: 'title'
    article: '<h1>title</h1><p>article</p>'

  stream.once 'data', (file)->
    assert.equal file.contents.toString(), '<h1>title<article><h1>title</h1><p>article</p></article></h1>'
    callback()

  stream.write new gutil.File
    contents: new Buffer JSON.stringify contents

  stream.end()
