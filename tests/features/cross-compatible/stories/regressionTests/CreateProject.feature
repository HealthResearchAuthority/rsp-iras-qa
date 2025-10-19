@ApplicantUser @CreateProjectRegression @Regression
Feature: Create Amendment - Create Project - Regression Tests

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @CreateProjectValidRegression
  Scenario Outline: Validate user is able to amend a project
    # Validate labels in My_Research_Projects_Page
    And I can see the my research projects page
    And I capture the page screenshot
    When I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    # Back button validation on Project_Details_IRAS_Page
    When I click the '<Navigation_Link>' link on the 'Project_Details_IRAS_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    # Validate labels in Project_Details_IRAS_Page
    And I can see the '<Validation_Text>' ui labels on the project details iras page
    And I capture the page screenshot
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    # Validate labels in Project_Details_Title_Page
    Then I can see the '<Validation_Text>' ui labels on the project details title page
    And I capture the page screenshot
    Then I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    And I capture the page screenshot
    # Back button validation on Chief_Investigator_Page
    When I click the '<Navigation_Link>' link on the 'Chief_Investigator_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    # Validate previously filled values persist on screen navigation for Project_Details_Title_Page
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    # Validate labels in Chief_Investigator_Page
    Then I can see the '<Validation_Text>' ui labels on the chief investigator page
    And I capture the page screenshot
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    # Back button validation on Research_Locations_Page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the chief investigator page
    And I capture the page screenshot
    # Validate previously filled values persist on screen navigation for Chief_Investigator_Page
    Then I can see previously saved values for '<Chief_Investigator>' displayed on the chief investigator page
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    # Validate labels in Research_Locations_Page
    Then I can see the '<Validation_Text>' ui labels on the research locations page
    And I capture the page screenshot
    Then I fill the research locations page with '<Research_Locations>'
    And I validate the guidance content displayed based on the data entered using '<Research_Locations>' dataset on the research locations page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your application page
    When I navigate 'back'
    Then I can see the project identifiers page
    # Validate previously filled values persist on screen navigation for Research_Locations_Page
    Then I can see previously saved values for '<Project_Identifiers>' displayed on the project identifiers page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Identifiers_Page'
    # Validate saved values in different pages is displayed in review answers page
    Then I can see the review your application page
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    # Validate change link functionality in review answers page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator_Change>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I capture the page screenshot
    # Validate project overview page
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Navigation_Button_Add_Project | Navigation_Link | Project_Details_Title | Project_Identifiers   | Chief_Investigator    | Chief_Investigator_Change    | Research_Locations   | Change_Link_Field        | Project_Identifiers_Change                   |
      | Label_Texts     | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Add_Project                   | Back            | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields_Change | Data_With_No_NHS_HSC | chief_investigator_email | Valid_Data_Only_Investigator_Email_Field_Two |
  # | Label_Texts     | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Add_Project                   | Back            | Valid_Data_All_Fields_VERA | Valid_Email_Data_Special_Characters | Valid_Email_Data_Special_Characters | Data_With_Lead_Nation_Northern_Ireland | sponsor_contact    | Valid_Data_Only_Sponsor_Email_Field_Two      |

  @ErrorMessageInvalidIRASIDRegression
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_IRAS_Page'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS             | Navigation_Button_Third | Navigation_Button_Add_Project | Field_And_Summary_Error_Message       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters          | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Symbols          | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters_Symbols  | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Min_Length       | Save_Continue           | Add_Project                   | Field_Error_Message_Iras_Id_Length    |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces           | Save_Continue           | Add_Project                   | Field_Error_Message_Iras_Id_Mandatory |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Suffix    | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Prefix    | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Seperator | Save_Continue           | Add_Project                   | Field_Error_Message                   |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Blank            | Save_Continue           | Add_Project                   | Field_Error_Message_Iras_Id_Mandatory |

  @ErrorMessageInvalidTitleEndDateRegression
  Scenario Outline: Validate error messages displayed when user fill invalid data for short project title and project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Add_Project | Project_Details_Title                       | Field_And_Summary_Error_Message              |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Data_Short_Project_Title_Max_Length | Field_Error_Message_Short_Project_Title      |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Data_Short_Project_Title_Min_Length | Field_Error_Message_Short_Project_Title      |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Day_Number                          | Field_Error_Message_Planned_Project_End_Day  |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Day_Letters                         | Field_Error_Message_Planned_Project_End_Day  |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Year_Number_1                       | Field_Error_Message_Planned_Project_End_Year |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Year_Number_2                       | Field_Error_Message_Planned_Project_End_Year |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Year_Letters                        | Field_Error_Message_Planned_Project_End_Year |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Date_Past                           | Field_Error_Message_Planned_Project_End_Day  |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Date_No_Day                         | Field_Error_Message_Planned_Project_End_Day  |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Date_No_Month                       | Field_Error_Message_Planned_Project_End_Day  |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Invalid_Date_No_Year                        | Field_Error_Message_Planned_Project_End_Year |

  @ErrorMessageInvalidChiefEmailRegression @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate error messages displayed when user inputs invalid data in chief investigator email on chief investigator page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Chief_Investigator_Page'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Add_Project | Project_Details_Title | Chief_Investigator                     | Field_And_Summary_Error_Message |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot      | Field_Error_Chief_Email         |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_TLD             | Field_Error_Chief_Email         |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Reserved_Domain | Field_Error_Chief_Email         |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Punycode        | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Dot                  | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email         |
  # | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Valid_Data_All_Fields | Invalid_Email_Data_One_Max_Char                        | Field_Error_Chief_Email         |

  @CreateProjectJSEnabledRegression @jsEnabled
  Scenario Outline: Validate lead nation radio option when javascript is enabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    When I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option for '<Research_Locations>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Add_Project | Validation_Text | Project_Details_Title | Chief_Investigator    | Research_Locations    |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC  |

  @CreateProjectJSDisabledRegression @jsDisabled
  Scenario Outline: Validate lead nation radio option when javascript is disabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    When I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option when javascript disabled

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Add_Project | Validation_Text | Project_Details_Title | Chief_Investigator    | Research_Locations   |
      | Create_Project_Record   | Start                    | Save_Continue           | Add_Project                   | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC |

  @CreateProjectRTSRegression @jsEnabled
  # new code to be written to retrieve the RTS data from dev database.
  Scenario Outline: Validate the active primary sponsor organisation from rts with data in database
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
    And I validate the list of sponsor organisations retrieved in ui compared to the rts response received using '<RTS_Request>'

    Examples:
      | RTS_API_Data         | RTS_Request                                 |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_MAN         |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

  @DeleteProjectRecordRegression
  Scenario Outline: Verify that user is able to delete the created project record
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I click the 'Delete_Project' button on the 'Project_Overview_Unfinished_Projects_Page'
    And I can see the delete project confirmation page based on '<Project_Details_Title>' entered for short project title
    And I capture the page screenshot
    When I click the 'Keep_Project' button on the 'Confirmation_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I click the 'Delete_Project' button on the 'Project_Overview_Unfinished_Projects_Page'
    When I click the 'Delete_Project' button on the 'Confirmation_Page'
    And I can see the my research projects page
    And I can see the project delete success message on my research page
    And I capture the page screenshot
    And I validate deleted project does not exist in the my research projects list
    And I capture the page screenshot

    Examples:
      | Project_Details_Title        |
      | Valid_Data_All_Fields        |
      | Valid_Data_Title_Empty_Field |
