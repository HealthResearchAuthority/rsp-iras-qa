@ApplicantUser @CloseProject @SystemTest @NextRelease
Feature: Close Project - This feature file helps to close project journeys

  @rsp-4908 @PreventProjectClosureWithOpenModification
  Scenario Outline: Validate prevention of project closure when open modifications exist for reviewable modifications
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
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I create '<Changes>' for the created modification
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
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I can see the ui labels in sponsor check and authorise page
    And I capture the page screenshot
    When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate all fields on modification page using '<Changes>' for collapsed view and by expanding the view details
    And I capture the page screenshot
    When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With review body' status in the sponsor authorisations page
    And I can see the searched modification to be present in the list with date actioned in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the modification page for sponsor view
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Review_Body' is displayed on the page
    When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset under the tabs sections
    And I capture the page screenshot
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With review body' status displayed for all documents in the table
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With review body' status displayed for all documents in the table
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'With review body' status in project overview page
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot  
  # Draft Modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot  
 #With Sponsor
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
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
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    And I capture the page screenshot
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot  
  Examples:
      | Changes                                            | Research_Locations                     |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_England          |
 
  @rsp-4908 @PreventProjectClosureWithOneOpenModificationAndModificationWithApprovedAndNotApprovedStatus
  Scenario Outline: Validate prevention of project closure when one open modifications exist for reviewable modifications
    Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
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
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I create '<Changes>' for the created modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
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
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot  
     Examples:
      | Changes                                            | Research_Locations                     |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_England          |
   
  @rsp-4908 @ValidateProjectWithoutModificationsAndAuthorizedForClosure
  Scenario Outline: Verify the project without modification and authorised for project closure
    Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
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
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project has been sent to sponsor
    And I capture the page screenshot
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I capture the page screenshot
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate ui labels in project closure confirmation screen 
    And I capture the page screenshot
    And I validate 'Keep_Project_Open' button visible on the screen
    And I click the 'Authorise closure' button on the 'Confirmation_Page'
    And I validate the project closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the closed project details to be present in the list with 'Authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
 
  @rsp-4908 @ValidateTheModificationApprovedAndNotApprovedByReviewBodyAndAuthorisedForProjectClosure 
  Scenario Outline: Verify the modification approved and not approved by reviewbody and authorised for project closure
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
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    And I capture the page screenshot
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
    And I keep note of the 'Modification_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
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
    And I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Modifications_Tasklist_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'cannot' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    Then I can see the modifications details page in the readonly view
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I keep note of the 'Modification_Approved_By_Review_Body' event and 'blank_user_details' user for modification audit history
    Then I see the check and send review outcome page with 'Approved' outcome and 'Blank' reason
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    Then I validate confirmation screen for modification review outcome sent
    When I click the 'Back_To_Tasklist' link on the 'Modification_Review_Outcome_Sent_Page'
    Then I can see the 'My_Modifications_Tasklist_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    And I 'cannot' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'Search_Modifications_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    Then I 'can' see the modification displayed in the 'Search_Modifications_Page' list with 'Modification_Status_Approved' status
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    Then I validate 'Close_Project_Sent_To_Sponsor' labels displayed in the success confirmation page when the project has been sent to sponsor
    And I capture the page screenshot
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I capture the page screenshot
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate ui labels in project closure confirmation screen 
    And I capture the page screenshot
    And I validate 'Keep_Project_Open' button visible on the screen
    And I click the 'Authorise closure' button on the 'Confirmation_Page'
    And I validate the project closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the closed project details to be present in the list with 'Authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
 Examples:
            | Changes                                  | Research_Locations                     | Study_Wide_Reviewer             | Workflow_User           | Reviewer_User         | Outcome      | Outcome_Reason   | Outcome_Status                   |
            | Other_Minor_Change_To_Project_Management | Data_With_Lead_Nation_England          | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator    | Studywide_Reviewer    | Approved     | Blank            | Modification_Status_Approved     |
            | Other_Minor_Change_To_Project_Management | Data_With_Lead_Nation_Northern_Ireland | Studywide_Reviewer_NI           | Workflow_Coordinator_NI | Studywide_Reviewer_NI | Not_Approved | Lack_Of_Evidence | Modification_Status_Not_Approved |
  
  @rsp-4908 @ValidateProjectWithoutModificationsAndNotAuthorizedForClosure
  Scenario Outline: Verify the project without modification and authorised for project closure
    Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
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
     And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate the project not closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the project details to be present in the list with 'Not authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    
  @rsp-4908 @ValidateModificationSponsorChangesReviewableNotAuthorisedAndAuthorisedForProjectClosure 
  Scenario: Validate the project closure for reviewable modifications when sponsor not authorised
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
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate ui labels in project closure confirmation screen 
    And I capture the page screenshot
    And I validate 'Keep_Project_Open' button visible on the screen
    And I click the 'Authorise closure' button on the 'Confirmation_Page'
    And I validate the project closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the closed project details to be present in the list with 'Authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
          
  @rsp-4908 @ValidateModificationSponsorChangesReviewableNotAuthorisedAndNotAuthorisedForProjectClosure 
  Scenario: Validate the project closure for reviewable modifications when sponsor not authorised and not authorised for project closure
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
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate the project not closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the project details to be present in the list with 'Not authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    
  @rsp-4908 @ValidateTheModificationApprovedAndNotApprovedByReviewBodyAndNotAuthorisedForProjectClosure 
  Scenario Outline: Verify the modification approved and not approved by reviewbody and not authorised for project closure
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
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    And I keep note of the 'Modification_Created' event and 'Applicant_User' user for modification audit history
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
    And I keep note of the 'Modification_Sent_To_Sponsor' event and 'Applicant_User' user for modification audit history
    And I capture the page screenshot
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
    And I keep note of the 'Modification_Authorised_By_Sponsor' event and 'Sponsor_User' user for modification audit history
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
    And I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Modifications_Tasklist_Page'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'cannot' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'My_Modifications_Tasklist_Page' as 'Studywide_Reviewer'
    And I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    Then I can see the modifications details page in the readonly view
    When I click the 'Continue' link on the 'Modification_Details_Page'
    Then I can see the review outcome section
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    And I keep note of the 'Modification_Approved_By_Review_Body' event and 'blank_user_details' user for modification audit history
    Then I see the check and send review outcome page with 'Approved' outcome and 'Blank' reason
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    Then I validate confirmation screen for modification review outcome sent
    When I click the 'Back_To_Tasklist' link on the 'Modification_Review_Outcome_Sent_Page'
    Then I can see the 'My_Modifications_Tasklist_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    And I 'cannot' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'Search_Modifications_Page'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    Then I 'can' see the modification displayed in the 'Search_Modifications_Page' list with 'Modification_Status_Approved' status
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate the project not closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the project details to be present in the list with 'Not authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
 Examples:
            | Changes                                  | Research_Locations                     | Study_Wide_Reviewer             | Workflow_User           | Reviewer_User         | Outcome      | Outcome_Reason   | Outcome_Status                   |
            | Other_Minor_Change_To_Project_Management | Data_With_Lead_Nation_England          | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator    | Studywide_Reviewer    | Approved     | Blank            | Modification_Status_Approved     |
            | Other_Minor_Change_To_Project_Management | Data_With_Lead_Nation_Northern_Ireland | Studywide_Reviewer_NI           | Workflow_Coordinator_NI | Studywide_Reviewer_NI | Not_Approved | Lack_Of_Evidence | Modification_Status_Not_Approved |
         
 
 
 
  @rsp-4908 @PreventProjectClosureWithOpenModificationForNonReviewableModification
  Scenario Outline: Validate prevention of project closure when open modifications exist for non reviewable modifications
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
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
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot  
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I validate 'Summary_Only_Error_Project_Closure' displayed on 'Project_Overview_Page'
    And I capture the page screenshot              
    Examples:
      | Changes                                                          | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One           | Nhs_Involvement_Yes |
      
  @rsp-4908 @ValidateTheNonReviewableModificationApprovedAndNotAuthorisedBySponsorAndAuthorisedForProjectClosure 
  Scenario Outline: Validate the non reviewable modifications when sponsor approved and not authorised status for authorised project closure
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
    And I fill the sponsor check and authorise page with '<Sponsor_Decision>'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
  And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate ui labels in project closure confirmation screen 
    And I capture the page screenshot
    And I validate 'Keep_Project_Open' button visible on the screen
    And I click the 'Authorise closure' button on the 'Confirmation_Page'
    And I validate the project closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the closed project details to be present in the list with 'Authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Closed' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
    Example:
    | Sponsor_Decision     | 
    | Sponsor_Authorised   |
    |Sponsor_Not_Authorised|
 
  @rsp-4908 @ValidateTheNonReviewableModificationApprovedAndNotAuthorisedBySponsorAndNotAuthorisedForProjectClosure 
  Scenario Outline: Validate the non reviewable modifications when sponsor approved and not authorised status for not authorised project closure
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
    And I fill the sponsor check and authorise page with '<Sponsor_Decision>'
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Project_Overview_Page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    And I can see the close project confirmation page
    And I click the 'Return_To_Project_Overview' button on the 'Close_Project_Confirmation_page'
    And I can see the project overview page
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Pending_Closure' on the project overview page
    And I validate project ending section
    And I validate the status 'Project_Status_With_Sponsor' is displayed on the page
     And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I click the 'Project closures' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the project details to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the short project title 
    And I can see the check and authorise project closure page
    And I validate the project information 
    And I validate the Planned project end date and Actual project closure date for project closure in check and authorise project closure page
    And I can see the ui labels in check and authorise project closure page
    And I capture the page screenshot
    And I fill the check and authorise project closure page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Check_And_Authorise_Project_Closure_Page'
    And I validate the project not closed success message
    And I click the 'Return_To_Authorisations' button on the 'Project_Closure_Success_Page'
    And I can see the project details to be present in the list with 'Not authorised' status in the sponsor authorisations page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I capture the page screenshot
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I can see the project overview page
    And I Validate the closed project details
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Multiple_Files_Three' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    
    Example:
    | Sponsor_Decision     | 
    | Sponsor_Authorised   |
    |Sponsor_Not_Authorised|
  
  @rsp-4908 @ErrorValidationForInvalidDate
  Scenario: Validate the date field error message
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
    Then I can see the 'Post_Approval_Tab' ui labels on the project overview page
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using 'Other_Minor_Change_To_Project_Management' and '<Research_Locations>' dataset
    And I create 'Other_Minor_Change_To_Project_Management' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'PNG_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_For_Later' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I validate 'Close_Project' button visible on the screen
    And I capture the page screenshot
    And I click the 'Close_Project' button on the 'Clsoe_Project_page'
    Then I can see the close project page
    Then I validate the project information displayed on close project page
    And I can see the 'Label_Texts' ui labels on close project page
    Then I fill the close project page with 'Valid_Data_All_Fields'
    When I click the 'Send_To_Sponsor' button on the 'Close_Project_page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on '<Close_Project_page>'

    Examples: 
      | Close_Project_page                   | Field_And_Summary_Error_Message |
      | Invalid_Future_Date                  | Invalid_Date_Field_Error        |
      | Invalid_Day_Number                   | Invalid_Date_Field_Error        |
      | Invalid_Day_Letters                  | Invalid_Date_Field_Error        |
      | Invalid_Year_Number_1                | Invalid_Date_Field_Error        |
      | Invalid_Year_Number_2                | Invalid_Date_Field_Error        |
      | Invalid_Year_Letters                 | Invalid_Date_Field_Error        |
      | Invalid_Date_Past                    | Invalid_Date_Field_Error        |
      | Invalid_Date_No_Day                  | Invalid_Date_Field_Error        |
      | Invalid_Date_No_Month                | Invalid_Date_Field_Error        |
      | Invalid_Date_No_Year                 | Invalid_Date_Field_Error        |



 
 