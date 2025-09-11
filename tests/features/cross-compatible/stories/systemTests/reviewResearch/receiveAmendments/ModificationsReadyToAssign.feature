@ReceiveAmendments @ModificationsReadyToAssign @WorkFlowCoordinator @SystemTest
Feature: Receive Amendments: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    @searchTasklistByIrasIdWithResults @rsp-4104
    Scenario Outline: Verify the user is able to search the modifications tasklist by the iras ID
        When I fill the search input for searching 'tasklist' with '<Search_Input>' as the search query
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'

        Examples:
            | Search_Input             |
            | Existing_IRAS_ID_Single  |
            | Existing_IRAS_ID_Multi   |
            | Existing_Partial_IRAS_ID |

    @filterTasklistByShortTitle @rsp-4104
    Scenario Outline: Verify the user is able to filter the modifications tasklist by the short project title
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Title_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the modifications ready to assign table contains the expected search results for '<Title_Filter_Input>'
        And I 'cannot' see the advanced filters panel

        Examples:
            | Title_Filter_Input     |
            | Existing_Title_Single  |
            | Existing_Title_Multi   |
            | Existing_Title_Partial |

    @filterTasklistByDateSubmitted @rsp-4104
    Scenario Outline: Verify the user is able to filter the modifications tasklist by the date submitted
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        And I can see the date from and date to filters have the expected hint text
        When I fill the modifications tasklist search and filter options with '<Date_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the modifications ready to assign table contains the expected search results for '<Date_Filter_Input>'
        And I 'cannot' see the advanced filters panel

        Examples:
            | Date_Filter_Input |
            | Date_Range_Single |
            | Date_Range_Multi  |
            | Date_From_Multi   |
            | Date_To_Single    |
            | Date_To_Multi     |

    @filterTasklistByDaysSinceSubmission @rsp-4296 @UPDATE-AFTER-RSP-4808
    Scenario Outline: Verify the user is able to filter the modifications tasklist by the days since submission
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        And I can see the days since submission filter has the expected hint text
        When I fill the modifications tasklist search and filter options with '<Days_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the modifications ready to assign table contains the expected search results for '<Days_Filter_Input>'
        And I 'cannot' see the advanced filters panel
        When I click the 'Date_Submitted' button on the 'Modifications_Tasklist_Page'
        Then I can now see the modifications ready to assign table contains the expected search results for '<Days_Filter_Input>'

        Examples:
            | Days_Filter_Input |
            | Days_Range_Multi  |
            # | Days_Specific_Single | REQUIRES DATA SETUP
            | Days_From_Multi   |
            | Days_To_Multi     |

    @searchFilterComboTasklist @rsp-4104 @rsp-4296
    Scenario Outline: Verify the user is able to combine searching and filtering options to narrow modifications displayed on the tasklist
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the '<Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Filter_Input>'
        And I 'cannot' see the advanced filters panel

        Examples:
            | Search_Filter_Input             | Button        |
            | IRAS_ID_Title_Single            | Apply_Filters |
            | Title_Date_Range_Single         | Search        |
            | IRAS_ID_Title_Date_Range_Single | Apply_Filters |
            | IRAS_ID_Title_Multi             | Search        |
            | Title_Date_Range_Multi          | Apply_Filters |
            | IRAS_ID_Title_Date_Range_Multi  | Search        |
            | Title_Days_Range_Multi          | Apply_Filters |

    @searchTasklistWithNoResults @rsp-4104 @rsp-4296
    Scenario Outline: Verify the tasklist page displays the no results found message, when no records on the system match the search criteria
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the no search results found message is displayed

        Examples:
            | Search_Filter_Input           |
            | Non_Existant_IRAS_ID          |
            | Non_Existant_Title            |
            | Non_Existant_Date_Range       |
            | Non_Existant_Days_Since_Range |

    @activeFilterPanelTasklist @rsp-4104 @rsp-4296
    Scenario Outline: Verify the active filters display as expected
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the '<Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see active filters displayed
        And I can see active filters displayed for '<Search_Filter_Input>'

        Examples:
            | Search_Filter_Input     | Button        |
            | Title_Date_Range_Single | Search        |
            | Title_Date_Range_Multi  | Apply_Filters |
            | Date_From_Multi         | Search        |
            | Date_To_Single          | Apply_Filters |
            | Days_Range_Multi        | Search        |
            | Days_From_Multi         | Apply_Filters |
            | Days_To_Multi           | Search        |

    @addRemoveFiltersTasklist @rsp-4104
    Scenario: Verify that adding and removing filters narrows and widens the search results appropriately
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with 'Date_From_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the modifications tasklist search and filter options with 'Existing_Title_Partial'
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

    @clearAllFiltersTasklist @rsp-4104
    Scenario: Verify that the clear all filters option returns the tasklist to its original state
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with 'Title_Date_Range_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        When I click the 'Clear_All_Filters' link on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has returned to the original number
        And I 'cannot' see active filters displayed

    @filterTasklistDateSubmittedValidation @rsp-4104
    Scenario Outline: Verify that correct validation is in place for the date submitted filter
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the modifications tasklist search and filter options with '<Date_Filter_Input>'
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

    # Date_Submitted,Days_Since_Submission sort is failing
    @SortTasklistByColumn @rsp-4091 @fail
    Scenario Outline: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the tasklist of modifications ready to assign is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And I can see the tasklist of modifications ready to assign is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Modification_Id       | modification id       | ascending    | descending     |
            | Short_Project_Title   | short project title   | ascending    | descending     |
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |

    @tasklistErrorStateValidation @rsp-4111
    Scenario: Verify that the user must select a modifiation before continuing
        When I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        Then I validate 'No_Modifications_Selected_Summary_Only_Error' displayed on 'Modifications_Tasklist_Page'


    @ModificationsTasklistPaginationFirst @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method |
            | Label_Texts     | page number       |
            | Label_Texts     | next link         |

    @ModificationsTasklistPaginationLast @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method |
            | Label_Texts     | page number       |
            | Label_Texts     | previous link     |

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

    @ModificationsSelectAllAndSort @rsp-4105 @jsEnabled @KNOWN-DEFECT-RSP-4976 @fail
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
