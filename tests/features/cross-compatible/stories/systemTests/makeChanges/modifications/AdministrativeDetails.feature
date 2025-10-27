@ApplicantUser @createModificationsAdministrativeDetails @SystemTest @jsEnabled
Feature: Create Amendment - Create Modifications for administrative details for the project

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
    And  I fill the project identification enter reference modification page using '<Valid_Data_Change>' dataset
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
    When I click the 'Save_For_Later' button on the 'Project_Identification_Enter_Reference_Numbers_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |


  @rsp-4094 @rsp-4095 @ModificationsErrorValidationForInvalidReferenceNumbersAndProjectTitles
  Scenario Outline: Validate error message for invalid reference numbers and project titles on project identification enter reference and title page
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
      | Modification_To_Add_Administrative_Details_Invalid_Data_Titles            | Field_Summary_Error_Message_Invalid_Project_Titles    | Administrative_Details_For_The_Project | Project_Identification |
