define ["angular", "_", "text!template_hud"], (angular, _, tmpl) ->

  angular
    .module 'app.directives.hud', [
      "app"
      "app.enums"
      "app.services.log",
      "hmTouchEvents"

    ]
    .directive "hud", ["$rootScope", "enums", "log", ($rootScope, enums, $log) ->
      priority: 0
      template: ""
      replace: false
      transclude: false
      restrict: "A"
      template: tmpl
      scope: true

      compile: compile = (tElement, tAttrs, transclude) ->

        pre: preLink = (scope, iElement, iAttrs, controller) ->
          _.extend scope,
            validateLabel: "Validate"
            handleNewGameClick: (e) ->
              scope.$emit enums.EventType.GameNew
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
            handleGridChange: (val) ->
              $log.info 'handleGridChange ' + val
              scope.$emit enums.EventType.GameGridChange, val
            handleDifficultyChange: (val) ->
              $log.info 'handleChangeDifficulty ' + val
              scope.$emit enums.EventType.GameDifficultyChange, val

          scope.$on enums.EventType.GameOver, angular.bind(scope, scope.handleGameOver)
          scope.$on enums.EventType.GameStart, angular.bind(scope, scope.handleGameStart)

        #post: postLink = (scope, iElement, iAttrs, controller) ->

    ]
