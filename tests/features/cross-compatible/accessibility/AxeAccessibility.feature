@axeAccessibility
Feature: Run Axe Accessibilty Test Tool Against App Pages

    @axeAccessibilityTasks @adminUser
    Scenario: Run AXE Accessibilty Checks on Tasks Page
        Given I have navigated to the 'Home_page'
        When I Scan the page with the Axe Accessibilty Tool
        Then I expect to receive no WCAG Violations

    @axeAccessibilityIdg
    Scenario: Run AXE Accessibilty Checks on IDG Login Page
        Given I have navigated to the 'Home_page'
        And I click the 'Login' button
        And I can see the 'Login_Page'
        When I Scan the page with the Axe Accessibilty Tool
        Then I expect to receive no WCAG Violations
