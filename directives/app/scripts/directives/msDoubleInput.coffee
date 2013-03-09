'use strict';

angular.module('directiveApp')
  .directive 'msDoubleInput', [ ->
    controller: [
      '$scope'
      ($scope) ->
        $scope.controllerId = Math.random().toString()
        $scope.answer = []
        $scope.result = 'correct'

        # Handle answer's from downstream
        $scope.$on 'answer', (e, data) ->
          # Ignore our own answer events.
          if data.controllerId isnt $scope.controllerId
              # Save the answer
              $scope.answer.push data.answer
    
              # Set an incorrect flag if appropriate
              $scope.result = data.result if data.result is 'incorrect'
    
              # Send the answer upstream if it's complete
              if $scope.answer.length is 2
                $scope.$emit 'answer',
                  controllerId: $scope.controllerId
                  answer: $scope.answer.join(', ')
                  result: $scope.result
    
              # Stop the answer from going upstream
              e.stopPropagation()

        # Handle checkAnswer requests from upstream
        $scope.$on 'checkAnswer', ->
          $scope.answer = []
          $scope.result = 'correct'
    ]
    restrict: 'E'
    scope:
      expected: '@'
    template: '''
        <div>
            <ms-input expected={{expected.split(',')[0]}}></ms-input>
            <ms-input expected={{expected.split(',')[1]}}></ms-input>
        </div>
    '''
  ]
