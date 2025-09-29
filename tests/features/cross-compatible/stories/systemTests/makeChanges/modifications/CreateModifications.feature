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
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the key project roles page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
     Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page

  @rsp-4038 @SelectAreaOfChange
  Scenario Outline: Verify that user can create modifications to change the participating organisations
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

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @ReturnToProjectOverviewFromModificationSentToSponsorConfirmation
  Scenario Outline: Validate that user can create modifications and complete the entire modifications journey till send modification to sponsor confirmation page and return to project overview page from there
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    And I keep note of the individual and overall ranking of changes created using '<Changes>'
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modifications_Details_Page'
    # Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    # Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    # Then I can see the confimation page for modification sent to sponsor page
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    Then I can see the project overview page
    And I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @SaveForLaterFromReviewAllChangesPage
  Scenario Outline: Validate that user can create modifications and complete the entire modifications journey till review all changes page and save for later from there
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    And I keep note of the individual and overall ranking of changes created using '<Changes>'
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modifications_Details_Page'
    # Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    # Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    And I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @ModifyCurrentChangesInReviewAllChangesPage
  Scenario Outline: Validate that user can create modification with multiple changes and modify current changes in review all changes page by clicking change link link from there
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    And I keep note of the individual and overall ranking of changes created using '<Changes>'
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modifications_Details_Page'
    # Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<Changes>'
    # And I validate the individual ranking of changes displayed for '<Changes>'
    # And I validate the field values are displayed as per the '<Changes>' dataset
    # Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I modify the current changes with '<New_Changes>' for the created modification
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using '<New_Changes>'
    # And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<New_Changes>'
    # And I validate the individual ranking of changes displayed for '<New_Changes>'
    # And I validate the field values are displayed as per the '<New_Changes>' dataset
    When I click the 'Save_Continue_Review' button on the 'Modifications_Details_Page'
    # Then I can see the add sponsor reference page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    # Then I can see the review all changes modifications page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    # And I validate the overall ranking of changes displayed for '<New_Changes>'
    # And I validate the individual ranking of changes displayed for '<New_Changes>'
    # And I validate the field values are displayed as per the '<New_Changes>' dataset
    # Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    # Then I can see the confimation page for modification sent to sponsor page
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    Then I can see the project overview page
    And I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'


    Examples:
      | Changes                           | New_Changes                              |
      | Multiple_Changes_Planned_End_Date | Multiple_Changes_Planned_End_Date_Change |

# Multiple_Changes_Planned_End_Date + project documents

# back link navigation from Review_All_Changes_Page and confimation page for modification sent to sponsor page
