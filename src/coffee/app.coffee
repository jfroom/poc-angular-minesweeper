define [ #deps
#invoke
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
  #"hammer"
  #"angularHammer"




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
    #"hmTouchEvents"
  ]
  app.config ["$routeProvider", ($routeProvider) ->

    $routeProvider.when("/",
      #templateUrl: "views/main.html"
      template: tmpl
      controller: "mainCtrl"
    ).otherwise redirectTo: "/"
  ]
