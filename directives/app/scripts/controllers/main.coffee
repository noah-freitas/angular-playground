'use strict'

angular.module('directiveApp')
  .controller 'MainCtrl', ['$scope', ($scope) ->
    $scope.$on 'answer', (e, data) -> console.log data
    $scope.checkAnswer = -> $scope.$broadcast 'checkAnswer'
  ]
