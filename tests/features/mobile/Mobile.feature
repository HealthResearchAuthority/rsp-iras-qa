@adminUser @mobileFeature
Feature: This is a Feature that Contains Mobile Specific Tests 

    Background:
        Given I have navigated to the 'Home_Page'

    @mobileScenario
    Scenario: This is a Mobile Test
        When I do something 'Mobile'
        Then I see something 'Mobile'