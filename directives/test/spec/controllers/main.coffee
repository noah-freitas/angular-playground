'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'directiveApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  xit 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
