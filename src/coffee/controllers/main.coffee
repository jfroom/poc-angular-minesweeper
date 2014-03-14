define ["angular"], (angular) ->

  angular
    .module("pocAngularMinesweeperApp.controllers.MainCtrl", [])
    .controller "MainCtrl", ["$scope", ($scope) ->
      $scope.awesomeThings = [
        "HTML5 Boilerplate"
        "AngularJS"
        "Karma"
      ]
    ]

