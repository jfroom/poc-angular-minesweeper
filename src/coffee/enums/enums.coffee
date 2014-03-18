define ["angular", "_"], (angular, _) ->
  # ENUMS
  angular.module("app.enums", [])
    .constant "enums",
      EventType:
        GameNew: "game.new"
        GameStart: "game.start"
        GameOver: "game.over"
        GameCheat: "game.cheat"
        GameValidate: "game.validate"
        GameGridChange: "game.gridChange"
        GameDifficultyChange: "game.difficultyChange"
        TileInit: "tile.init"
        TileMined: "tile.mined"
        TileShown: "tile.shown"

      StateType:
        Idle: "idle"
        Active: "active"
        Complete: "complete"

      GameResultType:
        Lose: "Lose"
        Win: "Win"
        InProgress: "In Progress"

      GridSize:
        Size8: 8
        Size16: 16
        Size24: 24

      DifficultyType:
        Easy:
          id: "easy"
          gridToMineRatio: .15625 # 10 for Size8
        Medium:
          id: "medium"
          gridToMineRatio: .25 # 16 for Size8
        Hard:
          id: "hard"
          gridToMineRatio: .40 # 26 for Size8

