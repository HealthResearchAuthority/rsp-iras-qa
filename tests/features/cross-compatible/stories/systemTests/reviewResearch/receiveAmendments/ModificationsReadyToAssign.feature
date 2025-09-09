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

    @WFCAssignModificationSWR @rsp-4076 @rsp-4849
    Scenario Outline: Validate the workflow co-ordinator can assign a study-wide reviewer to a modification from the modifications ready to assign page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
        And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
        Then I can see the modifications assignment confirmation page for '<Study_Wide_Reviewer>'
        And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
        Then I can see the 'Modifications_Tasklist_Page'
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        # Then I can see previously assigned modification is no longer displayed in the modifications ready to assign table for '<Search_Input>'
        Examples:
            | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                       |
            | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England |

    @ModificationsList @rsp-4076 @rsp-4849
    Scenario Outline: Validate whether the proper list of modifications are displayed based on the 'Select a reviewer' page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        # And I can see all selected modifications on that page, including the following fields: Short project title, Modification ID
        And I capture the page screenshot

        Examples:
            | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                       |
            | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England |

    @StudyWideReviewerList @rsp-4076 @rsp-4849
    Scenario Outline: Validate whether the proper list of study-wide reviewers are displayed based on the lead nation of the selected modification and the corresponding review body
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        # And I can see all selected modifications on that page
        # And I can see the proper list of study-wide reviewers displayed based on the lead nation of the selected modification and the corresponding review body
        And I capture the page screenshot

        Examples:
            | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                       |
            | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England |

    @BackLinkNavigation @RetainSelectedCheckboxes @rsp-4076 @rsp-4849
    Scenario Outline: Validate the workflow co-ordinator navigates to the modifications task list page from the 'Select a reviewer' page on clicking 'Back' button on 'Select a reviewer' page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        When I click the 'Back' button on the 'Select_Study_Wide_Reviewer_Page'
        Then I can see the 'Modifications_Tasklist_Page'
        # And I can see previously selected modifications checkboxes are retained
        And I capture the page screenshot

        Examples:
            | Validation_Text | Modification_Id                       |
            | Label_Texts     | Modification_Id_Ln_England_Pn_England |

# Validate - Retaining of filters- Bakkiya

# navigates to 'Select a study-wide reviewer' page on clicking 'Continue to assign modifications' button on the task list page
# https://nihr.atlassian.net/browse/RSP-4076
# Test Case Design - AC’s for Automation:
# Pre-requisite:
# The roles and permissions feature should be implemented to properly display the list of study-wide reviewers.
#  The user is on the Task list page, has selected at least one modification by clicking the checkbox, and clicks the Continue to assign modifications button to proceed to the next page.
# Scenario : 1- Validate the user navigates to ‘Select a study-wide reviewer’ page on clicking Continue to assign modifications button on the task list page
# GIVEN I am on the Task list page,
# WHEN I select a modification by clicking the checkbox and then click the Continue to assign modifications button,
# THEN I am taken to the next page to select a study-wide reviewer,
# AND the proper list of study-wide reviewers should be displayed, the list of SWRs available should be determined by the assign modification (e.g. so if it = England, then it should only display SWRs with the review body HRA and are active),
# AND I can see all selected modifications on that page, including the following fields: Short project title, Modification ID, and a scrollable list of study-wide reviewers,
# AND Short project titles should be link buttons.
# AND  the Complete assignment button should be displayed at the bottom of the page,
# Scenario : 2- Validate the user navigates to the task list page  from the ‘Select a study-wide reviewer’ page on clicking ‘Back’ button on ‘Select a study-wide reviewer’ page
# GIVEN I am on the page to select a study-wide reviewer,
# WHEN I click the Back button at the top left of the page,
# THEN I am redirected back to the Tasklist page,
# AND my previously selected modifications and reviewer remain preserved.
# https://nihr.atlassian.net/browse/RSP-4849
# Test Case Design - AC’s for Automation:
# Pre-requisite: The user has selected a study-wide reviewer from the list on the previous page and clicked the Complete assignment button.
# Scenario : 1- Validate the user navigates to the final page on clicking ‘Complete assignment’ button
# GIVEN I've selected a reviewer from the list,
# WHEN I click the Complete assignment button and proceed to the final page.
# THEN I see a success message with a description of what happens next, along with the Back to Tasklist button on the final page.
# Scenario : 2-Validate the user navigates to the tasklist page on clicking ‘Back to Tasklist' button
# GIVEN I am on the final page,
# WHEN I click the Back to Tasklist button beneath the text,
# THEN clicking the button should navigate me to the Tasklist page.
