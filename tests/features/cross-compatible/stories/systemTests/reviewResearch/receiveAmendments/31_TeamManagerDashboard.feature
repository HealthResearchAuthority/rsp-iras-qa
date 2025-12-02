@ReceiveAmendments @TeamManagerDashboard @TeamManagerDashboardSortFilter @SystemTest @TeamManager @rsp-5122 @rsp-5125 @rsp-5174 @rsp-5175 @rsp-5132 @TestApprovals
Feature: Team Manager Dashboard page

        # Known Issues :-
        # I 'cannot' see the advanced filters panel-fail for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)
        # pagination is missing in team mananger dashboard, swr sorting is not correct
        @sortTeamManagerDashboardByColumn @rsp-4822
        Scenario Outline: Verify the user is able to sort the team manager dashboards by ascending and descending order for each results table column
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I can see the 'Column' ui labels on the team manager dashboard page
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

                Examples:
                        | Sort_Button | Sort_Field | Initial_Sort | Secondary_Sort |
                        | Status      | status     | ascending    | descending     |

        @searchTeamManagerDashboardStatus @rsp-4822
        Scenario Outline: Verify that modifications status display as expected on the team manager dashboard
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I can see the 'Column' ui labels on the team manager dashboard page
                When I enter an iras id for 'England' lead nation modification assigned to '<User>' with status '<Status>' into the search field
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I '<Visibility>' see the modification displayed in the 'Team_Manager_Dashboard_Page' list with '<Status>' status

                Examples:
                        | Status                                 | User               | Visibility |
                        | Modification_Status_Approved           | nobody             | cannot     |
                        | Modification_Status_Received           | nobody             | can        |
                        | Modification_Status_Review_In_Progress | Studywide_Reviewer | can        |

        # there is no data in db with not approved status
        @searchTeamManagerDashboardNotApprovedStatus @rsp-4822 @dataIssue @fail @noDBDataNotApproved
        Scenario Outline: Verify that modifications status display as expected on the team manager dashboard where the status is not approved
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I can see the 'Column' ui labels on the team manager dashboard page
                When I enter an iras id for 'England' lead nation modification assigned to '<User>' with status '<Status>' into the search field
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I '<Visibility>' see the modification displayed in the 'Team_Manager_Dashboard_Page' list with '<Status>' status

                Examples:
                        | Status                           | User   | Visibility |
                        | Modification_Status_Not_Approved | nobody | cannot     |

        @viewTeamManagerDashboardByLeadNation  @rsp-5132 @DBDataUsed @fail @KNOWN_DEFECT-RSP-6411
        Scenario Outline: Verify the team manger is able to view existing list of modifications for a specific lead nation
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<User>'
                And I capture the page screenshot
                Then the country linked to the '<User>' appears as the lead nation in the page description
                And I see only modifications where the lead nation is the country linked to the '<User>' and with status '<Status>'
                Examples:
                        | User            | Status           |
                        | Team_Manager    | With review body |
                        | Team_Manager_NI | With review body |
                        | Team_Manager_S  | With review body |
                        | Team_Manager_W  | With review body |

        @searchTMDashboardByIrasIdWithResults @rsp-5125 @DBDataUsed
        Scenario Outline: Verify the user is able to search the team manager dashboard by the iras ID
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<User>'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Search_Input>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Search_Input>' with '<Status>'

                Examples:
                        | Search_Input             | User         | Status           | Modification_Count |
                        | Existing_IRAS_ID_Single  | Team_Manager | With review body | Single             |
                        # | Existing_IRAS_ID_Multi   | Team_Manager | With review body | Multi              |
                        | Existing_Partial_IRAS_ID | Team_Manager | With review body | Partial            |


        @filterTMDashboardBySWR @rsp-5125
        Scenario Outline: Verify the user is able to filter the team manager dashboard by the study-wide reviewer
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Study_Wide_Reviewer_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Study_Wide_Reviewer_Filter_Input>' with '<Status>'
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Study_Wide_Reviewer_Filter_Input     | Status           |
                        | Existing_Study_Wide_Reviewer_Multi   | With review body |
                        | Existing_Study_Wide_Reviewer_Partial | With review body |

        # status-out of scope

        @filterTMDashboardByDateSubmitted @rsp-5125 @DBSetupReqd
        Scenario Outline: Verify the user is able to filter the team manager dashboard by the date submitted
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                And I can see the date from and date to filters have the expected hint text
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Date_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Date_Filter_Input>' with '<Status>'
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Date_Filter_Input | Status           |
                        | Date_Range_Multi  | With review body |
                        | Date_From_Multi   | With review body |
                        | Date_To_Multi     | With review body |
        #  date submitted need to capture from db to avoid any failures

        @filterTMDashboardByDaysSinceSubmission @rsp-5125 @UPDATE-AFTER-RSP-4808 @DBSetupReqd
        Scenario Outline: Verify the user is able to filter the team manager dashboard by the days since submission
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                And I can see the days since submission filter has the expected hint text
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Days_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Days_Filter_Input>' with '<Status>'
                And I 'cannot' see the advanced filters panel
                When I click the 'Date_Submitted' button on the 'Team_Manager_Dashboard_Page'
                Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Days_Filter_Input>' with '<Status>'

                Examples:
                        | Days_Filter_Input | Status           |
                        | Days_Range_Multi  | With review body |
                        # | Days_Specific_Single | REQUIRES DATA SETUP
                        | Days_From_Multi   | With review body |
                        | Days_To_Multi     | With review body |

        # @searchFilterComboTMDashboard @rsp-5122 @rsp-5125 @dataIssue
        # Scenario Outline: Verify the user is able to combine searching and filtering options to narrow modifications displayed on the team manager dashboard
        #         Given I have navigated to the 'Team_Manager_Dashboard_Page'
        #         And I capture the page screenshot
        #         And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<User>' with status '<Status>' and SWR '<Study_Wide_Reviewer>'
        #         And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
        #         And I 'can' see the advanced filters panel
        #         And I open each of the 'team manager dashboard' filters
        #         And I capture the page screenshot
        #         When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Search_Filter_Input>'
        #         And I capture the page screenshot
        #         And I click the '<Button>' button on the 'Team_Manager_Dashboard_Page'
        #         And I capture the page screenshot
        #         Then I can now see the table of modifications 'ready to assign and reassign in team manager dashboard' contains the expected search results for '<Search_Filter_Input>' with '<Status>'
        #         And I 'cannot' see the advanced filters panel

        #         Examples:
        #                 | Search_Filter_Input                            | Button        | Status           | User         | Modification_Count | Study_Wide_Reviewer             |
        #                 | IRAS_ID_Study_Wide_Reviewer_Date_Range_Multi   | Apply_Filters | With review body | Team_Manager | Multi              | Study_Wide_Reviewer_HRA_England |
        #                 | IRAS_ID_Study_Wide_Reviewer_Date_Range_Partial | Apply_Filters | With review body | Team_Manager | Single             | Study_Wide_Reviewer_HRA_England |

        @searchTMDashboardWithNoResults @rsp-5122 @rsp-5125
        Scenario Outline: Verify the team manager dashboard page displays the no results found message, when no records on the system match the search criteria
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Search_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the no search results found message is displayed

                Examples:
                        | Search_Filter_Input           |
                        | Non_Existant_IRAS_ID          |
                        | Non_Existant_Date_Range       |
                        | Non_Existant_Days_Since_Range |

        @activeFilterPanelTMDashboard @rsp-5122 @rsp-5125
        Scenario Outline: Verify the active filters display as expected
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Search_Filter_Input>'
                And I capture the page screenshot
                And I click the '<Button>' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I 'can' see active filters displayed
                And I can see active filters displayed for '<Search_Filter_Input>'

                Examples:
                        | Search_Filter_Input                  | Button        |
                        | Study_Wide_Reviewer_Date_Range_Multi | Apply_Filters |
                        | Date_From_Multi                      | Search        |
                        | Days_Range_Multi                     | Search        |
                        | Days_From_Multi                      | Apply_Filters |
                        | Days_To_Multi                        | Search        |

        @addRemoveFiltersTMDashboard @rsp-5125
        Scenario: Verify that adding and removing filters narrows and widens the search results appropriately
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with 'Date_From_Multi'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see active filters displayed
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with 'Existing_Study_Wide_Reviewer_Partial'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I click the 'Date_Submitted_Filter_Panel' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has 'increased' from the 'previous' number
                When I click the 'Study_Wide_Reviewer_Filter_Panel' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has returned to the original number
                And I 'cannot' see active filters displayed

        @clearAllFiltersTMDashboard  @rsp-5125
        Scenario: Verify that the clear all filters option returns the team manager dashboard to its original state
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with 'Study_Wide_Reviewer_Date_Range_Multi'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see active filters displayed
                And I capture the page screenshot
                When I click the 'Clear_All_Filters' link on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then the number of search results has returned to the original number
                And I 'cannot' see active filters displayed

        @filterTMDashboardDateSubmittedValidation @rsp-5125
        Scenario Outline: Verify that correct validation is in place for the date submitted filter in team manager dashboard
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I 'can' see the advanced filters panel
                And I open each of the 'team manager dashboard' filters
                And I capture the page screenshot
                When I fill the 'ready to assign and reassign in team manager dashboard' search and filter options with '<Date_Filter_Input>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I 'can' see the advanced filters panel
                And I validate '<Field_And_Summary_Error_Message>' displayed on 'Team_Manager_Dashboard_Page'

                Examples:
                        | Date_Filter_Input                 | Field_And_Summary_Error_Message           |
                        | Invalid_Date_Range_To_Before_From | Invalid_Date_Range_To_Before_From_Error   |
                        | Invalid_Date_From                 | Invalid_Date_From_Error                   |
                        | Invalid_Date_To                   | Invalid_Date_To_Error                     |
                        | Invalid_Date_From_Days_From       | Date_Days_Simultaneous_Summary_Only_Error |

        @SortTMDashboardByColumn @rsp-5122
        Scenario Outline: Verify the user is able to sort the team manager dashboard by ascending and descending order for each results table column
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
                And I capture the page screenshot
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
                        | Status                | status                | ascending    | descending     |

        @SortTMDashboardByColumn @rsp-5122 @KNOWN_DEFECT-RSP-6411 @fail @defectSWRSortingDuetoSPace
        Scenario Outline: Verify the user is able to sort the team manager dashboard by ascending and descending order for study-wide reviewer
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
                And I capture the page screenshot
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

                Examples:
                        | Sort_Button         | Sort_Field          | Initial_Sort | Secondary_Sort |
                        | Study_Wide_Reviewer | study-wide reviewer | ascending    | descending     |


        @TMDashboardErrorStateValidation @rsp-5122
        Scenario: Verify that the user must select a modifiation before continuing
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                Then I validate 'No_Modifications_Selected_Summary_Only_Error' displayed on 'Team_Manager_Dashboard_Page'

        @ModificationsTMDashboardPaginationFirst @rsp-5122 @fail @KNOWN_DEFECT-RSP-6411
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

        @ModificationsTMDashboardPaginationLast @rsp-5122 @fail @KNOWN_DEFECT-RSP-6411
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

        @TMDashboardTitleLinksNav @jsEnabled
        Scenario Outline: Verify back and short project title link navigation for team manager dashboard and select reviewer pages
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And Each '<Link_Text>' displayed on the 'Team_Manager_Dashboard_Page' is a link
                When I click a '<Link_Text>' on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the '<Navigation_Page>'
                # When I click the 'Back' link on the 'Project_Overview_Page'
                # And I capture the page screenshot
                # And I can see the 'Team_Manager_Dashboard_Page'
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I can see the 'Team_Manager_Dashboard_Page'
                When I select check all checkbox on the current page and validate all checkboxes are checked
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And Each '<Link_Text>' displayed on the 'Select_Study_Wide_Reviewer_Page' is a link
                When I click a '<Link_Text>' on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the '<Navigation_Page>'
                # When I click the 'Back' link on the 'Project_Overview_Page'
                # And I capture the page screenshot
                # Then I can see the 'Team_Manager_Dashboard_Page'
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I can see the 'Team_Manager_Dashboard_Page'
                Examples:
                        | Link_Text           | Navigation_Page       |
                        | short project title | Project_Overview_Page |

        @TMDashboardModificationLinksNav @jsEnabled
        Scenario Outline: Verify back and modification link navigation for team manager dashboard and select reviewer pages
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And Each '<Link_Text>' displayed on the 'Team_Manager_Dashboard_Page' is a link
                When I click a '<Link_Text>' on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the '<Navigation_Page>'
                When I click the 'Back' link on the 'Modification_Details_Page'
                And I capture the page screenshot
                And I can see the 'Team_Manager_Dashboard_Page'
                When I select check all checkbox on the current page and validate all checkboxes are checked
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And Each '<Link_Text>' displayed on the 'Select_Study_Wide_Reviewer_Page' is a link
                When I click a '<Link_Text>' on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the '<Navigation_Page>'
                When I click the 'Back' link on the 'Modification_Details_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                Examples:
                        | Link_Text       | Navigation_Page           |
                        | modification id | Modification_Details_Page |

        @TMDashboardRandomSelection
        Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I confirm checkbox exists in every row across pages
                And I capture the page screenshot
                And I check random row and validate if the row is checked even after navigation
                And I capture the page screenshot

        @TMDashboardSelectAllWithJs  @jsEnabled
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

        @TMDashboardSelectAllWithoutJs  @jsDisabled
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

        @TMDashboardModificationsRandomSelectionAndSort
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

        @TMDashboardModificationsSelectAllAndSort @jsEnabled
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

        @TMAssignModificationSWR
        Scenario Outline: Validate the team manager can assign a study-wide reviewer to a modification from the team manger dashboard page
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<Team_Manager_User>'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<Team_Manager_User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Valid_Iras_Id>' by clicking the checkbox in the 'team manager dashboard' page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
                And I capture the page screenshot
                And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the modifications assignment confirmation page for 'Team_Manager' with reviewer '<Study_Wide_Reviewer>'
                And I capture the page screenshot
                And  I click the 'Back_To_Dashboard' link on the 'Modifications_Assignment_Confirmation_Page_Team_Manager'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see previously assigned modification is displayed in 'Team_Manager_Dashboard_Page' with status 'Review in progress' and reviewer '<Study_Wide_Reviewer>'
                And I capture the page screenshot
                Given I have navigated to the 'My_Modifications_Tasklist_Page' as '<Study_Wide_Reviewer_User>'
                Then I capture the page screenshot
                When I fill the search input for searching 'my tasklist' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
                And I capture the page screenshot
                Then I can see the modifications assigned from WFC or TM to SWR are now visible in my task list with status 'Review in progress'

                Examples:
                        | Valid_Iras_Id           | Study_Wide_Reviewer             | Team_Manager_User | Status           | Modification_Count | Study_Wide_Reviewer_User |
                        | Existing_IRAS_ID_Single | Study_Wide_Reviewer_HRA_England | Team_Manager      | With review body | Single             | Studywide_Reviewer       |


        @TMDashboardModificationsList @DBDataUsed
        Scenario Outline: Validate whether all the selected modifications are displayed based on the 'Select a reviewer' page
                Given I have navigated to the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<Team_Manager_User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Valid_Iras_Id>' by clicking the checkbox in the 'team manager dashboard' page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see all the selected modifications on that page including details such as the short project title and the modification id
                And I capture the page screenshot

                Examples:
                        | Valid_Iras_Id           | Study_Wide_Reviewer             | Team_Manager_User | Status           | Modification_Count | Study_Wide_Reviewer_User |
                        | Existing_IRAS_ID_Single | Study_Wide_Reviewer_HRA_England | Team_Manager      | With review body | Single             | Studywide_Reviewer       |

        @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListActiveLeadNationEngland
        Scenario Outline: Validate whether the active study-wide reviewers are displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
                Given I have navigated to the 'Manage_Users_Page' as 'System_Admin'
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
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<Team_Manager_User>'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<Team_Manager_User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Valid_Iras_Id>' by clicking the checkbox in the 'team manager dashboard' page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
                And I capture the page screenshot

                Examples:
                        | User_Profile                                                       | Valid_Iras_Id           | Advanced_Filters_Users                                | Lead_Nation      | Availability  | Team_Manager_User | Status           | Modification_Count | Study_Wide_Reviewer_User |
                        | Valid_Data_In_All_Fields_Role_Studywide_Reviewer                   | Existing_IRAS_ID_Single | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England          | Available     | Team_Manager      | With review body | Single             | Studywide_Reviewer       |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer         | Existing_IRAS_ID_Single | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Northern Ireland | Not Available | Team_Manager      | With review body | Single             | Studywide_Reviewer       |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another | Existing_IRAS_ID_Single | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Scotland         | Not Available | Team_Manager      | With review body | Single             | Studywide_Reviewer       |

        @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListDisabledLeadNationEngland
        Scenario Outline: Validate whether disabled study-wide reviewer is not displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
                Given I have navigated to the 'Manage_Users_Page' as 'System_Admin'
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
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<Team_Manager_User>'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<Team_Manager_User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Valid_Iras_Id>' by clicking the checkbox in the 'team manager dashboard' page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
                And I capture the page screenshot

                Examples:
                        | User_Profile                                              | Valid_Iras_Id           | Advanced_Filters_Users                                | Lead_Nation | Availability  | Team_Manager_User | Status           | Modification_Count | Study_Wide_Reviewer_User |
                        | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Disabled | Existing_IRAS_ID_Single | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England     | Not Available | Team_Manager      | With review body | Single             | Studywide_Reviewer       |

        @BackLinkNavigation @RetainSelectedCheckboxes
        Scenario Outline: Validate the team manger navigates to the team manger dashboard page from the 'Select a reviewer' page on clicking 'Back' button on 'Select a reviewer' page
                Given I have navigated to the 'Team_Manager_Dashboard_Page' as '<User>'
                And I capture the page screenshot
                And I capture the modification id of '<Modification_Count>' where the lead nation is the country linked to the '<User>' and with status '<Status>'
                When I fill the search input for searching 'team manager dashboard' with '<Valid_Iras_Id>' as the search query
                And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                When I select modifications with ids as '<Valid_Iras_Id>' by clicking the checkbox in the 'team manager dashboard' page
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Team_Manager_Dashboard_Page'
                And I capture the page screenshot
                Then I can see the 'Select_Study_Wide_Reviewer_Page'
                When I click the 'Back' link on the 'Select_Study_Wide_Reviewer_Page'
                And I capture the page screenshot
                Then I can see the 'Team_Manager_Dashboard_Page'
                And I can see previously selected modifications checkboxes are retained
                And I capture the page screenshot

                Examples:
                        | Valid_Iras_Id           | User         | Status           | Modification_Count |
                        | Existing_IRAS_ID_Single | Team_Manager | With review body | Single             |
