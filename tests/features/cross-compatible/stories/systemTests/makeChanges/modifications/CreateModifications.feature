@ApplicantUser @createModifications @SystemTest @jsEnabled
Feature: Create Amendment - Create Modifications

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
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

  @rsp-4039 @ParticipatingOrganisationSaveLater
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
    And I click the 'Save_For_Later' button on the 'Participating_Organisations_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_Sites_Option                                   | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      |
      | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      |

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

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @ReturnToProjectOverviewFromModificationSentToSponsorConfirmation @KNOWN_DEFECT_RSP-5184 @KNOWN_DEFECT_RSP-5317
  Scenario Outline: Validate that user can create modifications and complete the entire modifications journey till send modification to sponsor confirmation page and return to project overview page from there
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
    # And I keep note of the individual and overall ranking of changes created using '<Changes>'
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'available' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'available' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'available' on the review all changes page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    # work around due to @KNOWN_DEFECT_RSP-5317
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    #And I can see post approval tab of project overview page
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Send_Modification_To_Sponsor' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Save_For_Later' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'unavailable' on the review all changes page

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @SaveForLaterFromReviewAllChangesPage @KNOWN_DEFECT_RSP-5324 @KNOWN_DEFECT_RSP-5184 @KNOWN_DEFECT_RSP-5317
  Scenario Outline: Validate that user can create modifications and complete the entire modifications journey till review all changes page and save for later from there
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
    # And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    #And I can see post approval tab of project overview page
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'Draft'

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @ModifyCurrentChangesInReviewAllChangesPage @KNOWN_DEFECT_RSP-5184 @KNOWN_DEFECT_RSP-5317
  Scenario Outline: Validate that user can create modification with multiple changes and modify current changes in review all changes page by clicking change link link from there
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
    # And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I modify the current changes with '<New_Changes>' for the created modification
    And I capture the page screenshot
    # And I keep note of the individual and overall ranking of changes created using '<New_Changes>'
    Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<New_Changes>'
    # And I validate the individual ranking of changes displayed for '<New_Changes>'
    And I validate the change details are displayed as per the '<New_Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I modify the current sponsor details with 'Valid_Data_All_Fields_Changes' for the created modification
    And I capture the page screenshot
    # And I keep note of the individual and overall ranking of changes created using '<New_Changes>'
    Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields_Changes'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    # work around due to @KNOWN_DEFECT_RSP-5317
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    #And I can see post approval tab of project overview page
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Send_Modification_To_Sponsor' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Save_For_Later' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'unavailable' on the review all changes page

    Examples:
      | Changes                           | New_Changes                              |
      | Multiple_Changes_Planned_End_Date | Multiple_Changes_Planned_End_Date_Change |

  # Multiple_Changes_Planned_End_Date + project documents+particpant organisation
  # back link navigation from Review_All_Changes_Page and confimation page for modification sent to sponsor page-

  # And I can see the modification review changes page
  # Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
  # When I click the change link '<Change_Field>' on modification review changes page
  # Then I can see the 'Planned_End_Date' page for modifications

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

  @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeText @KNOWN_DEFECT_RSP_5495_5496
  Scenario Outline: Validate that user can create modifications to add free text for reviewable and non reviewable modifications
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
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    # work around due to @KNOWN_DEFECT_RSP-5317
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes page
    And I capture the page screenshot

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Nhs_Involvement_Yes |
      | Other_Minor_Change_To_Project_Management                           | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One             | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One             | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two             | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two             | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability   | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability   | Nhs_Involvement_No  |
      | Change_Of_Sponsor_legal_Representative                             | Nhs_Involvement_Yes |
      | Changes_To_The_Research_Team                                       | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_No  |

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
