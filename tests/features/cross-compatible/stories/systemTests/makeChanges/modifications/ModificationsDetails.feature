@ApplicantUser @ModificationDetails @SystemTest @jsEnabled
Feature: Create Amendment - Modification Details

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
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page

  @rsp-4271 @ModificationsDetailsSaveAndContinue
  Scenario Outline: Validate that user can create modifications and navigate to add sponsor reference page
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
