#jshint unused: vars
require.config
  baseUrl: "./scripts"
  paths:
    jquery: "../bower_components/jquery/dist/jquery"
    angular: "../bower_components/angular/angular"
    angularRoute: "../bower_components/angular-route/angular-route"
    angularCookies: "../bower_components/angular-cookies/angular-cookies"
    angularSanitize: "../bower_components/angular-sanitize/angular-sanitize"
    angularResource: "../bower_components/angular-resource/angular-resource"
    angularMocks: "../bower_components/angular-mocks/angular-mocks"
    loglevel: "../bower_components/loglevel/dist/loglevel"
    text: "../bower_components/requirejs-text/text"
    domReady: "../bower_components/requirejs-domready/domReady"
    "bootstrapDropdown": "../bower_components/sass-bootstrap/js/dropdown"
    "_": "../bower_components/lodash/dist/lodash"
    "hammer": "../bower_components/hammerjs/hammer"
    "angularHammer": "vendor/angular-hammer-require"


  shim:
    angular:
      exports: "angular"

    hammer:
      exports: "Hammer"
    bootstrapDropdown:
      deps: ["jquery"]
    jquery:
      exports: "jQuery"
    angularHammer:
      deps: ["hammer"]
    angularRoute: ["angular"]
    angularCookies: ["angular"]
    angularSanitize: ["angular"]
    angularResource: ["angular"]
    angularMocks:
      deps: ["angular"]
      exports: "angular.mock"



  priority: ["angular", "jquery", "hammer"]

#http://code.angularjs.org/1.2.1/docs/guide/bootstrap#overview_deferred-bootstrap
window.name = "NG_DEFER_BOOTSTRAP!"
require [
  "angular"
  "app"
  "angularRoute"
  "angularCookies"
  "angularSanitize"
  "angularResource"
  "text"
  "domReady"
  "hammer"
  "bootstrapDropdown"
], (angular, app, ngRoutes, ngCookies, ngSanitize, ngResource, text, domReady, hammer, dropdown) ->
  #$html = angular.element(document.getElementsByTagName("html")[0])
  angular.element().ready ->
    angular.resumeBootstrap [app.name]

