@ApplicantUser @createProject @createAmendment @SystemTest
Feature: Create project error validations - This feature file helps check all the create project error validation journeys

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-1858 @rsp-1860 @invalidIrasIdValidations
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_IRAS_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_IRAS             | Field_And_Summary_Error_Message           |
      | Invalid_IRAS_ID_Letters          | Field_Error_Message                       |
      | Invalid_IRAS_ID_Symbols          | Field_Error_Message                       |
      | Invalid_IRAS_ID_Letters_Symbols  | Field_Error_Message                       |
      | Invalid_IRAS_ID_Min_Length       | Field_Error_Message_Iras_Id_Length        |
      | Invalid_IRAS_ID_Leading_Zeros    | Field_Error_Message_Iras_Id_Leading_Zeros |
      | Invalid_IRAS_ID_Spaces           | Field_Error_Message_Iras_Id_Mandatory     |
      | Invalid_IRAS_ID_Spaces_Suffix    | Field_Error_Message                       |
      | Invalid_IRAS_ID_Spaces_Prefix    | Field_Error_Message                       |
      | Invalid_IRAS_ID_Spaces_Seperator | Field_Error_Message                       |
      | Invalid_IRAS_ID_Blank            | Field_Error_Message_Iras_Id_Mandatory     |

  @rsp-5185 @IRASIDNotInHARPInvalid
  Scenario: Validate project not currently eligible message displayed when user enter iras id not in harp system
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with 'IRAS_ID_Not_In_HARP'
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I capture the page screenshot
    Then I validate that the project not currently eligible to use the service page is displayed
    And I capture the page screenshot
    When I click the 'Return_To_IRAS_ID' button on the 'IRAS_ID_Error_Page'
    Then I can see the project details iras page

  @rsp-5185 @IRASIDAlreadyExistInvalid
  Scenario: Validate project not currently eligible message displayed when user enter iras id already exist in system
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I capture the page screenshot
    When I click the 'Home' link on the 'Banner'
    When I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the existing iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I capture the page screenshot
    Then I validate that the project record already exists page is displayed
    And I capture the page screenshot
    When I click the 'Return_To_IRAS_ID' button on the 'IRAS_ID_Error_Page'
    Then I can see the project details iras page

  @rsp-1859 @rsp-3819
  Scenario Outline: Validate error messages displayed when user fill invalid data for project end date
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Field_And_Summary_Error_Message |
      | Invalid_All_Fields    | All_Field_Error_Message         |
      | Invalid_Day_Number    | Date_Day_Field_Error_Message    |
      | Invalid_Day_Letters   | Date_Day_Field_Error_Message    |
      | Invalid_Year_Number_1 | Date_Year_Field_Error_Message   |
      | Invalid_Year_Number_2 | Date_Year_Field_Error_Message   |
      | Invalid_Year_Letters  | Date_Year_Field_Error_Message   |
      | Invalid_Date_Past     | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Day   | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Month | Date_Month_Field_Error_Message  |
      | Invalid_Date_No_Year  | Date_Year_Field_Error_Message   |

  @rsp-1859 @rsp-3819
  Scenario Outline: Validate error messages displayed when user fill todays date for project end date
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill todays date for planned project end date in project details title page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Today    | Field_Error_Message | Summary_Error_Message |

  @rsp-1897 @rsp-4209 @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate error messages displayed when user inputs invalid data in chief investigator page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on chief investigator page for '<Chief_Investigator>'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator                     | Field_Error_Message     | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Dot  | Field_Error_Chief_Email | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot      | Field_Error_Chief_Email | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_TLD             | Field_Error_Chief_Email | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Reserved_Domain | Field_Error_Chief_Email | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Punycode        | Field_Error_Chief_Email | Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Max_Char        | Field_Error_Chief_Email | Summary_Error_Message |
      # | Valid_Data_All_Fields | Invalid_Data_Max_Character_Limit                       | Field_Error_Max_Character_Limit_All_Fields | Summary_Error_Message_Max_Character_Limit_All_Fields |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email                    | Summary_Error_Message                                |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email                    | Summary_Error_Message                                |

  @rsp-1860 @duplicateIrasIdValidation
  Scenario Outline: Verify the duplicate IRAS ID error message when user enters the existing IRAS ID
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the project details title page
    And I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the existing iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_IRAS_Page'

    Examples:
      | Field_And_Summary_Error_Message       |
      | Field_Error_Message_Iras_Id_Duplicate |

  @rsp-1863 @rsp-3819 @saveLaterProjTitleValidations
  Scenario Outline: Validate error messages when user saves the project with invalid data on project details page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'

    Examples:
      | Project_Details_Title | Field_And_Summary_Error_Message |
      | Invalid_All_Fields    | All_Field_Error_Message         |
      | Invalid_Day_Number    | Date_Day_Field_Error_Message    |
      | Invalid_Day_Letters   | Date_Day_Field_Error_Message    |
      | Invalid_Year_Number_1 | Date_Year_Field_Error_Message   |
      | Invalid_Year_Number_2 | Date_Year_Field_Error_Message   |
      | Invalid_Year_Letters  | Date_Year_Field_Error_Message   |
      | Invalid_Date_Past     | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Day   | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Month | Date_Month_Field_Error_Message  |
      | Invalid_Date_No_Year  | Date_Year_Field_Error_Message   |

  @rsp-1863 @rsp-4209 @saveLaterChiefInvEmailValidations @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate error messages when user saves the project with invalid Chief Investigator email data on chief investigator page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Chief_Investigator_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Chief_Investigator_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator                     | Field_And_Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Dot  | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot      | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_TLD             | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Reserved_Domain | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Punycode        | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Max_Char        | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email         |
      # | Valid_Data_All_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email         |

  @rsp-3939 @rsp-4200 @rsp-3940 @validateSponsorOrganisationResultsJsDisabled @jsDisabled
  Scenario Outline: Validate the primary sponsor organisation search results in project identifiers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
    And With JS disabled, I search with valid '<Sponsor_Organisation>' for primary sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
    And I capture the page screenshot
    And With JS disabled, I search with invalid '<Sponsor_Organisation_Invalid>' for primary sponsor organisation search box and validate the search results along with '<Sponsor_Organisation_Jsdisabled_Search_Hint_Labels>'
    And I capture the page screenshot
    And With JS disabled, I search with invalid min characters '<Sponsor_Organisation_Min>' for primary sponsor organisation search box
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Identifiers_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Sponsor_Organisation                           | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_API_Data         | RTS_Request                                    | Field_And_Summary_Error_Message          |
      | Valid_Data_All_Fields | Sponsor_Organisation_Partial_Text_NHS          | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS            | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Brackets     | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets       | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Dot_Comma    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma      | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Slash        | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash          | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Hyphen       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen         | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Start_Space  | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space    | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_End_Space    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space     | Field_Error_Primary_Sponsor_Organisation |
      | Valid_Data_All_Fields | Sponsor_Organisation_Text_Exactly_Five_Results | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Sponsor_Organisation_Jsdisabled_Search_Hint_Labels | RTS_NIHR_FHIR_Config | Sponsor_Organisation_Text_Exactly_Five_Results | Field_Error_Primary_Sponsor_Organisation |

  @rsp-4887 @DateSubmittedErrorValidationPostApproval
  Scenario Outline: Verify that correct validation is in place for the date submitted filter
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
    And I capture the page screenshot
    And I enter values in the '<Advanced_Filters>' of the post approval page
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
    And I capture the page screenshot
    And I validate '<Field_And_Summary_Error_Message>' displayed on 'Post_Approval_Page' in advanced filters

    Examples:
      | Advanced_Filters                  | Field_And_Summary_Error_Message                       |
      | Invalid_Date_Range_To_Before_From | Post_Approval_Invalid_Date_Range_To_Before_From_Error |
      | Invalid_Date_From                 | Post_Approval_Invalid_Date_From_Error                 |
      | Invalid_Date_To                   | Post_Approval_Invalid_Date_To_Error                   |

  @rsp-2837 @rsp-1867 @rsp-3819 @rsp-4868 @reviewAnswersProjTitleErrorValidations
  Scenario Outline: Validate error message on project title page when user redirected from review your answers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can see enter link for all the incomplete fields '<Review_Answers>'
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field | Review_Answers             | Project_Details_Title_Enter | Field_And_Summary_Error_Message | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_All_Fields          | All_Field_Error_Message         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Day_Number          | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Day_Letters         | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Year_Number_1       | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Year_Number_2       | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Year_Letters        | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Date_Past           | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Date_No_Day         | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Date_No_Month       | Date_Month_Field_Error_Message  | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Invalid_Date_No_Year        | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersChiefInvestigatorEmailValidations @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate chief investigator email error messages when user redirected from review your answers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can see enter link for all the incomplete fields '<Review_Answers>'
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with '<Chief_Investigator_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Chief_Investigator_Page'

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field         | Review_Answers             | Chief_Investigator_Enter               | Field_And_Summary_Error_Message | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Start_With_Dot  | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Double_Dot      | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_TLD             | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Reserved_Domain | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Punycode        | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Max_Char        | Field_Error_Chief_Email         | Sponsor_Organisation_Text_Blank |
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|
  # | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email         |Sponsor_Organisation_Text_Blank|

  @rsp-2837 @rsp-3819 @rsp-4868 @reviewAnswersProjTitleErrorValidationsChangeFlow
  Scenario Outline: Validate error message on project title page when user redirected from review your answers page - change flow
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field | Project_Details_Title_Enter | Field_And_Summary_Error_Message | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_All_Fields          | All_Field_Error_Message         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Day_Number          | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Day_Letters         | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Year_Number_1       | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Year_Number_2       | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Year_Letters        | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Date_Past           | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Date_No_Day         | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Date_No_Month       | Date_Month_Field_Error_Message  | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Invalid_Date_No_Year        | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |

  @rsp-2837 @rsp-4868 @reviewAnswersChiefInvestigatorEmailValidation_ChangeFlow @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate error message for chief investigator email when user redirected from review your answers page - change flow
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with '<Chief_Investigator_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Chief_Investigator_Page'

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field        | Chief_Investigator_Enter               | Field_And_Summary_Error_Message | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Start_With_Dot  | Field_Error_Chief_Email         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Double_Dot      | Field_Error_Chief_Email         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_TLD             | Field_Error_Chief_Email         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Reserved_Domain | Field_Error_Chief_Email         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Punycode        | Field_Error_Chief_Email         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Max_Char        | Field_Error_Chief_Email         | Valid_Data_All_Fields |
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Missing_AT      | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email         |Valid_Data_All_Fields|
  # | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email         |Valid_Data_All_Fields|

  @rsp-1867 @rsp-3819 @rsp-4868 @ValidateErrorMessagesOnConfirmProjectPage @KNOWN_DEFECT_RSP-5418
  Scenario Outline: Validate user is able to see the error messages when user submit the review answer page when all mandatory fields are not entered correctly
    And I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Answers_Page'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Project_Details_Title       | Chief_Investigator                       | Research_Locations                          | Field_And_Summary_Error_Message                    | Project_Identifiers             |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_All_Empty_Fields                 | All_Field_Error_Message                            | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_Only_Date_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_All_Empty_Fields                 | Field_Error_Message_Except_End_Date                | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_Only_Investigator_Email_Field | Valid_Data_All_Empty_Fields                 | Field_Error_Message_Except_Chief_Investigator      | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_Only_Nations_Participating       | Field_Error_Message_Except_Nations_Participating   | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_Only_is_nhs_hsc_organisation_Two | Field_Error_Message_Except_NHS_HSC_Org             | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_Only_is_nhs_hsc_organisation     | Field_Error_Message_Except_NHS_HSC_Org_As_Yes      | Sponsor_Organisation_Text_Blank |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_is_nhs_hsc_organisation          | Field_Error_Message_Except_NHS_HSC_Org_Lead_Nation | Sponsor_Organisation_Text_Blank |

  @ValidateLastLoggedInInvalidDateErrorMessageMyResearch @rsp-4650
  Scenario Outline: Verify the user can see validation error message that Search to date must be after Search from date in my research page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Date_Submitted_Invalid_Data>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'My_Research_Page' in advanced filters
    And I capture the page screenshot

    Examples:
      | Date_Submitted_Invalid_Data                                   | Field_And_Summary_Error_Message                 |
      | Advanced_Filter_Project_Created_To_Date_Before_From_Date      | Invalid_Date_Created_Range_To_Before_From_Error |
      | Advanced_Filter_Project_Created_No_Month_From_Date            | Invalid_Date_Created_From_Error                 |
      | Advanced_Filter_Project_Created_No_Day_From_Date              | Invalid_Date_Created_From_Error                 |
      | Advanced_Filter_Project_Created_No_Year_From_Date             | Invalid_Date_Created_From_Error                 |
      | Advanced_Filter_Project_Created_No_Month_To_Date              | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_No_Day_To_Date                | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_No_Year_To_Date               | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_Invalid_Year_Number_From_Date | Invalid_Date_Created_From_Error                 |
      | Advanced_Filter_Project_Created_Invalid_Year_Number_To_Date   | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_Invalid_Day_Number_To_Date    | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_Invalid_Day_Letters_To_Date   | Invalid_Date_Created_To_Error                   |
      | Advanced_Filter_Project_Created_Invalid_Year_Letters_To_Date  | Invalid_Date_Created_To_Error                   |
