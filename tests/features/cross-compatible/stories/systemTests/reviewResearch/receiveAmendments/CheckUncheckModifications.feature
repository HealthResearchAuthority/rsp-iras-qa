@ReceiveAmendments @FrontStageUser @SystemTest @rsp-4105
Feature: Implement selection functionality for modifications ready to assign
    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'Approvals' link on the 'Home_Page'
        And I capture the page screenshot
        #When I click the 'Modifications' link on the 'Approvals_Page' -> Check with Chris if he will be creating step for this
        #And I have navigated to the 'Modifications Ready to assign' page -> Check with Chris if he will be creating step for this
        And I capture the page screenshot
        

        Scenario Outline: Verify checkbox is available next to each modification record and check all the checkboxes
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        #And I can see the checkbox next to each modification record
        And I check all checkboxes in all pages displayed
        Then I validate the 'Continue to assign modifications' button is visible
        Then I click the 'Continue to assign modifications' button on the 'Modifications Ready to assign'

        Scenario Outline: Verify checkbox is available next to each modification record and check only few checkboxes
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the checkbox next to each modification record
        And I check the first couple of checkboxes next to each modification record
        Then I validate the 'Continue to assign modifications' button is visible
        Then I click the 'Continue to assign modifications' button on the 'Modifications Ready to assign'

        Scenario Outline: Verify user is able to uncheck checkboxes available next to each modification record 
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on


        
