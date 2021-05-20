const gulp = require('gulp')
const concat = require('gulp-concat')
const replace = require('gulp-replace-task')
const fs = require('fs')
const clean = require('gulp-clean');
const rename = require("gulp-rename");
const through2 = require('through2');


function transformLabels(str, filestem) {
  // @loop1 => main_loop1
  str = str.replace(/@/gm, `${filestem}_`)
  return str
}

function correctPushPop(str) {
  /*
   * INPUT
   * push ax, bx,cx
   * OUTPUT
   * push ax
   * push bx
   * push cx
   */
  str = str.replace(/(push|pop)(.*)/g, (_, kw, s) => {
    return kw+s.replace(/\,/g, `\n${kw} `)
  })
  return str
}

function correctAssignments(str) {
  /* INPUT
   * ax = bx
   * OUTPUT
   * mov ax, bx
   * https://regex101.com/r/EAxGD4/3
   */
  str = str.replace(/^(.*?\s*)([a-z0-9_+ \[\]]+?)\s*?\=\s*(.*)$/gmi, '$1mov\t$2, $3')
  /* INPUT
   * ax += bx
   * OUTPUT
   * add ax, bx
   * https://regex101.com/r/EAxGD4/2
   */
  str = str.replace(/^(.*?\s*)([a-z0-9_+ \[\]]+?)\s*?\+\=\s*/gmi, '$1add\t$2, ')
  str = str.replace(/^(.*?\s*)([a-z0-9_+ \[\]]+?)\s*?\-\=\s*/gmi, '$1sub\t$2, ')

  str = str.replace(/([a-z0-9_+]+?)\s*?\+\+/gi, 'inc\t$1')
  str = str.replace(/([a-z0-9_+]+?)\s*?\-\-/gi, 'dec\t$1')

  str = str.replace(/^(.*?\s*)([a-z0-9_+ \[\]]+?)\s*?\&\=\s*(.*)$/gmi, '$1and\t$2, $3')
  str = str.replace(/^(.*?\s*)([a-z0-9_+ \[\]]+?)\s*?\|\=\s*(.*)$/gmi, '$1or\t$2, $3')
  return str
}

function correctProcCall(str) {
  /*
   * INPUT
   * procname()
   * OUTPUT
   * call procname
   */
  str = str.replace(/([a-z0-9_]+?)\s*?\(\)/gi, 'call\t$1')
  return str
}

function correctSyntax(file, enc, callback) {
  let contents = file.contents.toString()
  contents = transformLabels(contents, file.stem)
  contents = correctPushPop(contents)
  // = assignment
  // += -= ++ --
  contents = correctAssignments(contents)
  // cmp and jmp -e -ge -nz -nbe
  // procName() => call procName
  contents = correctProcCall(contents)
  file.contents = Buffer.from(contents)
  callback(null, file)
}

function completeProc(file, enc, callback) {
  let contents = file.contents.toString()
  contents = contents.replace(/^\s*(proc|endp)/gm, `${file.stem} $1`)
  file.contents = Buffer.from(contents)
  callback(null, file)
}

function compileData() {
  return gulp.src('./src/data/**/*.asm')
    .pipe(concat({path: 'data.asm'}))
    .pipe(gulp.dest('./tmp'))
}
function compileCode() {
  return gulp.src('./src/code/**/*.asm')
    .pipe(through2.obj(correctSyntax))
    .pipe(concat({path: 'code.asm'}))
    .pipe(gulp.dest('./tmp'))
}
function compileProcs() {
  return gulp.src('./src/procs/**/*.asm')
    .pipe(through2.obj(completeProc))
    .pipe(through2.obj(correctSyntax))
    .pipe(concat({path: 'procs.asm'}))
    .pipe(gulp.dest('./tmp'))
}

let compile = gulp.parallel(compileCode, compileData, compileProcs)

function inject() {
  return gulp.src('template.asm')
    .pipe(replace({patterns: [{
      match: /;;DATA;;/g,
      replacement: fs.readFileSync('./tmp/data.asm', 'utf8')
    }]}))
    .pipe(replace({patterns: [{
      match: /;;CODE;;/g,
      replacement: fs.readFileSync('./tmp/code.asm', 'utf8')
    }]}))
    .pipe(replace({patterns: [{
      match: /;;PROCS;;/g,
      replacement: fs.readFileSync('./tmp/procs.asm', 'utf8')
    }]}))
    .pipe(rename('15num.asm'))
    .pipe(gulp.dest('./build'))
}

function minify() {
  return gulp.src('./build/15num.asm')
    .pipe(replace({patterns: [{
      match: /\s*;.*$/gm, // remove comments
      replacement: ''
    }]}))
    .pipe(replace({patterns: [{
      match: /:/g, // split labels
      replacement: ':\n'
    }]}))
    .pipe(replace({patterns: [{
      match: /\n{2,}/g, // remove extra newlines
      replacement: '\n'
    }]}))
    .pipe(replace({patterns: [{
      match: /^\s/gm, // remove leading space
      replacement: ''
    }]}))
    .pipe(replace({patterns: [{
      match: /\t+/g, // remove tabs
      replacement: ' '
    }]}))
    .pipe(replace({patterns: [{
      match: /[ ]{2,}/g, // remove extra spaces
      replacement: ' '
    }]}))
    .pipe(rename('15num.min.asm'))
    .pipe(gulp.dest('./build'))
}


exports.default = gulp.series(compile, inject, minify)
exports.watch = function() {
  gulp.watch('./src/procs/**/*.asm', { ignoreInitial: true }, gulp.series(compileProcs))
  gulp.watch('./src/data/**/*.asm', { ignoreInitial: true }, gulp.series(compileData))
  gulp.watch('./src/code/**/*.asm', { ignoreInitial: true }, gulp.series(compileCode))
  gulp.watch('./tmp/**/*.asm', { ignoreInitial: false }, gulp.series(inject))
}
