@ModificationsReadyToAssign @FrontStageUser @SystemTest @rsp4040
Feature: Modifications Tasklist page that displays modifications ready to be assigned   
   
    Background:
        Given I have navigated to the 'Modifications_tasklist_Page'
        Then I can see the 'Modifications_tasklist_Page'
        And I capture the page screenshot

        # Given I have navigated to the 'Home_Page'
        # When I click the 'Approvals' link on the 'Home_Page'
        # When I click the 'Modifications_tasklist' link on the 'Approvals_page'
        # And I capture the page screenshot
        # Then I can see the modifications ready to assign page
        # And I capture the page screenshot
        Then I can see the '<Validation_Text>' ui labels on the project details title page


        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
      
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        # And I capture the page screenshot
        Examples:
            |Validation_Text | Navigation_Method        |
            |Label_Texts     | clicking on page number  |
            |Label_Texts     | clicking on next link    |


        # Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
      
        # When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        # And I capture the page screenshot
        # And the default page size should be twenty
        # And the 'Previous' button will be 'available' to the user
        # And the 'Next' button will be 'not available' to the user
        # And the current page number should be visually highlighted to indicate the active page the user is on
        # And I capture the page screenshot
        # Then I sequentially navigate through each page by '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        # And I capture the page screenshot
        # Examples:
        #     | Navigation_Method           |
        #     | clicking on page number     |
        #     | clicking on previous link   |