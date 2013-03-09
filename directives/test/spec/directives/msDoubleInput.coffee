'use strict'

describe 'Directive: msDoubleInput', () ->
  element = {}

  beforeEach module 'directiveApp'

  beforeEach inject ($rootScope, $compile) ->
    element = angular.element '<ms-double-input></ms-double-input>'
    element = $compile(element) $rootScope

  it 'should display two <ms-input>\'s', ->
    msInputs = element.find 'ms-input'
    expect(msInputs.length).toBe 2

  it 'should fire a single answer event in response to a checkAnswer request', inject ($rootScope) ->
    # Setup our answers received count.
    answersReceived = 0

    # The test will pass if answersReceived is 1.
    done = -> expect(answersReceived).toBe 1

    # Count the answers received.
    $rootScope.$on 'answer', -> answersReceived += 1

    # Fire the request event.
    $rootScope.$broadcast 'checkAnswer'

    # Pass or fail the test.
    done()
