@ApplicantUser @createModifications @ContactDetailsModifications @SystemTest @jsEnabled
Feature: Create Amendment - Contact Details Modifications

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
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
    And I fill the contact details modifications page with '<Changes>' for 'create' action
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    Then I validate the review modifications page for contact details using '<Changes>' dataset
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of contact details change created using '<Changes>' and '<Research_Locations>' dataset
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modifications details page
    And I capture the page screenshot

    Then I validate overall modification ranking
    # Then I validate individual ranking for single card displayed in modifications page
    Then I validate all fields on modification page '<Changes>'

    When I click the 'Change' link on the 'Modification_Details_Page'
    And I capture the page screenshot
    When I click the change link '<Change_Field>' on modification review changes page
    And I capture the page screenshot
    And I can see the '<Page>' page for modifications
    And I capture the page screenshot
    And I fill the contact details modifications page with '<Changes_Edited>' for 'change' action
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
    Then I validate all fields on modification page '<Changes>'

    Examples:
      | Research_Locations  | Changes                            | Change_Field                     | Changes_Edited                  | Page                                    |
      | Nhs_Involvement_Yes | Contact_Details_Chief_Investigator | Chief_Investigator_Email         | Chief_Investigator_Email_Change | Contact_Details_Chief_Investigator_Page |
      | Nhs_Involvement_Yes | Contact_Details_Chief_Investigator | Select_Contact_Details_To_Change |                                 | Contact_Details_Select_Change_Page      |

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
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
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
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Chief_Investigator_Valid_Data' for 'create' action
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I can see the 'Contact_Details_Chief_Investigator_Page' page for modifications
    And I can see the current chief investigator email details displayed on modifications page using 'Valid_Data_All_Fields' dataset
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Sponsor_Contact_Valid_Data' for 'create' action
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I can see the 'Contact_Details_Sponsor_Contact_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Other_Valid_Data' for 'create' action
    Then I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I can see the 'Contact_Details_Other_Page' page for modifications
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    And I fill the contact details modifications page with 'Contact_Details_Other_Valid_Data' for 'create' action
    And I click the 'Save_Continue' button on the 'Modifications_Page'
    And I can see the modification review changes page
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Modifications_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

  @rsp-4980 @ValidateSummaryAndFieldErrorMessagesContactDetailsModification
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
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
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
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    And I capture the page screenshot
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
