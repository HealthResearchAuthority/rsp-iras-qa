@ApplicantUser @ChangePlannedEndDateModificationRegression @jsEnabled
Feature: Create Modifications - Change to planned end date regression

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'

  @ChangePlannedEndDateRegression @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system retains the data on all modifications pages when user navigates back from review changes page
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

  @ModifyPlannedEndDateFromReviewChangesPageRegression @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that user can change the planned end date from review modifications page
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

    Examples:
      | Change_Field         | Planned_End_Date      | Planned_End_Date_Change      | Organisation_Change_Affect | Affected_Org_Questions |
      | New_Planned_End_Date | Valid_Data_All_Fields | Valid_Data_All_Fields_Change | Valid_Data_All_Fields      | Valid_Data_All_Fields  |

  @ModifyAffectedOrgQuestionsFromReviewChangesPageRegression @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that user can change all affected organisation questions from review modifications page
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
    When I click the change link '<Change_Field>' on modification review changes page
    Then I can see the change planned end date affected organisation questions page
    And I capture the page screenshot
    And I fill the affected organisation questions page with '<Affected_Org_Questions_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    And I capture the page screenshot

    Examples:
      | Change_Field                     | Planned_End_Date      | Organisation_Change_Affect | Affected_Org_Questions            | Affected_Org_Questions_Change     |
      | Affected_Nhs_Hsc_Locations       | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_All_Fields             | Valid_Data_Optional_Fields        |
      | Affected_Nhs_Hsc_Locations       | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_Optional_Fields        | Valid_Data_All_Fields             |
      | Portion_Of_Nhs_Hsc_Organisations | Valid_Data_All_Fields | NHS_HSC_Only               | Valid_Data_All_Fields             | Valid_Data_Optional_Fields        |
      | Additional_Resource_Implications | Valid_Data_All_Fields | Valid_Data_All_Fields      | Valid_Data_Optional_Fields        | Valid_Data_All_Fields             |
      | Affected_Non_Nhs_Hsc_Locations   | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_All_Country    | Valid_Data_Non_Nhs_Single_Country |
      | Affected_Non_Nhs_Hsc_Locations   | Valid_Data_All_Fields | Non_NHS_HSC_Only           | Valid_Data_Non_Nhs_Single_Country | Valid_Data_Non_Nhs_All_Country    |

  @ChangePlannedEndDateValidationsFromReviewChangesPageRegression @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system prevents the user to enter invalid date when modifications details updated from review changes page
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

  @TodayDateErrorValidationsFromReviewChangesPageRegression @KNOWN-DEFECT-RSP-4795
  Scenario Outline: Verify that system prevents the user to enter invalid today date when modifications details updated from review changes page
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
