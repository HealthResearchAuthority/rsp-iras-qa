@ApplicantUser @AuditHistoryModifications @SystemTest @SetupNewSponsorOrgGoLive
Feature: Modifications - Audit history

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesReviewableAuthorised
  Scenario: Validate the audit history for reviewable modifications when sponsor authorised
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two' for the created modification
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
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
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Sponsor_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Sponsor_User' user
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesNonReviewableAuthorised
  Scenario: Validate the audit history for non reviewable modifications when sponsor authorised
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two' and 'Nhs_Involvement_Yes' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two' for the created modification
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
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
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Sponsor_User' user
    And I keep note of the 'Modification_Approved' event actioned by the user 'Blank_User_Details' to store the modification audit history for 'Applicant_User' user
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesReviewableNotAuthorised
  Scenario: Validate the audit history for reviewable modifications when sponsor not authorised
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two' for the created modification
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
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
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Not_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Sponsor_User' user
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot

  @rsp-5339 @ValidateAuditHistoryModificationSponsorChangesNonReviewableNotAuthorised
  Scenario: Validate the audit history for non reviewable modifications when sponsor not authorised
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two' and 'Nhs_Involvement_Yes' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two' for the created modification
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
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
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Not_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Sponsor_User' user
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot

  @rsp-5268 @LogTheModificationCreatedEventAndModificationSentToSponsorEventinAuditHistoryPage
  Scenario: Validate that user can create modifications and complete the entire modifications journey till send modification to sponsor confirmation page and return to project overview page and validate event in audit history page
    Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
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
    Then I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I can see the select area of change page
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and '<Research_Locations>' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files_Three' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And the 'Add_Documents' button should be 'available' on the 'Review_All_Changes_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I capture the page screenshot
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the modification post submission page
    And I capture the page screenshot
    And I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot

  @rsp-5268 @LogTheModificationApprovedByReviewBodyEventinAuditHistoryPage @SetupNewSponsorOrgGoLive
  Scenario: Verify the modification approved by reviewbody and log the event in modification history page
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
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Loging as sponsor user and authorising the modification
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as workflow coordinator and assigning the modification to study wide reviewer northen ireland
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Studywide_Reviewer_NI'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Assigned' event actioned by the user 'Workflow_Coordinator' to store the modification audit history for 'Backstage_User' user
    # logging as team manager and reassigning the modification to study wide reviewer hra england
    When I have navigated to the 'Team_Manager_Dashboard_Page' as 'Team_Manager'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Reassigned' event actioned by the user 'Team_Manager' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as study wide reviewer and approving the modification with change of reason
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    When I provide the 'Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    Then I see the check and send review outcome page with 'Approved' outcome and 'Lack_Of_Evidence' reason
    And I capture the page screenshot
    And I keep note of the 'Modification_Outcome_Selected' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Comment_Added' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    When I click the 'Change' link on the 'Modification_Outcome_Check_Send_Page'
    Then I can see the review outcome section
    And I capture the page screenshot
    When I provide the 'Approved' outcome for the modification with 'Valid_Reason' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    Then I see the check and send review outcome page with 'Approved' outcome and 'Valid_Reason' reason
    And I keep note of the 'Modification_Comment_Changed' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I keep note of the 'Modification_Approved_By_Review_Body' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Review_Outcome_Sent' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Approved_By_Review_Body' event actioned by the user 'blank_user_details' to store the modification audit history for 'Applicant_User' user
    Then I validate confirmation screen for modification review outcome sent
    # Validating the audit history for study wide reviewer
    When I have navigated to the 'Approvals_Page' as 'Studywide_Reviewer'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    Then I can see the modification post submission page
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot
    # Validating the audit history for applicant user
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Applicant_User'
    And I capture the page screenshot
    # Validating the audit history for sponsor user
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    When I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    Then I can see the modification post submission page
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Applicant_User'
    # Validating the audit history for workflow coordinator user
    When I have navigated to the 'Approvals_Page' as 'Workflow_Coordinator'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    Then I can see the modification post submission page
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot
    # Validating the audit history for team manager user
    When I have navigated to the 'Approvals_Page' as 'Team_Manager'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    Then I can see the modification post submission page
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot

  @rsp-5268 @rsp-6625 @LogTheModificationNotApprovedByReviewBodyEventinAuditHistoryPage @SetupNewSponsorOrgGoLive
  Scenario: Verify the modification not approved by reviewbody and log the event in modification history page
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfBristol'
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
    And I fill the project identifiers page with 'Sponsor_Organisation_Full_Text_Bristol'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_Northern_Ireland' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as sponsor user and not authorising the modification
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
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    # Logging as workflow coordinator and assigning the modification to study wide reviewer northern ireland
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Studywide_Reviewer_NI'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Assigned' event actioned by the user 'Workflow_Coordinator' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # logging as team manager and reassigning the modification to study wide reviewer hra england
    When I have navigated to the 'Team_Manager_Dashboard_Page' as 'Team_Manager'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Reassigned' event actioned by the user 'Team_Manager' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as study wide reviewer and not approving the modification with change of reason
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    And I capture the page screenshot
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    And I capture the page screenshot
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    And I keep note of the 'Modification_Outcome_Selected' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Comment_Reason_Not_Approved_Added' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    Then I see the check and send review outcome page with 'Not_Approved' outcome and 'Lack_Of_Evidence' reason
    When I click the 'Change' link on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I can see the review outcome section
    And I capture the page screenshot
    When I provide the 'Not_Approved' outcome for the modification with 'Valid_Reason_Not_Approved' reason
    And I capture the page screenshot
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I see the check and send review outcome page with 'Not_Approved' outcome and 'Valid_Reason_Not_Approved' reason
    And I keep note of the 'Modification_Comment_Reason_Not_Approved_Changed' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    And I keep note of the 'Modificaiton_Not_Approved_By_Review_Body' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Review_Outcome_Sent' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modificaiton_Not_Approved_By_Review_Body' event actioned by the user 'blank_user_details' to store the modification audit history for 'Applicant_User' user
    Then I validate confirmation screen for modification review outcome sent
    # Validating the audit history for applicant user
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Valid_Reason_Not_Approved' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Applicant_User'
    # Validating the audit history for sponsor user
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    When I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    # valid audit row is not visible
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Valid_Reason_Not_Approved' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    # Validating the audit history for study wide reviewer
    When I have navigated to the 'Approvals_Page' as 'Studywide_Reviewer'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Valid_Reason_Not_Approved' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    # Validating the audit history for workflow coordinator user
    When I have navigated to the 'Approvals_Page' as 'Workflow_Coordinator'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Valid_Reason_Not_Approved' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot
    # Validating the audit history for team manager user
    When I have navigated to the 'Approvals_Page' as 'Team_Manager'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Valid_Reason_Not_Approved' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot

  @rsp-5268 @rsp-6625 @LogTheModificationNotApprovedByReviewBodyEventinAuditHistoryPage @SetupNewSponsorOrgGoLive
  Scenario: Verify the modification not approved by reviewbody and log the event in modification history page without change link click
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfBristol'
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
    And I fill the project identifiers page with 'Sponsor_Organisation_Full_Text_Bristol'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_Northern_Ireland' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as sponsor user and not authorising the modification
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
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    # Logging as workflow coordinator and assigning the modification to study wide reviewer northern ireland
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Studywide_Reviewer_NI'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Assigned' event actioned by the user 'Workflow_Coordinator' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # logging as team manager and reassigning the modification to study wide reviewer hra england
    When I have navigated to the 'Team_Manager_Dashboard_Page' as 'Team_Manager'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Reassigned' event actioned by the user 'Team_Manager' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as study wide reviewer and not approving the modification with reason
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    And I capture the page screenshot
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    And I capture the page screenshot
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    And I keep note of the 'Modification_Outcome_Selected' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Comment_Reason_Not_Approved_Added' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    Then I see the check and send review outcome page with 'Not_Approved' outcome and 'Lack_Of_Evidence' reason
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    And I keep note of the 'Modificaiton_Not_Approved_By_Review_Body' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Review_Outcome_Sent' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modificaiton_Not_Approved_By_Review_Body' event actioned by the user 'blank_user_details' to store the modification audit history for 'Applicant_User' user
    Then I validate confirmation screen for modification review outcome sent
    # Validating the audit history for applicant user
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Lack_Of_Evidence' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Applicant_User'
    # Validating the audit history for sponsor user
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    When I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    # valid audit row is not visible
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Lack_Of_Evidence' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    # Validating the audit history for study wide reviewer
    When I have navigated to the 'Approvals_Page' as 'Studywide_Reviewer'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Lack_Of_Evidence' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    # Validating the audit history for workflow coordinator user
    When I have navigated to the 'Approvals_Page' as 'Workflow_Coordinator'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Lack_Of_Evidence' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot
    # Validating the audit history for team manager user
    When I have navigated to the 'Approvals_Page' as 'Team_Manager'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_Not_Approved' status and 'Lack_Of_Evidence' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot

  @rsp-5268 @rsp-6625 @LogTheModificationNotApprovedByReviewBodyEventinAuditHistoryPage @SetupNewSponsorOrgGoLive
  Scenario: Verify the modification not approved by reviewbody and log the event in modification history page with save for later
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfBristol'
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
    And I fill the project identifiers page with 'Sponsor_Organisation_Full_Text_Bristol'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_Northern_Ireland' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Created' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Sent_To_Sponsor' event actioned by the user 'Applicant_User' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as sponsor user and not authorising the modification
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
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Authorised_By_Sponsor' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Applicant_User' user
    And I keep note of the 'Modification_Submitted_To_Review_Body' event actioned by the user 'Sponsor_User' to store the modification audit history for 'Backstage_User' user
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    # Logging as workflow coordinator and assigning the modification to study wide reviewer northern ireland
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Studywide_Reviewer_NI'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Assigned' event actioned by the user 'Workflow_Coordinator' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # logging as team manager and reassigning the modification to study wide reviewer hra england
    When I have navigated to the 'Team_Manager_Dashboard_Page' as 'Team_Manager'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I keep note of the 'Modification_Reassigned' event actioned by the user 'Team_Manager' to store the modification audit history for 'Backstage_User' user
    And I capture the page screenshot
    # Logging as study wide reviewer and not approving the modification with change of reason
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    And I capture the page screenshot
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    And I keep note of the 'Modification_Outcome_Selected' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I keep note of the 'Modification_Comment_Reason_Not_Approved_Added' event actioned by the user 'Studywide_Reviewer' to store the modification audit history for 'Backstage_User' user
    And I can see the 'My_Modifications_Tasklist_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the 'Not_Approved' outcome is selected for the modification with 'Lack_Of_Evidence' reason
    And I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    # Validating the audit history for applicant user
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then I click on the searched modification id
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Applicant_User'
    # Validating the audit history for sponsor user
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    When I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Sponsor_User'
    # Validating the audit history for study wide reviewer
    When I have navigated to the 'Approvals_Page' as 'Studywide_Reviewer'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    # Validating the audit history for workflow coordinator user
    When I have navigated to the 'Approvals_Page' as 'Workflow_Coordinator'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot
    # Validating the audit history for team manager user
    When I have navigated to the 'Approvals_Page' as 'Team_Manager'
    When I click the 'Search_Records' link on the 'Approvals_Page'
    And I select the radio button for 'Modification_Record' in the choose a record type to search page
    And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    When I click a 'modification id' on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then I see the the modification post submission page with 'Modification_Status_With_Review_Body' status and '' reason
    When I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the audit history table for modifications of the user 'Backstage_User'
    And I capture the page screenshot