@ApplicantUser @CloseProject @SystemTest @SetupNewSponsorOrgGoLive @SystemTestFrontStage
Feature: Close Project

  Background:
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
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNoModificationsAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure successful when no modifications exist for project and authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate iras id and short project title displayed
    And I validate confirmation screen for project closure when closure is about to be authorised
    When I click the 'Go_Back_Check_Authorise' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the check and authorise project closure page
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNoModificationsNotAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when no modifications exist for project and not authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureApprovedModificationsAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure successful when there exist an approved modification for project and authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate iras id and short project title displayed
    And I validate confirmation screen for project closure when closure is about to be authorised
    When I click the 'Go_Back_Check_Authorise' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the check and authorise project closure page
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureApprovedModificationsNotAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when there exist an approved modification for project and not authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNotApprovedModificationsAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure successful when there exist a not approved modification for project and authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate iras id and short project title displayed
    And I validate confirmation screen for project closure when closure is about to be authorised
    When I click the 'Go_Back_Check_Authorise' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the check and authorise project closure page
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNotApprovedModificationsNotAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when there exist a not approved modification for project and not authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNotAuthorisedModificationsAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when there exist a not authorised modification for project and authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate iras id and short project title displayed
    And I validate confirmation screen for project closure when closure is about to be authorised
    When I click the 'Go_Back_Check_Authorise' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the check and authorise project closure page
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNotAuthorisedModificationsNotAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when there exist a not authorised modification for project and not authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureApprovedNotApprovedAndNotAuthorisedModificationsAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure successful when there exist a combination of approved, not approved and not authorised modifications for project and authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate iras id and short project title displayed
    And I validate confirmation screen for project closure when closure is about to be authorised
    When I click the 'Go_Back_Check_Authorise' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the check and authorise project closure page
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureApprovedNotApprovedAndNotAuthorisedModificationsNotAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate project closure when there exist a combination of approved, not approved and not authorised modifications for project and not authorised for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I validate iras id and short project title displayed
    And I can see the ui labels on the check and authorise project closure page
    And I validate the planned project end date and actual project closure date in check and authorise project closure page using 'Valid_Data_All_Fields' dataset
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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

  @rsp-4908 @PreventProjectClosureWithProjectWithDraftModifications
  Scenario: Validate prevention of project closure when draft modifications exist for project
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project cannot be closed error message
    When I click the 'Return_To_Project_Overview' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see the iras id and short project title on project overview page

  @rsp-4908 @PreventProjectClosureWithProjectWithSponsorModifications
  Scenario: Validate prevention of project closure when with sponsor modifications exist for project
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project cannot be closed error message
    When I click the 'Return_To_Project_Overview' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see the iras id and short project title on project overview page

  @rsp-4908 @PreventProjectClosureWithProjectWithReviewerModifications
  Scenario: Validate prevention of project closure when with review body modifications exist for project
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project cannot be closed error message
    When I click the 'Return_To_Project_Overview' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see the iras id and short project title on project overview page

  @rsp-4908 @PreventProjectClosureWithProjectHavingCombinationInDraftWithReviewerModifications
  Scenario: Validate prevention of project closure when combination of in draft and with review body modifications exist for project
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project cannot be closed error message
    When I click the 'Return_To_Project_Overview' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see the iras id and short project title on project overview page

  @rsp-4908 @PreventProjectClosureWithProjectHavingCombinationInDraftVsOthersModifications
  Scenario: Validate prevention of project closure when combination of in draft, with review body, approved, not approved and not authorised modifications exist for project
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project cannot be closed error message
    When I click the 'Return_To_Project_Overview' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see the iras id and short project title on project overview page

  @rsp-4908 @ErrorValidationForInvalidDate @KNOWN_DEFECT_RSP-6798
  Scenario: Validate the date field error message in project closure page for invalid project closure end date inputs
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I fill the close project page with '<Close_Project_Page_Data>'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Close_Project_Page'

    Examples:
      | Close_Project_Page_Data | Field_And_Summary_Error_Message      |
      | Invalid_Date_Future     | Invalid_Date_Field_Future_Error      |
      | Invalid_Date_Blank      | Invalid_Date_Field_Blank_Error       |
      | Invalid_Day_Number      | Invalid_Date_Field_Error             |
      | Invalid_Day_Letters     | Invalid_Date_Field_Error             |
      | Invalid_Year_Number_1   | Invalid_Date_Field_Error             |
      | Invalid_Year_Number_2   | Invalid_Date_Field_Error             |
      | Invalid_Year_Letters    | Invalid_Date_Field_Error             |
      | Invalid_Date_No_Day     | Invalid_Date_Field_Day_Blank_Error   |
      | Invalid_Date_No_Month   | Invalid_Date_Field_Month_Blank_Error |
      | Invalid_Date_No_Year    | Invalid_Date_Field_Year_Blank_Error  |

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureMandatorySelectionErrorInAuthorisePage
  Scenario: Validate error message displayed when user selects no options for mandatory question in sponsor project closure authorise page
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the short project title link
    And I can see the check and authorise project closure page
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    Then I validate 'Mandatory_Field_Error' displayed on 'Check_Authorise_Project_Closure_Page'

  @rsp-4888 @rsp-4908 @rsp-5312 @ProjectClosureNotAuthorisedThenAuthorisedForClosure @KNOWN_DEFECT_RSP-6783
  Scenario: Validate a project closure initially not authorised can be authorised later for project closure
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    Then I click on the short project title link
    And I fill the check and authorise project closure page with 'Not_Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure not authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Not authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Not authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    Then I can see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I capture the page screenshot
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as 'Workflow_Coordinator'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    When I click the 'Close_Project' button on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the close project page
    Then I validate the planned project end date in close project page using 'Valid_Data_All_Fields' dataset
    Then I can see the ui labels on the close project page
    Then I fill the close project page with 'Valid_Date_Today'
    And I capture the page screenshot
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_Page'
    And I 'keep note of' the project closure transaction details along with the 'Applicant_User' user and 'With sponsor' status
    And I capture the page screenshot
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project closure has been sent to sponsor
    When I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the my research page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I 'keep note of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'With sponsor' status
    Then I click on the short project title link
    And I fill the check and authorise project closure page with 'Authorised_Data'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_Authorise_Project_Closure_Page'
    And I capture the page screenshot
    When I click the 'Authorise_Closure' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I validate confirmation screen for project closure when closure authorised
    And I 'update status of' the project closure transaction details along with the 'Applicant_User' user and 'Authorised' status
    And I 'update status of' the project closure details for sponsor authorisations view along with the 'Applicant_User' user and 'Authorised' status
    When I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    And I click the 'Project_Closures' link on the 'Sponsor_Workspace_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    And I validate the project closure table for sponsor authorisations view
    Then I click on the short project title link
    And I can see the project overview page
    And I capture the page screenshot
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate project closure date displayed in project details page using 'Valid_Date_Today'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the my research page
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see project ending section in project overview page
    Then I can see the iras id and short project title on project overview page
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    Then I cannot see a 'Close_Project' button on the 'Project_Overview_Page'
    Then I cannot see a 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I validate the project closure transaction table
