@axeAccessibility @pocUser
Feature: Run Axe Accessibilty Test Tool Against App Pages

    Scenario Outline: Run AXE Accessibilty Checks on Existing Old IRAS Pages
        Given I have navigated to the '<Page>'
        When I Scan the page with the Axe Accessibilty Tool
        Then I expect to receive no WCAG Violations
        Examples:
            | Page                 |
            | Tasks_Page           |
