define ["angular", "_", "loglevel"], (angular, _, loglevel) ->

  angular
    .module "app.services.log", []
    .factory "log", ["$rootScope", ($rootScope) ->
      logger = loglevel
      $rootScope.logger = logger
      logger.setLevel "trace"
      return logger
    ]
