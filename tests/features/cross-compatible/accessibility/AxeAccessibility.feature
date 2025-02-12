@axeAccessibility @jsEnabled
Feature: Run Axe Accessibilty Test Tool Against App Pages

    @axeAccessibilityHome @adminUser
    Scenario: Home Page
        Given I have navigated to the 'Home_Page'
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations

    @axeAccessibilityIdg
    Scenario: IDG Login Page
        Given I have navigated to the 'Login_Page'
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations

    @axeAccessibilityCreate @adminUser
    Scenario: Create Application Page
        Given I have navigated to the 'Create_Application_Page'
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations

    @axeAccessibilityProjFilter @adminUser
    Scenario: Project Filter Question Set
        Given I have navigated to the 'Home_Page'
        And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
        And I can see the 'Create_Application_Page'
        And I enter the application name and description for 'Project_X'
        And I click the 'Create' button on the 'Create_Application_Page'
        And I can see the proceed application page for 'Project_X'
        And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
        And I can see the 'Project_Filter' question set
        When I Scan the page with the Axe Accessibilty Tool
        And I analyse the results from the Axe scan
        Then I expect to receive no WCAG Violations