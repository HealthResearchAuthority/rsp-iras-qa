@ReceiveAmendments @ModificationsReadyToAssign @WorkFlowCoordinator @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    # Date_Submitted,Days_Since_Submission sort is failing
    @SortTasklistByColumn @rsp-4091 @fail
    Scenario: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Modification_Id       | modification id       | ascending    | descending     |
            | Short_Project_Title   | short project title   | ascending    | descending     |
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |

    @ModificationsTasklistPaginationFirst @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method       |
            | Label_Texts     | clicking on page number |
            | Label_Texts     | clicking on next link   |

    @ModificationsTasklistPaginationLast @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method         |
            | Label_Texts     | clicking on page number   |
            | Label_Texts     | clicking on previous link |

    @ModificationsTasklistRandomSelection @rsp-4105 @KNOWN-DEFECT-RSP-4971
    Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
        When I confirm checkbox exists in every row across pages
        And I capture the page screenshot
        And I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot

    @ModificationsTasklistSelectAllWithJs @rsp-4105 @jsEnabled
    Scenario: With JavaScript enabled, Verify if user selects the check all checkbox on the first page and confirm checkboxes are checked and status retained even after navigation
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'checked'
        And I capture the page screenshot
        Then I can see a 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'

    @ModificationsTasklistSelectAllWithoutJs @rsp-4105 @jsDisabled
    Scenario: With JavaScript disabled, Verify user selects the check all checkbox on the first page and confirm checkboxes are unchecked and status retained even after navigation
        When JavaScript is disabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Then I can see a 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'

    @ModificationsRandomSelectionAndSort @rsp-4105
    Scenario: Verify user selects few checkboxes on the first page, then applying sort resets all the checkboxes
        When I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sort_Button           |
            | Modification_Id       |
            | Short_Project_Title   |
            | Date_Submitted        |
            | Days_Since_Submission |

    @ModificationsSelectAllAndSort @rsp-4105 @KNOWN-DEFECT-RSP-4976
    Scenario: Verify user selects check all on the first page, then applying sort resets all the checkboxes
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sort_Button           |
            | Modification_Id       |
            | Short_Project_Title   |
            | Date_Submitted        |
            | Days_Since_Submission |



# https://nihr.atlassian.net/browse/RSP-4076
# Test Case Design - AC’s for Automation:

# Pre-requisite:

# The roles and permissions feature should be implemented to properly display the list of study-wide reviewers.

#  The user is on the Task list page, has selected at least one modification by clicking the checkbox, and clicks the Continue to assign modifications button to proceed to the next page.

# Supporting links:
# Figma link: Review research -Assign a modification – Figma

# Scenario : 1- Validate the user navigates to ‘Select a study-wide reviewer’ page on clicking Continue to assign modifications button on the task list page

# GIVEN I am on the Task list page,
# WHEN I select a modification by clicking the checkbox and then click the Continue to assign modifications button,
# THEN I am taken to the next page to select a study-wide reviewer,
# AND the proper list of study-wide reviewers should be displayed, the list of SWRs available should be determined by the assign modification (e.g. so if it = England, then it should only display SWRs with the review body HRA and are active),
# AND I can see all selected modifications on that page, including the following fields: Short project title, Modification ID, and a scrollable list of study-wide reviewers,
# AND Short project titles should be link buttons.

# AND  the Complete assignment button should be displayed at the bottom of the page,

# The button should be disabled for now, as the record page is not within the scope of this ticket.

# Scenario : 2- Validate the user navigates to the task list page  from the ‘Select a study-wide reviewer’ page on clicking ‘Back’ button on ‘Select a study-wide reviewer’ page

# GIVEN I am on the page to select a study-wide reviewer,
# WHEN I click the Back button at the top left of the page,
# THEN I am redirected back to the Tasklist page,
# AND my previously selected modifications and reviewer remain preserved.

# https://nihr.atlassian.net/browse/RSP-4849
# Test Case Design - AC’s for Automation:

# Pre-requisite: The user has selected a study-wide reviewer from the list on the previous page and clicked the Complete assignment button.

# Supporting links:
# Figma link: Review research -Assign a modification – Figma

# Scenario : 1- Validate the user navigates to the final page on clicking ‘Complete assignment’ button

# GIVEN I've selected a reviewer from the list,
# WHEN I click the Complete assignment button and proceed to the final page.
# THEN I see a success message with a description of what happens next, along with the Back to Tasklist button on the final page.

# Scenario : 2-Validate the user navigates to the tasklist page on clicking ‘Back to Tasklist' button

# GIVEN I am on the final page,
# WHEN I click the Back to Tasklist button beneath the text,
# THEN clicking the button should navigate me to the Tasklist page.
