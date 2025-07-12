@UserAdministration @ViewReviewBodies @SysAdminUser @SystemTest
Feature: User Administration: Manage Review Bodies list and view review bodies profile details   
   
    Background:

        # Given I have navigated to the 'Home_Page'
        # When I click the 'Approvals' link on the 'Home_Page'
        #         Given I have navigated to the 'Search_Modifications_Page'
        # Then I can see the 'Search_Modifications_Page'
        # And I capture the page screenshot

        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @pagination 
        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
      
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        #And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        And I capture the page screenshot
        Examples:
            | Navigation_Method       |
            | clicking on page number |
            | clicking on next link   |