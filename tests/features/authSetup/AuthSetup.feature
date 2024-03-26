@authSetup
Feature: Authenticate Test Users once only, before test run

  Background: 
    Given I am on the Login Page

  Scenario: Login & Authenticate POC User
    When I login as "POC" User
    Then I can see the Tasks Page
    And I will store the "POC" users Authentication State