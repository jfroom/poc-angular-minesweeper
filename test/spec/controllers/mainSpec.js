/*jshint unused: vars */
define(['angular', 'angularMocks', 'app'], function(angular, mocks, app) {
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

    it('should attach a list of awesomeThings to the scope', function () {
      expect(MainCtrl).toBeDefined();
    });
  });
});
