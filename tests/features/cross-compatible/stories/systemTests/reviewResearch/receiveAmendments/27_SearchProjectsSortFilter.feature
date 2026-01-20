@ReceiveAmendments @SearchProjectRecordsSortFilter @TeamManager  @SystemTest @rsp-5455 @rsp-5456 @TestApprovals @TestApprovalsSearch
Feature: Filter, Search and Sort the Search project records page

        Background:
                Given I have navigated to the 'Search_Projects_Page'

        # Known Issues :-
        # I 'cannot' see the advanced filters panel-fail for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)

        # rsp-6194 will be delivered in next sprint
        @viewListOfProjects @ValidIrasIdAndNoFilters @PartialSearchIrasID @rsp-6194
        Scenario Outline: Verify the user can view the list of modifications based on the partial iras id entered and the search performed
                And I capture the iras id and short project title of the recently added project with status as 'Active' from the database
                When I enter '<Partial_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Projects_Page'
                And the system displays project records based on the search '<Partial_Iras_Id>' and filter criteria ''
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                Examples:
                        | Partial_Iras_Id      |
                        | Valid_Iras_Id_Prefix |

        # # rsp-6194 will be delivered in next sprint
        @SortProjectsByColumn @PartialIrasIdSearch  @rsp-6194
        Scenario Outline: Verify the user is able to sort the list of projects by ascending and descending order for each results table column after performing a search with iras id
                And I capture the iras id and short project title of the recently added project with status as 'Active' from the database
                When I enter the the search input for 'project records' with '<Partial_Iras_Id>'
                And I click the 'Search' button on the 'Search_Projects_Page'
                And I can now see a table of search results for 'project records'
                And I can see the list of 'project records' is sorted by 'ascending' order of the 'iras id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by 'descending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by 'descending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the list of 'project records' is sorted by 'ascending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by 'ascending' order of the '<Sort_Field>'

                Examples:
                        | Partial_Iras_Id      | Sort_Button | Sort_Field |
                        | Valid_Iras_Id_Prefix | Iras_Id     | IRAS ID    |
        # | Valid_Iras_Id_Prefix | Short_Project_Title | Short project title |
        # | Valid_Iras_Id_Prefix | Lead_Nation         | Lead nation         |

        @SortProjectsByColumn @DefaultSorting
        Scenario Outline: Verify default sorting of projects by IRAS ID, Short Project Title and Lead Nation and check ascending and descending order for each column after applying filters
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I can now see a table of search results for 'project records'
                And I can see the list of 'project records' is sorted by 'ascending' order of the 'iras id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by '<Sort_Order_First>' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by '<Sort_Order_First>' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the list of 'project records' is sorted by '<Sort_Order_Second>' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of 'project records' is sorted by '<Sort_Order_Second>' order of the '<Sort_Field>'

                Examples:
                        | Advanced_Filters             | Sort_Button         | Sort_Field          | Sort_Order_First | Sort_Order_Second |
                        | Advanced_Filters_Lead_Nation | Iras_Id             | iras id             | descending       | ascending         |
                        | Advanced_Filters_Lead_Nation | Short_Project_Title | short project title | ascending        | descending        |
                        | Advanced_Filters_Lead_Nation | Lead_Nation         | lead nation         | ascending        | descending        |

        @ViewListOfProjects @ViewListOfProjectsPaginationFirstPage @ViewListOfProjectsPaginationPageNumber @ViewListOfProjectsPaginationNextLinkClick
        Scenario Outline: Verify pagination in the list of projects page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the default page size should be 'twenty'
                And the 'Next' button will be 'available' to the user
                And the 'Previous' button will be 'not available' to the user
                And the current page number should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I sequentially navigate through each 'Search_Projects_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot
                Examples:
                        | Navigation_Method | Advanced_Filters             |
                        | page number       | Advanced_Filters_Lead_Nation |
                        | next link         | Advanced_Filters_Lead_Nation |

        @ViewListOfProjects @ViewListOfProjectsPaginationLastPage @ViewListOfProjectsPaginationPageNumber @ViewListOfProjectsPaginationPreviousLinkClick
        Scenario Outline: Verify pagination in the list of projects page when user is on the last page and navigate through each page by clicking page number or by by clicking next link
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the 'Previous' button will be 'available' to the user
                And the 'Next' button will be 'not available' to the user
                And I capture the page screenshot
                Then I sequentially navigate through each 'Search_Projects_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot
                Examples:
                        | Navigation_Method | Advanced_Filters             |
                        | page number       | Advanced_Filters_Lead_Nation |
                        | previous link     | Advanced_Filters_Lead_Nation |

        @viewListOfProjects @ValidIrasIdAndAdvancedFilters @ActiveFilters @DBDataUsed
        Scenario Outline: Verify the user is able to view the list of projects by entering a valid IRAS ID, selecting the advanced filters, and clicking the 'Apply filters' button
                And I capture the iras id and short project title of the recently added project with status as 'Active' from the database
                When I enter '<Valid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I 'cannot' see the advanced filters panel
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id        | Advanced_Filters             |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Lead_Nation |
        # | Valid_Full_Iras_Id | Advanced_Filters_Short_Project_Title |
        # | Valid_Iras_Id_Prefix | Advanced_Filters_All_Except_Short_Project_Title   |
        # | Valid_Iras_Id_Prefix | Advanced_Filters_All_Except_Short_Project_Title   |
        # | Valid_Iras_Id_Prefix | Advanced_Filters_All_Except_Short_Project_Title |

        # @viewListOfProjects @ValidIrasIdAndAdvancedFilters @ActiveFilters @jsDisabled
        # Scenario Outline: Verify the user is able to view the list of projects by entering valid iras id, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
        #         When I enter '<Valid_Iras_Id>' into the search field for 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         And I click the 'Search' button on the 'Search_Projects_Page'
        #         And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria ''
        #         When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        #         And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
        #         And I capture the page screenshot
        #         And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
        #         And I capture the page screenshot
        #         And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
        #         And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
        #         When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        #         And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
        #         And I capture the page screenshot
        #         Examples:
        #                 | Valid_Iras_Id      | Advanced_Filters             |
        #                 | Valid_Full_Iras_Id | Advanced_Filters_Lead_Nation |

        @viewListOfProjects @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @jsDisabled @DBDataUsed
        Scenario Outline: Verify the user can view the list of projects by entering valid iras id, then click on search button and then selected advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the system displays project records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                And I capture the iras id and short project title of the recently added project with status as 'Active' from the database
                When I enter the the search input for 'project records' with '<Valid_Iras_Id>'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Projects_Page'
                And the system displays project records based on the search 'Partial_Iras_Id_Retrieved_From_DB_With_Status_Active' and filter criteria '<Advanced_Filters>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id        | Advanced_Filters                                |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_All_Except_Short_Project_Title |

        @viewListOfProjects @ValidIrasIdAndNoFilters @jsDisabled @DBDataUsed
        Scenario: Verify the user can view the list of projects based on the entered valid iras id and the search performed
                And I capture the iras id and short project title of the recently added project with status as 'Active' from the database
                When I enter 'Project_Iras_Id_Retrieved_From_DB_With_Status_Active' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And the system displays project records based on the search 'Project_Iras_Id_Retrieved_From_DB_With_Status_Active' and filter criteria ''
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot

        @viewListOfProjects @NoIrasIdAndAdvancedFilters @jsDisabled
        Scenario Outline: Verify the user can view the list of projects by selecting advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                When I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the system displays project records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                                |
                        | Advanced_Filters_All_Except_Short_Project_Title |

        @NoResultsFound @NoIrasIdAndNoAdvancedFilters
        Scenario: Verify the user can see an empty state that informs me no projects exist for the search criteria on clicking search button without entering/selecting iras id and filters
                When I click the 'Search' button on the 'Search_Projects_Page'
                Then The search projects page returns to its original empty state with no results displayed
                And I capture the page screenshot

        @NoResultsFound @NoIrasIdAndNoAdvancedFilters
        Scenario: Verify the user can see an empty state that informs me no projects exist for the search criteria on clicking apply filters button without entering/selecting iras id and filters
                When I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                Then The search projects page returns to its original empty state with no results displayed
                And I capture the page screenshot


        @NoResultsFound @InvalidIrasIdAndNoAdvancedFilters
        # Add no results check to regression
        Scenario Outline: Verify the user can see no matching results found message on clicking search button after entering invalid iras id
                When I enter '<Invalid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Projects_Page'
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Invalid_Iras_Id                  |
                        | Invalid_Iras_Id_Letters          |
                        | Invalid_Iras_Id_Symbols          |
                        | Invalid_Iras_Id_Letters_Symbols  |
                        | Invalid_Iras_Id_Leading_Zeros    |
                        | Invalid_Iras_Id_Spaces_Suffix    |
                        | Invalid_Iras_Id_Spaces_Prefix    |
                        | Invalid_Iras_Id_Spaces_Seperator |
                        | Invalid_Iras_Id_Zeros            |

        @NoResultsFound @InvalidIrasIdAndAdvancedFilters
        Scenario Outline: Verify the user can see no matching results found message by entering invalid iras id, then selected advanced filters and click on apply filters button
                When I enter '<Invalid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Invalid_Iras_Id                  | Advanced_Filters                                |
                        | Invalid_Iras_Id_Letters          | Advanced_Filters_All_Except_Short_Project_Title |
                        | Invalid_Iras_Id_Symbols          | Advanced_Filters_All_Except_Short_Project_Title |
                        | Invalid_Iras_Id_Letters_Symbols  | Advanced_Filters_All_Except_Short_Project_Title |
                        | Invalid_Iras_Id_Leading_Zeros    | Advanced_Filters_All_Except_Short_Project_Title |
                        | Invalid_Iras_Id_Leading_Zeros    | Advanced_Filters_All                            |
                        | Invalid_Iras_Id_Spaces_Suffix    | Advanced_Filters_All                            |
                        | Invalid_Iras_Id_Spaces_Prefix    | Advanced_Filters_All                            |
                        | Invalid_Iras_Id_Spaces_Seperator | Advanced_Filters_All                            |
                        | Invalid_Iras_Id_Spaces_Seperator | Advanced_Filters_Lead_Nation                    |
                        | Invalid_Iras_Id_Zeros            | Advanced_Filters_Lead_Nation                    |

        @NoResultsFound @ValidIrasIdAndAdvancedFilters @jsDisabled
        Scenario Outline: Verify the user can see no matching results found message by entering valid iras id, then selected advanced filters and click on apply filters button
                When I enter '<Valid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters_No_Results>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_No_Results>' in the 'Search_Projects_Page'
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id      | Advanced_Filters_No_Results |
                        | Valid_Full_Iras_Id | Advanced_Filters_All        |
        # | Valid_Iras_Id_Prefix | Advanced_Filters_All |

        @NoResultsFound @InvalidAdvancedFilters
        Scenario Outline: Verify the user can see no matching results found message by selecting advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters_No_Results>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_No_Results>' in the 'Search_Projects_Page'
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters_No_Results |
                        | Advanced_Filters_All        |

        @RemoveActiveFiltersOneByOne @jsDisabled
        Scenario Outline: Verify the user can remove the selected filters one by one
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                When I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_After_Remove>' in the 'Search_Projects_Page'
                Examples:
                        | Advanced_Filters     | Advanced_Filters_Remove                             | Advanced_Filters_After_Remove                                    |
                        | Advanced_Filters_All | Advanced_Filters_All_Chief_Investigator_Name_Filter | Advanced_Filters_All_After_Remove_Chief_Investigator_Name_Filter |
                        | Advanced_Filters_All | Advanced_Filters_All_Short_Project_Title_Filter     | Advanced_Filters_All_After_Remove_Short_Project_Title_Filter     |
                        | Advanced_Filters_All | Advanced_Filters_All_Sponsor_Organisation_Filter    | Advanced_Filters_All_After_Remove_Sponsor_Organisation_Filter    |

        @RemoveAllActiveFiltersOneByOne
        Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                When I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And I capture the page screenshot
                Then The search projects page returns to its original empty state with no results displayed
                And I capture the page screenshot

                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_All |

        @RemoveAllActiveFiltersOneByOne @jsDisabled
        Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly based on the previously entered IRAS ID
                When I enter '<Valid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                And 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And I capture the page screenshot
                And I 'cannot' see active filters displayed
                And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria ''
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id      | Advanced_Filters             |
                        | Valid_Full_Iras_Id | Advanced_Filters_Lead_Nation |
        # | Valid_Iras_Id_Prefix | Advanced_Filters_All_Except_Short_Project_Title |

        @RemoveActiveFiltersAltogether
        Scenario Outline: Verify the user can remove the selected filters altogether by clicking 'Clear all filters' link and the search results update accordingly
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                When I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And I click the 'Clear_All_Filters' link on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then The search projects page returns to its original empty state with no results displayed
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_All |

        @RemoveActiveFiltersAlTogether @jsDisabled
        Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then selected advanced filters and click on apply filters button
                When I enter '<Valid_Iras_Id>' into the search field for 'Search_Projects_Page'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Projects_Page'
                And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search 'projects' page
                And I capture the page screenshot
                And I click the 'Clear_All_Filters' link on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I 'cannot' see active filters displayed
                And the system displays project records based on the search '<Valid_Iras_Id>' and filter criteria ''
                Examples:
                        | Valid_Iras_Id      | Advanced_Filters             |
                        | Valid_Full_Iras_Id | Advanced_Filters_Lead_Nation |

        @SponsorOrganisationValidation @AdvancedFilters @jsEnabled @RTS @skip
        Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is enabled-Search Projects Page
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                When I authorise the rts api using '<RTS_API_Data>'
                Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
                And I type valid '<Sponsor_Organisation>' for sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
                And I capture the page screenshot
                And I type invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
                And I capture the page screenshot
                And I type min characters '<Sponsor_Organisation_Min>' for sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                      | Sponsor_Organisation                          | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min             | Suggestion_List_Headers        | RTS_API_Data         | RTS_Request                                 |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Partial_Text_NHS         | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Brackets    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Dot_Comma   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Slash       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Hyphen      | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Start_Space | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Text_Min_Spaces | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

        @SponsorOrganisationValidation @AdvancedFilters @jsDisabled @RTS @skip
        Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is disabled-Search Projects Page
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                When I authorise the rts api using '<RTS_API_Data>'
                Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
                And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>' in the 'Search_Projects_Page'
                And I capture the page screenshot
                And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>' in the 'Search_Projects_Page'
                And I capture the page screenshot
                And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box in the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Search_Projects_Page' in advanced filters
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                      | Sponsor_Organisation                        | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                               | Field_And_Summary_Error_Message     |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Brackets  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets  | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Dot_Comma | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Hyphen    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen    | Sponsor_Organisation_Min_Char_Error |

        # @SponsorOrganisationValidation @AdvancedFilters @jsDisabled @RTS @fail @KNOWN_DEFECT_RSP_RTS @skip
        # Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is disabled-Search Projects Page-RTS issue
        #         And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
        #         And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         When I authorise the rts api using '<RTS_API_Data>'
        #         Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        #         And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>' in the 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>' in the 'Search_Projects_Page'
        #         And I capture the page screenshot
        #         And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box in the 'Search_Projects_Page'
        #         And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
        #         Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Search_Projects_Page' in advanced filters
        #         And I capture the page screenshot
        #         Examples:
        #                 | Advanced_Filters                      | Sponsor_Organisation                           | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min             | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                                    | Field_And_Summary_Error_Message     |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Partial_Text_NHS          | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS            | Sponsor_Organisation_Min_Char_Error |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Slash        | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash          | Sponsor_Organisation_Min_Char_Error |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Start_Space  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space    | Sponsor_Organisation_Min_Char_Error |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space     | Sponsor_Organisation_Min_Char_Error |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |
        #                 | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Text_Min_Spaces | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |

        @SponsorOrganisationValidation @jsDisabled
        Scenario Outline: Verify that the search button appears with a green background in the 'Sponsor Organisation' filter section of the advanced filters when JavaScript is disabled
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And the search button appears with a green background in the sponsor Organisation filter in the 'Search_Projects_Page'
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                      |
                        | Advanced_Filters_Sponsor_Organisation |

        @jsEnabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
        Scenario Outline: When javascript enabled verify the hint text for advanced filters when user select multiple checkboxes(not selected any checkboxes)
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                 |
                        | Advanced_Filter_No_Lead_Nation_Selected          |
                        | Advanced_Filter_No_Participating_Nation_Selected |
                        | Advanced_Filters_All                             |


        @jsEnabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
        Scenario Outline: When javascript enabled verify the hint text for advanced filters when user select multiple checkboxes
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                    |
                        | Advanced_Filter_No_Lead_Nation_Selected             |
                        | Advanced_Filter_One_Lead_Nation_Selected            |
                        | Advanced_Filter_Two_Lead_Nation_Selected            |
                        | Advanced_Filter_Three_Lead_Nation_Selected          |
                        | Advanced_Filter_Four_Lead_Nation_Selected           |
                        | Advanced_Filter_No_Participating_Nation_Selected    |
                        | Advanced_Filter_One_Participating_Nation_Selected   |
                        | Advanced_Filter_Two_Participating_Nation_Selected   |
                        | Advanced_Filter_Three_Participating_Nation_Selected |
                        | Advanced_Filter_Four_Participating_Nation_Selected  |

        @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
        Scenario Outline: When javascript disabled verify the hint text for advanced filters when user select multiple checkboxes-without sponsor
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                    |
                        | Advanced_Filter_One_Lead_Nation_Selected            |
                        | Advanced_Filter_Two_Lead_Nation_Selected            |
                        | Advanced_Filter_Three_Lead_Nation_Selected          |
                        | Advanced_Filter_Four_Lead_Nation_Selected           |
                        | Advanced_Filter_One_Participating_Nation_Selected   |
                        | Advanced_Filter_Two_Participating_Nation_Selected   |
                        | Advanced_Filter_Three_Participating_Nation_Selected |
                        | Advanced_Filter_Four_Participating_Nation_Selected  |

        # Can't close advanced filters panel- for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)
        @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
        Scenario Outline: When javascript disabled verify the hint text for advanced filters when user select multiple checkboxes-with sponsor
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I select advanced filters in the 'Search_Projects_Page' using '<Advanced_Filters>'
                And I click the 'Apply_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_All |

        # Can't close advanced filters panel- for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)
        @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
        Scenario Outline: When javascript disabled verify the hint text for advanced filters when user does n't select any checkboxes
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                 |
                        | Advanced_Filter_No_Lead_Nation_Selected          |
                        | Advanced_Filter_No_Participating_Nation_Selected |

        @VerifyHintTextForAdvanceFilters
        Scenario Outline: Validate hint labels for advanced filters in search modifications page
                And I click the 'Advanced_Filters' button on the 'Search_Projects_Page'
                And I expand the chevrons for '<Advanced_Filters>' in 'Search_Projects_Page'
                And I capture the page screenshot
                And I can see the '<Advanced_Filters_Labels>' ui labels in 'Search_Projects_Page'

                Examples:
                        | Advanced_Filters     | Advanced_Filters_Labels      |
                        | Advanced_Filters_All | Advanced_Filters_Hint_Labels |