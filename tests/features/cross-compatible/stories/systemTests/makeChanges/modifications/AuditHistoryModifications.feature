@ApplicantUser @createModifications @SystemTest @jsEnabled
Feature: Create Modification- This feature file help an applicant to complete the modification journey and can sent to sponsor

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

  @rsp-5268 @LogTheModificationCreatedEventinAuditHistoryPage @testOnly
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    And I validate the project information labels using dataset displayed on modifications page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'available' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'available' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'available' on the review all changes page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    Then I can see the project overview page
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    And I capture the page screenshot
    # And I click the 'History' tab on the 'Modification_Post_Submission_Page'
    # Then I can see the audit history page of the selected modification
    # And I capture the page screenshot
    # And I can see the audit history for the modification 'created' event with date and user details
    # And I can see the audit history for the modification 'Modification sent to sponsor' event with date and user details

    Examples:
      | Changes                           | Research_Locations  |
      | Multiple_Changes_Planned_End_Date | Nhs_Involvement_Yes |

