'use strict';

angular.module('directiveApp')
  .directive 'msInput', [ ->
    controller: [
      '$scope'
      ($scope) ->
        # Answer model.
        $scope.answer = ''

        # Handle checkAnswer requests from upstream
        $scope.$on 'checkAnswer', ->
          # Setup the event data object.
          data = {}
          if $scope.answer is $scope.expected
            data.result = 'correct'
          else
            data.result = 'incorrect'
          data.answer = $scope.answer

          # Send the answer upstream.
          $scope.$emit 'answer', data
    ]
    restrict: 'E'
    scope:
      expected: '@'
    template: '<input type=text ng-model=answer>'
  ]
