@pocUser @crossCompatibleFeature
Feature: This is a Feature that Contains Cross Compatible Tests 

    Background:
        Given I have navigated to the 'Tasks_Page'

    @crossCompatibleScenario
    Scenario: This is a Cross Compatible Test
        When I do something 'Cross Compatible'
        Then I see something 'Cross Compatible'