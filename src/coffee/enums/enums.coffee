define ["angular", "_"], (angular, _) ->
  # ENUMS
  angular.module("app.enums", [])
    .constant "enums",
      EventType:
        GameNew: "game.new"
        TileMined: "tile.mined"
        TileShown: "tile.shown"
