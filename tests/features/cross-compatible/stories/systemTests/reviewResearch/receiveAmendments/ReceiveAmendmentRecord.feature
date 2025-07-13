@ReceiveAmendments @FrontStageUser @SystemTest @rsp-4011 @rsp-4016 @4118
Feature: Receive Amendment - Staff dashboard/worklist

    Background:
        # Given I have navigated to the 'Home_Page'
        # When I click the 'Approvals' link on the 'Home_Page'
        # Then I can see the approvals home page
        # And I capture the page screenshot
        # When I click the 'Search_For_Modifications' link on the 'Approvals_Page'
        # And I capture the page screenshot
        Given I have navigated to the 'Search_Modifications_Page'
        Then I can see the 'Search_Modifications_Page'
        And I capture the page screenshot

    ##Scenario 1 -Happy Paths:

    # 1. Valid IRAS ID + filters(64 combinations) >>Click Apply Filters>>Results displayed (some combinations can't give results) (Search button is not clicked)
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @Test1
    Scenario Outline: Verify the user is able to view the list of modifications by entering a valid IRAS ID, selecting the advanced filters, and clicking the 'Apply filters' button
        When I enter '<Valid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        Examples:
            | Valid_Iras_Id     | Advanced_Filters     |
            | Valid_Iras_Id_One | Advanced_Filters_One |
    # | Valid_Iras_Id_One | Sponsor_Organisation_Text_Blank |

    # 2. Valid IRAS ID >>Click Search>>Results displayed>> Select Advanced Filters(64 combinations)>> Click Apply Filters>>Results displayed(filtered results)
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @Test3
    Scenario Outline: Verify the user is able to view the list of modifications by entering valid iras id, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
        # When I enter iras id in the search modifications page using '<Valid_Iras_Id>'
        When I enter '<Valid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then the system displays modification records matching the search criteria of '<Valid_Iras_Id>'
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        Examples:
            | Valid_Iras_Id     | Advanced_Filters     |
            | Valid_Iras_Id_One | Advanced_Filters_One |

    #3.Select Advanced Filters(64 combinations)>> Click Apply Filters>>Results displayed>> Valid IRAS ID >>Click Search>>Results displayed
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters
    Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then click on search button and then selected advanced filters and click on apply filters button
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        When I enter '<Valid_Iras_Id>' into the search field
        # When I enter iras id in the search modifications page using '<Valid_Iras_Id>'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then the system displays modification records matching the search criteria of '<Valid_Iras_Id>'
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        Examples:
            | Valid_Iras_Id     | Advanced_Filters     |
            | Valid_Iras_Id_One | Advanced_Filters_One |

    # 4. Valid IRAS ID + No Filters >>Click Search>>Results displayed
    @viewListOfModifications @ValidIrasIdAndNoFilters
    Scenario Outline: Verify the user can view the list of modifications based on the entered valid iras id and the search performed
        # When I enter iras id in the search modifications page using '<Valid_Iras_Id>'
        When I enter '<Valid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then the system displays modification records matching the search criteria of '<Valid_Iras_Id>'
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        Examples:
            | Valid_Iras_Id     |
            | Valid_Iras_Id_One |


    #5. No IRAS ID+Filters(64 combinations)>>Click Apply Filters>>Results displayed
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @viewListOfModifications @NoIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters
    Scenario Outline: Verify the user can view the list of modifications by selecting advanced filters and click on apply filters button
        When I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the filter criteria of '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        Examples:
            | Advanced_Filters     |
            | Advanced_Filters_One |

    ##Scenario 2 -Unhappy paths:

    #  1. No IRAS ID + No Filters >> Click Search>>No results
    @NoResultsFound @NoIrasIdAndNoAdvancedFilters
    Scenario Outline: Verify the user can see no matching results found message on clicking search button without entering/selecting iras id and filters
        When I click the 'Search' button on the 'Search_Modifications_Page'
        Then the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        And I capture the page screenshot

    # 2.  No IRAS ID + No Filters >> Click Apply Filters>>No results
    @NoResultsFound @NoIrasIdAndNoAdvancedFilters
    Scenario Outline: Verify the user can see no matching results found message on clicking apply filters button without entering/selecting iras id and filters
        When I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        Then the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        And I capture the page screenshot


    #  3. Invalid IRAS ID + No Filters >>Click Search>>No results
    @NoResultsFound @InvalidIrasIdAndNoAdvancedFilters
    Scenario Outline: Verify the user can see no matching results found message on clicking search button after entering invalid iras id
        # When I enter iras id in the search modifications page using '<Invalid_Iras_Id>'
        When I enter '<Invalid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        And I capture the page screenshot
        Examples:
            | Invalid_Iras_Id     |
            | Invalid_Iras_Id_One |

    #   4. Invalid IRAS ID + filters(64 combinations) >>Apply Filters>>No results
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @NoResultsFound @InvalidIrasIdAndAdvancedFilters @ActiveFilters
    Scenario Outline: Verify the user can see no matching results found message by entering invalid iras id, then selected advanced filters and click on apply filters button
        # When I enter iras id in the search modifications page using '<Invalid_Iras_Id>'
        When I enter '<Invalid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        And I capture the page screenshot
        Examples:
            | Invalid_Iras_Id     | Advanced_Filters     |
            | Invalid_Iras_Id_One | Advanced_Filters_One |

    #  5.  Valid IRAS ID + filters(combinations can't give results) >>Click Apply Filters>>No results (some combinations can't give results)
    ##Scenario 6 -Selected filters validation
    # Selected filters are displayed under active filters>>tags/labels for each filter validation
    @NoResultsFound @ValidIrasIdAndAdvancedFilters @ActiveFilters
    Scenario Outline: Verify the user can see no matching results found message by entering invalid iras id, then selected advanced filters and click on apply filters button
        # When I enter iras id in the search modifications page using '<Valid_Iras_Id>'
        When I enter '<Valid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        And I capture the page screenshot
        Examples:
            | Valid_Iras_Id     | Advanced_Filters_No_results     |
            | Valid_Iras_Id_One | Advanced_Filters_No_results_One |

    ##Scenario 4 -'Date Modification submitted' filter validation
    ### Scenario 4.1 -'Date Modification submitted' error validation

    # WHEN I select an end date in the field that is earlier than the start date,
    # THEN I should see a clear validation error message ‘This date you’ve selected is before the search above'
    @NoResultsFound @InvalidIrasIdAndNoAdvancedFilters
    Scenario Outline: Verify the user can see clear validation error message This date you have selected is before the search above when an end date is earlier than the start date
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        # Then the system displays error message '<Error_Message>'
        And I capture the page screenshot
        Examples:
            | Invalid_Data_Advanced_Filters            | Error_Message                             |
            | Invalid_Date_Modification_Submitted_Data | Invalid_Date_Modification_Submitted_Error |

    ##Scenario 6.1 -Remove filters validation
    # Remove filters>>one by one on clicking 'x'/ all together by clicking 'Clear all filters'
    # The search results update accordingly
    @viewListOfModifications @DefaultSorting @RemoveActiveFiltersOneByOne
    Scenario Outline: Verify the user can view the list of modifications by selecting advanced filters and click on apply filters button
        When I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the filter criteria of '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        # And I remove the selected filter '<Advanced_Filters_Remove>'
        Then the system displays modification records matching the filter criteria of '<Advanced_Filters_After_Remove>'

        Examples:
            | Advanced_Filters     | Advanced_Filters_Remove | Advanced_Filters_After_Remove |
            | Advanced_Filters_One | CI_Name                 | Advanced_Filters_No_CI_Name   |

    ##Scenario 6.1 -Remove filters validation
    # Remove filters>>one by one on clicking 'x'/ all together by clicking 'Clear all filters'
    # The search results update accordingly
    @viewListOfModifications @DefaultSorting @RemoveActiveFiltersAllTogether
    Scenario Outline: Verify the user can view the list of modifications by selecting advanced filters and click on apply filters button
        When I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the filter criteria of '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        And I click the 'Clear_All_Filters' link on the 'Search_Modifications_Page'
        Then the system displays no results found message if there is no 'modification record' on the system that matches the search criteria
        Examples:
            | Advanced_Filters     |
            | Advanced_Filters_One |

    ##Scenario 6.1 -Remove filters validation
    # Remove filters>>one by one on clicking 'x'/ all together by clicking 'Clear all filters'
    # The search results update accordingly
    @viewListOfModifications @ValidIrasIdAndAdvancedFilters @DefaultSorting @ActiveFilters @RemoveActiveFiltersAllTogether
    Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then selected advanced filters and click on apply filters button
        # When I enter iras id in the search modifications page using '<Valid_Iras_Id>'
        When I enter '<Valid_Iras_Id>' into the search field
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters
        And the system displays modification records matching the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
        And I capture the page screenshot
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        And I capture the page screenshot
        And I click the 'Clear_All_Filters' link on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then the system displays modification records matching the search criteria of '<Valid_Iras_Id>'
        And I can see the list is sorted by default in the descending order of the 'Modification Id'
        Examples:
            | Valid_Iras_Id     | Advanced_Filters     |
            | Valid_Iras_Id_One | Advanced_Filters_One |

    ##Scenario 5 -'Sponsor organisation' filter validation
    # • The search should begin after entering the first three characters.
    # § If more than three results are returned, only the first three should be displayed initially, with the rest accessible via a vertically scrollable list.
    # § If no results are found, the system must display an appropriate error message to the user.

    @SponsorOrganisationValidation @AdvancedFilters @jsEnabled
    Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is enabled
        And I open advanced filter and each filter one by one by clicking the corresponding filter chevron,if not opened by default using '<Advanced_Filters>'
        And I capture the page screenshot
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        And I type valid '<Sponsor_Organisation>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
        And I type invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
        And I type min characters '<Sponsor_Organisation_Min>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
        And I capture the page screenshot
        Examples:
            | Advanced_Filters                      | Sponsor_Organisation                          | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Suggestion_List_Headers        | RTS_API_Data         | RTS_Request                                 |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Partial_Text_NHS         | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Brackets    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Dot_Comma   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Slash       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Hyphen      | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Start_Space | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

    @SponsorOrganisationValidation @AdvancedFilters @jsDisabled
    Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is disabled
        And I open advanced filter and each filter one by one by clicking the corresponding filter chevron,if not opened by default using '<Advanced_Filters>'
        And I capture the page screenshot
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box in advanced filters and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box in advanced filters and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box in advanced filters
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Search_Modifications_Page' in advanced filters
        And I capture the page screenshot
        Examples:
            | Advanced_Filters                      | Sponsor_Organisation                           | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                                    | Field_And_Summary_Error_Message  |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Partial_Text_NHS          | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS            | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Brackets     | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets       | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Dot_Comma    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma      | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Slash        | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash          | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Hyphen       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen         | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_Start_Space  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space    | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Partial_End_Space    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space     | Field_Error_Sponsor_Organisation |
            | Advanced_Filters_Sponsor_Organisation | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Field_Error_Sponsor_Organisation |




    #### Partial validation for all the text boxes>>Iras Id search validation

    @viewListOfModifications @Pagination
    Scenario Outline: Verify the user can view the list of modifications by entering valid iras id, then click on search button and then selected advanced filters and click on apply filters button
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        # add pagination steps here
        Examples:
            | Advanced_Filters             |
            | Advanced_Filters_Lead_Nation |

###*****************************************************************************************************************************

### https://nihr.atlassian.net/browse/RSP-4011   dev/test - Develop the search & filters for modification records

##Scenario 1 -Happy Paths:

# 1. Valid IRAS ID + No Filters >>Click Search>>Results displayed

# 2. Valid IRAS ID + filters(64 combinations) >>Click Apply Filters>>Results displayed (some combinations can't give results) (Search button is not clicked)

# 3. No IRAS ID+Filters(64 combinations)>>Click Apply Filters>>Results displayed  (Search button is not clicked)>>Do I need to click search

# 4. Valid IRAS ID >>Click Search>>Results displayed>> Select Advanced Filters(64 combinations)>> Click Apply Filters>>Results displayed(filtered results)

# 5.Select Advanced Filters(64 combinations)>> Click Apply Filters>>Results displayed>> Valid IRAS ID >>Click Search>>Results displayed

# 6.Partial Iras ID >>Click Search>>Results displayed

##Scenario 2 -Unhappy paths:

# 1. No IRAS ID + No Filters >> Click Search>>No results

# 2. No IRAS ID + No Filters >> Click Apply Filters>>No results

# 3. Invalid IRAS ID + No Filters >>Click Search>>No results

# 4. Invalid IRAS ID + filters(64 combinations) >>Search>>No results

# 5. Valid IRAS ID + filters(combinations  can't give results) >>Click Apply Filters>>No results (some combinations can't give results)

##Scenario 3 -Validation of Advanced filters

# Advanced filters  JS Enabled

# •  Filter may be expanded by default when JS disabled

# ○ Chief Investigator name — free text field

# ○ Short project title — free text field

# ○ Date modification submitted — date range picker

# ○ Sponsor organisation — search with checklist and radio buttons (Only one sponsor?) JS Enabled

# ○ Lead nation — checkbox + multi-select list

# ○ Modification type — checkbox + multi-select list

##Scenario 4 -'Date Modification submitted' filter validation

### Scenario 4.1 -'Date Modification submitted' error validation

# ○ GIVEN I am applying the ‘Date Modification submitted’ filters,
# WHEN I select an end date in the field that is earlier than the start date,
# THEN I should see a clear validation error message ‘This date you’ve selected is before the search above'

### Scenario 4.2 -'Date Modification submitted' selection (4 combinations- blank, from, to , from and to)

# AND the system should allow users to enter a single specific date without requiring a date range or a ‘from-to’ search.

##Scenario 5 -'Sponsor organisation' filter validation

# ○ Sponsor organisation — search with checklist and radio buttons (Only one sponsor?) JS Enabled

# • The search should begin after entering the first three characters.

# § If more than three results are returned, only the first three should be displayed initially, with the rest accessible via a vertically scrollable list.

# § If no results are found, the system must display an appropriate error message to the user.

##Scenario 6 -Selected filters validation

# • Selected filters are displayed under active filters>>tags/labels for each filter validation

##Scenario 6.1 -Remove filters validation

# • Remove filters>>one by one on clicking 'x'/ all together by clicking 'Clear all filters'
# ○ The search results update accordingly


# ## https://nihr.atlassian.net/browse/RSP-4016  dev/test - Display modification results after search

#     Scenario : 1- Default sorting

#     GIVEN I have performed a search,
#     WHEN the search results are displayed,
#     THEN I see modification records in a table view showing modification ID, short project title, modification type, chief investigator, lead nation, and project link.
#     AND by default, the records should be sorted in the descending order of the modification id

#     Scenario: 2 – Clearing active filters (one by one / all at once)

#     GIVEN I have applied filters during my search,
#     WHEN the search results are displayed,
#     THEN I see all active filters clearly visible,
#     AND I can remove individual filters by clicking the ‘x' button or clear all filters at once by clicking the 'Clear all filters’ button,
#     AND The search results update accordingly.

#     Scenario: 3 – No results found

#     GIVEN there are no records to display,
#     WHEN I view the search results area,
#     THEN I see an empty state that informs me no modifications exist for the search criteria. (RR-Receive amendment record – Figma)

#     Scenario : 4- Pagination

#     GIVEN the search has returned a large volume of results,
#     WHEN the user views the list of results,
#     THEN the default page size should be 20 records,
#     AND the pagination controls should be displayed at the bottom of the page.

#     Scenario: 4.1- The user is on the first page

#     GIVEN I am on the first page,
#     WHEN I view the paginated results,
#     THEN the ‘Previous’ button will be disabled and not visible First page pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page after the current page and the last page First page – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number Pagination with numbered labels – Pagination.

#     Scenario : 4.2 - The user is on the last page

#     GIVEN I am on the last page,
#     WHEN I view the paginated results,
#     THEN the ‘Next’ button will be disabled and not visible Last page pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page immediately before the current page and the first page Last page – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number Pagination with numbered labels – Pagination.

#     Scenario : 4.3 – The user selects a page number

#     GIVEN I identify which page I am on,
#     WHEN the page number is selected,
#     THEN the corresponding page should be displayed Number pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page immediately before and after the current page and the first and last pages Pagination with numbered labels – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number. Pagination with numbered labels – Pagination.

#     Scenario: 4.4 – The user selects ‘Next'

#     GIVEN I can view the ‘Next’ link,
#     WHEN the ‘Next’ button is selected,
#     THEN the data on the next page should be displayed,
#     AND the current page number should be visually highlighted to indicate the active page I am on.

#     Scenario: 4.5 – The user selects ‘Previous’

# GIVEN I can view the ‘Previous’ link,
# WHEN I select the ‘Previous’ button,
# THEN the data on the previous page should be displayed,
# AND the current page number should be visually highlighted to indicate the active page I am on