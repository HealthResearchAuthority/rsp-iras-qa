@adminUser @createProject @createAmendment @SystemTest
Feature: Create Amendment - Create Project

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-1858
  Scenario Outline: Validate user is able to amend a project using an iras id
    And I can see the my research projects page
    And I can see the '<Validation_Text>' on the my research project page
    Then I can see a '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    When I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I can see a '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    When I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I can see the '<Validation_Text>' ui labels on the project details iras page
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I can see a '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details title page
    Then I can see previously saved values for '<Project_Details_IRAS>' displayed on the project details iras page

    Examples:
      | Validation_Text | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Navigation_Link |
      | Label_Texts     | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Back            |
      | Label_Texts     | Create_Project_Record | Start               | Valid_IRAS_ID_Max    | Save_Continue       | Back            |

  @rsp-1858
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details iras page for '<Project_Details_IRAS>'

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS             | Navigation_Button_3 | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Letters          | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Symbols          | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Letters_Symbols  | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Min_Length       | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Max_Length       | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Leading_Zeros    | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Spaces           | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Spaces_Suffix    | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Spaces_Prefix    | Save_Continue       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Spaces_Seperator | Save_Continue       | Field_Error_Message | Summary_Error_Message |

  @rsp-1858
  Scenario Outline: Validate breadcrumb navigations in project details iras id page
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    When I click the '<Navigation_Link>' link on the 'Project_Details_IRAS_Page'
    Then I can see the create project record page

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Navigation_Link |
      | Create_Project_Record | Start               | Back            |

  @rsp-1859
  Scenario Outline: Validate user is able to fill project details page for short project title and project end date
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I can see the '<Validation_Text>' ui labels on the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Validation_Text | Project_Details_Title    | Navigation_Link |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_1  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_2  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_3  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_4  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_5  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_6  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_7  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_8  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_9  | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_10 | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_11 | Back            |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Label_Texts     | Valid_Data_All_Fields_12 | Back            |

  @rsp-1859-make-changes-dataset-error
  Scenario Outline: Validate error messages displayed when user fill invalid data for short project title and project end date
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Project_Details_Title                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_All_Fields                          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Data_Short_Project_Title_Max_Length | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Data_Short_Project_Title_Min_Length | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Day_Number                          | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Day_Letters                         | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Month_Number                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Month_Letters                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Year_Number_1                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Year_Number_2                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Year_Letters                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_Past                           | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_Current                        | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_No_Day                         | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_No_Month                       | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_No_Year                        | Field_Error_Message | Summary_Error_Message |

  @rsp-1859
  Scenario Outline: Validate error messages displayed when user fill todays data for project end date
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    And I fill todays date for planned project end date in project details title page
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_Title_Page'
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Project_Details_Title | Field_Error_Message | Summary_Error_Message |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Invalid_Date_Today    | Field_Error_Message | Summary_Error_Message |

  @rsp-1859
  Scenario Outline: Validate breadcrumb navigations in project details short project title page
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details iras page

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Navigation_Link |
      | Create_Project_Record | Start               | Valid_IRAS_ID_Min    | Save_Continue       | Back            |
