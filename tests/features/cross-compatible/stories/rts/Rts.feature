@rtsApi @Smoke @only
Feature: Make successful requests to RTS API
  Find the API Documentation at the following Swagger Doc - https://test.rts.nihr.ac.uk/api/swagger/index.html

  @rtsApi_Internal
  Scenario Outline: I am able to make a request to RTS Internal API
    When I authorise the rts api using '<RTS_API_Data>' and store the bearer token in memory
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation and save the response in memory

    Examples:
      | RTS_API_Data         | RTS_Request                         |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
