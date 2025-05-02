@rtsApi @Smoke @only
Feature: Make successful requests to RTS API
  Find the API Documentation at the following Swagger Doc - https://test.rts.nihr.ac.uk/api/swagger/index.html

  @rtsApi_Internal
  Scenario Outline: I am able to make a request to RTS Internal API
    When I make a request to the rts api using '<RTS_API_Data>' dataset

    Examples:
      | RTS_API_Data         |
      | RTS_NIHR_FHIR_Config |
