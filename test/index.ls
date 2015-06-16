require! {
  \power-assert : assert
  \gulp-util : gutil
}

jade = unless process.env.CI is \true then require \../src/ else require \../build/

it 'should compile with template', (callback)->
  stream = jade \test/fixture.jade
  contents =
    title: \title
    article: \<h1>title</h1><p>article</p>

  stream.once \data, (file)->
    assert.equal file.contents.toString!, \<h1>title<article><h1>title</h1><p>article</p></article></h1>
    callback!

  stream.write new gutil.File do
    contents: new Buffer JSON.stringify contents

  stream.end!
