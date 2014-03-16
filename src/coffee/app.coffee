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
  "hammer"
  "angularHammer"

], (angular) ->
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
    "hmTouchEvents"


  ]
  app.config ["$routeProvider", ($routeProvider) ->

    $routeProvider.when("/",
      templateUrl: "views/main.html"
      controller: "mainCtrl"
    ).otherwise redirectTo: "/"
  ]
