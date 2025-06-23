@FrontStageUser @createProject @createAmendment @SystemTest
Feature: Create Amendment - Create Project

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-1858 @rsp-1862
  Scenario Outline: Validate user is able to amend a project using an iras id
    And I can see the my research projects page
    And I capture the page screenshot
    When I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the '<Validation_Text>' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Link |
      | Label_Texts     | Create_Project_Record   | Start                    | Add_Project                   | Back            |
      | Label_Texts     | Create_Project_Record   | Start                    | Add_Project                   | Back            |

  @rsp-1858 @rsp-1860 @invalidIrasIdValidations
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_IRAS_Page'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Project_Details_IRAS             | Navigation_Button_Add_Project | Field_And_Summary_Error_Message           |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters          | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Symbols          | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Letters_Symbols  | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Min_Length       | Add_Project                   | Field_Error_Message_Iras_Id_Length        |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Leading_Zeros    | Add_Project                   | Field_Error_Message_Iras_Id_Leading_Zeros |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces           | Add_Project                   | Field_Error_Message_Iras_Id_Mandatory     |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Suffix    | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Prefix    | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Spaces_Seperator | Add_Project                   | Field_Error_Message                       |
      | Create_Project_Record   | Start                    | Invalid_IRAS_ID_Blank            | Add_Project                   | Field_Error_Message_Iras_Id_Mandatory     |

  @rsp-1858
  Scenario Outline: Validate breadcrumb navigations in project details iras id page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Project_Details_IRAS_Page'
    Then I can see the create project record page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Link |
      | Create_Project_Record   | Start                    | Back            |

  @rsp-1859 @rsp-3819 @ValidateUserAbleToFillProjectDetailsPAge
  Scenario Outline: Validate user is able to fill project details page for short project title and project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    Then I can see the '<Validation_Text>' ui labels on the project details title page
    And I validate the planned project end date '<Dropdown_Values>'
    Then I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title                         | Navigation_Link | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields                         | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_VERA                    | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_CSL                     | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_One   | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Two   | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Three | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Four  | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_PARTRIDGE               | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_OMEGA                   | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Ferumoxytol             | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Five  | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields_Special_Character_Six   | Back            | Dropdown_Values |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Empty_Fields                   | Back            | Dropdown_Values |

  @rsp-1859 @rsp-3819
  Scenario Outline: Validate error messages displayed when user fill invalid data for short project title and project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title                       | Field_And_Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_All_Fields                          | All_Field_Error_Message         |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Data_Short_Project_Title_Max_Length | Title_Field_Error_Message       |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Data_Short_Project_Title_Min_Length | Title_Field_Error_Message       |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Day_Number                          | Date_Day_Field_Error_Message    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Day_Letters                         | Date_Day_Field_Error_Message    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Year_Number_1                       | Date_Year_Field_Error_Message   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Year_Number_2                       | Date_Year_Field_Error_Message   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Year_Letters                        | Date_Year_Field_Error_Message   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Date_Past                           | Date_Day_Field_Error_Message    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Date_No_Day                         | Date_Day_Field_Error_Message    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Date_No_Month                       | Date_Month_Field_Error_Message  |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Date_No_Year                        | Date_Year_Field_Error_Message   |

  @rsp-1859 @rsp-3819
  Scenario Outline: Validate error messages displayed when user fill todays date for project end date
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill todays date for planned project end date in project details title page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Invalid_Date_Today    | Field_Error_Message | Summary_Error_Message |

  @rsp-1859 @rsp-1865
  Scenario Outline: Validate breadcrumb navigations in project details short project title page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I can see the project details title page
    And I cannot see a '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I fill the key project roles page with '<Key_Project_Roles>'
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I click the change link '<Change_Link_Field>' on review your answers page
    And I capture the page screenshot
    And I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview page
    When I click the '<Navigation_Link_Second>' link on the 'Project_Overview_Page'
    And I can see the project details title page
    And I capture the page screenshot
    And I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project overview page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Navigation_Button_Fourth | Navigation_Link | Navigation_Link_Second | Project_Details_Title | Key_Project_Roles     | Research_Locations    | Change_Link_Field |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Confirm_Project_Details  | Back            | Project_Details        | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_Title     |

  @rsp-1897
  Scenario Outline: Validate user is able to fill key project roles page with valid data
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
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
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles                     | Navigation_Link |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields                 | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data                      | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Underscore                | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hyphen               | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Plus                 | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Exclamation          | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hash                 | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Dollar               | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Percentage           | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Ampersand            | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Single_Quote         | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Star                 | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Slash                | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Equal_Symbol         | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Question_Mark        | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Cap_Symbol           | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Right_Single_Quote   | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Curly_Brackets       | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Pipe_Symbol          | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Tilde_Symbol         | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Unicode              | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Special_Characters   | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Hyphen_Underscore    | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Unicode     | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Sub_Domains | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Domain               | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Email_Data_Other_Language       | Back            |

  @rsp-1897
  Scenario Outline: Validate error messages displayed when user inputs invalid data for chief investigator email in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on key project roles page for '<Key_Project_Roles>'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Key_Project_Roles                                      | Field_Error_Message     | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Dot                  | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot                      | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_TLD                             | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Reserved_Domain                 | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Punycode                        | Field_Error_Chief_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_One_Max_Char                        | Field_Error_Chief_Email | Summary_Error_Message |

  @rsp-1897
  Scenario Outline: Validate error messages displayed when user inputs invalid data for sponsor contact email in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on key project roles page for '<Key_Project_Roles>'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Key_Project_Roles                                      | Field_Error_Message       | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Start_With_Dot                  | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Double_Dot                      | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Space                           | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Wrong_AT                        | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Less_Greater_Symbols            | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Colon                           | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Semi_Colon                      | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Comma                           | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Start_With_Hyphen               | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Hyphen_Before_Domain            | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Double_Dot_Domain               | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Exclamation_Domain              | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Unicode                         | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Single_Quote_Before_AT          | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Domain_Exceed_Max               | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Local_Part_Max                  | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutive_Dot_Domain          | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutive_Dot_SubDomain       | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutiv_Dot_Domain_SubDomain | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Emoji                           | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_TLD                             | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Missing_AT                      | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Reserved_Domain                 | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Punycode                        | Field_Error_Sponsor_Email | Summary_Error_Message |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Invalid_Email_Data_Two_Max_Char                        | Field_Error_Sponsor_Email | Summary_Error_Message |

  @rsp-1897
  Scenario Outline: Validate breadcrumb navigations in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see the project details title page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Navigation_Link |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Back            |

  @rsp-1901
  Scenario Outline: Validate user is able to fill research locations page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
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
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations                     |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                  |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC                   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Northern_Ireland |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Scotland         |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Wales            |

  @rsp-1901 @jsEnabled
  Scenario Outline: Validate lead nation radio option when javascript is enabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    When I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option for '<Research_Locations>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC  |

  @rsp-1901 @jsDisabled
  Scenario Outline: Validate lead nation radio option when javascript is disabled
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    When I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option when javascript disabled

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Research_Locations   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC |

  @rsp-1901
  Scenario Outline: Validate breadcrumb navigations in research locations page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    And I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    And I can see the research locations page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the key project roles page

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Key_Project_Roles     | Navigation_Link |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Valid_Data_All_Fields | Back            |

  @rsp-1860 @duplicateIrasIdValidation
  Scenario Outline: Verify the duplicate IRAS ID error message when user enters the existing IRAS ID
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
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

  @rsp-1863 @rsp-3819 @saveLaterProjectTitle
  Scenario Outline: Verify product details are saved when user saves the record on create project - Project details page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the short project title on project overview page for '<Project_Details_Title>'
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I can see the project details title page
    And I capture the page screenshot
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page

    Examples:
      | Project_Details_Title       |
      | Valid_Data_All_Fields       |
      | Valid_Data_All_Empty_Fields |
      | Valid_Data_Only_Title_Field |
      | Valid_Data_Only_Date_Fields |

  @rsp-1863 @saveLaterProjectRoles
  Scenario Outline: Verify product details are saved when user saves the record on create project - key project roles page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Key_Project_Roles_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the short project title on project overview page for '<Project_Details_Title>'
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    And I capture the page screenshot
    Then I can see previously saved values for '<Key_Project_Roles>' displayed on the key project roles page

    Examples:
      | Project_Details_Title | Key_Project_Roles                        |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    |
      | Valid_Data_All_Fields | Valid_Data_All_Empty_Fields              |
      | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field |
      | Valid_Data_All_Fields | Valid_Data_Only_Sponsor_Email_Field      |

  @rsp-1863 @saveLaterProjectLocations
  Scenario Outline: Verify product details are saved when user saves the record on create project - research locations page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Research_Locations_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the short project title on project overview page for '<Project_Details_Title>'
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    And I capture the page screenshot
    Then I can see previously saved values for '<Research_Locations>' displayed on the research locations page

    Examples:
      | Project_Details_Title | Key_Project_Roles     | Research_Locations                       |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Empty_Fields              |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Sponsor_Email_Field      |

  @rsp-1863 @rsp-3819 @saveLaterProjTitleValidations
  Scenario Outline: Validate error messages when user saves the project with invalid data on project title page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Details_Title_Page'

    Examples:
      | Project_Details_Title                       | Field_And_Summary_Error_Message |
      | Invalid_All_Fields                          | All_Field_Error_Message         |
      | Invalid_Data_Short_Project_Title_Max_Length | Title_Field_Error_Message       |
      | Invalid_Data_Short_Project_Title_Min_Length | Title_Field_Error_Message       |
      | Invalid_Day_Number                          | Date_Day_Field_Error_Message    |
      | Invalid_Day_Letters                         | Date_Day_Field_Error_Message    |
      | Invalid_Year_Number_1                       | Date_Year_Field_Error_Message   |
      | Invalid_Year_Number_2                       | Date_Year_Field_Error_Message   |
      | Invalid_Year_Letters                        | Date_Year_Field_Error_Message   |
      | Invalid_Date_Past                           | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Day                         | Date_Day_Field_Error_Message    |
      | Invalid_Date_No_Month                       | Date_Month_Field_Error_Message  |
      | Invalid_Date_No_Year                        | Date_Year_Field_Error_Message   |

  @rsp-1863 @saveLaterChiefInvEmailValidations
  Scenario Outline: Validate error messages when user saves the project with invalid Chief Investigator email data on key project roles page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Key_Project_Roles_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Key_Project_Roles_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Key_Project_Roles                                      | Field_And_Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Dot                  | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot                      | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Space                           | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Wrong_AT                        | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Less_Greater_Symbols            | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Colon                           | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Semi_Colon                      | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Comma                           | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Start_With_Hyphen               | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Hyphen_Before_Domain            | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Double_Dot_Domain               | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Exclamation_Domain              | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Unicode                         | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Single_Quote_Before_AT          | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Domain_Exceed_Max               | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Local_Part_Max                  | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_Domain          | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutive_Dot_SubDomain       | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Consecutiv_Dot_Domain_SubDomain | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Emoji                           | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_TLD                             | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Missing_AT                      | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Reserved_Domain                 | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Punycode                        | Field_Error_Chief_Email         |
      | Valid_Data_All_Fields | Invalid_Email_Data_One_Max_Char                        | Field_Error_Chief_Email         |

  @rsp-1863 @saveLaterSponsorEmailValidations
  Scenario Outline: Validate error messages when user saves the project with invalid sponsor email data on key project roles page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Key_Project_Roles_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Key_Project_Roles_Page'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Key_Project_Roles                                      | Field_And_Summary_Error_Message |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Start_With_Dot                  | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Double_Dot                      | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Space                           | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Wrong_AT                        | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Less_Greater_Symbols            | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Colon                           | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Semi_Colon                      | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Comma                           | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Start_With_Hyphen               | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Hyphen_Before_Domain            | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Double_Dot_Domain               | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Exclamation_Domain              | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Unicode                         | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Single_Quote_Before_AT          | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Domain_Exceed_Max               | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Local_Part_Max                  | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutive_Dot_Domain          | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutive_Dot_SubDomain       | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Consecutiv_Dot_Domain_SubDomain | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Emoji                           | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_TLD                             | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Missing_AT                      | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Reserved_Domain                 | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Punycode                        | Field_Error_Sponsor_Email       |
      | Valid_Data_All_Fields | Invalid_Email_Data_Two_Max_Char                        | Field_Error_Sponsor_Email       |

  @rsp-1861 @rsp-3670 @jsEnabled
  Scenario Outline: Validate user is able to fill sponsor organisation in key project roles page with valid data
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    And I capture the page screenshot
    Then I can see the '<Validation_Text>' ui labels on the key project roles page
    Then I fill the key project roles page with '<Key_Project_Roles>'
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    When I click the '<Navigation_Link>' link on the 'Research_Locations_Page'
    Then I can see the key project roles page
    Then I can see previously saved values for '<Key_Project_Roles>' displayed on the key project roles page
    And I capture the page screenshot
    Then I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Key_Project_Roles>' page and '<Research_Locations>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the key project roles page
    Then I can see previously saved values for '<Key_Project_Roles>' displayed on the key project roles page
    And I capture the page screenshot
    And I fill the key project roles page with '<Key_Project_Roles_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Key_Project_Roles_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Key_Project_Roles_Change>' page and '<Research_Locations>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the key project roles page
    Then I can see previously saved values for '<Key_Project_Roles_Change>' displayed on the key project roles page
    And I capture the page screenshot
    And I fill the key project roles page with '<Key_Project_Roles_Change_Blank>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Key_Project_Roles_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Key_Project_Roles_Change_Blank>' page and '<Research_Locations>' page
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the key project roles page
    Then I can see previously saved values for '<Key_Project_Roles_Change_Blank>' displayed on the key project roles page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Validation_Text | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change               | Key_Project_Roles_Change_Blank  | Research_Locations    | Change_Link_Field            | Enter_Link_Field             | Navigation_Link |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Full_Text_Aalborg | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Brackets     | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Amp          | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Dot_Comma    | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Slash        | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Label_Texts     | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Hyphen       | Sponsor_Organisation_Text_Blank | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation | Back            |

  @rsp-1861 @rsp-3670 @jsEnabled
  Scenario Outline: Validate the primary sponsor organisation suggestion list in key project roles page
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the '<Navigation_Button_Add_Project>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    And I capture the page screenshot
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
    And I type valid '<Sponsor_Organisation>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I type invalid '<Sponsor_Organisation_Invalid>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I type min characters '<Sponsor_Organisation_Min>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Add_Project | Navigation_Button_Third | Project_Details_Title | Sponsor_Organisation                          | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Suggestion_List_Headers        | RTS_API_Data         | RTS_Request                                 |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Partial_Text_NHS         | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Brackets    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Dot_Comma   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Slash       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Hyphen      | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Start_Space | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
      | Create_Project_Record   | Start                    | Add_Project                   | Save_Continue           | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

  @rsp-1861 @jsEnabled
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