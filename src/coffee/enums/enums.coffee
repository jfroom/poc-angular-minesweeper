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
