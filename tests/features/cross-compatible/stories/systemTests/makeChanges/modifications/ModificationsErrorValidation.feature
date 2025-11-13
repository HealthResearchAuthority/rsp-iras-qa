@ApplicantUser @ModificationsErrorValidation @SystemTest @jsEnabled
Feature: Create Modifications - ModificationsErrorValidation: This feature file helps check all the error handling that is in place for when a modification record is created to until it is submitted to a sponsor

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'

  @rsp-4038 @SelectAreaOfChangeErrorValidation
  Scenario Outline: Validate the mandatory field error message on select area of change page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Select_Area_Of_Change_Page'

    Examples:
      | Field_And_Summary_Error_Message        | Area_Of_Change             | Specific_Change | Modifications_Tile_Link |
      | Missing_All_Mandatory_Fields           | Default_Value              | Default_Value   | Modifications_Tile      |
      | Missing_Mandatory_Only_Specific_Change | Participating_Organisation | Default_Value   | Modifications_Tile      |

  # The KNOWN_DEFECT-RSP-5007 will be fixed with the new user story RSP-4136 so this scenario can be re-used later
  @rsp-4039 @ParticipatingOrganisationsErrorValidation @KNOWN_DEFECT-RSP-5007 @skip
  Scenario Outline: Validate the mandatory field error message on participating organisation page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Participating_Organisations_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Participating_Organisations_Page'

    Examples:
      | Field_And_Summary_Error_Message              | Area_Of_Change             | Specific_Change          | Modifications_Tile_Link |
      | Field_Error_participating_organisations_text | Participating_Organisation | Addition_Of_Sites_Option | Modifications_Tile      |

  @rsp-4364 @ValidateErrorMessgaeDisplayedSponsorReferenceModifications
  Scenario Outline: Verify the error messages displayed for sponsor reference modifications page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with '<Sponsor_Reference_Page>'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Sponsor_Reference_Page'

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4364 @ValidateErrorMessgaeDisplayedSponsorReferenceModifications
  Scenario Outline: Verify the error messages displayed for sponsor reference modifications page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with '<Sponsor_Reference_Page>'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Sponsor_Reference_Page'

    Examples:
      | Changes                 | Sponsor_Reference_Page               | Field_And_Summary_Error_Message |
      | Change_Planned_End_Date | Missing_Mandatory_Field              | Missing_Mandatory_Fields_Error  |
      | Change_Planned_End_Date | Max_Character_Sponsor_Summary_Fields | Max_Character_Field_Error       |
      | Change_Planned_End_Date | Invalid_Day_Number                   | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Day_Letters                  | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Year_Number_1                | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Year_Number_2                | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Year_Letters                 | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Date_Past                    | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Date_No_Day                  | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Date_No_Month                | Invalid_Date_Field_Error        |
      | Change_Planned_End_Date | Invalid_Date_No_Year                 | Invalid_Date_Field_Error        |

  @rsp-5200 @rsp-4818 @ModificationsEnterFreeTextErrorValidation
  Scenario Outline: Validate the maximum field length error message on enter free text modification page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    And I fill the modification enter free text page using 'Invalid_Data' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modification_Enter_Free_Text_Page'
    Then I can validate that an error is shown when the entered free text exceeds the character limit on enter free text page

    Examples:
      | Area_Of_Change         | Specific_Change                              |
      | Participant_Procedures | Other_Minor_Change_To_Participant_Procedures |
      | Project_Personnel      | Chief_Investigator_Conflict_Of_Interest      |

  @rsp-4094 @rsp-4095 @ModificationsErrorValidationForInvalidReferenceNumbers
  Scenario Outline: Validate error message for invalid reference numbers on project identification page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project identification select change modification page
    And I capture the page screenshot
    And I fill the project identification select change modification page using '<Changes>' dataset
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project identification select reference modification page
    And I capture the page screenshot
    And I fill the project identification select reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_SelectReference_To_Change_Page'
    Then I can see the project identification enter reference modification page
    And I fill the project identification enter reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Identification_Enter_Reference_Numbers_Page'

    Examples:
      | Changes                                                                   | Field_And_Summary_Error_Message                       | Area_Of_Change                         | Specific_Change        |
      | Modification_To_Add_Administrative_Details_Invalid_Data_Reference_Numbers | Field_Summary_Error_Message_Invalid_Project_Reference | Administrative_Details_For_The_Project | Project_Identification |

  @rsp-4094 @ModificationsErrorValidationInvalidProjectTitles
  Scenario Outline: Validate error message for invalid project titles on project identification page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project identification select change modification page
    And I capture the page screenshot
    And I fill the project identification select change modification page using '<Changes>' dataset
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project identification enter reference modification page
    And I fill the project identification enter reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Identification_Enter_Reference_Numbers_Page'

    Examples:
      | Changes                                                        | Field_And_Summary_Error_Message                    | Area_Of_Change                         | Specific_Change        |
      | Modification_To_Add_Administrative_Details_Invalid_Data_Titles | Field_Summary_Error_Message_Invalid_Project_Titles | Administrative_Details_For_The_Project | Project_Identification |

  @rsp-4097 @ValidateErrorMessagePlannedEndDateModifications
  Scenario Outline: Verify the user is able to see error messages when entering invalid data for planned end date in modifications (save and continue and save for later)
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
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
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill todays date in planned project end date for modifications
    And I capture the page screenshot
    When I click the '<Navigation_Button>' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on planned project end date modifications page for '<Planned_End_Date>'

    Examples:
      | Planned_End_Date   | Navigation_Button | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Today | Save_Continue     | Field_Error_Message | Summary_Error_Message |
      | Invalid_Date_Today | Save_For_Later    | Field_Error_Message | Summary_Error_Message |

  @rsp-4103 @ValidateErrorForEmptyOrganisationChangeAffectModifications
  Scenario Outline: Verify the user is able to see error messages when empty data for 'which organisation this change affect' page in modifications
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Affected_Organisation_Selection_Page'

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Field_And_Summary_Error_Message |
      | Valid_Data_All_Fields | Empty_Data_All_Fields      | Mandatory_Field_Error           |

  @rsp-4171 @ChangePlannedEndDateValidationsFromReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system prevents the user to enter invalid date when modifications details updated from review changes page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    And I fill the affected organisation questions page with '<Affected_Org_Questions>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
    When I click the change link '<Change_Field>' on modification review changes page
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    And I fill the planned project end date modifications page with '<Planned_End_Date_Change>'
    When I click the 'Save_Changes' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on planned project end date modifications page for '<Planned_End_Date>'

    Examples:
      | Planned_End_Date_Change | Change_Field         | Field_Error_Message | Summary_Error_Message | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions |
      | Invalid_Date_Past       | New_Planned_End_Date | Field_Error_Message | Summary_Error_Message | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields  |
      | Invalid_Day_Number      | New_Planned_End_Date | Field_Error_Message | Summary_Error_Message | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields  |
      | Invalid_Day_Letters     | New_Planned_End_Date | Field_Error_Message | Summary_Error_Message | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields  |
      | Invalid_Year_Letters    | New_Planned_End_Date | Field_Error_Message | Summary_Error_Message | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields  |

  @rsp-4171 @TodayDateErrorValidationsFromReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system prevents the user to enter invalid today date when modifications details updated from review changes page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill the planned project end date modifications page with '<Planned_End_Date>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    And I fill the affected organisation questions page with '<Affected_Org_Questions>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
    When I click the change link '<Change_Field>' on modification review changes page
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I fill todays date in planned project end date for modifications
    When I click the 'Save_Changes' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_Error_Message>' and '<Summary_Error_Message>' displayed on planned project end date modifications page for '<Planned_End_Date>'

    Examples:
      | Planned_End_Date_Change | Change_Field         | Field_Error_Message | Summary_Error_Message | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions |
      | Invalid_Date_Today      | New_Planned_End_Date | Field_Error_Message | Summary_Error_Message | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields  |

  @4684 @3877 @ValidateDocumentUploadDuplicateFileErrorMessage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
  Scenario Outline: Verify that a relevant error message is shown when the user attempts to upload a video or non video file that has already been uploaded
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files_New>' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Duplicate_File_Upload_Error' displayed on 'Add_Document_Modifications_Page' while uploading '<Upload_Type>' documents
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files      | Document_Upload_Files_New  | Upload_Type      |
      | Correction_Of_Typographical_Errors | MP4_File                   | MP4_File                   | single invalid   |
      | Correction_Of_Typographical_Errors | Multiple_Files_Video_Valid | Multiple_Files_Video_Valid | multiple invalid |
      | Correction_Of_Typographical_Errors | PNG_File                   | PNG_File                   | single invalid   |
      | Protocol_Non_Substantial_Changes   | Multiple_Files_Three       | Multiple_Files_Three       | multiple invalid |

  @4684 @3877 @ValidateDocumentUploadInvalidFileErrorMessage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
  Scenario Outline: Verify that an appropriate error message is displayed when the user uploads a video or non video file with an invalid format
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files_Invalid>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Invalid_Format_File_Error' displayed on 'Add_Document_Modifications_Page' while uploading '<Upload_Type>' documents
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files_Invalid    | Upload_Type      |
      | Correction_Of_Typographical_Errors | Multiple_Files_Video_Invalid     | multiple invalid |
      | Correction_Of_Typographical_Errors | ASF_File                         | single invalid   |
      | Correction_Of_Typographical_Errors | FLAC_File                        | single invalid   |
      | Correction_Of_Typographical_Errors | MP3_File                         | single invalid   |
      | Correction_Of_Typographical_Errors | MPEG1_File                       | single invalid   |
      | Correction_Of_Typographical_Errors | OGG_File                         | single invalid   |
      | Correction_Of_Typographical_Errors | PS_File                          | single invalid   |
      | Correction_Of_Typographical_Errors | RAW_File                         | single invalid   |
      | Correction_Of_Typographical_Errors | WAV_File                         | single invalid   |
      | Correction_Of_Typographical_Errors | Multiple_Invalid_Files_Non_Video | multiple invalid |
      | Protocol_Non_Substantial_Changes   | JSON_File                        | single invalid   |
  #| Correction_Of_Typographical_Errors | TS_File                          | single invalid   |

  @rsp-3876 @ValidateDocumentUploadModificationsPageErrprMessages @KNOWN_DEFECT_RSP-4801_4920
  Scenario Outline: Validate the user is able to see error messages for invalid actions on upload documents for modifications
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-4314 @ValidateErrorNonRECStudyTypeOptionalDocumentVersionDate
  Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing, using document types applicable to Non-REC study types where document version and date are optional, for documents uploaded with an Incomplete status
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I capture the page screenshot
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    And I select document type '<Document_Types_Optional>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Optional                                                                                       | Version_Date | Field_And_Summary_Error_Message                      |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Evidence_Of_Insurance_Or_Indemnity                                                                            | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Facing_Material_Other                                                                             | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Validated                                                                                       | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Curriculum_Vitae_CV_Suitability_Of_Researcher                                                                 | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Student_Research_Criteria_Eligibility_Declaration                                                             | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Dear_Investigator_Letter                                                                                      | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Funder_Letters_Outcome_Of_Funding_Panel                                                                       | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Statisticians_Letter                                                                                          | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Referees_Or_Other_Scientific_Critique_Report                                                                  | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Sponsor_Site_Agreement                                                                                        | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Schedule_Of_Events_Or_Schedule_Of_Events_Cost_Attribution_Template_SoECAT                                     | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Data_Flow_Diagram_Or_Documents_Demonstrating_Conformity_With_Data_Protection_And_Confidentiality_Requirements | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Miscellaneous                                                                                                 | optional     | Missing_Mandatory_Question_Previously_Approved_Error |

  @rsp-4314 @ValidateErrorNonRECStudyTypeMissingMandatoryFields
  Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing for documents uploaded with an Incomplete status
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I capture the page screenshot
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I click the error displayed on 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I enter document details for the uploaded documents using '<Document_Details_Info>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Field_And_Summary_Error_Message | Document_Details_Info                        |
      | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Mandatory_Data_Fields_Optional_Version_Date  |
      | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Mandatory_Data_Fields_Mandatory_Version_Date |

  @rsp-4314 @ValidateErrorNonRECStudyTypeMissingMandatoryFields
  Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing for documents uploaded with an Incomplete status-alternate flow
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I capture the page screenshot
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I click the error displayed on 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I enter document details for the uploaded documents using '<Document_Details_Info>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message_Another>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Field_And_Summary_Error_Message | Document_Details_Info                                | Field_And_Summary_Error_Message_Another              |
      | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Missing_Mandatory_Data_Fields_Optional_Version_Date  | Missing_Mandatory_Question_Previously_Approved_Error |
      | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Missing_Mandatory_Data_Fields_Mandatory_Version_Date | Missing_Mandatory_Question_Previously_Approved_Error |

  @rsp-4314 @ValidateErrorNonRECStudyTypeMandatoryDocumentVersionDate
  Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing, using document types applicable to Non-REC study types where document version and date are mandatory, for documents uploaded with an Incomplete status
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date | Field_And_Summary_Error_Message                                            |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |

  @rsp-4314 @ValidateErrorNonRECStudyTypeMandatoryDocumentVersionOrDate
  Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when few mandatory details are missing, using document types applicable to Non-REC study types where document version and date are mandatory, for documents uploaded with an Incomplete status
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    And I enter document details for the uploaded documents using '<Valid_Data_Fields_Mandatory_Version_Or_Date>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date | Field_And_Summary_Error_Message                   | Valid_Data_Fields_Mandatory_Version_Or_Date |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |

  @ValidateErrorMessage @rsp-5261 @KNOWN-DEFECT-RSP-5595
  Scenario Outline: Verify that appropriate error messages are displayed when mandatory fields, such as dates, are missing on the 'Add Document Details' page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I capture the page screenshot
    And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    And I enter document details for the uploaded documents using '<Missing_Mandatory_Field>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Add_Document_Details_For_Specific_Document_Modifications_Page'

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Mandatory                         | Missing_Mandatory_Field               | Field_And_Summary_Error_Message            |
      | Correction_Of_Typographical_Errors           | PNG_File              | Protocol_Clinical_Investigation_Plan             | Invalid_Day_Number                    | Invalid_Sponsor_Document_Date_Error        |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                | Invalid_Day_Letters                   | Invalid_Sponsor_Document_Date_Error        |
      | GDPR_Wording                                 | PNG_File              | Consent_form                                     | Invalid_Year_Number_1                 | Invalid_Sponsor_Document_Date_Error        |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants | Invalid_Year_Number_2                 | Invalid_Sponsor_Document_Date_Error        |
      | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Year_Letters                  | Invalid_Sponsor_Document_Date_Error        |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Interviews_Or_Focus_Group_Topic_Guides           | Invalid_Date_Future                   | Invalid_Sponsor_Document_Future_Date_Error |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Questionnaire_Non_Validated                      | Invalid_Date_No_Day                   | No_Sponsor_Document_Date_Day_Error         |
      | Correction_Of_Typographical_Errors           | PNG_File              | Participant_Diary_Sample                         | Invalid_Date_No_Month                 | No_Sponsor_Document_Date_Month_Error       |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                | Invalid_Date_No_Year                  | No_Sponsor_Document_Date_Year_Error        |
      | GDPR_Wording                                 | PNG_File              | Consent_form                                     | Invalid_Date_No_Day_No_Month          | No_Sponsor_Document_Date_Day_Month_Error   |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants | Invalid_Date_No_Day_No_Year           | No_Sponsor_Document_Date_Day_Year_Error    |
      | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Date_No_Month_No_Year         | No_Sponsor_Document_Date_Month_Year_Error  |
      | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Date_No_Date_No_Month_No_Year | No_Sponsor_Document_Date_Error             |

  @EditTheDateFiledAndValidateErrorMessage @rsp-5261 @KNOWN-DEFECT-RSP-5595
  Scenario Outline: Verify the user is able to edit the sponsor document date field from review your document information and validate the error message
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I click on the document date change link next to each document and enter new 'Invalid_Day_Number' and validate if '' is displayed in the add document details for the uploaded documents page
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Add_Document_Details_For_Specific_Document_Modifications_Page'

    Examples:
      | Specific_Change                              | Document_Upload_Files | Missing_Mandatory_Field               | Field_And_Summary_Error_Message            |
      | Correction_Of_Typographical_Errors           | PNG_File              | Invalid_Day_Number                    | Invalid_Sponsor_Document_Date_Error        |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Invalid_Day_Letters                   | Invalid_Sponsor_Document_Date_Error        |
      | GDPR_Wording                                 | PNG_File              | Invalid_Year_Number_1                 | Invalid_Sponsor_Document_Date_Error        |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Invalid_Year_Number_2                 | Invalid_Sponsor_Document_Date_Error        |
      | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Year_Letters                  | Invalid_Sponsor_Document_Date_Error        |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Invalid_Date_Future                   | Invalid_Sponsor_Document_Future_Date_Error |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Invalid_Date_No_Day                   | No_Sponsor_Document_Date_Day_Error         |
      | Correction_Of_Typographical_Errors           | PNG_File              | Invalid_Date_No_Month                 | No_Sponsor_Document_Date_Month_Error       |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Invalid_Date_No_Year                  | No_Sponsor_Document_Date_Year_Error        |
      | GDPR_Wording                                 | PNG_File              | Invalid_Date_No_Day_No_Month          | No_Sponsor_Document_Date_Day_Month_Error   |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Invalid_Date_No_Day_No_Year           | No_Sponsor_Document_Date_Day_Year_Error    |
      | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Date_No_Month_No_Year         | No_Sponsor_Document_Date_Month_Year_Error  |
      | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Date_No_Date_No_Month_No_Year | No_Sponsor_Document_Date_Error             |

  @rsp-4980 @ValidateSummaryAndFieldErrorMessagesContactDetailsModification
  Scenario Outline: Validate the error messages displayed on contact details modification page for invalid email formats
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the contact details modifications page with '<Modification_Data>' for 'create' action
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Contact_Details_Modification_Page'

    Examples:
      | Modification_Data                            | Field_And_Summary_Error_Message                |
      | Invalid_Email_CI_Data_One_Start_With_Dot     | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Double_Dot         | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_TLD                | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Reserved_Domain    | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Punycode           | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Max_Char           | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_SC_Data_One_Start_With_Dot     | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_SC_Data_One_Double_Dot         | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_SC_Data_One_TLD                | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_SC_Data_One_Reserved_Domain    | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_SC_Data_One_Punycode           | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_SC_Data_One_Max_Char           | Sponsor_Contact_Invalid_Email_Error_Message    |
      | Invalid_Email_Other_Data_One_Start_With_Dot  | Other_Email_Field_Invalid_Email_Error_Message  |
      | Invalid_Email_Other_Data_One_Double_Dot      | Other_Email_Field_Invalid_Email_Error_Message  |
      | Invalid_Email_Other_Data_One_TLD             | Other_Email_Field_Invalid_Email_Error_Message  |
      | Invalid_Email_Other_Data_One_Reserved_Domain | Other_Email_Field_Invalid_Email_Error_Message  |
      | Invalid_Email_Other_Data_One_Punycode        | Other_Email_Field_Invalid_Email_Error_Message  |
      | Invalid_Email_Other_Data_One_Max_Char        | Other_Email_Field_Invalid_Email_Error_Message  |

  @rsp-4982 @ValidateSummaryAndFieldErrorMessagesProjectPersonnelChangeChiefInvestigatorModification
  Scenario Outline: Validate the error messages displayed on project personnel new chief investigator modification page for invalid email formats
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the change chief investigator modifications page with '<Modification_Data>' for 'create' action
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Personnel_Change_Chief_Investigator_Page'

    Examples:
      | Modification_Data                                              | Field_And_Summary_Error_Message                |
      | Invalid_Email_CI_Data_One_Start_With_Dot                       | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Double_Dot                           | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_TLD                                  | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Reserved_Domain                      | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Punycode                             | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Max_Char                             | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Start_With_Dot  | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Double_Dot      | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_TLD             | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Reserved_Domain | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Punycode        | Chief_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Max_Char        | Chief_Investigator_Invalid_Email_Error_Message |

  @rsp-4982 @ValidateSummaryAndFieldErrorMessagesProjectPersonnelChangePrincipalInvestigatorModification
  Scenario Outline: Validate the error messages displayed on project personnel new principal investigator modification page for invalid email formats
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the change principal investigator modifications page with '<Modification_Data>' for 'create' action
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Project_Personnel_Change_Principal_Investigator_Page'

    Examples:
      | Modification_Data                                              | Field_And_Summary_Error_Message                    |
      | Invalid_Email_CI_Data_One_Start_With_Dot                       | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Double_Dot                           | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_TLD                                  | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Reserved_Domain                      | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Punycode                             | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Data_One_Max_Char                             | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Start_With_Dot  | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Double_Dot      | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_TLD             | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Reserved_Domain | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Punycode        | Principal_Investigator_Invalid_Email_Error_Message |
      | Invalid_Email_CI_Temorary_Arrangement_Data_One_Max_Char        | Principal_Investigator_Invalid_Email_Error_Message |
