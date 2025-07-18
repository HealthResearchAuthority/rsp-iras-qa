@FrontStageUser @CreateModificationRegression @Regression
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
    Then I can see the project overview page

  @SelectAreaOfChangeRegression
  Scenario Outline: Verify that user can create modifications to change the participating organisations
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I validate the field values with '<Project_Details_Title>' on select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Participating_Organisations_Page'
    # Then I can see the select area of change page
    Then I can see previously saved values for '<Area_Of_Change>' and '<Specific_Change>' displayed on select area of change page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot

    Examples:
      | Area_Of_Change                    | Specific_Change                                            | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change | Research_Locations    | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation_Option | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |

  @SelectAreaOfChangeSaveLaterRegression
  Scenario Outline: Verify that user can save the modifications progress on select area of change page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Area_Of_Change                    | Specific_Change                                            | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change | Research_Locations    | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation_Option | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Invalid_Data_Area_Of_Change_Empty | Invalid_Data_Specific_Change_Empty                         | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |

  @SelectAreaOfChangeErrorValidationRegression
  Scenario Outline: Validate the mandatory field error message on select area of change page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Select_Area_Of_Change_Page'

    Examples:
      | Field_And_Summary_Error_Message         | Area_Of_Change                    | Specific_Change                    | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change | Research_Locations    | Navigation_Link | Modifications_Tile_Link |
      | Missing_All_Mandatory_Fields            | Invalid_Data_Area_Of_Change_Empty | Invalid_Data_Specific_Change_Empty | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Missing_Mandatory_Field_Specific_Change | Participating_Organisation_Option | Invalid_Data_Specific_Change_Empty | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |

  @ParticipatingOrganisationsRegression
  Scenario Outline: Verify that user can create modifications and validate the field values in search participating organisations page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
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
      | Area_Of_Change                    | Specific_Change                                            | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change | Research_Locations    | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation_Option | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |


  @ParticipatingOrganisationSaveLaterRegression
  Scenario Outline: Verify that user can save the modifications progress on search participating organisations page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
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
      | Area_Of_Change                    | Specific_Change                                            | Project_Details_Title | Key_Project_Roles     | Key_Project_Roles_Change | Research_Locations    | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation_Option | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation_Option | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields    | Valid_Data_All_Fields | Back            | Modifications_Tile      |
