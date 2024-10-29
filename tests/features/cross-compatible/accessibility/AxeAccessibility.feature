@axeAccessibility
Feature: Run Axe Accessibilty Test Tool Against App Pages

    @axeAccessibilityTasks @adminUser
    Scenario: Run AXE Accessibilty Checks on Home Page
        Given I have navigated to the 'Home_Page'
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations

    @axeAccessibilityIdg
    Scenario: Run AXE Accessibilty Checks on IDG Login Page
        Given I have navigated to the 'Login_Page'
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations

#