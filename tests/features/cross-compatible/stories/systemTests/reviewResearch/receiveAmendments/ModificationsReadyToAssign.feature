@ModificationsReadyToAssign @FrontStageUser @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned   
   
    Background:
        Given I have navigated to the 'Modifications_tasklist_Page'
        Then I can see the 'Modifications_tasklist_Page'
        And I capture the page screenshot
        Then I can see the '<Validation_Text>' ui labels on the project details title page

        @rsp4040
        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
      
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        And I capture the page screenshot
        Examples:
            |Validation_Text | Navigation_Method        |
            |Label_Texts     | clicking on page number  |
            |Label_Texts     | clicking on next link    |

        @rsp4040
        Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
      
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user       
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges      
        And I capture the page screenshot
        Examples:
            | Navigation_Method           |
            | clicking on page number     |
            | clicking on previous link   |

        @rsp4105
        Scenario Outline: Verify I can select the modification records across all pages
        When I confirm checkbox is visible next to each modification record
        And I confirm '<button>' is visible
        And I click on the checkbox available on the '<Page>'
        And I click on the checkbox available on the '<Page>'
        Then I click the <'Sort column'> previously selected checkboxes are disabled
        #Then I click the <'Filter'> previously selected checkboxes are disabled 
        #filter is not available in present screen and not in scope of this story

        @rsp4105
        Scenario Outline: With JSEnabled, Verify Select All button selects all the results on the current page
        When I click on the Select All button All modification records in the current page is enabled
        And I click on the Select All button All modification records in the current page is disabled






        