@RegressionModificationsReadyToAssign @WorkFlowCoordinator @Regression @RegressionReceiveAmendments
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    # Date_Submitted,Days_Since_Submission sort is failing
    @RegressionSortTasklistByColumn @rsp-4091 @fail
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

    @filterTasklistDateSubmittedValidation @rsp-4819 
    Scenario Outline: Verify that correct validation is in place for the date submitted filter
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Date_Filter_Input>'
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Date_Submission_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see the advanced filters panel
        And I validate '<Field_And_Summary_Error_Message>' displayed on 'Modifications_Tasklist_Page'

        Examples:
            | Date_Filter_Input | Date_Submission_Filter_Input | Field_And_Summary_Error_Message                        |
            | Date_Range_Multi  | Days_Range_Multi             | Both_Filters_Not_Selected_Same_Time_Summary_Only_Error |
       