@axeAccessibility
Feature: Run Axe Accessibilty Test Tool Against App Pages
 
 Background:
    Given I have navigated to the 'Home_Page'

    @axeAccessibilityTasks @adminUser
    Scenario: Run AXE Accessibilty Checks on Tasks Page                     
        When I Scan the page with the Axe Accessibilty Tool
        Then I generate JSON 'temp-axe-results.json' from the scanned results
        Then I create the axe-core html report from the scanned results
        Then I expect to receive no WCAG Violations

    @axeAccessibilityIdg
    Scenario: Run AXE Accessibilty Checks on IDG Login Page        
        And I can see a 'Login' button on the 'Banner'
        When I click the 'Login' button on the 'Banner'
        Then I can see the 'Login_Page'
        Then I click on the next button in the login page           
        When I Scan the page with the Axe Accessibilty Tool
        Then I generate JSON 'temp-axe-results.json' from the scanned results
        Then I create the axe-core html report from the scanned results
        Then I expect to receive no WCAG Violations
