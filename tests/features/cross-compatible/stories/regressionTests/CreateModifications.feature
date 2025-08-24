@ApplicantUser @CreateModificationRegression @Regression @jsEnabled
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
    Then I can see the select area of change page
    Then I can see previously saved values for '<Area_Of_Change>' and '<Specific_Change>' displayed on select area of change page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Project_Details_Title | Navigation_Link | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Back            | Modifications_Tile      |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Back            | Modifications_Tile      |

  @SelectAreaOfChangeDropdownListValidationRegression
  Scenario Outline: Validate the specific change list values are displayed based on the area of change selection
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    Then I validate the specific change dropdown options are displayed based on the selected area of change dropdown with '<Dropdown_Options_To_Validate >'

    Examples:
      | Area_Of_Change             | Specific_Change | Dropdown_Options_To_Validate | Modifications_Tile_Link |
      | Participating_Organisation | Default_Value   | Participating_Organisation   | Modifications_Tile      |
      | Default_Value              | Default_Value   | Default_Value                | Modifications_Tile      |

  @SelectAreaOfChangeModificationIdValidationRegression
  Scenario Outline: Validate the modification id on select area of change page when user creates multiple new modifications
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    Then I validate the modification id is incremented by one for every '<New_Modification_Count>' new modification on select area of change page

    Examples:
      | New_Modification_Count | Modifications_Tile_Link |
      | Modification_Count     | Modifications_Tile      |

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
      | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Modifications_Tile      |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      |
      | Default_Value              | Default_Value                                              | Modifications_Tile      |

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
      | Field_And_Summary_Error_Message        | Area_Of_Change             | Specific_Change | Modifications_Tile_Link |
      | Missing_All_Mandatory_Fields           | Default_Value              | Default_Value   | Modifications_Tile      |
      | Missing_Mandatory_Only_Specific_Change | Participating_Organisation | Default_Value   | Modifications_Tile      |

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
      | Area_Of_Change             | Specific_Change                                            | Project_Details_Title | Modifications_Tile_Link |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Valid_Data_All_Fields | Modifications_Tile      |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Valid_Data_All_Fields | Modifications_Tile      |

  @ParticipatingOrganisationsErrorValidationRegression
  Scenario Outline: Validate the mandatory field error message on participating organisation page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Participating_Organisations_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Participating_Organisations_Page'

    Examples:
      | Field_And_Summary_Error_Message              | Area_Of_Change             | Specific_Change          | Modifications_Tile_Link |
      | Field_Error_participating_organisations_text | Participating_Organisation | Addition_Of_sites_Option | Modifications_Tile      |

  @ValidateDocumentUploadAndReviewForModificationsPageRegression
  Scenario Outline: Validate the user is able to upload and review documents for modifications
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
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Add_Document_Modifications_Page'
    Then I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files | Document_Upload_Files_New |
      | Correction_Of_Typographical_Errors | Multiple_Files        | Multiple_Files            |
