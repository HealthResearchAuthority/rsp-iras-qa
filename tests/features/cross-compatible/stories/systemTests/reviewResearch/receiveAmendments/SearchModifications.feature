@ReceiveAmendments @SearchModifications @StudyWideReviewer @SystemTest
Feature: Receive Amendments: Sort modification results after performing a search

    Background:
        Given I have navigated to the 'Approvals_Page'
        And I click the 'Search_Records' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the 'Choose_A_Record_Type_To_Search_Page'
        And I capture the page screenshot
        And I click the radio button to select 'Modification record'
        And I capture the page screenshot
        Then I have navigated to the 'Search_Modifications_Page'

    @ViewListOfModifications @ViewListOfModificationsPaginationFirstPage @ViewListOfModificationsPaginationPageNumber @ViewListOfModificationsPaginationNextLinkClick @rsp-4016
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

    @ViewListOfModifications @ViewListOfModificationsPaginationLastPage @ViewListOfModificationsPaginationPageNumber @ViewListOfModificationsPaginationPreviousLinkClick @rsp-4016
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

    @SearchModificationsTitleBackLinksNav @rsp-5046 @rsp-5031
    Scenario: Verify back and short project title link navigation for search modifications tasklist
        And I fill the search input for searching 'modifications' with 'Valid_Full_Iras_Id' as the search query
        And I click the 'Search' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I can now see a table of search results for modifications received for approval
        And Each 'short project title' displayed on the 'Search_Modifications_Page' is a link
        When I click a 'short project title' on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the project overview page
        When I click the 'Back' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I can see the 'Search_Modifications_Page'
        When I fill the search input for searching 'modifications' with 'Valid_Full_Iras_Id' as the search query
        And I click the 'Search' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I can now see a table of search results for modifications received for approval
        Then Each 'modification id' displayed on the 'Search_Modifications_Page' is a link
        When I click a 'modification id' on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the review all changes modifications page
        When I click the 'Back' link on the 'Review_All_Changes_Page'
        And I capture the page screenshot
        Then I can see the 'Search_Modifications_Page'

    @SponsorOrganisationValidation @AdvancedFilters @jsEnabled
    Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is enabled
        And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
        And I expand the chevrons for '<Advanced_Filters>' in search modifications page
        And I capture the page screenshot
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        And I type valid '<Sponsor_Organisation>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
        And I type invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
        And I type min characters '<Sponsor_Organisation_Min>' for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with '<Suggestion_List_Headers>'
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

    @SponsorOrganisationValidation @AdvancedFilters @jsDisabled @rsp-4118
    Scenario Outline: Validate the sponsor organisation suggestion list in advanced filters when javascript is disabled
        And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
        And I expand the chevrons for '<Advanced_Filters>' in search modifications page
        And I capture the page screenshot
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box in advanced filters and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box in advanced filters and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box in advanced filters
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

    @SponsorOrganisationValidation @jsDisabled @rsp-4167
    Scenario Outline: "Verify that the search button appears with a green background in the 'Sponsor Organisation' filter section of the advanced filters when JavaScript is disabled
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
            | Advanced_Filters_Nth                                |

    @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters @rsp-4167
    Scenario Outline: When javascript disabled verify the hint text for advanced filters when user select multiple checkboxes
        And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I select advanced filters in the search modifications page using '<Advanced_Filters>'
        And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
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
            | Advanced_Filters_Nth                                |

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