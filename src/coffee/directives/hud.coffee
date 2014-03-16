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
            validateLabel: "Validate"
            handleNewGameClick: (e) ->
              console.log "click game"
              scope.$emit enums.EventType.GameNew
            handleTouchHold: (e) ->
              console.log "touch hold"
            handleValidateClick: (e) ->
              scope.$emit enums.EventType.GameValidate
            handleGameStart: (e) ->
              scope.validateLabel = "Validate"
            handleGameOver: (e, data) ->
              #if scope.gameResult == enums.GameResultType.Win
              $log.info "hud game over"
              scope.validateLabel = scope.gameResult
            handleCheatClick: (e) ->
              $log.info 'cheatclick'
              scope.$emit enums.EventType.GameCheat


          scope.$on enums.EventType.GameOver, angular.bind(scope, scope.handleGameOver)
          scope.$on enums.EventType.GameStart, angular.bind(scope, scope.handleGameStart)

        #post: postLink = (scope, iElement, iAttrs, controller) ->

    ]
