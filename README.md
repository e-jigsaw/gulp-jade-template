gulp-jade-template
==================

[![npm version](https://badge.fury.io/js/gulp-jade-template.svg)](http://badge.fury.io/js/gulp-jade-template) [![dependency Status](https://david-dm.org/e-jigsaw/gulp-jade-template/status.svg)](https://david-dm.org/e-jigsaw/gulp-jade-template) [![devDependency Status](https://david-dm.org/e-jigsaw/gulp-jade-template/dev-status.svg)](https://david-dm.org/e-jigsaw/gulp-jade-template#info=devDependencies)

gulp plugin for jade template

# Usage

This plugin compile [Jade](http://jade-lang.com/) template with `vinyl.contents` as local variables.

## Example

`example.json`:

```json
{
  "name": {
    "first": "Taro",
    "last":  "Momo"
  }
}
```

`example.jade`:

```jade
p Hello, #{name.first} #{name.last}
```

`gulpfile.coffee`:

```coffee
gulp = require 'gulp'
jadeTemplate = require 'gulp-jade-template'
data = require 'gulp-data'

gulp.task 'jade', ->
  gulp.src 'example.json'
    .pipe data (file)-> require file.path
    .pipe jadeTemplate 'example.jade'
    .pipe gulp.dest 'example.html'
```

run task:

```
% gulp jade
% cat example.html
<p>Hello, Taro Momo</p>
```

# Installation

```
% npm install gulp-jade-template
```

# Requirements

* Node.js
* gulp

# Build

```
% gulp
```

# Test

```
% npm test
```

# Author

* jigsaw (http://jgs.me, [@e-jigsaw](http://github.com/e-jigsaw))

# License

MIT

The MIT License (MIT)

Copyright (c) 2014 Takaya Kobayashi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
