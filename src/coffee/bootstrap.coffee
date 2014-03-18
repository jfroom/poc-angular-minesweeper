#jshint unused: vars
require.config
  baseUrl: "./scripts"
  paths:
    angular: "../bower_components/angular/angular"
    angularRoute: "../bower_components/angular-route/angular-route"
    angularCookies: "../bower_components/angular-cookies/angular-cookies"
    angularSanitize: "../bower_components/angular-sanitize/angular-sanitize"
    angularResource: "../bower_components/angular-resource/angular-resource"
    angularMocks: "../bower_components/angular-mocks/angular-mocks"
    text: "../bower_components/requirejs-text/text"
    domReady: "../bower_components/requirejs-domready/domReady"
    bootstrapDropdown: "../bower_components/sass-bootstrap/js/dropdown"
    "_": "../bower_components/lodash/dist/lodash"
    hammer: "../bower_components/hammerjs/hammer"
    angularHammer: "vendor/angular-hammer-require"
    #views: "../views"
    jquery: "../bower_components/jquery/dist/jquery"
    woodman: "../bower_components/woodman/dist/woodman-amd"


  shim:
    angular:
      exports: "angular"
      deps: ["jquery"]
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

  priority: ["jquery", "angular", "hammer"]

#http://code.angularjs.org/1.2.1/docs/guide/bootstrap#overview_deferred-bootstrap
window.name = "NG_DEFER_BOOTSTRAP!"
require [
  "jquery"
  "angular"
  "app"
  "angularRoute"
  "angularCookies"
  "angularSanitize"
  "angularResource"
  "text"
  "domReady"
  #"jsnlog"
  "hammer"
  "angularHammer"
  "bootstrapDropdown"
  "_"
  "woodman"

#], (jQuery, angular, app, ngRoutes, ngCookies, ngSanitize, ngResource, text, domReady, hammer, dropdown, _, jsnlog) ->
], (jQuery, angular, app, ngRoutes, ngCookies, ngSanitize, ngResource, text, domReady, Hammer, ngTouchEvents, dropdown, _, woodman) ->
  #require ["app"], (app) ->
  console.log "bootstrap running..."
  $html = angular.element(document.getElementsByTagName("html")[0])
  angular.element().ready ->
    angular.resumeBootstrap [app.name]

