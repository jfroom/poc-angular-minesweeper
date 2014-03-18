var tests = [];
for (var file in window.__karma__.files) {
  if (window.__karma__.files.hasOwnProperty(file)) {
    // Removed "Spec" naming from files
    if (/Spec\.js$/.test(file)) {
      tests.push(file);
    }
  }
}

requirejs.config({
    // Karma serves files from '/base'
    baseUrl: '/base/.tmp-dist/scripts',

    paths: {
        angular: '../../app/bower_components/angular/angular',
        angularRoute: '../../app/bower_components/angular-route/angular-route',
        angularCookies: '../../app/bower_components/angular-cookies/angular-cookies',
        angularSanitize: '../../app/bower_components/angular-sanitize/angular-sanitize',
        angularResource: '../../app/bower_components/angular-resource/angular-resource',
        angularMocks: '../../app/bower_components/angular-mocks/angular-mocks',

        text: "../../app/bower_components/requirejs-text/text",
        domReady: "../../app/bower_components/requirejs-domready/domReady",
        _: "../../app/bower_components/lodash/dist/lodash",
        bootstrapDropdown: "../../app/bower_components/sass-bootstrap/js/dropdown",
        hammer: "../../app/bower_components/hammerjs/hammer",
        angularHammer: "vendor/angular-hammer-require",
        views: "../../app/views",
        jquery: "../../app/bower_components/jquery/dist/jquery",
        woodman: "../../app/bower_components/woodman/dist/woodman-amd",

        template_main: "../../app/views/main.html",
        template_gameTile: "../../app/views/gameTile.html",
        template_hud: "../../app/views/hud.html"

    },

    shim: {
        'angular' : {
          deps: ['jquery'],
          'exports' : 'angular'
        },
        'hammer': {'exports' : 'Hammer'},
        'bootstrapDropdown': {'deps' : 'jquery'},
        'jquery': {'exports' : 'jQuery'},
        'angularRoute': ['angular'],
        'angularCookies': ['angular'],
        'angularSanitize': ['angular'],
        'angularResource': ['angular'],
        'angularMocks': {
          deps:['angular'],
          'exports':'angular.mock'
        }
    },

    // ask Require.js to load these files (all our tests)
    deps: tests,

    // start test run, once Require.js is done
    callback: window.__karma__.start
});
