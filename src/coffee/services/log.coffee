#define ["angular", "_", "jsnlog"], (angular, _, JL) ->
define ["angular", "_", "woodman"], (angular, _, woodman) ->

  angular
    .module "app.services.log", []
    .factory "log", ["$rootScope", ($rootScope) ->
      woodman.load("console")
      logger = woodman.getLogger("app")
      $rootScope.logger = logger
      #$rootScope.logger.setLevel "trace"

      return logger
    ]
