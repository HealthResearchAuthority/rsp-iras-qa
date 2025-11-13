@ApplicantUser @ModificationsSaveLater @SystemTest @jsEnabled
Feature: Create Modifications - ModificationsSaveLater: This feature file helps check all the partial journey that a user can leave at any time and come back again to

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

  @rsp-4038 @SelectAreaOfChange
  Scenario Outline: Verify that user can create modifications to change the participating organisations
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
    And I validate the field values with '<Project_Details_Title>' on select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Participating_Organisations_Page'
    Then I can see the select area of change page
    Then I can see previously saved values for '<Area_Of_Change>' and '<Specific_Change>' displayed on select area of change page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Project_Details_Title | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_Sites_Option                                   | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Back            | Modifications_Tile      |

  @rsp-4038 @rsp-4110 @rsp-3876 @SelectAreaOfChangeDropdownListValidation
  Scenario Outline: Validate the specific change list values are displayed based on the area of change selection
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
    Then I validate the specific change dropdown options are displayed based on the selected area of change dropdown with '<Dropdown_Options_To_Validate>'

    Examples:
      | Area_Of_Change             | Specific_Change | Dropdown_Options_To_Validate | Modifications_Tile_Link |
      | Participating_Organisation | Default_Value   | Participating_Organisation   | Modifications_Tile      |
      | Default_Value              | Default_Value   | Default_Value                | Modifications_Tile      |
      | Project_Design             | Default_Value   | Project_Design               | Modifications_Tile      |
      | Project_Documents          | Default_Value   | Project_Documents            | Modifications_Tile      |

  @rsp-4038 @SelectAreaOfChangeModificationIdValidation @KNOWN_DEFECT-RSP-4997
  Scenario Outline: Validate the modification id on select area of change page when user creates multiple new modifications
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
    Then I validate the modification id is incremented by one for every '<New_Modification_Count>' new modification on select area of change page

    Examples:
      | New_Modification_Count | Modifications_Tile_Link |
      | Modification_Count     | Modifications_Tile      |

  @rsp-4038 @SelectAreaOfChangeSaveLater @KNOWN_DEFECT-RSP-4997
  Scenario Outline: Verify that user can save the modifications progress on select area of change page
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
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Modifications_Tile      |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      |
      | Default_Value              | Default_Value                                              | Modifications_Tile      |

  @rsp-4039 @ParticipatingOrganisations
  Scenario Outline: Verify that user can create modifications and validate the field values in search participating organisations page
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
    Then I can see the participating organisation page
    And I can see the page heading is changed for '<Specific_Change>' on participating organisation page
    And I capture the page screenshot
    And I validate the ui lables and field values with '<Project_Details_Title>' on participating organisation page

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Project_Details_Title | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_Sites_Option                                   | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Modifications_Tile      |

  @rsp-4039 @rsp-4065 @ParticipatingOrganisationSaveLater
  Scenario Outline: Verify that user can save the modifications progress on search participating organisations page
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
    Then I can see the participating organisation page
    And I capture the page screenshot
    And I validate the guidance content displayed on modifications participating organisations page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Participating_Organisations_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Area_Of_Change             | Specific_Change                                            |
      | Participating_Organisation | Addition_Of_Sites_Option                                   |
      | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |
      | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option |

  @rsp-4364 @ValidateSponsorReferenceModifications
  Scenario Outline: Verify user is able to fill sponsor reference details for the modification
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
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I can see the 'Label_Texts' ui labels on the sponsor reference modifications page
    Then I fill the sponsor reference modifications page with '<Sponsor_Reference_Page>'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    # Then I validate sponsor details are displayed with '<Sponsor_Reference_Page>'

    Examples:
      | Changes              | Sponsor_Reference_Page |
      | Multiple_Changes_One | Valid_Data_All_Fields  |

  @rsp-4364 @ValidateSaveForLaterSponsorReferenceModifications
  Scenario Outline: Verify the save for later functionality for sponsor reference modifications page
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
    When I click the 'Save_For_Later' button on the 'Sponsor_Reference_Page'
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    And I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'

    Examples:
      | Changes                 |
      | Change_Planned_End_Date |

  @rsp-4364 @ValidateSponsorReferenceModifications
  Scenario Outline: Verify user is able to fill sponsor reference details for the modification
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
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I can see the 'Label_Texts' ui labels on the sponsor reference modifications page
    Then I fill the sponsor reference modifications page with '<Sponsor_Reference_Page>'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    # Then I validate sponsor details are displayed with '<Sponsor_Reference_Page>'

    Examples:
      | Changes              | Sponsor_Reference_Page |
      | Multiple_Changes_One | Valid_Data_All_Fields  |

  @rsp-4364 @ValidateSaveForLaterSponsorReferenceModifications
  Scenario Outline: Verify the save for later functionality for sponsor reference modifications page
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
    When I click the 'Save_For_Later' button on the 'Sponsor_Reference_Page'
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    And I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'

    Examples:
      | Changes                 |
      | Change_Planned_End_Date |

  @rsp-4386 @rsp-4380 @rsp-5200 @rsp-4818 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextUpdateFreeText
  Scenario Outline: Validate that user can create modifications to add free text and modify free text from modification details page
    Then I fill the research locations page with '<Research_Locations>'
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate all fields on modification page '<Changes>'
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    Then I can see the modification page matching with the specific change using '<Changes>' dataset
    And I fill the modification enter free text page using '<Changes_Edited>' dataset
    And I capture the page screenshot
    And I click the 'Save_Changes' button on the 'Modification_Enter_Free_Text_Page'
    And I capture the page screenshot
    Then I validate the free text content and specific change label on review modifications page using '<Changes_Edited>' dataset
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page

    Examples:
      | Changes                                                              | Research_Locations  | Change_Field      | Specific_Change                         | Changes_Edited                                                              |
      | Bulk_Free_Text_Single_Change_Chief_Investigator_Conflict_Of_Interest | Nhs_Involvement_Yes | Changes_Free_Text | Chief_Investigator_Conflict_Of_Interest | Bulk_Free_Text_Single_Chief_Investigator_Conflict_Of_Interest_Change_Edited |
      | Modification_To_Add_Administrative_Details_Single                    | Nhs_Involvement_Yes | select_change     | Chief_Investigator_Conflict_Of_Interest | Bulk_Free_Text_Single_Chief_Investigator_Conflict_Of_Interest_Change_Edited |

  @rsp-5200 @rsp-4818 @ModificationsEnterFreeTextPageSaveForLater
  Scenario Outline: Verify that user can create modifications and validate the field values in enter free text page and can save the changes
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
    Then I can see the modification page matching with the specific change using '<Changes>' dataset
    And I capture the page screenshot
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I click the 'Save_For_Later' button on the 'Modification_Enter_Free_Text_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                                                                     | Area_Of_Change         | Specific_Change                              | Project_Details_Title |
      | Bulk_Free_Text_Single_Change_Other_Minor_Change_To_Participant_Procedures   | Participant_Procedures | Other_Minor_Change_To_Participant_Procedures | Valid_Data_All_Fields |
      | Bulk_Free_Text_Single_Chief_Investigator_Conflict_Of_Interest_Change_Edited | Project_Personnel      | Chief_Investigator_Conflict_Of_Interest      | Valid_Data_All_Fields |

  @rsp-4094 @rsp-4095 @ModificationsJourneyEntireJourney @ModificationsToAddAdministrativeDetailsAndModifyDetails
  Scenario Outline: Validate that user can create modifications to add administrative details and modify the details from modification details page
    Then I fill the research locations page with '<Research_Locations>'
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate all fields on modification page '<Changes>'
    And I validate the individual and overall ranking of changes on the relevant modification page
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    Then I can see the project identification select change modification page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I fill the project identification select change modification page using '<Valid_Data_Change>' dataset
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project identification select reference modification page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I fill the project identification select reference modification page using '<Valid_Data_Change>' dataset
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identification_SelectReference_To_Change_Page'
    Then I can see the project identification enter reference modification page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I fill the project identification enter reference modification page using '<Valid_Data_Change>' dataset
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    Then I can see the modification review changes page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page

    Examples:
      | Changes                                           | Research_Locations  | Change_Field  | Specific_Change        | Valid_Data_Change                                        |
      | Modification_To_Add_Administrative_Details_Single | Nhs_Involvement_Yes | select_change | Project_Identification | Modification_To_Add_Administrative_Details_Single_Change |

  @rsp-4094 @rsp-4095 @ProjectIdentification_SelectChangeSaveForLater
  Scenario Outline: Verify that user can create modifications and can save the changes on project identification select change page
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
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I click the 'Save_For_Later' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                                           | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @rsp-4094 @rsp-4095 @ProjectIdentification_SelectReferenceSaveForLater
  Scenario Outline: Verify that user can create modifications and can save the changes on project identification select reference number page
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
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    When I click the 'Save_For_Later' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @rsp-4094 @rsp-4095 @ProjectIdentificationEnterReferenceNumberSaveForLater
  Scenario Outline: Verify that user can create modifications and can save the changes on project identification enter reference number page
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I fill the project identification select reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_SelectReference_To_Change_Page'
    Then I can see the project identification enter reference modification page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I can validate the ui labels on project identification enter reference numbers page using '<Label_Text_Data>' dataset
    When I click the 'Save_For_Later' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title | Label_Text_Data |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields | Label_Texts     |

  @rsp-4097 @ValidatePlannedEndDateModificationsPageLabels
  Scenario Outline: Validate the ui labels displayed for planned end date in modifications
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
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels for planned project end date page in modifications using '<Current_Planned_End_Date>' dataset

    Examples:
      | Planned_End_Date      | Label_Texts           | Current_Planned_End_Date |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    |

  @rsp-4097 @ValidateValidPlannedEndDateModifications
  Scenario Outline: Verify the user is able make modifications by entering valid data for planned end date
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

    Examples:
      | Planned_End_Date      |
      | Valid_Data_All_Fields |

  @rsp-4097 @ValidateSaveForLaterValidEmptyDateModifications
  Scenario Outline: Validate save for later functionality for valid or empty date for planned end date in modifications
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
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels for which organisation this change affect page in modifications

    Examples:
      | Planned_End_Date      | Label_Texts           |
      | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-4103 @ValidateSaveForLaterForOranisationAffectModifications
  Scenario Outline: Validate save for later functionality for valid or empty data for 'which organisation this change affect' page in modifications
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
    Then I can see the change planned end date affected organisation questions page
    And I capture the page screenshot

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      |
      | Valid_Data_All_Fields | NHS_HSC_Only               |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           |

  @rsp-4108 @ValidateUiLabelsAffectedOrganisationQuestionsPage @KNOWN-DEFECT-RSP-4790
  Scenario Outline: Validate ui labels on modifications affected organisation questions page
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
    And I capture the page screenshot
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels using '<Label_Text_Affected_Org_Questions>' on affected organisation questions page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Label_Texts           | Label_Text_Affected_Org_Questions |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields | Label_Texts_Nhs_Hsc               |
      | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields | Label_Texts_Nhs_Hsc               |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_All_Fields | Label_Texts_Non_Nhs_Hsc           |

  @rsp-4108 @SaveLaterAffectedOrganisationQuestionsPage @KNOWN-DEFECT-RSP-4786
  Scenario Outline: Verify that modifications progress successfully saved when user saves the record from affected organisation questions page
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
    When I click the 'Save_For_Later' button on the 'Affected_Organisation_Questions_Page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields          |
      | Valid_Data_All_Fields | NHS_HSC_Only               | Empty_Data_All_Fields          |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_All_Country |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Empty_Data_Non_Nhs             |

  @rsp-4171 @rsp-4611 @CreateModificationsToChangePlannedEndDateAndReviewChanges @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Create modifications for change planned end date and review the modifications details on review changes page
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
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
    # Save and continue will be covered in future story rsp-4271

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Label_Texts           | Affected_Org_Questions         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields | Valid_Data_All_Fields          |
      | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields | Valid_Data_Optional_Fields     |
      | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields | Empty_Data_All_Fields          |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_All_Fields | Valid_Data_Non_Nhs_All_Country |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_All_Fields | Empty_Data_Non_Nhs             |

  @rsp-4171 @rsp-4611 @SaveLaterReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that modifications progress successfully saved when user saves the record from review changes page
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
    When I click the 'Save_For_Later' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields          |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_All_Country |

  @rsp-4171 @ChangePlannedEndDateDataPersistenceValidations @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system retains the data on all modifications pages when user navigates back from review changes page
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
    When I click the 'Back' link on the 'Review_Changes_Planned_End_Date_Page'
    Then I can see the change planned end date affected organisation questions page
    And I capture the page screenshot
    And I can see previously saved values for '<Affected_Org_Questions>' displayed on the affected organisation questions page
    When I click the 'Back' link on the 'Affected_Organisation_Questions_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I capture the page screenshot
    And I can see previously saved values for '<Organisation_Change_Affect>' displayed on the affected organisation selection page
    When I click the 'Back' link on the 'Affected_Organisation_Selection_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    Then I can see previously saved values for '<Planned_End_Date>' displayed on the change to planned end date page
    When I click the 'Back' link on the 'Planned_End_Date_Change_Page'
    Then I can see the select area of change page
    And I capture the page screenshot
    Then I can see previously saved values for 'Project_Design' and 'Planned_End_Date' displayed on select area of change page

    Examples:
      | Planned_End_Date      | Organisation_Change_Affect | Label_Texts           | Affected_Org_Questions         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields | Valid_Data_All_Fields          |
      | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields | Valid_Data_Optional_Fields     |
      | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_All_Fields | Valid_Data_Non_Nhs_All_Country |

  @rsp-4171 @ModifyPlannedEndDateFromReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that user can change the planned end date from review modifications page
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
    When I click the 'Back' link on the 'Planned_End_Date_Change_Page'
    And I capture the page screenshot
    And I can see the modification review changes page
    When I click the change link '<Change_Field>' on modification review changes page
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    And I fill the planned project end date modifications page with '<Planned_End_Date_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate all field values on review modifications page using '<Planned_End_Date_Change>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'

    Examples:
      | Change_Field         | Planned_End_Date      | Planned_End_Date_Change      | Organisation_Change_Affect | Affected_Org_Questions |
      | New_Planned_End_Date | Valid_Data_All_Fields | Valid_Data_All_Fields_Change | Valid_Data_All_Fields      | Valid_Data_All_Fields  |

  @rsp-4171 @ModifyAffectedOrganisationTypesFromReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that user can change the affected organisation types from review modifications page
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
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with '<Organisation_Change_Affect_Update>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    And I fill the affected organisation questions page with '<Affected_Org_Questions_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect_Update>' and '<Affected_Org_Questions_Change>'

    Examples:
      | Change_Field                | Planned_End_Date      | Planned_End_Date_Change      | Organisation_Change_Affect | Organisation_Change_Affect_Update | Affected_Org_Questions         | Affected_Org_Questions_Change |
      | Affected_Organisation_Types | Valid_Data_All_Fields | Valid_Data_All_Fields_Change | Valid_Data_All_Fields      | NHS_HSC_Only                      | Valid_Data_All_Fields          | Valid_Data_All_Fields         |
      | Affected_Organisation_Types | Valid_Data_All_Fields | Valid_Data_All_Fields_Change | Non_NHS_HSC_Only           | NHS_HSC_Only                      | Valid_Data_Non_Nhs_All_Country | Valid_Data_All_Fields         |

  @rsp-4171 @ModifyAffectedOrgQuestionsFromReviewChangesPage @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that user can change all affected organisation questions from review modifications page
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
    Then I can see the change planned end date affected organisation questions page
    And I capture the page screenshot
    And I fill the affected organisation questions page with '<Affected_Org_Questions_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions_Change>'

    Examples:
      | Change_Field                     | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions            | Affected_Org_Questions_Change     |
      | Affected_Nhs_Hsc_Locations       | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields             | Valid_Data_Optional_Fields        |
      | Affected_Nhs_Hsc_Locations       | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_Optional_Fields        | Valid_Data_All_Fields             |
      | Portion_Of_Nhs_Hsc_Organisations | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields             | Valid_Data_Optional_Fields        |
      | Additional_Resource_Implications | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_Optional_Fields        | Valid_Data_All_Fields             |
      | Affected_Non_Nhs_Hsc_Locations   | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_All_Country    | Valid_Data_Non_Nhs_Single_Country |
      | Affected_Non_Nhs_Hsc_Locations   | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_Single_Country | Valid_Data_Non_Nhs_All_Country    |

  @rsp-4271 @ModificationsDetailsSaveAndContinue
  Scenario Outline: Validate that user can create modifications and navigate to add sponsor reference page
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
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the ui labels on modification details page using 'Modification_Details_Label_Texts'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    # Further steps will be covered in RSP-4364

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4271 @ModificationsDetailsUnfinishedModification
  Scenario Outline: Verify that system prevents the user to proceed further when modification details are unfinished
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the modification unfinished error page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Return_To_Modification_Details' button on the 'Modification_Unfinished_Error_Page'
    Then I can see the modifications details page
    And I capture the page screenshot

    Examples:
      | Changes                                           |
      | Changes_Planned_End_Date_Unfinished_Modifications |

  @rsp-4271 @rsp-5188 @ModificationsDetailsRemoveAllChanges
  Scenario Outline: Validate that user can remove all changes from modification details page
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Remove' link on the 'Modification_Details_Page'
    Then I can see the confirm remove modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    And I click the 'Remove_Change' button on the 'Confirm_Remove_Modification_Page'
    And I capture the page screenshot
    And I can see the modifications details page
    Then I can see the modification successfully removed message on modification details page
    And I capture the page screenshot

    Examples:
      | Changes                                           |
      | Changes_Planned_End_Date_Unfinished_Modifications |

  @rsp-4271 @UpdateDetailsFromModificationsDetailsPage @KNOWN_DEFECT_RSP-5275
  Scenario Outline: Verify that user can update the details from modification details page
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    And I fill the planned project end date modifications page with '<Planned_End_Date_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Modifications_Page'
    And I can see the modification review changes page
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the modifications details page
    And I capture the page screenshot

    Examples:
      | Changes                           | Change_Field         | Planned_End_Date_Change      |
      | Multiple_Changes_Planned_End_Date | New_Planned_End_Date | Valid_Data_All_Fields_Change |

  @rsp-4271 @ModificationsDetailsSaveForLater
  Scenario Outline: Verify that user can save the modification progress from modification details page
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
    And I capture the page screenshot
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-3876 @4684 @ValidateDocumentUploadAndReviewForModificationsPage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
  Scenario Outline: Validate the user is able to upload and review documents for modifications
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
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    And I validate the uploaded '<Document_Upload_Files_New>' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    And I click the 'Back' link on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Add_Document_Modifications_Page'
    Then I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Upload_Files_New  |
      | Correction_Of_Typographical_Errors           | PNG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | GIF_File              | PNG_File                   |
      | Correction_Of_Typographical_Errors           | BMP_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | SVG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | JPG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | JPEG_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOC_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOCX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOTX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XLS_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XLSX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PDF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | TXT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | CSV_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PPT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PPTX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | RTF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | ODT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | OFD_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XPS_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XML_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | HTML_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | HTM_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | VCF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | EML_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | MSG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | GIF_File                   |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | Multiple_Files             |
      | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files             |
      | CRF_Other_Study_Data_Records                 | Multiple_Files        | GIF_File                   |
      | GDPR_Wording                                 | Multiple_Files        | GIF_File                   |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files        | GIF_File                   |
      | Post_Trial_Information_For_Participants      | Multiple_Files        | GIF_File                   |
      | Protocol_Non_Substantial_Changes             | Multiple_Files        | GIF_File                   |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files        | GIF_File                   |
      | Correction_Of_Typographical_Errors           | MP4_File              | AVI_File                   |
      | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files_Video_Valid |
      | Correction_Of_Typographical_Errors           | AVI_File              | MP4_File                   |
      | Correction_Of_Typographical_Errors           | MOV_File              | MKV_File                   |
      | Correction_Of_Typographical_Errors           | MKV_File              | MOV_File                   |
      | Correction_Of_Typographical_Errors           | MPG_File              | MPEG_File                  |
      | Correction_Of_Typographical_Errors           | MPEG_File             | MPG_File                   |
      | Correction_Of_Typographical_Errors           | WMV_File              | WEBM_File                  |
      | Correction_Of_Typographical_Errors           | WEBM_File             | WMV_File                   |

  @rsp-4539 @SaveForLaterWithoutSelectingDocumentType @KNOWN-DEFECT-RSP-5091
  Scenario Outline: Verify the user is able to save for later without selecting document type in the review your information page
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
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I can see the review your document information page
    And I can see document type guidance text next to each document type
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Review_Document_Infomation_Page'
    And I capture the page screenshot
    And I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-4539 @SaveForLaterSelectingOnlyDocumentType @KNOWN-DEFECT-RSP-5091
  Scenario Outline: Verify the user is able to save for later after selecting only document type in the review your information page
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
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I can see the review your document information page
    And I can see document type guidance text next to each document type
    And I capture the page screenshot
    And I select a document type 'New_Valid_Document_Type' and validate the changes in review your information page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Review_Document_Infomation_Page'
    And I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @SaveForLaterWithoutSelectingDocumentDate @rsp-5261
  Scenario Outline: Verify the user is able to save for later without selecting document date in add document detail page
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
    When I click the 'Save_For_Later' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Mandatory                         |
      | Correction_Of_Typographical_Errors           | PNG_File              | Protocol_Clinical_Investigation_Plan             |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                |
      | GDPR_Wording                                 | PNG_File              | Consent_form                                     |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants |
      | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Interviews_Or_Focus_Group_Topic_Guides           |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Questionnaire_Non_Validated                      |

  @rsp-3889 @AddDetailsToUploadedDocumentsIncompleteStatus @KNOWN-DEFECT-RSP-5091
  Scenario Outline: Verify the user is able to enter details for uploaded documents with incomplete status and review your information page
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3889 @rsp-5280 @AddDetailsToUploadedDocumentsCompletedStatus @KNOWN-DEFECT-RSP-5091_5747 @fail
  Scenario Outline: Verify the user is able to enter details for uploaded documents with completed status and review your information page
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    And I click on the document link with status 'Document_Status_Complete' and enter 'New_Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'New_Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3889 @SaveAndContinueAfterMakingChanges @KNOWN-DEFECT-RSP-5091
  Scenario Outline: Verify the user is able to change and save the updated document details after reaching the review your information page
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I click on the document type change link next to each document and enter new 'New_Valid_Document_Type' in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the document version change link next to each document and enter new 'New_Valid_Document_Version' in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the document date change link next to each document and enter new 'New_Valid_Document_Date' and validate if 'New_Full_Valid_Document_Date' is displayed in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the document previously approved option change link next to each document and enter new 'New_Valid_Document_Previously_Approved_Value' in the add document details for the uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3889 @SaveAndContinueWithoutMakingChanges @KNOWN-DEFECT-RSP-5091
  Scenario Outline: Verify the user is able to save without changing and document details are retained after reaching the review your information page
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    And I click on the 'document_type' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the 'document_version' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the 'document_date' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
    And I capture the page screenshot
    And I click on the 'previously_approved' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-4314 @ValidateDocumentTypeDropDownList @ValidateNonRECStudyTypeOptionalDocumentVersionDate
  Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are optional, for documents uploaded with an Incomplete status, and review the entered information
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    And I select document type '<Document_Types_Optional>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    And I enter document details for the uploaded documents using '<Document_Details_Info_Optional>' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Optional                                                                                       | Version_Date | Document_Details_Info_Optional          |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Evidence_Of_Insurance_Or_Indemnity                                                                            | optional     | Valid_Data_Fields_Optional_Version_Date |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Facing_Material_Other                                                                             | optional     | Valid_Data_Fields_Optional_Version_Date |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Validated                                                                                       | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Curriculum_Vitae_CV_Suitability_Of_Researcher                                                                 | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Student_Research_Criteria_Eligibility_Declaration                                                             | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Dear_Investigator_Letter                                                                                      | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Funder_Letters_Outcome_Of_Funding_Panel                                                                       | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Statisticians_Letter                                                                                          | optional     | Valid_Data_Fields_Optional_Version_Date |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Referees_Or_Other_Scientific_Critique_Report                                                                  | optional     | Valid_Data_Fields_Optional_Version_Date |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Sponsor_Site_Agreement                                                                                        | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Schedule_Of_Events_Or_Schedule_Of_Events_Cost_Attribution_Template_SoECAT                                     | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Data_Flow_Diagram_Or_Documents_Demonstrating_Conformity_With_Data_Protection_And_Confidentiality_Requirements | optional     | Valid_Data_Fields_Optional_Version_Date |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Miscellaneous                                                                                                 | optional     | Valid_Data_Fields_Optional_Version_Date |

  @rsp-4314 @ValidateDocumentTypeDropDownList @ValidateNonRECStudyTypeMandatoryDocumentVersionDate
  Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are mandatory, for documents uploaded with an Incomplete status, and review the entered information
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
    And I capture the page screenshot
    And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
    And I capture the page screenshot
    And I enter document details for the uploaded documents using 'Valid_Data_Fields_Mandatory_Version_Date' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    |
      | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    |
      | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    |
      | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    |
      | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    |
      | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    |
      | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    |
      | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    |

  @rsp-3876 @ValidateUploadDocumentsModificationsPageLabels @KNOWN_DEFECT_RSP-4801
  Scenario Outline: Validate the ui labels displayed for upload documents pages in modifications
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
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the ui labels for add documents modifications page
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-3876 @ValidateBackLinkRetainDocumentsInReviewUploadedDocumentPage @KNOWN_DEFECT_RSP-4801
  Scenario Outline: Validate the user is able to see the previously uploaded documents in eview uploaded documents page after navigating away using back link
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
    Then I upload 'PNG_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded 'PNG_File' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    And I click the 'Back' link on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload 'GIF_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded 'PNG_File' documents are listed along with size and delete option in the review uploaded documents page
    And I validate the uploaded 'GIF_File' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-3888 @DeleteAllDocumentsModification
  Scenario Outline: Validate the user is able to delete all documents after uploading
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
    And I capture the page screenshot
    And I click the 'Delete_All' link on the 'Documents_Added_For_Change_Page'
    Then I can see the delete multiple documents confirmation page
    And I capture the page screenshot
    And I click the 'Delete_Documents' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3888 @DeleteDocumentsOneByOneInModification
  Scenario Outline: Validate the user is able to delete documents one by one from documents added for page
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
    And I delete the documents one by one from the documents added page of '<Specific_Change>' modifications in reference to the uploaded '<Document_Upload_Files>' documents
    And I capture the page screenshot
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3888 @DeleteDocumentsOneByOneFromAddDocumentDetailsModification
  Scenario Outline: Validate the user is able to delete documents from add document details page
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
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and delete the uploaded document in the add document details for specific document page
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-4980 @ContactDetailsModificationChangeLinks
  Scenario Outline: Validate that user can update the saved contact details modification by clicking change links in review changes page
    Then I fill the research locations page with '<Research_Locations>'
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
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the contact details modifications page with '<Changes>' for 'create' action
    And I keep note of the individual and overall ranking of contact details change created using '<Changes>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    Then I validate overall modification ranking
    Then I validate the review modifications page for contact details using '<Changes>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot
    And I fill the contact details modifications page with '<Changes_Edited>' for 'change' action
    And I keep note of the individual and overall ranking of contact details change created using '<Changes_Edited>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Changes' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate the review modifications page for contact details using '<Changes_Edited>' dataset
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page

    Examples:
      | Research_Locations  | Changes                                       | Change_Field             | Changes_Edited                                    | Page                                    |
      | Nhs_Involvement_Yes | Contact_Details_Chief_Investigator_Valid_Data | Select_Details_To_Change | Change_Contact_Detail_To_Sponsor_Contact_Email    | Contact_Details_Select_Change_Page      |
      | Nhs_Involvement_Yes | Contact_Details_Sponsor_Contact_Valid_Data    | Select_Details_To_Change | Change_Contact_Detail_To_Other_Contact_Name_Email | Contact_Details_Select_Change_Page      |
      | Nhs_Involvement_Yes | Contact_Details_Chief_Investigator_Valid_Data | Chief_Investigator_Email | Chief_Investigator_Email_Change                   | Contact_Details_Chief_Investigator_Page |
      | Nhs_Involvement_Yes | Contact_Details_Sponsor_Contact_Valid_Data    | Sponsor_Contact_Email    | Sponsor_Contact_Email_Change                      | Contact_Details_Sponsor_Contact_Page    |
      | Nhs_Involvement_Yes | Contact_Details_Other_Valid_Data              | Name_Text                | Contact_Name_Change                               | Contact_Details_Other_Page              |
      | Nhs_Involvement_Yes | Contact_Details_Other_Valid_Data              | Email_Text               | Contact_Email_Change                              | Contact_Details_Other_Page              |

  @rsp-4980 @ContactDetailsModificationsLabelsAndSaveForLater
  Scenario: Verify that save for later functionalities and page labels for contact details modifications journey
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I capture the page screenshot
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Chief_Investigator_Valid_Data' for 'create' action
    And I can see the 'Contact_Details_Chief_Investigator_Page' page for modifications
    And I can see the current chief investigator email details displayed on modifications page using 'Valid_Data_All_Fields' dataset
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Sponsor_Contact_Valid_Data' for 'create' action
    And I can see the 'Contact_Details_Sponsor_Contact_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Other_Valid_Data' for 'create' action
    And I can see the 'Contact_Details_Other_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_For_The_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Other_Valid_Data' for 'create' action
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

  @rsp-4980 @ValidateEnterLinksOnReviewAnswersPageContactDetails
  Scenario Outline: Validate the enter links on review your answers page for contact details modifications
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
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I click enter link displayed on review your answers page for contact details modification for '<Enter_Link>'
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot

    Examples:
      | Modification_Data                     | Enter_Link               | Page                                    |
      | Empty_Data_Select_Contact_All_Fields  | Select_Details_To_Change | Contact_Details_Select_Change_Page      |
      | Empty_Data_CI_Fields                  | Chief_Investigator       | Contact_Details_Chief_Investigator_Page |
      | Empty_Data_Sponsor_Contact_All_Fields | Sponsor_Contact          | Contact_Details_Sponsor_Contact_Page    |
      | Empty_Data_Other_Contact_All_Fields   | Other_Contact_Name       | Contact_Details_Other_Page              |
      | Empty_Data_Other_Contact_All_Fields   | Other_Contact_Email      | Contact_Details_Other_Page              |

  @rsp-4982 @ProjectPersonnelChangeChiefInvestigatorModificationChangeLinks
  Scenario Outline: Validate that user can update the saved chief investigator modification by clicking change links in review changes page
    Then I fill the research locations page with '<Research_Locations>'
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
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the change chief investigator modifications page with '<Changes>' for 'create' action
    And I keep note of the individual and overall ranking of change chief investigator change created using '<Changes>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    Then I validate overall modification ranking
    Then I validate the review modifications page for change chief investigator modification using '<Changes>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot
    And I fill the change chief investigator modifications page with '<Changes_Edited>' for 'change' action
    And I keep note of the individual and overall ranking of change chief investigator change created using '<Changes_Edited>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Changes' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate the review modifications page for change chief investigator modification using '<Changes_Edited>' dataset
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page

    Examples:
      | Research_Locations  | Changes                                                               | Change_Field             | Changes_Edited                                             | Page                                         |
      | Nhs_Involvement_Yes | Project_Personnel_Chief_Investigator_New_Valid_Data                   | Select_Details_To_Change | Change_CI_New_To_Temporary_Arrangement_Details             | Project_Personnel_Select_Change_Page         |
      | Nhs_Involvement_Yes | Project_Personnel_Chief_Investigator_New_Valid_Data                   | Chief_Investigator_Email | Chief_Investigator_New_Email_Name_Change                   | Project_Personnel_Chief_Investigator_Page    |
      | Nhs_Involvement_Yes | Project_Personnel_Chief_Investigator_New_Valid_Data                   | Name_Text                | Chief_Investigator_New_Email_Name_Change                   | Project_Personnel_Chief_Investigator_Page    |
      | Nhs_Involvement_Yes | Project_Personnel_Chief_Investigator_Temporary_Arrangement_Valid_Data | Chief_Investigator_Email | Chief_Investigator_Temporary_Arrangement_Email_Name_Change | Project_Personnel_Temporary_Arrangement_Page |
      | Nhs_Involvement_Yes | Project_Personnel_Chief_Investigator_Temporary_Arrangement_Valid_Data | Name_Text                | Chief_Investigator_Temporary_Arrangement_Email_Name_Change | Project_Personnel_Temporary_Arrangement_Page |

  @rsp-4982 @ProjectPersonnelChangeChiefInvestigatorModificationsLabelsAndSaveForLater
  Scenario: Verify that save for later functionalities and page labels for project personnel change chief investigator modifications journey
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Select_Change_Page' page for modifications
    And I capture the page screenshot
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Select_Change_Page' page for modifications
    And I fill the change chief investigator modifications page with 'Project_Personnel_Chief_Investigator_New_Valid_Data' for 'create' action
    And I can see the 'Project_Personnel_Chief_Investigator_Page' page for modifications
    And I can see the current chief investigator email details displayed on modifications page using 'Valid_Data_All_Fields' dataset
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Select_Change_Page' page for modifications
    And I fill the change chief investigator modifications page with 'Project_Personnel_Chief_Investigator_Temporary_Arrangement_Valid_Data' for 'create' action
    And I can see the 'Project_Personnel_Temporary_Arrangement_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Select_Change_Page' page for modifications
    And I fill the change chief investigator modifications page with 'Project_Personnel_Chief_Investigator_Temporary_Arrangement_Valid_Data' for 'create' action
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

  @rsp-4982 @ValidateEnterLinksOnReviewAnswersPageProjectPersonnelChangeChiefInvestigator
  Scenario Outline: Validate the enter links on review your answers page for project personnel new chief investigator modifications
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
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I click enter link displayed on review your answers page for change chief investigator modification for '<Enter_Link>'
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot

    Examples:
      | Modification_Data                              | Enter_Link               | Page                                         |
      | Empty_Data_Select_Details_To_Change_All_Fields | Select_Details_To_Change | Project_Personnel_Select_Change_Page         |
      | Empty_Data_CI_Fields                           | Chief_Investigator       | Project_Personnel_Chief_Investigator_Page    |
      | Empty_Data_CI_Fields                           | Name_Text                | Project_Personnel_Chief_Investigator_Page    |
      | Empty_Data_Temporary_Arrangement_All_Fields    | Chief_Investigator       | Project_Personnel_Temporary_Arrangement_Page |
      | Empty_Data_Temporary_Arrangement_All_Fields    | Name_Text                | Project_Personnel_Temporary_Arrangement_Page |

  @rsp-4982 @ProjectPersonnelChangePrincipalInvestigatorModificationChangeLinks
  Scenario Outline: Validate that user can update the saved principal investigator modification by clicking change links in review changes page
    Then I fill the research locations page with '<Research_Locations>'
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
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the change principal investigator modifications page with '<Changes>' for 'create' action
    And I keep note of the individual and overall ranking of change principal investigator change created using '<Changes>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    Then I validate overall modification ranking
    Then I validate the review modifications page for change principal investigator modification using '<Changes>' dataset
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page
    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot
    And I fill the change principal investigator modifications page with '<Changes_Edited>' for 'change' action
    And I keep note of the individual and overall ranking of change principal investigator change created using '<Changes_Edited>' and '<Research_Locations>' dataset
    And I capture the page screenshot
    And I click the 'Save_Changes' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate the review modifications page for change principal investigator modification using '<Changes_Edited>' dataset
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot
    Then I validate overall modification ranking
    Then I validate individual ranking for single card displayed in modifications page

    Examples:
      | Research_Locations  | Changes                                                                   | Change_Field                 | Changes_Edited                                                 | Page                                                               |
      | Nhs_Involvement_Yes | Project_Personnel_Principal_Investigator_New_Valid_Data                   | Select_Details_To_Change     | Change_CI_New_To_Temporary_Arrangement_Details                 | Project_Personnel_Principal_Investigator_Select_Change_Page        |
      | Nhs_Involvement_Yes | Project_Personnel_Principal_Investigator_New_Valid_Data                   | Principal_Investigator_Email | Principal_Investigator_New_Email_Name_Change                   | Project_Personnel_Principal_Investigator_Page                      |
      | Nhs_Involvement_Yes | Project_Personnel_Principal_Investigator_New_Valid_Data                   | Name_Text                    | Principal_Investigator_New_Email_Name_Change                   | Project_Personnel_Principal_Investigator_Page                      |
      | Nhs_Involvement_Yes | Project_Personnel_Principal_Investigator_Temporary_Arrangement_Valid_Data | Principal_Investigator_Email | Principal_Investigator_Temporary_Arrangement_Email_Name_Change | Project_Personnel_Pricipal_Investigator_Temporary_Arrangement_Page |
      | Nhs_Involvement_Yes | Project_Personnel_Principal_Investigator_Temporary_Arrangement_Valid_Data | Name_Text                    | Principal_Investigator_Temporary_Arrangement_Email_Name_Change | Project_Personnel_Pricipal_Investigator_Temporary_Arrangement_Page |

  @rsp-4982 @ProjectPersonnelChangePrincipalInvestigatorModificationsLabelsAndSaveForLater
  Scenario: Verify that save for later functionalities and page labels for project personnel change principal investigator modifications journey
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Principal_Investigator_Select_Change_Page' page for modifications
    And I capture the page screenshot
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Principal_Investigator_Select_Change_Page' page for modifications
    And I fill the change principal investigator modifications page with 'Project_Personnel_Principal_Investigator_New_Valid_Data' for 'create' action
    And I can see the 'Project_Personnel_Principal_Investigator_Page' page for modifications
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Principal_Investigator_Select_Change_Page' page for modifications
    And I fill the change principal investigator modifications page with 'Project_Personnel_Principal_Investigator_Temporary_Arrangement_Valid_Data' for 'create' action
    And I can see the 'Project_Personnel_Pricipal_Investigator_Temporary_Arrangement_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Principal_Investigator_Select_Change_Page' page for modifications
    And I fill the change principal investigator modifications page with 'Project_Personnel_Principal_Investigator_Temporary_Arrangement_Valid_Data' for 'create' action
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

  @rsp-4982 @ValidateEnterLinksOnReviewAnswersPageProjectPersonnelChangePrincipalInvestigator
  Scenario Outline: Validate the enter links on review your answers page for project personnel new principal investigator modifications
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
    And I can see the modification review changes page
    And I capture the page screenshot
    Then I click enter link displayed on review your answers page for change principal investigator modification for '<Enter_Link>'
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot

    Examples:
      | Modification_Data                              | Enter_Link                   | Page                                                               |
      | Empty_Data_Select_Details_To_Change_All_Fields | Select_Details_To_Change     | Project_Personnel_Principal_Investigator_Select_Change_Page        |
      | Empty_Data_CI_Fields                           | Principal_Investigator_Email | Project_Personnel_Principal_Investigator_Page                      |
      | Empty_Data_CI_Fields                           | Name_Text                    | Project_Personnel_Principal_Investigator_Page                      |
      | Empty_Data_Temporary_Arrangement_All_Fields    | Principal_Investigator_Email | Project_Personnel_Pricipal_Investigator_Temporary_Arrangement_Page |
      | Empty_Data_Temporary_Arrangement_All_Fields    | Name_Text                    | Project_Personnel_Pricipal_Investigator_Temporary_Arrangement_Page |

  @rsp-3929 @DownloadDocumentsOneByOneInModification
  Scenario Outline: Validate the user is able to download the documents one by one from documents added for page
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
    And I download the documents one by one from the documents added page of specific change modifications in reference to the uploaded '<Document_Upload_Files>' documents
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3929 @DownloadDocumentFromAddDocumentDetailsModification
  Scenario Outline: Validate the user is able to download the documents from add document details page
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload 'PNG_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and download the uploaded document in the add document details for specific document page
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
