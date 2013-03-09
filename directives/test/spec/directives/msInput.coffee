'use strict'

describe 'Directive: msInput', () ->
  element = {}

  beforeEach module 'directiveApp'

  beforeEach inject ($rootScope, $compile) ->
    element = angular.element '<ms-input expected="3"></ms-input>'
    element = $compile(element) $rootScope

  it 'should display a single input box', ->
    input = element.find 'input'
    expect(input.length).toBe 1

  it 'should fire an answer event in response to a checkAnswer request', inject ($rootScope) ->
    # Fail the test by default.
    done = -> expect(true).toBe(false)

    # If $rootScope receives an answer event
    $rootScope.$on 'answer', ->
      # Pass the test.
      done = -> expect(true).toBe(true)

    # Fire the event we're testing a response for.
    $rootScope.$broadcast 'checkAnswer'

    # Pass or fail the test.
    done()
