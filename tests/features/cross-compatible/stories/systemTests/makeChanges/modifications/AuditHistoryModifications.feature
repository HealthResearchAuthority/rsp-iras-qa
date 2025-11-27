@ApplicantUser @AuditHistoryModifications @SystemTest @SetupNewSponsorOrgGoLive @jsEnabled
Feature: Audit history - This feature file contains scenarios to validate audit history for modifications and related documents

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

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesReviewableAuthorised @KNOWN_DEFECT-RSP-6272_6354_6358 @fail
  Scenario: Validate the audit history for reviewable modifications when sponsor authorised
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
    And I keep note of the 'Modification_Submitted_To_Review_Body' event and 'Sponsor_User' user for modification audit history
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesNonReviewableAuthorised @KNOWN_DEFECT-RSP-6272_6354_6358 @fail
  Scenario: Validate the audit history for non reviewable modifications when sponsor authorised
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Nhs_Involvement_Yes' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
    And I keep note of the 'Modification_Approved' event and 'Blank_User_Details' user for modification audit history
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesReviewableNotAuthorised @KNOWN_DEFECT-RSP-6272_6354_6358 @fail
  Scenario: Validate the audit history for reviewable modifications when sponsor not authorised
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Not_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesNonReviewableNotAuthorised @KNOWN_DEFECT-RSP-6272_6354_6358 @fail
  Scenario: Validate the audit history for non reviewable modifications when sponsor not authorised
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Nhs_Involvement_Yes' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'automation sponsor email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Not_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications
    And I capture the page screenshot
