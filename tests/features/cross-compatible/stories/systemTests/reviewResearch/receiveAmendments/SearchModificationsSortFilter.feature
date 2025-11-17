@ReceiveAmendments @SearchModificationsSortFilter @StudyWideReviewer @SystemTest @rsp-4011 @rsp-4016 @rsp-4289 @DataIssueNeedsFixing
Feature: Receive Amendments: Filter, Search and Sort the Search modifications page

        Background:
                Given I have navigated to the 'Search_Modifications_Page'
                And I capture the page screenshot

        # Known Issues :-
        # I 'cannot' see the advanced filters panel-fail for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)
        @SortModificationsByColumn @rsp-4090 @rsp-4822 @KNOWN-DEFECT-RSP-6229
        Scenario Outline: Verify the user is able to sort the list of modifications by ascending and descending order for each results table column
                And I fill the search input for searching 'modifications' with 'Valid_Iras_Id_Prefix' as the search query
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I can now see a table of search results for modifications received for approval
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'

                Examples:
                        | Sort_Button         | Sort_Field          |
                        | Modification_Id     | modification id     |
                        | Short_Project_Title | short project title |
                        | Modification_Type   | modification type   |
                        | Chief_Investigator  | chief investigator  |
                        | Lead_Nation         | lead nation         |
                        | Status              | status              |

        @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @rsp-4118  @rsp-4293
        Scenario Outline: Verify the user is able to view the list of modifications by entering a valid IRAS ID, selecting the advanced filters, and clicking the 'Apply filters' button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I 'cannot' see the advanced filters panel
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id        | Advanced_Filters                                 |
                        # | Valid_Iras_Id_Twenty      | Advanced_Filters_Twenty                          |
                        # | Valid_Iras_Id_TwentyOne   | Advanced_Filters_TwentyOne                       |
                        # | Valid_Iras_Id_TwentyTwo   | Advanced_Filters_TwentyTwo                       |
                        # | Valid_Iras_Id_TwentyThree | Advanced_Filters_TwentyThree                     |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Automation_No_SpOrg             |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Automation_No_SpOrg_No_ToDate   |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Automation_No_SpOrg_No_FromDate |

        @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @rsp-4118  @rsp-4293 @jsDisabled
        Scenario Outline: Verify the user is able to view the list of modifications by entering a valid IRAS ID, selecting the advanced filters(with sponsor organisation), and clicking the 'Apply filters' button-when JSvavascript is enabled
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters     |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Nth |

        @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @jsDisabled
        Scenario Outline: Verify the user is able to view the list of modifications by entering valid iras id, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters     |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Nth |
        # | Valid_Iras_Id_Twenty      | Advanced_Filters_Twenty      |
        # | Valid_Iras_Id_TwentyOne   | Advanced_Filters_TwentyOne   |
        # | Valid_Iras_Id_TwentyTwo   | Advanced_Filters_TwentyTwo   |
        # | Valid_Iras_Id_TwentyThree | Advanced_Filters_TwentyThree |

        @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @jsDisabled
        Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then click on search button and then selected advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters     |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Nth |
        # | Valid_Iras_Id_Twenty      | Advanced_Filters_Twenty      |
        # | Valid_Iras_Id_TwentyOne   | Advanced_Filters_TwentyOne   |
        # | Valid_Iras_Id_TwentyTwo   | Advanced_Filters_TwentyTwo   |
        # | Valid_Iras_Id_TwentyThree | Advanced_Filters_TwentyThree |

        @viewListOfModifications @ValidIrasIdAndNoFilters @jsDisabled
        Scenario Outline: Verify the user can view the list of modifications based on the entered valid iras id and the search performed
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     |
                        | Valid_Iras_Id_Nth |
        # | Valid_Iras_Id_Nineteen    |
        # | Valid_Iras_Id_Twenty      |
        # | Valid_Iras_Id_TwentyOne   |
        # | Valid_Iras_Id_TwentyTwo   |
        # | Valid_Iras_Id_TwentyThree |

        @viewListOfModifications @NoIrasIdAndAdvancedFilters @jsDisabled
        Scenario Outline: Verify the user can view the list of modifications by selecting advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                When I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_Nth |
        # | Advanced_Filters_Two       |
        # | Advanced_Filters_Three       |
        # | Advanced_Filters_Four      |
        # | Advanced_Filters_Five        |
        # | Advanced_Filters_Six         |
        # | Advanced_Filters_Seven       |
        # | Advanced_Filters_Eight       |
        # | Advanced_Filters_Nine        |
        # | Advanced_Filters_Ten         |
        # | Advanced_Filters_Eleven      |
        # | Advanced_Filters_Fourteen    |
        # | Advanced_Filters_Sixteen   |
        # | Advanced_Filters_Seventeen |
        # | Advanced_Filters_Eighteen    |
        # | Advanced_Filters_Twenty      |
        # | Advanced_Filters_TwentyOne |
        # | Advanced_Filters_TwentyTwo   |
        # | Advanced_Filters_TwentyThree |

        @viewListOfModifications @DateModificationSubmitted @SponsorOrganisation
        Scenario Outline: Verify the user is able to view the list of modifications filtered by sponsor organisation and modification submitted date
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I capture the page screenshot
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters          |
                        | Advanced_Filters_One      |
                        # | Advanced_Filters_Tweleve  |
                        | Advanced_Filters_Thirteen |

        @NoResultsFound @NoIrasIdAndNoAdvancedFilters
        Scenario: Verify the user can see an empty state that informs me no modifications exist for the search criteria on clicking search button without entering/selecting iras id and filters
                When I click the 'Search' button on the 'Search_Modifications_Page'
                Then The search modifications page returns to its original empty state with no results displayed
                And I capture the page screenshot

        @NoResultsFound @NoIrasIdAndNoAdvancedFilters
        Scenario: Verify the user can see an empty state that informs me no modifications exist for the search criteria on clicking apply filters button without entering/selecting iras id and filters
                When I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                Then The search modifications page returns to its original empty state with no results displayed
                And I capture the page screenshot

        @NoResultsFound @InvalidIrasIdAndNoAdvancedFilters
        Scenario Outline: Verify the user can see an empty state that informs me no modifications exist for the search criteria on clicking search button after entering invalid iras id
                When I enter '<Invalid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                Then The search modifications page returns to its original empty state with no results displayed
                And I capture the page screenshot
                Examples:
                        | Invalid_Iras_Id        |
                        | Invalid_Iras_Id_Spaces |
                        | Invalid_Iras_Id_Blank  |

        @NoResultsFound @InvalidIrasIdAndNoAdvancedFilters @rsp-4293
        # Add no results check to regression
        Scenario Outline: Verify the user can see no matching results found message on clicking search button after entering invalid iras id
                When I enter '<Invalid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
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
                When I enter '<Invalid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Invalid_Iras_Id                  | Advanced_Filters             |
                        | Invalid_Iras_Id_Letters          | Advanced_Filters_Eleven      |
                        | Invalid_Iras_Id_Symbols          | Advanced_Filters_Thirteen    |
                        | Invalid_Iras_Id_Letters_Symbols  | Advanced_Filters_Fourteen    |
                        | Invalid_Iras_Id_Leading_Zeros    | Advanced_Filters_Sixteen     |
                        | Invalid_Iras_Id_Leading_Zeros    | Advanced_Filters_Seventeen   |
                        | Invalid_Iras_Id_Spaces_Suffix    | Advanced_Filters_Eighteen    |
                        | Invalid_Iras_Id_Spaces_Prefix    | Advanced_Filters_Twenty      |
                        | Invalid_Iras_Id_Spaces_Seperator | Advanced_Filters_TwentyOne   |
                        | Invalid_Iras_Id_Spaces_Seperator | Advanced_Filters_TwentyTwo   |
                        | Invalid_Iras_Id_Zeros            | Advanced_Filters_TwentyThree |

        @NoResultsFound @ValidIrasIdAndAdvancedFilters @rsp-4293 @jsDisabled
        Scenario Outline: Verify the user can see no matching results found message by entering valid iras id, then selected advanced filters and click on apply filters button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters_No_Results>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_No_Results>' in the 'Search_Modifications_Page'
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters_No_Results |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Fifteen    |

        @NoResultsFound @InvalidAdvancedFilters
        Scenario Outline: Verify the user can see no matching results found message by selecting advanced filters and click on apply filters button
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters_No_Results>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_No_Results>' in the 'Search_Modifications_Page'
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters_No_Results     |
                        | Advanced_Filters_No_Results_One |

        @DateSubmittedError @rsp-4167
        Scenario Outline: Verify the user can see clear validation error message This date you have selected is before the search above when an end date is earlier than the start date
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Date_Submitted_Invalid_Data>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Search_Modifications_Page' in advanced filters
                And I capture the page screenshot
                Examples:
                        | Date_Submitted_Invalid_Data                  | Field_And_Summary_Error_Message         |
                        | Date_Submitted_To_Date_Before_From_Date      | Invalid_Date_Range_To_Before_From_Error |
                        | Date_Submitted_No_Month_From_Date            | Invalid_Date_From_Error                 |
                        | Date_Submitted_No_Day_From_Date              | Invalid_Date_From_Error                 |
                        | Date_Submitted_No_Year_From_Date             | Invalid_Date_From_Error                 |
                        | Date_Submitted_No_Month_To_Date              | Invalid_Date_To_Error                   |
                        | Date_Submitted_No_Day_To_Date                | Invalid_Date_To_Error                   |
                        | Date_Submitted_No_Year_To_Date               | Invalid_Date_To_Error                   |
                        | Date_Submitted_Invalid_Year_Number_From_Date | Invalid_Date_From_Error                 |
                        | Date_Submitted_Invalid_Year_Number_To_Date   | Invalid_Date_To_Error                   |
                        | Date_Submitted_Invalid_Day_Number_To_Date    | Invalid_Date_To_Error                   |
                        | Date_Submitted_Invalid_Day_Letters_To_Date   | Invalid_Date_To_Error                   |
                        | Date_Submitted_Invalid_Year_Letters_To_Date  | Invalid_Date_To_Error                   |


        @RemoveActiveFiltersOneByOne @jsDisabled
        Scenario Outline: Verify the user can remove the selected filters one by one and the search results update accordingly
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                When I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_After_Remove>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters_After_Remove>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page

                Examples:
                        | Advanced_Filters     | Advanced_Filters_Remove                             | Advanced_Filters_After_Remove                                    |
                        | Advanced_Filters_Nth | Advanced_Filters_Nth_Chief_Investigator_Name_Filter | Advanced_Filters_Nth_After_Remove_Chief_Investigator_Name_Filter |
                        | Advanced_Filters_Nth | Advanced_Filters_Nth_Short_Project_Title_Filter     | Advanced_Filters_Nth_After_Remove_Short_Project_Title_Filter     |
                        | Advanced_Filters_Nth | Advanced_Filters_Nth_Sponsor_Organisation_Filter    | Advanced_Filters_Nth_After_Remove_Sponsor_Organisation_Filter    |
                        | Advanced_Filters_Nth | Advanced_Filters_Nth_Date_Submitted_From_To_Filter  | Advanced_Filters_Nth_After_Remove_Date_Submitted_From_To_Filter  |

        @RemoveAllActiveFiltersOneByOne
        Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                When I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then The search modifications page returns to its original empty state with no results displayed
                And I capture the page screenshot

                Examples:
                        | Advanced_Filters                                 |
                        | Advanced_Filters_Automation_No_SpOrg             |
                        | Advanced_Filters_Automation_No_SpOrg_No_ToDate   |
                        | Advanced_Filters_Automation_No_SpOrg_No_FromDate |

        @RemoveAllActiveFiltersOneByOne @jsDisabled
        Scenario Outline: Verify the user can remove all the selected filters(with sponsor org) one by one and the search results update accordingly-JS disabled
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                When I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then The search modifications page returns to its original empty state with no results displayed
                And I capture the page screenshot

                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_Nth |

        @RemoveAllActiveFiltersOneByOne @jsDisabled
        Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly based on the previously entered IRAS ID
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I 'cannot' see active filters displayed
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters     |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Nth |

        @RemoveActiveFiltersAltogether @rsp-4293
        Scenario Outline: Verify the user can remove the selected filters altogether by clicking 'Clear all filters' link and the search results update accordingly
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                When I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And I click the 'Clear_All_Filters' link on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then The search modifications page returns to its original empty state with no results displayed
                And I 'cannot' see the advanced filters panel

                Examples:
                        | Advanced_Filters     |
                        | Advanced_Filters_Nth |

        @RemoveActiveFiltersAlTogether @jsDisabled
        Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then selected advanced filters and click on apply filters button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And I click the 'Clear_All_Filters' link on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I 'cannot' see active filters displayed
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                Examples:
                        | Valid_Iras_Id     | Advanced_Filters     |
                        | Valid_Iras_Id_Nth | Advanced_Filters_Nth |

        @SponsorOrganisationValidation @AdvancedFilters @jsEnabled @RTS
        Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is enabled
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
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

        @SponsorOrganisationValidation @AdvancedFilters @jsDisabled @rsp-4118 @KNOWN-DEFECT-RSP-5483 @RTS
        Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is disabled
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                And I capture the page screenshot
                When I authorise the rts api using '<RTS_API_Data>'
                Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
                And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
                And I capture the page screenshot
                And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
                And I capture the page screenshot
                And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Search_Modifications_Page' in advanced filters
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                      | Sponsor_Organisation                           | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min             | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                                    | Field_And_Summary_Error_Message     |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Partial_Text_NHS          | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS            | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Brackets     | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets       | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Dot_Comma    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma      | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Slash        | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash          | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Hyphen       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen         | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Start_Space  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space    | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space     | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |
                        | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Text_Min_Spaces | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |

        @SponsorOrganisationValidation  @jsDisabled @rsp-4167
        Scenario Outline: Verify that the search button appears with a green background in the 'Sponsor Organisation' filter section of the advanced filters when JavaScript is disabled
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                And the search button appears with a green background in the sponsor Organisation filter
                And I capture the page screenshot
                Examples:
                        | Advanced_Filters                      |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |
                        | Advanced_Filters_Sponsor_Organisation |

        @viewListOfModifications @ValidIrasIdAndNoFilters @PartialSearchIrasID
        Scenario Outline: Verify the user can view the list of modifications based on the partial iras id entered and the search performed
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                Examples:
                        | Valid_Iras_Id     |
                        | Valid_Iras_Id_Nth |
        # | Valid_Iras_Id_Nineteen    |
        # | Valid_Iras_Id_Twenty      |
        # | Valid_Iras_Id_TwentyOne   |
        # | Valid_Iras_Id_TwentyTwo   |
        # | Valid_Iras_Id_TwentyThree |

        @ViewListOfModifications @ViewListOfModificationsPaginationFirstPage @ViewListOfModificationsPaginationPageNumber @ViewListOfModificationsPaginationNextLinkClick
        Scenario Outline: Verify pagination in the list of modifications page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the default page size should be 'twenty'
                And the 'Next' button will be 'available' to the user
                And the 'Previous' button will be 'not available' to the user
                And the current page number should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I sequentially navigate through each 'Search_Modifications_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot
                Examples:
                        | Navigation_Method | Valid_Iras_Id       | Advanced_Filters             |
                        | page number       | Valid_Iras_Id_Zeros | Advanced_Filters_Lead_Nation |
                        | next link         | Valid_Iras_Id_Zeros | Advanced_Filters_Lead_Nation |

        @ViewListOfModifications  @ViewListOfModificationsPaginationLastPage @ViewListOfModificationsPaginationPageNumber @ViewListOfModificationsPaginationPreviousLinkClick
        Scenario Outline: Verify pagination in the list of modifications page when user is on the last page and navigate through each page by clicking page number or by by clicking next link
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                And the 'Previous' button will be 'available' to the user
                And the 'Next' button will be 'not available' to the user
                And I capture the page screenshot
                Then I sequentially navigate through each 'Search_Modifications_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
                And I capture the page screenshot
                Examples:
                        | Navigation_Method | Valid_Iras_Id       | Advanced_Filters             |
                        | page number       | Valid_Iras_Id_Zeros | Advanced_Filters_Lead_Nation |
                        | previous link     | Valid_Iras_Id_Zeros | Advanced_Filters_Lead_Nation |

        @BackLinkNavigation
        Scenario:  Verify the user can navigate from 'Search_Modifications_Page' by clicking 'Back' link
                When I click the 'Back' link on the 'Search_Modifications_Page'
                Then I can see the approvals home page
                When I click the 'Back' link on the 'Approvals_Page'
                Then I can see the 'Home_Page'

        @jsEnabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters @rsp-4167
        Scenario Outline: When javascript enabled verify the hint text for advanced filters when user select multiple checkboxes
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                    |
                        | Advanced_Filter_No_Lead_Nation_Selected             |
                        | Advanced_Filter_One_Lead_Nation_Selected            |
                        | Advanced_Filter_Two_Lead_Nation_Selected            |
                        | Advanced_Filter_Three_Lead_Nation_Selected          |
                        | Advanced_Filter_Four_Lead_Nation_Selected           |
                        | Advanced_Filter_No_Modification_Type_Selected       |
                        | Advanced_Filter_One_Modification_Type_Selected      |
                        | Advanced_Filter_Two_Modification_Type_Selected      |
                        | Advanced_Filter_No_Participating_Nation_Selected    |
                        | Advanced_Filter_One_Participating_Nation_Selected   |
                        | Advanced_Filter_Two_Participating_Nation_Selected   |
                        | Advanced_Filter_Three_Participating_Nation_Selected |
                        | Advanced_Filter_Four_Participating_Nation_Selected  |
        # | Advanced_Filters_Nth                                |


        @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters @rsp-4167
        Scenario Outline: When javascript disabled verify the hint text for advanced filters when user select multiple checkboxes
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                    |
                        | Advanced_Filter_One_Lead_Nation_Selected            |
                        | Advanced_Filter_Two_Lead_Nation_Selected            |
                        | Advanced_Filter_Three_Lead_Nation_Selected          |
                        | Advanced_Filter_Four_Lead_Nation_Selected           |
                        | Advanced_Filter_One_Modification_Type_Selected      |
                        | Advanced_Filter_Two_Modification_Type_Selected      |
                        | Advanced_Filter_One_Participating_Nation_Selected   |
                        | Advanced_Filter_Two_Participating_Nation_Selected   |
                        | Advanced_Filter_Three_Participating_Nation_Selected |
                        | Advanced_Filter_Four_Participating_Nation_Selected  |
        # | Advanced_Filters_Nth                                |

        # Can't close advanced filters panel- for Advanced_Filters_Nth- JS DIsabled (Sponsor is selected)
        @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters @rsp-4167
        Scenario Outline: When javascript disabled verify the hint text for advanced filters when user does n't select any checkboxes
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                And I capture the page screenshot
                And I verify the hint text based on the '<Advanced_Filters>' for search modifications page
                Examples:
                        | Advanced_Filters                                 |
                        | Advanced_Filter_No_Lead_Nation_Selected          |
                        | Advanced_Filter_No_Modification_Type_Selected    |
                        | Advanced_Filter_No_Participating_Nation_Selected |

        @VerifyHintTextForAdvanceFilters @rsp-4167
        Scenario Outline: Validate hint labels for advanced filters in search modifications page
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I expand the chevrons for '<Advanced_Filters>' in search modifications page
                And I capture the page screenshot
                And I can see the '<Advanced_Filters_Labels>' ui labels in search modifications page

                Examples:
                        | Advanced_Filters     | Advanced_Filters_Labels      |
                        | Advanced_Filters_Nth | Advanced_Filters_Hint_Labels |