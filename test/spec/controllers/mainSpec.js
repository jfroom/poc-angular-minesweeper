/*jshint unused: vars */
define(['angular', 'angularMocks', 'app', '_', "angularHammer", "jquery"], function(angular, mocks, app, _, angularHammer, jQuery) {
  'use strict';

  describe('Controller: MainCtrl', function () {

    // load the controller's module
    beforeEach(module('app.controllers.mainCtrl'));

    var MainCtrl,
      scope;

    // Initialize the controller and a mock scope
    beforeEach(inject(function ($controller, $rootScope) {
      console.log("test before")
      scope = $rootScope.$new();
      MainCtrl = $controller('mainCtrl', {
        $scope: scope
      });
      console.log("MainCtrl:" + MainCtrl)
    }));

    it('should expect MainCtrl to be defined', function () {
      expect(MainCtrl).toBeDefined();
    });
  });
});
