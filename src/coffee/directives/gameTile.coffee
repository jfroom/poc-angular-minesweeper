define ["angular", "_", "hammer"], (angular, _, Hammer) ->

  angular
    .module 'app.directives.gameTile', [
      "app"
      "app.enums"
      "app.services.log"
      "hmTouchEvents"
    ]
    .directive "gameTile", ["$rootScope", "enums", "log", ($rootScope, enums, $log) ->
      priority: 0
      template: ""
      replace: false
      transclude: false
      restrict: "A"
      templateUrl: "views/gameTile.html"

      scope:
        data: '=gameTile'

      compile: compile = (tElement, tAttrs, transclude) ->

        pre: preLink = (scope, iElement, iAttrs, controller) ->

          _.extend scope,
            x: -1
            y: -1
            hasMine: false
            isShown: false
            isStartOfRow: false
            distance: 10
            handleClick: (e) ->
              # intentionally empty to suppress event side effects
              # tap will handle it - has better mobile support
            handleTap: (e) ->
              # exit if game not running
              if $rootScope.gameState != enums.StateType.Active then return

              if !scope.isShown
                scope.isShown = true
                if scope.hasMine
                  scope.$emit enums.EventType.TileMined
                else
                  $rootScope.$broadcast enums.EventType.TileShown, scope
            handleSiblingTileShown: (e, data) ->
              if data.distance > 0 or scope.isShown or scope.hasMine or (scope.x == data.x and scope.y == data.y)
                return
              if (scope.x >= data.x - 1 and scope.x <= data.x + 1) and (scope.y >= data.y - 1 and scope.y <= data.y + 1)
                if scope.distance >= 0
                  scope.isShown = true
                  if scope.distance == 0
                    $rootScope.$broadcast enums.EventType.TileShown, scope
            handleTouchHold: (e) ->
              # exit if game not running
              if $rootScope.gameState != enums.StateType.Active then return
              $log.info "hold"

          _.extend scope, scope.data
          scope.$on enums.EventType.TileShown, angular.bind(scope, scope.handleSiblingTileShown)

          scope.$on "$destroy", () ->
            #$log.info "destroy tile"

        post: postLink = (scope, iElement, iAttrs, controller) ->
          scope.$emit enums.EventType.TileInit, scope

    ]

