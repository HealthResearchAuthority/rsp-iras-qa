@RegressionModificationsReadyToAssign @WorkFlowCoordinator @Regression @RegressionReceiveAmendments @BackStage
Feature: Receive Amendments: Modifications Tasklist page that displays modifications ready to be assigned

    @RegressionSearchFilterComboTasklist @rsp-4104 @rsp-4296
    Scenario Outline: Verify the user is able to combine searching and filtering options to narrow modifications displayed on the tasklist
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        And I can see the date from and date to filters have the expected hint text
        And I can see the days since submission filter has the expected hint text
        When I fill the 'assign' modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the '<Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Search_Filter_Input>'
        And I 'cannot' see the advanced filters panel
        And I 'can' see active filters displayed
        And I can see active filters displayed for '<Search_Filter_Input>'

        Examples:
            | Search_Filter_Input             | Button        |
            | IRAS_ID_Title_Single            | Apply_Filters |
            | Title_Date_Range_Single         | Search        |
            | IRAS_ID_Title_Date_Range_Single | Apply_Filters |
            | IRAS_ID_Title_Multi             | Search        |
            | Title_Date_Range_Multi          | Apply_Filters |
            | IRAS_ID_Title_Date_Range_Multi  | Search        |
            | Title_Days_Range_Multi          | Apply_Filters |

    @RegressionAddRemoveFiltersTasklist @rsp-4104
    Scenario: Verify that adding and removing filters narrows and widens the search results appropriately
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'assign' modifications tasklist search and filter options with 'Date_From_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the 'assign' modifications tasklist search and filter options with 'Existing_Title_Partial'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'previous' number
        When I click the 'Date_Submitted_Filter_Panel' link on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has 'increased' from the 'previous' number
        When I click the 'Short_Project_Title_Filter_Panel' link on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has returned to the original number
        And I 'cannot' see active filters displayed

    @RegressionClearAllFiltersTasklist @rsp-4104
    Scenario: Verify that the clear all filters option returns the tasklist to its original state
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'assign' modifications tasklist search and filter options with 'Title_Date_Range_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        When I click the 'Clear_All_Filters' link on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has returned to the original number
        And I 'cannot' see active filters displayed

    @RegressionLeadNationSortTasklistByColumn @rsp-4091 @rsp-4201 @rsp-4822
    Scenario Outline: Verify lead nation and that the user can sort the modifications tasklist by ascending and descending order for each column
        Given I have navigated to the 'Modifications_Tasklist_Page' as '<User>'
        And I capture the page screenshot
        Then the country linked to the review body of the '<User>' appears as the lead nation in the page description
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I can see the tasklist on the 'Modifications_Tasklist_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And I can see the tasklist on the 'Modifications_Tasklist_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the tasklist on the 'Modifications_Tasklist_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And I can see the tasklist on the 'Modifications_Tasklist_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | User                    | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Workflow_Coordinator    | Modification_Id       | modification id       | ascending    | descending     |
            | Workflow_Coordinator_NI | Short_Project_Title   | short project title   | ascending    | descending     |
            | Workflow_Coordinator_S  | Date_Submitted        | date submitted        | descending   | ascending      |
            | Workflow_Coordinator_W  | Days_Since_Submission | days since submission | ascending    | descending     |
            | Workflow_Coordinator    | Status                | status                | ascending    | descending     |

    @RegressionSearchTasklistWithNoResults @rsp-4104
    Scenario Outline: Verify the tasklist page displays the no results found message, when no records on the system match the search criteria
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the 'assign' modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the no search results found message is displayed

        Examples:
            | Search_Filter_Input     |
            | Non_Existant_IRAS_ID    |
            | Non_Existant_Title      |
            | Non_Existant_Date_Range |

    @RegressionFilterTasklistDateSubmittedValidation @rsp-4104
    Scenario Outline: Verify that correct validation is in place for the date submitted filter
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'assign' modifications tasklist search and filter options with '<Date_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see the advanced filters panel
        And I validate '<Field_And_Summary_Error_Message>' displayed on 'Modifications_Tasklist_Page'

        Examples:
            | Date_Filter_Input                 | Field_And_Summary_Error_Message         |
            | Invalid_Date_Range_To_Before_From | Invalid_Date_Range_To_Before_From_Error |
            | Invalid_Date_From                 | Invalid_Date_From_Error                 |
            | Invalid_Date_To                   | Invalid_Date_To_Error                   |

    @RegressionTasklistErrorStateValidation @rsp-4111
    Scenario: Verify that the user must select a modification before continuing
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        When I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I validate 'No_Modifications_Selected_Summary_Only_Error' displayed on 'Modifications_Tasklist_Page'

    @RegressionModificationsTasklistPaginationNavigation @rsp-4040 @rsp-5046 @rsp-5031
    Scenario Outline: Verify title links, pagination and navigation for the Modifications Tasklist page
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And Each 'short project title' displayed on the 'Modifications_Tasklist_Page' is a link
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        Then the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        And I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<First_Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        And I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<Last_Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        When I click a 'short project title' on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the project overview page
        When I click the 'Back' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I can see the 'Modifications_Tasklist_Page'
        And Each 'modification id' displayed on the 'Modifications_Tasklist_Page' is a link
        When I click a 'modification id' on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the review all changes modifications page
        When I click the 'Back' link on the 'Review_All_Changes_Page'
        And I capture the page screenshot
        Then I can see the 'Modifications_Tasklist_Page'
        When I click the 'Back' link on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the approvals home page

        Examples:
            | First_Navigation_Method | Last_Navigation_Method |
            | page number             | page number            |
            | next link               | previous link          |