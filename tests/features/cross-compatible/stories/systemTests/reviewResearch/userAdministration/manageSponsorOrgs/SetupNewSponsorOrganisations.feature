@SysAdminUser @SystemTest @UserAdministration @ManageSponsorOrgs @BackStage
Feature: User Administration: Manage Sponsor Organisations - Set up new sponsor organisation- JS Enabled and Disabled

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'

    @ViewListOfSponsorOrgs @rsp-5229 @rsp-5230 @rsp-5232 @rsp-5237
    Scenario Outline: Verify the user can add a sponsor organisation from manage sponsor organisation page and view the list of sponsor organisation in alphabetical order of organisation name
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation '<Setup_New_Sponsor_Organisation>' and  retrive country
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        And I capture the current time for 'Sponsor_Organisation_Profile_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        Examples:
            | Setup_New_Sponsor_Organisation  | Status_Enabled | RTS_API_Data         | RTS_Request                         |
            # | Sponsor_Organisation_One       | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Two         | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Three       | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Four        | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Five        | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Six         | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Seven       | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Eight       | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Nine        | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Ten         | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Eleven      | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Twelve      | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Thirteen    | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Fourteen    | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Fifteen     | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Sixteen     | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Seventeen   | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Eighteen    | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Nineteen    | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Twenty      | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyOne   | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyTwo   | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyThree | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyFour  | Enabled        |RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyFive | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentySix | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentySeven | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyEight | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_TwentyNine | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_Thirty    | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_ThirtyOne   | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_ThirtyTwo | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            # | Sponsor_Organisation_ThirtyThree | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
            | Sponsor_Organisation_ThirtyFour | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_ThirtyFive | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_ThirtySix | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_ThirtySeven | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_ThirtyEight | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_ThirtyNine | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
    # | Sponsor_Organisation_Forty      | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |


    @rsp-5230 @ErrorValidationDuplicateSponsorOrg @jsEnabled
    Scenario Outline: Verify appropriate error message is displayed when user tries to add a duplicate sponsor organisation from set up a new sponsor organisation page when JavaScript is enabled
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I capture the page screenshot
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using 'existing sponsor organisation'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Examples:
            | Field_Name        | Position | Field_And_Summary_Error_Message                               |
            | Organisation_Name | First    | JavaScript_Enabled_Duplicate_Sponsor_Organisation_Setup_Error |
            | Organisation_Name | Last     | JavaScript_Enabled_Duplicate_Sponsor_Organisation_Setup_Error |

    @rsp-5237 @ErrorValidationDuplicateSponsorOrg @KNOWN_DEFECT-RSP-5473 @jsDisabled
    Scenario Outline: Verify appropriate error message is displayed when user tries to add a duplicate sponsor organisation from set up a new sponsor organisation page when JavaScript is disabled
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I capture the page screenshot
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using 'existing sponsor organisation'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Examples:
            | Field_Name        | Position | Field_And_Summary_Error_Message                                |
            | Organisation_Name | First    | JavaScript_Disabled_Duplicate_Sponsor_Organisation_Setup_Error |
            | Organisation_Name | Last     | JavaScript_Disabled_Duplicate_Sponsor_Organisation_Setup_Error |

    @rsp-5230 @SponsorOrganisationValidation @jsEnabled @RTS
    Scenario Outline: Validate the sponsor organisation suggestion list when javascript is enabled
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
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
            | Sponsor_Organisation                          | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min             | Suggestion_List_Headers        | RTS_API_Data         | RTS_Request                                 |
            | Sponsor_Organisation_Partial_Text_NHS         | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
            | Sponsor_Organisation_Text_Partial_Brackets    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
            | Sponsor_Organisation_Text_Partial_Dot_Comma   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
            | Sponsor_Organisation_Text_Partial_Slash       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
            | Sponsor_Organisation_Text_Partial_Hyphen      | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
            | Sponsor_Organisation_Text_Partial_Start_Space | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
            | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |
            | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Text_Min_Spaces | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

    @rsp-5237 @SponsorOrganisationValidation @jsDisabled @RTS @KNOWN_DEFECT-RSP-5473
    Scenario Outline: Validate the sponsor organisation suggestion list when javascript is disabled
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
        And With javascript disabled, I search with valid '<Sponsor_Organisation>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
        And I capture the page screenshot
        And With javascript disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for sponsor organisation search box
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Examples:
            | Sponsor_Organisation                           | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min             | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                                    | Field_And_Summary_Error_Message     |
            | Sponsor_Organisation_Partial_Text_NHS          | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS            | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_Brackets     | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets       | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_Dot_Comma    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma      | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_Slash        | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash          | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_Hyphen       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen         | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_Start_Space  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space    | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Partial_End_Space    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space     | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char        | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |
            | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Text_Min_Spaces | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Min_Char_Error |

    @rsp-5232 @ExistingSPonsorOrgSearchAndView
    Scenario Outline: Validate the user can search and view the previously added sponsor organisation from manage sponsor organisation page
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Then I click the view edit link of the 'previously added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I capture the page screenshot
        Examples:
            | Field_Name        | Position | Status_Enabled |
            | Organisation_Name | First    | Enabled        |
            | Organisation_Name | Last     | Enabled        |