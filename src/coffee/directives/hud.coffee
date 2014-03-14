define ["angular", "_"], (angular, _) ->

  angular
    .module 'app.directives.hud', [
      "app"
      "app.enums"
      "app.services.log"
    ]
    .directive "hud", ["$rootScope", "enums", "log", ($rootScope, enums, $log) ->
      priority: 0
      template: ""
      replace: false
      transclude: false
      restrict: "A"
      templateUrl: "views/hud.html"
      scope: true



      compile: compile = (tElement, tAttrs, transclude) ->

        pre: preLink = (scope, iElement, iAttrs, controller) ->
          _.extend scope,
           handleNewGameClick: (e) ->
            console.log "click game"
            scope.$emit enums.EventType.GameNew


        post: postLink = (scope, iElement, iAttrs, controller) ->

    ]
