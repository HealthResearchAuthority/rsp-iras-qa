@rtsApi @only
Feature: Make successful requests to RTS API

  @rtsApi_External
  Scenario: I am able to make a request to RTS External API
    When I make a request to the External API
  
  @rtsApi_Internal
  Scenario: I am able to make a request to RTS Internal API
    When I make a request to the Internal API