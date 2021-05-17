const gulp = require('gulp')
const concat = require('gulp-concat')
const replace = require('gulp-replace-task')
const fs = require('fs')
const clean = require('gulp-clean');
const rename = require("gulp-rename");

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
    .pipe(concat({path: 'code.asm'}))
    .pipe(gulp.dest('./tmp'))
}
function compileProcs() {
  return gulp.src('./src/procs/**/*.asm')
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
    .pipe(rename('15num.asm'))
    .pipe(gulp.dest('./build'))
}

function post() {
  return gulp.src('./tmp/', {read: false})
    .pipe(clean())
}

exports.default = gulp.series(compile, inject)
exports.watch = function() {
  gulp.watch('./src/procs/**/*.asm', gulp.series(compileProcs, inject))
  gulp.watch('./src/data/**/*.asm', gulp.series(compileData, inject))
  gulp.watch('./src/code/**/*.asm', gulp.series(compileCode, inject))
}
