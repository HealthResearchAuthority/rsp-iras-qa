@adminUser @createProject @createAmendment @SystemTest
Feature: Create Amendment - Create Project

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-1858
  Scenario Outline: Validate user is able to amend a project using an iras id
    And I can see the my research projects page
    And I can see the '<Validation_Text>' on the my research project page
    When I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    When I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I can see the '<Validation_Text>' ui labels on the project details iras page
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details iras page
    Then I can see previously saved values for '<Project_Details_IRAS>' displayed on the project details iras page

    Examples:
      | Validation_Text | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Navigation_Link |
      | Label_Texts     | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Back            |
      | Label_Texts     | Create_Project_Record   | Start                    | Valid_IRAS_ID_Max    | Save_Continue           | Back            |

  @rsp-1858
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

  @rsp-1858
  Scenario Outline: Validate breadcrumb navigations in project details iras id page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    When I click the '<Navigation_Link>' link on the 'Project_Details_IRAS_Page'
    Then I can see the create project record page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Link |
      | Create_Project_Record   | Start                    | Back            |

  @rsp-1859
  Scenario Outline: Validate user is able to fill project details page for short project title and project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    Then I can see the '<Validation_Text>' ui labels on the project details title page
    Then I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Validation_Text | Project_Details_Title                         | Navigation_Link |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields                         | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_VERA                    | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_CSL                     | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_One   | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Two   | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Three | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Four  | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_PARTRIDGE               | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_OMEGA                   | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Ferumoxytol             | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Five  | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Six   | Back            |

  @rsp-1859
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

  @rsp-1859
  Scenario Outline: Validate error messages displayed when user fill todays date for project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill todays date for planned project end date in project details title page
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Project_Details_Title | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Invalid_Date_Today    | Field_Error_Message | Summary_Error_Message |

  @rsp-1859
  Scenario Outline: Validate breadcrumb navigations in project details short project title page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I can see the project details title page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details iras page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Navigation_Link |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Back            |

  @rsp-1897
  Scenario Outline: Validate user is able to fill key project roles page with valid data
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    Then I can see the '<Validation_Text>' ui labels on the key project roles page
    And I capture the page screenshot
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the key project roles page
    Then I can see previously saved values for '<Key_Project_Roles>' displayed on the key project roles page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles                     | Navigation_Link |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields                 | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data                      | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Underscore                | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hyphen               | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Plus                 | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Exclamation          | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hash                 | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Dollar               | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Percentage           | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Ampersand            | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Single_Quote         | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Star                 | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Slash                | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Equal_Symbol         | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Question_Mark        | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Cap_Symbol           | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Right_Single_Quote   | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Curly_Brackets       | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Pipe_Symbol          | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Tilde_Symbol         | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Unicode              | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Special_Characters   | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hyphen_Underscore    | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Unicode     | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Sub_Domains | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Domain               | Back            |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Other_Language       | Back            |

  @rsp-1897
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

  @rsp-1897
  Scenario Outline: Validate breadcrumb navigations in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see the project details title page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Project_Details_Title | Navigation_Link |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Back            |

  @rsp-1901
  Scenario Outline: Validate user is able to fill research locations page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    When I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    Then I can see the '<Validation_Text>' ui labels on the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your application page
    When I navigate 'back'
    Then I can see the research locations page
    Then I can see previously saved values for '<Research_Locations>' displayed on the research locations page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations                     |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                  |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC                   |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Northern_Ireland |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Scotland         |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Wales            |

  @rsp-1901 @jsEnabled
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

  @rsp-1901 @jsDisabled
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

  @rsp-1901
  Scenario Outline: Validate breadcrumb navigations in research locations page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    And I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    And I can see the research locations page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the key project roles page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS | Navigation_Button_Third | Project_Details_Title | Key_Project_Roles     | Navigation_Link |
      | Create_Project_Record   | Start                    | Valid_IRAS_ID_Min    | Save_Continue           | Valid_Data_All_Fields | Valid_Data_All_Fields | Back            |
