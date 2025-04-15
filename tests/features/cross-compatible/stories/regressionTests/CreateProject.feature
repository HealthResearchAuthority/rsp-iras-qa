@adminUser @CreateProjectRegression @Regression
Feature: Create Amendment - Create Project - Regression Tests

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @CreateProjectValidRegression
  Scenario Outline: Validate user is able to amend a project
    And I can see the my research projects page
    # Validate labels in My_Research_Projects_Page
    And I can see the '<Validation_Text>' on the my research project page
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
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    # Back button validation on Project_Details_Title_Page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    # Validate previously filled values persist on screen navigation for Project_Details_IRAS_Page
    Then I can see previously saved values for '<Project_Details_IRAS>' displayed on the project details iras page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    # Validate labels in Project_Details_Title_Page
    Then I can see the '<Validation_Text>' ui labels on the project details title page
    And I capture the page screenshot
    Then I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    And I capture the page screenshot
    # Back button validation on Key_Project_Roles_Page
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    # Validate previously filled values persist on screen navigation for Project_Details_Title_Page
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    # Validate labels in Key_Project_Roles_Page
    Then I can see the '<Validation_Text>' ui labels on the key project roles page
    And I capture the page screenshot
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    # Back button validation on Research_Locations_Page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the key project roles page
    And I capture the page screenshot
    # Validate previously filled values persist on screen navigation for Key_Project_Roles_Page
    Then I can see previously saved values for '<Key_Project_Roles>' displayed on the key project roles page
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    # Validate labels in Research_Locations_Page
    Then I can see the '<Validation_Text>' ui labels on the research locations page
    And I capture the page screenshot
    Then I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your application page
    When I navigate 'back'
    Then I can see the research locations page
    # Validate previously filled values persist on screen navigation for Research_Locations_Page
    Then I can see previously saved values for '<Research_Locations>' displayed on the research locations page
    And I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Navigation_Link | Project_Details_Title      | Key_Project_Roles                   | Research_Locations                     |
      | Label_Texts     | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Back            | Valid_Data_All_Fields      | Valid_Data_All_Fields               | Data_With_No_NHS_HSC                   |
      | Label_Texts     | Create_Project_Record   | Start                    | Valid_IRAS_ID_Max    | Save_Continue           | Back            | Valid_Data_All_Fields_VERA | Valid_Email_Data_Special_Characters | Data_With_Lead_Nation_Northern_Ireland |

  @ErrorMessageInvalidIRASIDRegression
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details iras page for '<Project_Details_IRAS>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS             | Navigation_Button_Third | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters          | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Symbols          | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters_Symbols  | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Min_Length       | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Max_Length       | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces           | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Suffix    | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Prefix    | Save_Continue           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Seperator | Save_Continue           | Field_Error_Message | Summary_Error_Message |

  @ErrorMessageInvalidTitleEndDateRegression
  Scenario Outline: Validate error messages displayed when user fill invalid data for short project title and project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Project_Details_Title                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_All_Fields                          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Data_Short_Project_Title_Max_Length | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Data_Short_Project_Title_Min_Length | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Day_Number                          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Day_Letters                         | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Month_Number                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Month_Letters                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Year_Number_1                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Year_Number_2                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Year_Letters                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Date_Past                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Date_No_Day                         | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Date_No_Month                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Date_No_Year                        | Field_Error_Message | Summary_Error_Message |

  @ErrorMessageInvalidKeyProjectRolesRegression
  Scenario Outline: Validate error messages displayed when user inputs invalid data in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on key project roles page for '<Key_Project_Roles>'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Project_Details_Title | Key_Project_Roles                                  | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Start_With_Dot                  | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Double_Dot                      | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Space                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Wrong_AT                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Less_Greater_Symbols            | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Colon                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Semi_Colon                      | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Comma                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Start_With_Hyphen               | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Hyphen_Before_Domain            | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Double_Dot_Domain               | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Exclamation_Domain              | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Unicode                         | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Single_Quote_Before_AT          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Domain_Exceed_Max               | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Local_Part_Max                  | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Consecutive_Dot_Domain          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Consecutive_Dot_SubDomain       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Consecutiv_Dot_Domain_SubDomain | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Emoji                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_TLD                             | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Missing_AT                      | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Reserved_Domain                 | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Punycode                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Max_Char                        | Field_Error_Message | Summary_Error_Message |

  @CreateProjectJSEnabledRegression @jsEnabled
  Scenario Outline: Validate lead nation radio option when javascript is enabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    When I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option for '<Research_Locations>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations    |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC  |

  @CreateProjectJSDisabledRegression @jsDisabled
  Scenario Outline: Validate lead nation radio option when javascript is disabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    When I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option when javascript disabled

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations   |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC |
