@ReceiveAmendments @TeamManagerDashboardSortFilter @TeamManager @SystemTest
Feature: Receive Amendments: Team Mnager's dashboard page that displays modifications ready to be assigned

        # Known Issues :-
        # I 'cannot' see the advanced filters panel-fail for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)

        @viewTeamManagerDashboardByLeadNation  @rsp-5132 @Complete-After-DB-Connection @TestLNTM
        Scenario Outline: Verify the team manger is able to view existing list of modifications for a specific lead nation
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<User>'
                And I capture the page screenshot
                Then the country linked to the '<User>' appears as the lead nation in the page description
                And I see only modifications where the lead nation is the country linked to the '<User>'
                Examples:
                        | User            |
                        | Team_Manager    |
                        | Team_Manager_NI |
                        | Team_Manager_S  |
                        | Team_Manager_W  |

        @searchTasklistByIrasIdWithResults @rsp-5125 @skip
        Scenario Outline: Verify the user is able to search the modifications tasklist by the iras ID
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I fill the search input for searching 'tasklist' with '<Search_Input>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Search_Input>'

                Examples:
                        | Search_Input             |
                        | Existing_IRAS_ID_Single  |
                        | Existing_IRAS_ID_Multi   |
                        | Existing_Partial_IRAS_ID |

        # @filterTasklistByShortTitle @rsp-5125 @skip
        # Scenario Outline: Verify the user is able to filter the modifications tasklist by the short project title
        #         Given I have navigated to the 'Team_Manager_Dashboard_Page'
        #         And I capture the page screenshot
        #         And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
        #         And I 'can' see the advanced filters panel
        #         And I open each of the modification tasklist filters
        #         And I capture the page screenshot
        #         When I fill the 'assign' modifications tasklist search and filter options with '<Title_Filter_Input>'
        #         And I capture the page screenshot
        #         And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
        #         And I capture the page screenshot
        #         Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Title_Filter_Input>'
        #         And I 'cannot' see the advanced filters panel

        #         Examples:
        #                 | Title_Filter_Input     |
        #                 | Existing_Title_Single  |
        #                 | Existing_Title_Multi   |
        #                 | Existing_Title_Partial |

        # study-wide reviewer,status

        @filterTasklistByDateSubmitted @rsp-5125
        Scenario Outline: Verify the user is able to filter the modifications tasklist by the date submitted
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                And I can see the date from and date to filters have the expected hint text
                When I fill the 'assign' modifications tasklist search and filter options with '<Date_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Date_Filter_Input>'
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Date_Filter_Input |
                        | Date_Range_Single |
                        | Date_Range_Multi  |
                        | Date_From_Multi   |
                        | Date_To_Multi     |

        @filterTasklistByDaysSinceSubmission @rsp-5125 @UPDATE-AFTER-RSP-4808
        Scenario Outline: Verify the user is able to filter the modifications tasklist by the days since submission
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                And I can see the days since submission filter has the expected hint text
                When I fill the 'assign' modifications tasklist search and filter options with '<Days_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Days_Filter_Input>'
                And I 'cannot' see the advanced filters panel
                When I click the 'Date_Submitted' button on the 'Team_Manager_Dashboard_Page'
                Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Days_Filter_Input>'

                Examples:
                        | Days_Filter_Input |
                        | Days_Range_Multi  |
                        # | Days_Specific_Single | REQUIRES DATA SETUP
                        | Days_From_Multi   |
                        | Days_To_Multi     |

        @searchFilterComboTasklist @rsp-5122 @rsp-5125
        Scenario Outline: Verify the user is able to combine searching and filtering options to narrow modifications displayed on the tasklist
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                When I fill the 'assign' modifications tasklist search and filter options with '<Search_Filter_Input>'
                And I capture the page screenshot
                And I click the '<Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign' contains the expected search results for '<Search_Filter_Input>'
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Search_Filter_Input     | Button        |
                        # | IRAS_ID_Title_Single            | Apply_Filters |
                        | Title_Date_Range_Single | Search        |
                        # | IRAS_ID_Title_Date_Range_Single | Apply_Filters |
                        # | IRAS_ID_Title_Multi             | Search        |
                        | Title_Date_Range_Multi  | Apply_Filters |
                        # | IRAS_ID_Title_Date_Range_Multi  | Search        |
                        | Title_Days_Range_Multi  | Apply_Filters |

        # study-wide reviewer,status

        @searchTasklistWithNoResults @rsp-5122 @rsp-5125
        Scenario Outline: Verify the tasklist page displays the no results found message, when no records on the system match the search criteria
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                When I fill the 'assign' modifications tasklist search and filter options with '<Search_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the no search results found message is displayed

                Examples:
                        | Search_Filter_Input           |
                        | Non_Existant_IRAS_ID          |
                        # | Non_Existant_Title            |
                        | Non_Existant_Date_Range       |
                        | Non_Existant_Days_Since_Range |

        @activeFilterPanelTasklist @rsp-5122 @rsp-5125
        Scenario Outline: Verify the active filters display as expected
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                When I fill the 'assign' modifications tasklist search and filter options with '<Search_Filter_Input>'
                And I capture the page screenshot
                And I click the '<Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I 'can' see active filters displayed
                And I can see active filters displayed for '<Search_Filter_Input>'

                Examples:
                        | Search_Filter_Input | Button        |
                        # | Title_Date_Range_Single | Search        |
                        # | Title_Date_Range_Multi  | Apply_Filters |
                        | Date_From_Multi     | Search        |
                        | Days_Range_Multi    | Search        |
                        | Days_From_Multi     | Apply_Filters |
                        | Days_To_Multi       | Search        |

        # title >>chnage
        @addRemoveFiltersTasklist @rsp-5125
        Scenario: Verify that adding and removing filters narrows and widens the search results appropriately
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                When I fill the 'assign' modifications tasklist search and filter options with 'Date_From_Multi'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see active filters displayed
                And I capture the page screenshot
                Then the number of search results has 'decreased' from the 'original' number
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                When I fill the 'assign' modifications tasklist search and filter options with 'Existing_Title_Partial'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has 'decreased' from the 'previous' number
                When I click the 'Date_Submitted_Filter_Panel' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has 'increased' from the 'previous' number
                When I click the 'Short_Project_Title_Filter_Panel' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has returned to the original number
                And I 'cannot' see active filters displayed

        # title >>chnage
        @clearAllFiltersTasklist  @rsp-5125
        Scenario: Verify that the clear all filters option returns the tasklist to its original state
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                When I fill the 'assign' modifications tasklist search and filter options with 'Title_Date_Range_Multi'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see active filters displayed
                And I capture the page screenshot
                Then the number of search results has 'decreased' from the 'original' number
                When I click the 'Clear_All_Filters' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has returned to the original number
                And I 'cannot' see active filters displayed

        @filterTasklistDateSubmittedValidation @rsp-5125
        Scenario Outline: Verify that correct validation is in place for the date submitted filter
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the modification tasklist filters
                And I capture the page screenshot
                When I fill the 'assign' modifications tasklist search and filter options with '<Date_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I 'can' see the advanced filters panel
                And I validate '<Field_And_Summary_Error_Message>' displayed on 'Team_Manager_Dashboard_Page'

                Examples:
                        | Date_Filter_Input                 | Field_And_Summary_Error_Message         |
                        | Invalid_Date_Range_To_Before_From | Invalid_Date_Range_To_Before_From_Error |
                        | Invalid_Date_From                 | Invalid_Date_From_Error                 |
                        | Invalid_Date_To                   | Invalid_Date_To_Error                   |

        @SortTasklistByColumn @rsp-5122
        Scenario Outline: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

                Examples:
                        | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
                        | Modification_Id       | modification id       | ascending    | descending     |
                        | Short_Project_Title   | short project title   | ascending    | descending     |
                        | Date_Submitted        | date submitted        | descending   | ascending      |
                        | Days_Since_Submission | days since submission | ascending    | descending     |
        # study-wide reviewer,status

        @tasklistErrorStateValidation @rsp-5122
        Scenario: Verify that the user must select a modifiation before continuing
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                Then I validate 'No_Modifications_Selected_Summary_Only_Error' displayed on 'Team_Manager_Dashboard_Page'

        @ModificationsTasklistPaginationFirst @rsp-5122
        Scenario Outline: Verify pagination in team manager dashboard page when user is on the first page and navigate through each page by clicking page number or by clicking next link
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
                When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the default page size should be 'twenty'
                And the 'Next' button will be 'available' to the user
                And the 'Previous' button will be 'not available' to the user
                And I capture the page screenshot
                Then I sequentially navigate through each 'Team_Manager_Dashboard_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot

                Examples:
                        | Validation_Text | Navigation_Method |
                        | Label_Texts     | page number       |
                        | Label_Texts     | next link         |

        @ModificationsTasklistPaginationLast @rsp-5122
        Scenario Outline: Verify pagination in team manager dashboard page page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the 'Previous' button will be 'available' to the user
                And the 'Next' button will be 'not available' to the user
                And I capture the page screenshot
                Then I sequentially navigate through each 'Team_Manager_Dashboard_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot

                Examples:
                        | Validation_Text | Navigation_Method |
                        | Label_Texts     | page number       |
                        | Label_Texts     | previous link     |

        @ModificationsTasklistTitleLinksNav @jsEnabled @rsp-5046
        Scenario: Verify back and short project title link navigation for modifications tasklist and select reviewer pages
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And Each 'short project title' displayed on the 'Team_Manager_Dashboard_Page' is a link
                When I click a 'short project title' on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the project overview page
                When I click the 'Back' link on the 'Project_Overview_Page'
                And I capture the page screenshot
                And I can see the 'Team_Manager_Dashboard_Page'
                When I select check all checkbox on the current page and validate all checkboxes are checked
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And Each 'short project title' displayed on the 'Select_Study_Wide_Reviewer_Page' is a link
                When I click a 'short project title' on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the project overview page
                When I click the 'Back' link on the 'Project_Overview_Page'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'
                And Each 'modification id' displayed on the 'Team_Manager_Dashboard_Page' is a link
                When I click a 'modification id' on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the review all changes modifications page
                When I click the 'Back' link on the 'Review_All_Changes_Page'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'

        @ModificationsTasklistRandomSelection @rsp-4105 @KNOWN-DEFECT-RSP-4971
        Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I confirm checkbox exists in every row across pages
                And I capture the page screenshot
                And I check random row and validate if the row is checked even after navigation
                And I capture the page screenshot

        @ModificationsTasklistSelectAllWithJs @rsp-4105 @jsEnabled
        Scenario: With JavaScript enabled, Verify if user selects the check all checkbox on the first page and confirm checkboxes are checked and status retained even after navigation
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select check all checkbox on the current page and validate all checkboxes are checked
                And I capture the page screenshot
                When I navigate by 'clicking on next link' within the Modifications Ready to assign page
                And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
                And I confirm all checkboxes are 'checked'
                And I capture the page screenshot
                Then I can see a 'Continue' button on the 'Team_Manager_Dashboard_Page'

        @ModificationsTasklistSelectAllWithoutJs @rsp-4105 @jsDisabled
        Scenario: With JavaScript disabled, Verify user selects the check all checkbox on the first page and confirm checkboxes are unchecked and status retained even after navigation
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When JavaScript is disabled I select check all checkbox on the current page and validate all checkboxes are unchecked
                And I capture the page screenshot
                And I navigate by 'clicking on next link' within the Modifications Ready to assign page
                And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
                And I confirm all checkboxes are 'unchecked'
                And I capture the page screenshot
                Then I can see a 'Continue' button on the 'Team_Manager_Dashboard_Page'

        @ModificationsRandomSelectionAndSort @rsp-4105
        Scenario: Verify user selects few checkboxes on the first page, then applying sort resets all the checkboxes
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I check random row and validate if the row is checked even after navigation
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I confirm all checkboxes are 'unchecked'
                And I capture the page screenshot
                Examples:
                        | Sort_Button           |
                        | Modification_Id       |
                        | Short_Project_Title   |
                        | Date_Submitted        |
                        | Days_Since_Submission |

        @ModificationsSelectAllAndSort @rsp-4105 @jsEnabled @KNOWN-DEFECT-RSP-4976
        Scenario: Verify user selects check all on the first page, then applying sort resets all the checkboxes
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select check all checkbox on the current page and validate all checkboxes are checked
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I confirm all checkboxes are 'unchecked'
                And I capture the page screenshot
                Examples:
                        | Sort_Button           |
                        | Modification_Id       |
                        | Short_Project_Title   |
                        | Date_Submitted        |
                        | Days_Since_Submission |

        # Need to integrate with modification creation process to have a fresh dataset for assignment
        # Test data currently has some modifications already assigned to SWR so cannot run repeatedly
        @WFCAssignModificationSWR @rsp-4076 @rsp-4849 @skip
        Scenario Outline: Validate the team manager can assign a study-wide reviewer to a modification from the modifications ready to assign page
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
                And I capture the page screenshot
                And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the modifications assignment confirmation page for '<Study_Wide_Reviewer>'
                And I capture the page screenshot
                And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see previously assigned modification is no longer displayed in the modifications ready to assign table for '<Modification_Id>'
                And I capture the page screenshot

                Examples:
                        | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                                  |
                        | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_One        |
                        | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Two        |
                        | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Three_Four |

        @StudyWideReviewer @SWRTasklist @rsp-4076 @rsp-4849
        Scenario Outline: Validate the SWR Tasklist page after the workflow co-ordinator assigns a study-wide reviewer to a modification from the modifications ready to assign page
                Given I have navigated to the 'My_Modifications_Tasklist_Page'
                Then I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
                And I capture the page screenshot
                Then I can see the modifications assigned from WFC to SWR are now visible in my task list for '<Modification_Id>'

                Examples:
                        | Valid_Iras_Id                       | Modification_Id                                                    |
                        | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_All_Assigned_From_WFC_To_SWR |

        @ModificationsList @rsp-4076 @rsp-4849
        Scenario Outline: Validate whether all the selected modifications are displayed based on the 'Select a reviewer' page
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see all the selected modifications on that page including details such as the short project title and the modification id
                And I capture the page screenshot

                Examples:
                        | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                                |
                        | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Five_Six |

        @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListActiveLeadNationEngland @rsp-4076 @rsp-4849
        Scenario Outline: Validate whether the active study-wide reviewers are displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
                Given I have navigated to the 'Manage_Users_Page'
                And I capture the page screenshot
                When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then I can see the add a new user profile page
                When I fill the new user profile page using '<User_Profile>'
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Create_User_Profile_Page'
                Then I can see the check and create user profile page
                And I capture the page screenshot
                Then I can see previously filled values in the new user profile page for '<User_Profile>' displayed on the check and create user profile page
                And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
                Then I can see the create user profile confirmation page for '<User_Profile>'
                And I capture the page screenshot
                When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
                Then I can see the 'Manage_Users_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                And I can see the newly created user record should be present in the list for '<User_Profile>' with 'Active' status in the manage user page
                And I capture the page screenshot
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
                And I capture the page screenshot

                Examples:
                        | User_Profile                                                       | Valid_Iras_Id                       | Modification_Id                                | Advanced_Filters_Users                                | Lead_Nation      | Availability  |
                        | Valid_Data_In_All_Fields_Role_Studywide_Reviewer                   | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England          | Available     |
                        | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another           | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Wales            | Not Available |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer         | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Northern Ireland | Not Available |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Scotland         | Not Available |

        @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListDisabledLeadNationEngland @rsp-4076 @rsp-4849
        Scenario Outline: Validate whether disabled study-wide reviewer is not displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
                Given I have navigated to the 'Manage_Users_Page'
                And I capture the page screenshot
                When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then I can see the add a new user profile page
                When I fill the new user profile page using '<User_Profile>'
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Create_User_Profile_Page'
                Then I can see the check and create user profile page
                And I capture the page screenshot
                Then I can see previously filled values in the new user profile page for '<User_Profile>' displayed on the check and create user profile page
                And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
                Then I can see the create user profile confirmation page for '<User_Profile>'
                And I capture the page screenshot
                When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
                Then I can see the 'Manage_Users_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I search and click on view edit link for unique '<User_Profile>' user with 'ACTIVE' status from the manage user page
                Then I can see the user profile page
                And I can see the 'Disable_Label_Texts' ui labels on the user profile page
                And I capture the page screenshot
                When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
                And I validate 'Disable_User_Profile_Labels' labels displayed in disable user profile confirmation page using the '<User_Profile>' details
                And I capture the page screenshot
                And I click the 'Confirm' button on the 'Confirmation_Page'
                And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
                Then I can see the 'Manage_Users_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                And I select advanced filters in the manage users page using 'Advanced_Filter_Role_Studywide_Reviewer_Status_Disabled'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I search and click on view edit link for unique '<User_Profile>' user with 'DISABLED' status from the manage user page
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
                And I capture the page screenshot

                Examples:
                        | User_Profile                                              | Valid_Iras_Id                       | Modification_Id                                | Advanced_Filters_Users                                | Lead_Nation | Availability  |
                        | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Disabled | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England     | Not Available |

        @BackLinkNavigation @RetainSelectedCheckboxes @rsp-4076 @rsp-4849 @KNOWN-DEFECT-RSP-5011
        Scenario Outline: Validate the team manger navigates to the team manger dashboard page from the 'Select a reviewer' page on clicking 'Back' button on 'Select a reviewer' page
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                When I click the 'Back' link on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'
                And I can see previously selected modifications checkboxes are retained for '<Modification_Id>'
                And I capture the page screenshot

                Examples:
                        | Valid_Iras_Id                       | Modification_Id                                |
                        | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six |