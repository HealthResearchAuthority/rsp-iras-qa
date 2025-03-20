@researcherUser @createProject @createAmendment @SystemTest
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
    And I can see the '<Validation_Text>' on the create project record page
    And I can see a '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    When I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I can see the '<Validation_Text>' on the project details iras page
    And I fill the project details iras page with '<Project_Details_IRAS>'
    And I can see a '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the project details title page
    Then I can see '<Project_Details_IRAS>' displayed on the project details iras page

    Examples:
      | Validation_Text | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Navigation_Link |
      | Label_Texts     | Create_Project_Record | Start               | Valid_IRAS_ID        | Save_Continue       | Back            |

  @rsp-1858
  Scenario Outline: Validate error messages displayed when user amend the project using invalid iras id
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see '<Error_Message>' displayed on the project details iras page --------------STEP TO CREATE--------------

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS            | Navigation_Button_3 | Error_Message         |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Letters         | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Symbols         | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Letters_Symbols | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Min_Length      | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Max_Length      | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Leading_Zero    | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Special_Char    | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Start_Spaces    | Save_Continue       | Error_Message_IRAS_ID |
      | Create_Project_Record | Start               | Invalid_IRAS_ID_Spaces_Between  | Save_Continue       | Error_Message_IRAS_ID |

  @rsp-1858
  Scenario Outline: Validate breadcrumb navigations in project details iras id page
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    Then I can see the 'Project_Details_IRAS_Page'
    When I click the '<Navigation_Link>' link on the 'Project_Details_IRAS_Page'
    Then I can see the 'Create_Project_Record_Page'

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Navigation_Link |
      | Create_Project_Record | Start               | Back            |

  @rsp-1859
  Scenario Outline: Validate user is able to fill project details page for short project title and project end date
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the 'Project_Details_Title_Page'
    And I can see the '<Validation_Text>' on the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_Title_Page'
    Then I can see no error displayed and has navigated to next page --------------STEP TO CREATE--------------
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see '<Project_Details_Title>' displayed on the project details title page

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Validation_Text | Project_Details_Title |
      | Create_Project_Record | Start               | Valid_IRAS_ID        | Save_Continue       | Label_Texts     | Valid_Data_All_Fields |

  @rsp-1859
  Scenario Outline: Validate error messages displayed when user fill invalid data for short project title and project end date
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_Title_Page'
    Then I can see no error displayed and has navigated to next page --------------STEP TO CREATE--------------
    When I click the '<Navigation_Link>' link on the 'Key_Project_Roles_Page'
    Then I can see '<Project_Details_Title>' displayed on the project details title page

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Navigation_Link | Validation_Text | Project_Details_Title |
      | Create_Project_Record | Start               | Valid_IRAS_ID        | Save_Continue       | Back            | Label_Texts     | Valid_Data_All_Fields |

  @rsp-1858
  Scenario Outline: Validate breadcrumb navigations in project details short project title page
    And I click the '<Navigation_Button_1>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_2>' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with '<Project_Details_IRAS>'
    When I click the '<Navigation_Button_3>' button on the 'Project_Details_IRAS_Page'
    Then I can see the 'Project_Details_Title_Page'
    When I click the '<Navigation_Link>' link on the 'Project_Details_Title_Page'
    Then I can see the 'Project_Details_IRAS_Page'

    Examples:
      | Navigation_Button_1   | Navigation_Button_2 | Project_Details_IRAS | Navigation_Button_3 | Navigation_Link |
      | Create_Project_Record | Start               | Valid_IRAS_ID        | Save_Continue       | Back            |
