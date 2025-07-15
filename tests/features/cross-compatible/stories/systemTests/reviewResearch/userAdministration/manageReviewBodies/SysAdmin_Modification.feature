@UserAdministration @ViewReviewBodies @SysAdminUser @SystemTest
Feature: Develop a Tasklist page that displays modifications ready to be assigned   
   
    Background:

        # Given I have navigated to the 'Home_Page'
        # When I click the 'Approvals' link on the 'Home_Page'
        # When I click the 'Tasklist' link on the 'Approvals_page'
        # And I capture the page screenshot
        # Then I can see the 'Modifications_Ready_To_Design_Page'
        # And I capture the page screenshot
        
        Given I have navigated to the 'System_Administration_Page'
        When I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'


        Scenario Outline: Verify default sorting in the Modification Ready to Assign page

        Given I can see the 'Modifications_Ready_To_Design_Page'
        And the default page size should be twenty
        # When I see modification records in a tasklist displaying the following columns: Modification ID, Short project title, Modification type, Date submitted, and Days since submission
        # Must be implemented in Chris story 4090 4091 .. Also similar step in 4016 Tiji
        
        # Then the oldest record is displayed at the top of the page
        # Must be implemented in Chris story 4091


        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
      
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
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


        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
      
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        And I capture the page screenshot
        Examples:
            | Navigation_Method       |
            | clicking on page number |
            | clicking on next link   |