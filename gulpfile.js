var gulp = require('gulp');
var nodemon = require('gulp-nodemon');

gulp.task('default', function(){
    nodemon({
        script: './js/server/app.js',
        watch: ['./js/server'],
        env: { 'NODE_ENV': 'development' },
    });
});