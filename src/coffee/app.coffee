#jshint unused: vars
define [ #deps
#invoke
  "angular"
  "controllers/main"
], (angular, MainCtrl) ->
  "use strict"

  #angJSDeps
  window.app = angular.module "pocAngularMinesweeperApp", [
    "pocAngularMinesweeperApp.controllers.MainCtrl"
    "ngCookies"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ]
  app.config ["$routeProvider", ($routeProvider) ->
    console.log "app loaded"
    $routeProvider.when("/",
      templateUrl: "views/main.html"
      controller: "MainCtrl"
    ).otherwise redirectTo: "/"
  ]

