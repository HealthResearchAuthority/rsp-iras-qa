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

  @rsp-4386 @4389 @4391 @ModificationsJourneyEntireJourney @ReturnToProjectOverviewFromModificationSentToSponsorConfirmation @KNOWN_DEFECT_RSP-5184
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
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Send_Modification_To_Sponsor' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Save_For_Later' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'unavailable' on the review all changes page
    And I validate the individual and overall ranking of changes on the relevant modification page

    Examples:
      | Changes                           | Research_Locations  |
      | Multiple_Changes_Planned_End_Date | Nhs_Involvement_Yes |

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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I capture the page screenshot
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
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'Draft'

    Examples:
      | Changes                           | Research_Locations  |
      | Multiple_Changes_Planned_End_Date | Nhs_Involvement_Yes |

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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I capture the page screenshot
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
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I keep note of the individual and overall ranking of changes created using '<New_Changes>' and '<Research_Locations>' dataset
    And I modify the current changes with '<New_Changes>' for the created modification
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the change details are displayed as per the '<New_Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I modify the current sponsor details with 'Valid_Data_All_Fields_Changes' for the created modification
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And I validate the project information labels using dataset displayed on modifications page
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields_Changes'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    And I capture the page screenshot
    Then I can see the review all changes modifications page
    And the 'Change' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Delete_Modification' link should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Send_Modification_To_Sponsor' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the 'Save_For_Later' button should be 'unavailable' on the 'Review_All_Changes_Page'
    And the now sent to sponsor heading and hint text should be 'unavailable' on the review all changes page
    And I validate the individual and overall ranking of changes on the relevant modification page

    Examples:
      | Changes                           | New_Changes                              | Research_Locations  |
      | Multiple_Changes_Planned_End_Date | Multiple_Changes_Planned_End_Date_Change | Nhs_Involvement_Yes |

  @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @rsp-5204 @rsp-4088 @rsp-5479 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextReviewable @KNOWN_DEFECT_RSP_5495_5496_5408_5408
  Scenario Outline: Validate that user can create and submit reviewable modifications
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
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate all fields on modification page '<Changes>'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset

    Examples:
      | Changes                                                          | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One               | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One               | Nhs_Involvement_No  |
      | Other_Minor_Change_To_Project_Management                         | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two               | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two               | Nhs_Involvement_No  |
      | Multiple_Changes_Reviewable_Set_Three                            | Nhs_Involvement_Yes |
      | Multiple_Changes_Reviewable_Set_Three                            | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four | Nhs_Involvement_No  |

  @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @rsp-4094 @rsp-4095 @rsp-4980 @rsp-4982 @rsp-5588 @rsp-5479 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextNonReviewable @KNOWN_DEFECT_RSP_5495_5496_5747
  Scenario Outline: Validate that user can create and submit non reviewable modifications
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
    And I validate the project information labels using dataset displayed on modifications page
    Then I validate all fields on modification page '<Changes>'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
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
    And I validate the change details are displayed as per the '<Changes>' dataset

    Examples:
      | Changes                                                           | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One            | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One            | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two            | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two            | Nhs_Involvement_No  |
      | Multiple_Changes_Non_Reviewable_Set_One                           | Nhs_Involvement_Yes |
      | Multiple_Changes_Non_Reviewable_Set_One                           | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability  | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability  | Nhs_Involvement_No  |
      | Change_Of_Sponsor_legal_Representative                            | Nhs_Involvement_Yes |
      | Modification_To_Add_Administrative_Details                        | Nhs_Involvement_Yes |
      | Modification_To_Add_Administrative_Details                        | Nhs_Involvement_No  |
      | Multiple_Changes_Non_Reviewable_Set_Two                           | Nhs_Involvement_Yes |
      | Multiple_Changes_Non_Reviewable_Set_Two                           | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Three | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Three | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Four  | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Four  | Nhs_Involvement_No  |

  @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextCombined @KNOWN_DEFECT_RSP_5495_5496
  Scenario Outline: Validate that user can create modifications for reviewable and non reviewable modifications
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
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate all fields on modification page '<Changes>'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_No  |

  @rsp-4392 @VerifyUserAbleToDeleteTheModificationDetails
  Scenario Outline: Verify user is able to delete the modification details
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I create '<Changes>' for the created modification
    And I capture the page screenshot
    And I click the 'Delete_Modification' link on the 'Modification_Details_Page'
    And I validate the project information labels using dataset displayed on modifications page
    And I validate all field values on delete modification confirmation screen
    And I capture the page screenshot
    And I click the 'Delete_Modification' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate the delete modification success message
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate the deleted modification does not appear in the modification in the post approval tab

    Examples:
      | Changes                           |
      | Multiple_Changes_Planned_End_Date |