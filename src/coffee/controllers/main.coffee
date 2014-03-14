define ["angular", "_"], (angular, _) ->

  angular
    .module("app.controllers.mainCtrl", ["app", "app.enums", "app.services.log"])
    .controller "mainCtrl", ["$scope", "enums", "log", ($scope, enums, $log) ->
      $log.info "mainctrl created"

      _.extend $scope,
        tileArr: []
        gridSize: 8
        numMines: 6

      init = () ->

        $scope.$on enums.EventType.GameNew, angular.bind(@, handleNewGame)
        #$scope.$on enums.EventType.TileShown, angular.bind(@, handleTileShown)
        handleNewGame()

      handleNewGame = () ->
        $scope.tileArr = []
        #create board
        _.each _.range(0, ($scope.gridSize * $scope.gridSize)), (el, index) ->
          x = (el % $scope.gridSize)
          y = Math.floor(el / $scope.gridSize)
          tile = {x:x, y:y}
          if x == 0 and y > 0
            tile.isStartOfRow = true
          $scope.tileArr.push tile

        #assign mines
        pluckArr = _.clone $scope.tileArr
        _.each _.range(1, $scope.numMines), (el, index) ->
          mineTile = (_.at pluckArr, Math.floor(Math.random() * pluckArr.length))[0]
          mineTile.hasMine = true
          $log.debug mineTile.x + " " + mineTile.y + " hasMine:" + mineTile.hasMine

        # assign distances
        _.each $scope.tileArr, (tile, index) ->
          if !tile.hasMine

            dist = 0
            dist += getTileDistAt tile.x + -1, tile.y + -1
            dist += getTileDistAt tile.x + 0, tile.y + -1
            dist += getTileDistAt tile.x + 1, tile.y + -1

            dist += getTileDistAt tile.x + -1, tile.y + 0
            dist += getTileDistAt tile.x + 1, tile.y + 0

            dist += getTileDistAt tile.x + -1, tile.y + 1
            dist += getTileDistAt tile.x + 0, tile.y + 1
            dist += getTileDistAt tile.x + 1, tile.y + 1
            tile.distance = dist

      handleTileShown = (e, data) ->
        tile = getTileAt data.x - 1, data.y - 1
        tile?.handleSiblingShown()
        getTileAt data.x
      getTileDistAt = (x, y) ->
        if x < 0 || x >= $scope.gridSize || y < 0 || y >= $scope.gridSize
          return 0
        tile = getTileAt x, y
        hasMine = tile.hasMine
        if hasMine then return 1 else return 0
      getTileAt = (x, y) ->
        i = x + y * $scope.gridSize
        return $scope.tileArr[i]


      init()
    ]
