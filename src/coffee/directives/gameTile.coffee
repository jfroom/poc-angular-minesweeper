define ["angular", "_"], (angular, _) ->

  angular
    .module 'app.directives.gameTile', [
      "app"
      "app.enums"
      "app.services.log"
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
              if !scope.isShown
                $log.info "click"
                scope.isShown = true
                if scope.hasMine
                  scope.$emit enums.EventType.TileMined
                else
                  $rootScope.$broadcast enums.EventType.TileShown, scope
            handleSiblingTileShown: (e, data) ->
              #$log.trace data.x
              #if data.x != scope.x and data.y != scope.y
              if scope.isShown or scope.hasMine or (scope.x == data.x and scope.y == data.y)
                return
              if (scope.x >= data.x - 1 and scope.x <= data.x + 1) and (scope.y >= data.y - 1 and scope.y <= data.y + 1)
                if scope.distance >= 0
                  scope.isShown = true
                  if scope.distance == 0
                    $rootScope.$broadcast enums.EventType.TileShown, scope



          _.extend scope, scope.data
          scope.$on enums.EventType.TileShown, angular.bind(scope, scope.handleSiblingTileShown)

          scope.$on "$destroy", () ->
            $log.info "destroy tile"


        post: postLink = (scope, iElement, iAttrs, controller) ->

    ]

