@axeAccessibility @Smoke
Feature: Run Axe Accessibilty Test Tool Against App Pages

    @axeAccessibilityTasks @pocUser
    Scenario: Run AXE Accessibilty Checks on Tasks Page
        Given I have navigated to the 'Tasks_Page'
        When I Scan the page with the Axe Accessibilty Tool
        Then I expect to receive no WCAG Violations
    
    @axeAccessibilityIdg
    Scenario: Run AXE Accessibilty Checks on IDG Login Page
        Given I have navigated to the 'Login_Page'
        When I Scan the page with the Axe Accessibilty Tool
        Then I expect to receive no WCAG Violations
