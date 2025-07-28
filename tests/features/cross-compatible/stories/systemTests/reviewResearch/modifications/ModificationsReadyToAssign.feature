@ModificationsReadyToAssign @FrontStageUser @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned   
   
    Background:
        Given I have navigated to the 'Modifications_tasklist_Page'
        Then I can see the 'Modifications_tasklist_Page'
        And I capture the page screenshot

        @rsp4040 
        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link      
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        When the pagination is in Modification and a button the current page number should be visually highlighted to indicate the active page the user is on 
        And I capture the page screenshot
        Then I sequentially navigate the first few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
          |Validation_Text   | Navigation_Method           |
          |Label_Texts       | clicking on page number     |
          |Label_Texts       | clicking on next link       |

        @rsp4040 @pagination
        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link    
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user       
        And I capture the page screenshot
        Then I sequentially navigate the last few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
          |Validation_Text   | Navigation_Method               |
          |Label_Texts       | clicking on page number         |
          |Label_Texts       | clicking on previous link       |

        @rsp4105
        Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
        When I confirm checkbox exists in every row across all pages
        And I capture the page screenshot
        And I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot

        @rsp4105 @jsEnabled
        Scenario: With JSEnabled, Verify if user selects the check all checkbox on the first couple of pages and confirm all checkboxes are checked and retained even after navigation
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I navigate by 'clicking on next link' within the Modifications Ready to assign page
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'checked'
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I capture the page screenshot
        Then I can see a 'Continue to assign modifications' button on the 'Modifications_Ready_To_Assign_Page'

        @rsp4105 @jsDisabled 
        Scenario: With JSdisabled, Verify user selects the check all checkbox on the first couple of pages and confirm all checkboxes are unchecked and retained even after navigation
        When JSdisabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        When JSdisabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Then I can see a 'Continue to assign modifications' button on the 'Modifications_Ready_To_Assign_Page'
       
        @rsp4105
        Scenario: Verify user selects few checkboxes on the first page, then applying sort resets all the checkboxes
        When I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot
        Then I sort the column '<Sorting_Column>'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sorting_Column           |
            | Modification ID          |
            | Short project title      |
            | Modification type        |
            | Date submitted           |
            | Days since submission    |
  
        @rsp4105
        Scenario: Verify user selects check all on the first page, then applying sort resets all the checkboxes
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        Then I sort the column '<Sorting_Column>'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sorting_Column           |
            | Modification ID          |
            | Short project title      |
            | Modification type        |
            | Date submitted           |
            | Days since submission    |







        