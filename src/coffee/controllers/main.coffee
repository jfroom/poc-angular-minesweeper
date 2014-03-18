define ["angular", "_"], (angular, _) ->

  angular
    .module("app.controllers.mainCtrl", ["app", "app.enums", "app.services.log" ])
    .controller "mainCtrl", ["$scope", "enums", "log", "$timeout", "$rootScope", ($scope, enums, $log, $timeout, $rootScope) ->
      $log.info "mainCtrl created"

      _.extend $scope,
        isGameViewReady: false # hide game view until all tiles registered
        tileArr: []
        gridSize: enums.GridSize.Size8
        difficulty: enums.DifficultyType.Easy
        numMines: 10
        state: enums.StateType.Idle
        gameResult: enums.GameResultType.InProgress
        isCheatMode: false
        isDebug: false
        gameCSSClasses: ''



      class Game
        constructor: () ->
          $scope.$on enums.EventType.GameNew, angular.bind(@, @handleNewGame)
          $scope.$on enums.EventType.GameValidate, angular.bind(@, @handleValidate)
          $scope.$on enums.EventType.GameCheat, angular.bind(@, @handleCheat)
          $scope.$on enums.EventType.GameGridChange, angular.bind(@, @handleGridChange)
          $scope.$on enums.EventType.GameDifficultyChange, angular.bind(@, @handleDifficultyChange)
          $scope.$on enums.EventType.TileInit, angular.bind(@, @handleTileInit)
          $scope.$on enums.EventType.TileMined, angular.bind(@, @handleTileMined)

          @setGridSize($scope.gridSize)
          @handleNewGame()
          if $scope.isDebug
            @handleCheat()

        updateGameCSS: () ->
          out = ''
          if $scope.state == enums.StateType.Complete then out += "game--complete "
          if $scope.isCheatMode then out += "game--cheat "
          switch $scope.gameResult
            when enums.GameResultType.Win
              out += "game--win "
            when enums.GameResultType.Lose
              out += "game--lose "
          $scope.gameCSSClasses = out

        handleGridChange: (e, val) ->
          if val != $scope.gridSize
            @setGridSize val
            @handleNewGame()
        setGridSize: (val) ->
          oldGridSize = $scope.gridSize
          $scope.gridSize = val
          @changeNumMinesForDifficulty()
          $body = angular.element("body")
          prefix = "game__grid-size--"
          $body.removeClass(prefix + oldGridSize).addClass(prefix + $scope.gridSize)
        handleDifficultyChange: (e, val) ->
          if val.id != $scope.difficulty.id
            _.find enums.DifficultyType, (item) ->
              if item.id == val
                $scope.difficulty = item
                return
            @changeNumMinesForDifficulty()
            @handleNewGame()

        changeNumMinesForDifficulty: () ->
          $scope.numMines = Math.ceil($scope.difficulty.gridToMineRatio * $scope.gridSize * $scope.gridSize)

        changeGameState: (state) ->
          $scope.state = state
          switch state
            when enums.StateType.Active
              $scope.$broadcast enums.EventType.GameStart
            when enums.StateType.Complete
              $scope.$broadcast enums.EventType.GameOver
          $rootScope.gameState = $scope.state
          @updateGameCSS()

        handleNewGame: () ->
          $scope.isGameViewReady = false #hide view while rendering
          $scope.tileArr = []
          $scope.outcome = enums.GameResultType.InProgress
          tmpArr = []

          #create board
          _.each _.range(0, ($scope.gridSize * $scope.gridSize)), (el, index) ->
            x = (el % $scope.gridSize)
            y = Math.floor(el / $scope.gridSize)
            config = {x:x, y:y}
            if x == 0 and y > 0
              config.isStartOfRow = true
            tmpArr.push config

          #assign mines
          pluckArr = _.clone tmpArr
          _.each _.range(1, $scope.numMines), (el, index) ->
            mineTile = (_.at pluckArr, Math.floor(Math.random() * pluckArr.length))[0]
            mineTile.hasMine = true

          # assign distances
          _.each tmpArr, (config, index) ->
            if !config.hasMine
              dist = 0
              dist += @getTileDistAt config.x + -1, config.y + -1, tmpArr
              dist += @getTileDistAt config.x + 0, config.y + -1, tmpArr
              dist += @getTileDistAt config.x + 1, config.y + -1, tmpArr

              dist += @getTileDistAt config.x + -1, config.y + 0, tmpArr
              dist += @getTileDistAt config.x + 1, config.y + 0, tmpArr

              dist += @getTileDistAt config.x + -1, config.y + 1, tmpArr
              dist += @getTileDistAt config.x + 0, config.y + 1, tmpArr
              dist += @getTileDistAt config.x + 1, config.y + 1, tmpArr
              config.distance = dist
          , @

          $scope.gameResult = enums.GameResultType.InProgress
          $scope.tileArr = tmpArr # render
          @changeGameState enums.StateType.Active

        handleCheat: (e) ->
          $scope.isCheatMode = !$scope.isCheatMode
          @updateGameCSS()

        handleTileInit: (e, tile) ->
          i =  @getTileIndex tile.x, tile.y
          $scope.tileArr[i] = tile
          if $scope.tileArr.length == $scope.gridSize * $scope.gridSize
              $scope.isGameViewReady = true

        handleValidate: (e) ->
          isWinner = true
          _.each $scope.tileArr, (tile, index) ->
            $log.info "x:" + tile.x + " y:" + tile.y
            if !tile.isShown and !tile.hasMine
              $log.info " lose"
              isWinner = false
              return isWinner
          , @

          $scope.gameResult = if isWinner then enums.GameResultType.Win else enums.GameResultType.Lose
          $log.info "$scope.gameResult: " + $scope.gameResult
          @changeGameState enums.StateType.Complete

        handleTileMined: (e) ->
          $scope.gameResult = enums.GameResultType.Lose
          @changeGameState enums.StateType.Complete


        #--------------------------------------------------------------------
        # UTILS

        getTileDistAt: (x, y, tileArr = $scope.tileArr) ->
          if x < 0 || x >= $scope.gridSize || y < 0 || y >= $scope.gridSize
            return 0
          tile = @getTileAt x, y, tileArr
          hasMine = tile.hasMine
          if hasMine then return 1 else return 0
        getTileAt: (x, y, tileArr = $scope.tileArr) ->
          i = @getTileIndex(x,y)
          tileArr[ i ]
        getTileIndex: (x, y) ->
          x + y * $scope.gridSize

      game = new Game()


    ]
