const gulp = require('gulp')
const concat = require('gulp-concat')
const replace = require('gulp-replace-task')
const fs = require('fs')
const clean = require('gulp-clean');
const rename = require("gulp-rename");
const through2 = require('through2');


function transformLabels(file, enc, callback) {
  let contents = file.contents.toString()
  contents = contents.replace(/@/gm, `${file.stem}_`)
  file.contents = Buffer.from(contents)
  callback(null, file)
}

function completeProc(file, enc, callback) {
  let contents = file.contents.toString()
  contents = contents.replace(/^(proc|endp)/gm, `${file.stem} $1`)
  file.contents = Buffer.from(contents)
  callback(null, file)
}

function pre(done) {
  return gulp.src('./build/', {read: false})
    .pipe(clean())
  done()
}

function compileData() {
  return gulp.src('./src/data/**/*.asm')
    .pipe(concat({path: 'data.asm'}))
    .pipe(gulp.dest('./tmp'))
}
function compileCode() {
  return gulp.src('./src/code/**/*.asm')
    .pipe(through2.obj(transformLabels))
    .pipe(concat({path: 'code.asm'}))
    .pipe(gulp.dest('./tmp'))
}
function compileProcs() {
  return gulp.src('./src/procs/**/*.asm')
    .pipe(through2.obj(completeProc))
    .pipe(through2.obj(transformLabels))
    .pipe(concat({path: 'procs.asm'}))
    .pipe(gulp.dest('./tmp'))
}

let compile = gulp.parallel(compileCode, compileData, compileProcs)

function inject() {
  return gulp.src('template.asm')
    .pipe(
      replace({
        patterns: [
          {
            match: /;;DATA;;/g,
            replacement: fs.readFileSync('./tmp/data.asm', 'utf8')
          }
        ]
      })
    )
    .pipe(
      replace({
        patterns: [
          {
            match: /;;CODE;;/g,
            replacement: fs.readFileSync('./tmp/code.asm', 'utf8')
          }
        ]
      })
    )
    .pipe(
      replace({
        patterns: [
          {
            match: /;;PROCS;;/g,
            replacement: fs.readFileSync('./tmp/procs.asm', 'utf8')
          }
        ]
      })
    )
    .pipe(
      replace({
        patterns: [
          {
            match: /;.*$/gm,
            replacement: ''
          }
        ]
      })
    )
    .pipe(
      replace({
        patterns: [
          {
            match: /\n{2,}/g,
            replacement: '\n'
          }
        ]
      })
    )
    .pipe(rename('15num.asm'))
    .pipe(gulp.dest('./build'))
}

function post() {
  return gulp.src('./tmp/', {read: false})
    .pipe(clean())
}

exports.default = gulp.series(compile, inject)
exports.watch = function() {
  gulp.watch('./src/procs/**/*.asm', { ignoreInitial: false }, gulp.series(compileProcs, inject))
  gulp.watch('./src/data/**/*.asm', { ignoreInitial: false }, gulp.series(compileData, inject))
  gulp.watch('./src/code/**/*.asm', { ignoreInitial: false }, gulp.series(compileCode, inject))
}
