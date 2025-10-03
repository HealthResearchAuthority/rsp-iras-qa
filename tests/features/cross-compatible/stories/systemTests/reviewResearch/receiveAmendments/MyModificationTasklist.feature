@ReceiveAmendments @MyModificationsTasklist @SystemTest @StudyWideReviewer @KNOWN-DEFECT-RSP-5212
Feature: Receive Amendments: My Modifications Tasklist page that displays modifications that have been assigned to me

    Background:
        Given I have navigated to the 'Approvals_Page'
        And I click the 'My_Tasklist' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the 'My_Modifications_Tasklist_Page'
        And I can see the 'Column' ui labels on the my modifications tasklist page

    @MyModificationsTasklistPaginationFirst @rsp-4820
    Scenario Outline: Verify pagination in My Modifications tasklist when user is on the first page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        Then the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        And I sequentially navigate through each 'My_Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Navigation_Method |
            | page number       |
            | next link         |

    @MyModificationsTasklistPaginationLast @rsp-4820
    Scenario Outline: Verify pagination in My Modifications tasklist when user is on the last page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        And I sequentially navigate through each 'My_Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Navigation_Method |
            | page number       |
            | previous link     |

    @MyModificationsTasklistTitleLinksBackNav @rsp-4820 @rsp-5046
    Scenario: Verify back and short project title link navigation for my tasklist
        And Each 'short project title' displayed on the 'My_Modifications_Tasklist_Page' is a link
        When I click a 'short project title' on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the project overview page
        When I click the 'Back' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        And I can see the 'My_Modifications_Tasklist_Page'
        When I click the 'Back' link on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the approvals home page

    @SortMyTasklistByColumn @rsp-4842
    Scenario Outline: Verify the user is able to sort the my modifications tasklist by ascending and descending order for each table column
        When I click the '<Sort_Button>' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I can see the tasklist on the 'My_Modifications_Tasklist_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And I can see the tasklist on the 'My_Modifications_Tasklist_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the tasklist on the 'My_Modifications_Tasklist_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And I can see the tasklist on the 'My_Modifications_Tasklist_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Modification_Id       | modification id       | ascending    | descending     |
            | Short_Project_Title   | short project title   | ascending    | descending     |
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |

    @searchMyTasklistByIrasIdWithResults @rsp-4821
    Scenario Outline: Verify the user is able to search the my modifications tasklist by the iras ID
        When I fill the search input for searching 'my tasklist' with '<Search_Input>' as the search query
        And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Search_Input>'

        Examples:
            | Search_Input             |
            | Existing_IRAS_ID_Single  |
            | Existing_IRAS_ID_Multi   |
            | Existing_Partial_IRAS_ID |

    @filterMyTasklistByShortTitle @rsp-4821
    Scenario Outline: Verify the user is able to filter the my modifications tasklist by the short project title
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with '<Title_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Title_Filter_Input>'
        And I 'cannot' see the advanced filters panel

        Examples:
            | Title_Filter_Input     |
            | Existing_Title_Single  |
            | Existing_Title_Multi   |
            | Existing_Title_Partial |

    @filterMyTasklistByDateSubmitted @rsp-4821
    Scenario Outline: Verify the user is able to filter the my modifications tasklist by the date submitted
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        And I can see the date from and date to filters have the expected hint text
        When I fill the 'my' modifications tasklist search and filter options with '<Date_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Date_Filter_Input>'
        And I 'cannot' see the advanced filters panel

        Examples:
            | Date_Filter_Input |
            | Date_Range_Single |
            | Date_Range_Multi  |
            | Date_From_Multi   |
            | Date_To_Multi     |

    @filterMyTasklistByDaysSinceSubmission @rsp-4821 @UPDATE-AFTER-RSP-4808
    Scenario Outline: Verify the user is able to filter the my modifications tasklist by the days since submission
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        And I can see the days since submission filter has the expected hint text
        When I fill the 'my' modifications tasklist search and filter options with '<Days_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Days_Filter_Input>'
        And I 'cannot' see the advanced filters panel
        When I click the 'Date_Submitted' button on the 'Modifications_Tasklist_Page'
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Days_Filter_Input>'

        Examples:
            | Days_Filter_Input |
            | Days_Range_Multi  |
            # | Days_Specific_Single | REQUIRES DATA SETUP
            | Days_From_Multi   |
            | Days_To_Multi     |

    @searchFilterComboMyTasklist @rsp-4821
    Scenario Outline: Verify the user is able to combine searching and filtering options to narrow modifications displayed on my tasklist
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the '<Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can now see the table of modifications 'assigned to me' contains the expected search results for '<Search_Filter_Input>'
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

    @searchMyTasklistWithNoResults @rsp-4821 @KNOWN-DEFECT-RSP-5212 @fail
    Scenario Outline: Verify the my tasklist page displays the no results found message, when no records on the system match the search criteria
        And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the 'my' modifications tasklist search and filter options with '<Search_Filter_Input>'
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

    @activeFilterPanelMyTasklist @rsp-4821
    Scenario Outline: Verify the active filters display as expected on my tasklist
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with '<Search_Filter_Input>'
        And I capture the page screenshot
        And I click the '<Button>' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see active filters displayed
        And I can see active filters displayed for '<Search_Filter_Input>'

        Examples:
            | Search_Filter_Input     | Button        |
            | Title_Date_Range_Single | Search        |
            | Title_Date_Range_Multi  | Apply_Filters |
            | Date_From_Multi         | Search        |
            | Days_Range_Multi        | Search        |
            | Days_From_Multi         | Apply_Filters |
            | Days_To_Multi           | Search        |

    @addRemoveFiltersMyTasklist @rsp-4821
    Scenario: Verify that adding and removing filters narrows and widens the search results appropriately on my tasklist
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with 'Date_From_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        When I fill the 'my' modifications tasklist search and filter options with 'Existing_Title_Partial'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'previous' number
        When I click the 'Date_Submitted_Filter_Panel' link on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has 'increased' from the 'previous' number
        When I click the 'Short_Project_Title_Filter_Panel' link on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has returned to the original number
        And I 'cannot' see active filters displayed

    @clearAllFiltersMyTasklist @rsp-4821
    Scenario: Verify that the clear all filters option returns my tasklist to its original state
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with 'Title_Date_Range_Multi'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see active filters displayed
        And I capture the page screenshot
        Then the number of search results has 'decreased' from the 'original' number
        When I click the 'Clear_All_Filters' link on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then the number of search results has returned to the original number
        And I 'cannot' see active filters displayed

    @filterMyTasklistDateSubmittedValidation @rsp-4821
    Scenario Outline: Verify that correct validation is in place for the date submitted filter on my tasklist
        And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I 'can' see the advanced filters panel
        And I open each of the modification tasklist filters
        And I capture the page screenshot
        When I fill the 'my' modifications tasklist search and filter options with '<Date_Filter_Input>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'My_Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see the advanced filters panel
        And I validate '<Field_And_Summary_Error_Message>' displayed on 'My_Modifications_Tasklist_Page'

        Examples:
            | Date_Filter_Input                 | Field_And_Summary_Error_Message           |
            | Invalid_Date_Range_To_Before_From | Invalid_Date_Range_To_Before_From_Error   |
            | Invalid_Date_From                 | Invalid_Date_From_Error                   |
            | Invalid_Date_To                   | Invalid_Date_To_Error                     |
            | Invalid_Date_From_Days_From       | Date_Days_Simultaneous_Summary_Only_Error |