@axeAccessibility
Feature: Run Axe Accessibilty Test Tool Against App Pages
 
 Background:
    Given I have navigated to the 'Home_Page'

    @axeAccessibilityTasks @adminUser
    Scenario: Run AXE Accessibilty Checks on Tasks Page                     
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan       
        Then I expect to receive no WCAG Violations

    @axeAccessibilityIdg
    Scenario: Run AXE Accessibilty Checks on IDG Login Page        
        And I can see a 'Login' button on the 'Banner'
        When I click the 'Login' button on the 'Banner'
        Then I can see the 'Login_Page'                 
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan 
        Then I expect to receive no WCAG Violations
