// Karma configuration
// http://karma-runner.github.io/0.10/config/configuration-file.html

module.exports = function(config) {
  config.set({

    preprocessors: {
      '**/*.coffee': ['coffee']
    },
    coffeePreprocessor: {
      // options passed to the coffee compiler
      options: {
        bare: true,
        sourceMap: false
      },
      // transforming the filenames
      transformPath: function(path) {
        return path.replace(/\.coffee$/, '.js');
      }
    },

    // base path, that will be used to resolve files and exclude
    basePath: '',

    // testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine', "requirejs"],

    // list of files / patterns to load in the browser
    files: [
      {pattern: 'app/bower_components/angular/angular.js', included: false },
      {pattern: 'app/bower_components/angular-mocks/angular-mocks.js', included: false },

      {pattern: 'app/bower_components/angular-route/angular-route.js', included: false },
      {pattern: 'app/bower_components/angular-cookies/angular-cookies.js', included: false },
      {pattern: 'app/bower_components/angular-sanitize/angular-sanitize.js', included: false },
      {pattern: 'app/bower_components/angular-resource/angular-resource.js', included: false },

      {pattern: 'app/bower_components/requirejs-text/text.js', included: false },
      {pattern: 'app/bower_components/requirejs-domready/domReady.js', included: false },
      {pattern: 'app/bower_components/sass-bootstrap/js/dropdown.js', included: false },
      {pattern: 'app/bower_components/lodash/dist/lodash.js', included: false },
      {pattern: 'app/bower_components/hammerjs/hammer.js', included: false },

      {pattern: 'app/bower_components/jquery/dist/jquery.js', included: false },
      {pattern: 'app/bower_components/woodman/dist/woodman-amd.js', included: false },

      {pattern: '.tmp-dist/scripts/vendor/*.js', included: false },
      {pattern: '.tmp-dist/scripts/*.js', included: false },
      {pattern: '.tmp-dist/scripts/**/*.js', included: false },
      {pattern: 'app/views/*.html', included: false },

      {pattern: 'test/spec/**/*.js', included: false },
      // http://karma-runner.github.io/0.10/plus/requirejs.html
      'test/test-bootstrap.js'
    ],

    // list of files / patterns to exclude
    exclude: [
        'app/scripts/bootstrap.js'
    ],

    // web server port
    port: 8080,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['PhantomJS'], //['PhantomJS'],


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};
