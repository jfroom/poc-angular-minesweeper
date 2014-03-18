define [
  "angular"
  "text!template_main"
  "angularSanitize"
  "angularResource"
  "angularRoute"
  "controllers/main"
  "directives/gameTile"
  "directives/hud"
  "enums/enums"
  "services/log"

], (angular, tmpl) ->
  window.app = angular.module "app", [
    "app.enums"
    "app.controllers.mainCtrl"
    "app.directives.gameTile"
    "app.directives.hud"
    "app.services.log"
    "ngResource"
    "ngSanitize"
    "ngRoute"
  ]
  app.config ["$routeProvider", ($routeProvider) ->

    $routeProvider.when("/",
      template: tmpl
      controller: "mainCtrl"
    ).otherwise redirectTo: "/"
  ]
