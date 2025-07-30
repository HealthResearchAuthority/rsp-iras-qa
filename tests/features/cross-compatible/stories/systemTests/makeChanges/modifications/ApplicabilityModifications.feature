@FrontStageUser @createModifications @createApplicabilityModifications @SystemTest @jsEnabled
Feature: Create Amendment - Create Applicability Modifications

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    # Then I fill the key project roles page with 'Valid_Data_All_Fields'
    # And I capture the page screenshot
    # Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    # Then I fill the research locations page with 'Valid_Data_All_Fields'
    # And I capture the page screenshot
    # When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    # Then I can see the review your answers page
    # And I capture the page screenshot
    # When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview page
    When I click the 'Modifications_Tile' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'

  @rsp-4097 @ValidatePlannedEndDateModificationsPageLabels
  Scenario Outline: Validate the ui labels displayed for planned end date in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels for planned project end date page in modifications using '<Current_Planned_End_Date>' dataset

    Examples:
      | Planned_End_Date      | Label_Texts           | Current_Planned_End_Date |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    |

  @rsp-4097 @ValidateValidPlannedEndDateModifications
  Scenario Outline: Verify the user is able make modifications by entering valid data for planned end date
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Which_Organisation_Type_Affect' page for modifications

    Examples:
      | Planned_End_Date      |
      | Valid_Data_All_Fields |

  @rsp-4097 @ValidateErrorMessagePlannedEndDateModifications
  Scenario Outline: Verify the user is able to see error messages when entering invalid data for planned end date in modifications (save and continue and save for later)
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the '<Navigation_Button>' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on planned project end date modifications page for '<Planned_End_Date>'

    Examples:
      | Planned_End_Date      | Navigation_Button | Field_Error_Message | Summary_Error_Message |
      | Invalid_Day_Number    | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Day_Letters   | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Number_1 | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Number_2 | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Letters  | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Past     | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Day   | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Month | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Year  | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Day_Number    | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Day_Letters   | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Number_1 | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Number_2 | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Year_Letters  | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Past     | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Day   | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Month | Save_For_Later    | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_No_Year  | Save_For_Later    | Field_Error_Message | Summary_Error_Message |

  @rsp-4097 @ValidateErrorMessageTodayDatePlannedEndDateModifications
  Scenario Outline: Validate error messages displayed when user fill todays date for planned end date in modifications (save and continue and save for later)
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill todays date in planned project end date for modifications
    And I capture the page screenshot
    When I click the '<Navigation_Button>' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on project details title page for '<Planned_End_Date>'

    Examples:
      | Planned_End_Date   | Navigation_Button | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Today | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Today | Save_For_Later    | Field_Error_Message | Summary_Error_Message |

  @rsp-4097 @ValidateSaveForLaterValidEmptyDateModifications
  Scenario Outline: Validate save for later functionality for valid or empty date for planned end date in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Modifications_Page'
    And I capture the page screenshot
    And I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Planned_End_Date      |
      | Valid_Data_All_Fields |
      | Empty_Data_All_Fields |

  @rsp-4103 @ValidateWhichOrganisationModificationsPageLabels
  Scenario Outline: Validate the ui labels displayed for 'which organisation this change affect' page in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Which_Organisation_Type_Affect' page for modifications
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels for which organisation this change affect page in modifications

    Examples:
      | Planned_End_Date      | Label_Texts           |
      | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-4103 @ValidateSaveForLaterForOranisationAffectModifications
  Scenario Outline: Validate save for later functionality for valid or empty data for 'which organisation this change affect' page in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Which_Organisation_Type_Affect' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Modifications_Page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      |
      | Valid_Data_All_Fields | Empty_Data_All_Fields      |

  @rsp-4103 @ValidateSaveAndContinueForOrganisationChangeAffectModifications
  Scenario Outline: Validate save and continue functionality for valid data for 'which organisation this change affect' page in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Which_Organisation_Type_Affect' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    # Below steps need to be changed to validate the applicability 2 page when RSP-4108 is deployed
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      |
      | Valid_Data_All_Fields | NHS_HSC_Only               |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           |

  @rsp-4103 @ValidateErrorForEmptyOrganisationChangeAffectModifications
  Scenario Outline: Verify the user is able to see error messages when empty data for 'which organisation this change affect' page in modifications
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Which_Organisation_Type_Affect' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Which_Organisation_Type_Affect_Page'

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Field_And_Summary_Error_Message |
      | Valid_Data_All_Fields | Empty_Data_All_Fields      | Mandatory_Field_Error           |
