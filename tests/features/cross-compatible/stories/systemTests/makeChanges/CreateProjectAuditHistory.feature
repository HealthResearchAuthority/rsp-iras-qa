@SystemTest @jsEnabled @SystemTestFrontStage
Feature: Create project - Audit history

  @rsp-5259 @AuditHistoryDraftProject @ApplicantUser
  Scenario: Verify that user can see the audit history for draft project on project overview history tab
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I capture the current time for 'Project_Identifier_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I capture the current time for 'Review_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the audit history for 'draft project' on project overview history tab

  @rsp-5259 @AuditHistoryCreateProject @ApplicantUser
  Scenario: Verify that user can see the audit history for the project creation successful on project overview history tab
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I capture the current time for 'Project_Identifier_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I capture the current time for 'Review_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the audit history for 'project creation' on project overview history tab

  @rsp-5259 @ViewProjectHistoryBackStageUsers @SponsorUser @WorkFlowCoordinator @StudyWideReviewer @SysAdminUser @TeamManager @ApplicantUser @SetupNewSponsorOrgGoLive
  Scenario Outline: Verify that backstage users can see the audit history on project overview history tab
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I capture the current time for 'Project_Identifier_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I capture the current time for 'Review_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as '<User>'
    And I have navigated to the 'Search_Modifications_Page'
    And I capture the page screenshot
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    And I capture the page screenshot
    When I click a 'short project title' on the 'Search_Modifications_Page'
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the audit history for 'draft project' on project overview history tab
    Then I can see the audit history for 'project creation' on project overview history tab

    Examples:
      | User                 | Changes                                | Research_Locations            |
      | Workflow_Coordinator | Modification_Reviewable_Single_Dataset | Data_With_Lead_Nation_England |
      | Studywide_Reviewer   | Modification_Reviewable_Single_Dataset | Data_With_Lead_Nation_England |
      | System_Admin         | Modification_Reviewable_Single_Dataset | Data_With_Lead_Nation_England |
      | Team_Manager         | Modification_Reviewable_Single_Dataset | Data_With_Lead_Nation_England |


  @FieldsModificationReflectInProjectRecordAuditHistoryChiefInvFields @rsp-6462 @SetupNewSponsorOrgGoLive @SponsorUser
  Scenario Outline: Verify the audit history for chief investigator fields updated through modifications.
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on 'Sponsor_Authoriser_Yes'
    When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'University of Southampton' and 'Sponsor_Authoriser_Yes'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I keep note of the 'Project_Record_Draft_Started' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I keep note of the 'Project_Record_Created' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Chief_Investigator_First_Name_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I keep note of the 'Chief_Investigator_Last_Name_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I keep note of the 'Chief_Investigator_Email_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the project level audit history table

    Examples:
      | Changes                                              | Research_Locations            | Study_Wide_Reviewer             | Workflow_User        | Reviewer_User      | Outcome  | Outcome_Reason | Outcome_Status               | Project_Name |
      | Project_Personnel__Change_Chief_Investigator_Details | Data_With_Lead_Nation_England | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator | Studywide_Reviewer | Approved | Blank          | Modification_Status_Approved |              |

  @FieldsModificationReflectInProjectRecordAuditHistoryProjectTitleFields @rsp-6462 @SetupNewSponsorOrgGoLive @SponsorUser
  Scenario Outline: Verify the audit history for project titles fields updated through modifications.
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on 'Sponsor_Authoriser_Yes'
    When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'University of Southampton' and 'Sponsor_Authoriser_Yes'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I keep note of the 'Project_Record_Draft_Started' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I keep note of the 'Project_Record_Created' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Short_Project_Title_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I keep note of the 'Full_Project_Title_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the project level audit history table

    Examples:
      | Changes                                                   | Research_Locations            | Study_Wide_Reviewer             | Workflow_User        | Reviewer_User      | Outcome  | Outcome_Reason | Outcome_Status               | Project_Name |
      | Modification_To_Add_Administrative_Details_Project_Titles | Data_With_Lead_Nation_England | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator | Studywide_Reviewer | Approved | Blank          | Modification_Status_Approved |              |

  @FieldsModificationReflectInProjectRecordAuditHistoryProjectEndDate @rsp-6462 @SetupNewSponsorOrgGoLive @SponsorUser
  Scenario Outline: Verify the audit history for project planned end date field updated through modifications.
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on 'Sponsor_Authoriser_Yes'
    When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'University of Southampton' and 'Sponsor_Authoriser_Yes'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I keep note of the 'Project_Record_Draft_Started' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I keep note of the 'Project_Record_Created' audit event actioned by the user 'Applicant_User' using the dataset '<Changes>'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Planned_Project_End_Date_Changed' audit event actioned by the user 'Sponsor_User' using the dataset '<Changes>'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_History' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the project level audit history table

    Examples:
      | Changes                                    | Research_Locations            | Study_Wide_Reviewer             | Workflow_User        | Reviewer_User      | Outcome  | Outcome_Reason | Outcome_Status               | Project_Name |
      | Planned_End_Date_NHS_All_Yes_All_Countries | Data_With_Lead_Nation_England | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator | Studywide_Reviewer | Approved | Blank          | Modification_Status_Approved |              |
