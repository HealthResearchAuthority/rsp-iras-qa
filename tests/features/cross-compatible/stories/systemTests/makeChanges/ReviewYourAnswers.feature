@ApplicantUser @createProject @createProjectReviewYourAnswers @createAmendment @SystemTest
Feature: Create Amendment - Create Project - Review your answers

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-2837 @rsp-3819 @rsp-4874 @rsp-4868 @reviewYourAnswersAllFields
  Scenario Outline: Verify that user completed all question and can review the answers on create project journey
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I validate the ui fields on project overview unfinished projects page
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Examples:
      | Project_Details_Title | Chief_Investigator    | Project_Identifiers   | Research_Locations    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-2837 @rsp-3819 @rsp-4868 @reviewAnswersChangeProjTitleFields
  Scenario Outline: Verify that user can change the project title details all fields from review the answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title_Change>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator    | Research_Locations    | Project_Identifiers   | Change_Link_Field | Project_Details_Title_Change    |
      | Valid_Data_Only_Date_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Valid_Data_Only_Date_Fields_Two |

  @rsp-2837 @rsp-4209 @rsp-4868 @reviewAnswersChangeProjKeyRoles
  Scenario Outline: Verify that user can change the project key roles all fields from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with '<Chief_Investigator_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator_Change>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title | Chief_Investigator                       | Chief_Investigator_Change                    | Research_Locations    | Project_Identifiers   | Change_Link_Field             |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email      |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_first_name |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_last_name  |
      | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field | Valid_Data_Only_Investigator_Email_Field_Two | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email      |

  @rsp-2837 @rsp-4868 @reviewAnswersChangeResearchLoc
  Scenario Outline: Verify that user can change the project research locations fields from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the research locations page
    And I fill the research locations page with '<Research_Locations_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations_Change>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations                      | Research_Locations_Change                   | Change_Link_Field     | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                   | Valid_Data_All_Fields_Two                   | nations_participating | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Nations_Participating   | Valid_Data_Only_Nations_Participating_Two   | nations_participating | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_is_nhs_hsc_organisation      | Valid_Data_is_nhs_hsc_organisation_Two      | nhs_hsc_organisation  | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_is_nhs_hsc_organisation | Valid_Data_Only_is_nhs_hsc_organisation_Two | nhs_hsc_organisation  | Valid_Data_All_Fields |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersEnterProjTitle
  Scenario Outline: Verify that user has not completed all questions and can enter project title details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title_Enter>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field | Review_Answers             | Project_Details_Title_Enter | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Valid_Data_Only_Date_Fields | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersEnterKeyRoles
  Scenario Outline: Verify that user has not completed all questions and can enter project key roles details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator_Enter>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title        | Chief_Investigator          | Research_Locations          | Enter_Link_Field         | Review_Answers             | Chief_Investigator_Enter                 | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Valid_Data_All_Fields                    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Valid_Data_Only_Investigator_Email_Field | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-3819 @rsp-4868 @reviewAnswersEnterResearchLoc
  Scenario Outline: Verify that user has not completed all questions and can enter research locations details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can see the research locations page
    And I fill the research locations page with '<Research_Locations_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations_Enter>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title        | Chief_Investigator          | Research_Locations          | Enter_Link_Field      | Review_Answers             | Research_Locations_Enter                | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_All_Fields                   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_Only_Nations_Participating   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nhs_hsc_organisation  | Enter_Links_Missing_Fields | Valid_Data_is_nhs_hsc_organisation      | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_Only_is_nhs_hsc_organisation | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-4868 @reviewAnswersNavigationResLocProjTitle
  Scenario Outline: Verify back navigation on project title and research locations page from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    When I click the 'Back' link on the 'Review_Your_Answers_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Valid_Data_All_Fields |

  @rsp-2837 @rsp-4868 @reviewAnswersNavigationKeyRoles
  Scenario Outline: Verify back navigation on chief investigator page from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I capture the page screenshot
    When I click the 'Back' link on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field        | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Valid_Data_All_Fields |

  @rsp-2837 @rsp-1867 @rsp-3819 @rsp-4868 @reviewAnswersProjTitleErrorValidations
  Scenario Outline: Validate error message on project title page when user redirected from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field | Review_Answers             | Project_Details_Title_Enter                 | Field_And_Summary_Error_Message | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_All_Fields                          | All_Field_Error_Message         | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Day_Number                          | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Day_Letters                         | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Year_Number_1                       | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Year_Number_2                       | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Year_Letters                        | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Date_Past                           | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Date_No_Day                         | Date_Day_Field_Error_Message    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Date_No_Month                       | Date_Month_Field_Error_Message  | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date    | Enter_Links_Missing_Fields | Invalid_Date_No_Year                        | Date_Year_Field_Error_Message   | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersChiefInvestigatorEmailValidations @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate chief investigator email error messages when user redirected from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
      | Project_Details_Title        | Chief_Investigator          | Research_Locations          | Enter_Link_Field         | Review_Answers             | Chief_Investigator_Enter               | Field_And_Summary_Error_Message | Project_Identifiers             |
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
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field | Project_Details_Title_Enter                 | Field_And_Summary_Error_Message | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_All_Fields                          | All_Field_Error_Message         | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Day_Number                          | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Day_Letters                         | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Year_Number_1                       | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Year_Number_2                       | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Year_Letters                        | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Date_Past                           | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Date_No_Day                         | Date_Day_Field_Error_Message    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Date_No_Month                       | Date_Month_Field_Error_Message  | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date     | Invalid_Date_No_Year                        | Date_Year_Field_Error_Message   | Valid_Data_All_Fields |

  @rsp-2837 @rsp-4868 @reviewAnswersChiefInvestigatorEmailValidation_ChangeFlow @KNOWN_DEFECT_RSP-5319
  Scenario Outline: Validate error message for chief investigator email when user redirected from review your answers page - change flow
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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


  @rsp-1867 @rsp-3819 @rsp-4868 @ValidateConfirmProjectFlow
  Scenario Outline: Validate user is able to see the project overview page when user submit the review answer page with all mandatory fields entered correctly
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Project_Details_Title | Chief_Investigator    | Research_Locations    | Project_Identifiers   |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-1867 @rsp-3819 @rsp-4868 @ValidateErrorMessagesOnConfirmProjectPage @KNOWN_DEFECT_RSP-5418
  Scenario Outline: Validate user is able to see the error messages when user submit the review answer page when all mandatory fields are not entered correctly
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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

  @rsp-1867 @rsp-3819 @rsp-4880 @rsp-4868 @ValidateConfirmProjectPage
  Scenario Outline: Validate user is able to see the project success confirmation screen and then the project overview page when user submit the review answer page with all mandatory fields entered correctly
    And I click the '<Navigation_Button_First>' button on the 'My_Research_Projects_Page'
    And I click the '<Navigation_Button_Second>' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I validate 'Project_Record_Created_Labels' labels displayed in confirmation page for project created
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the 'created' project details on project overview page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Project_Details_Title | Chief_Investigator    | Research_Locations    | Project_Identifiers   |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |
