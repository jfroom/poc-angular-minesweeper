define [ #deps
#invoke
  "angular"
  "angularCookies"
  "angularSanitize"
  "angularResource"
  "angularRoute"
  "controllers/main"
  "directives/gameTile"
  "directives/hud"
  "enums/enums"
  "services/log"
], (angular, MainCtrl, TileDir) ->
  window.app = angular.module "app", [
    "app.enums"
    "app.controllers.mainCtrl"
    "app.directives.gameTile"
    "app.directives.hud"
    "app.services.log"
    #"ngCookies"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ]
  app.config ["$routeProvider", ($routeProvider) ->

    $routeProvider.when("/",
      templateUrl: "views/main.html"
      controller: "mainCtrl"
    ).otherwise redirectTo: "/"
  ]
