@pocUser @desktopFeature
Feature: This is a Feature that Contains Desktop Specific Tests 

    Background:
        Given I have navigated to the 'Tasks_Page'

    @desktopScenario
    Scenario: This is a Desktop Test
        When I do something 'Desktop'
        Then I see something 'Desktop'