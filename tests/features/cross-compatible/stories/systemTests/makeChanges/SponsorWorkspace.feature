@SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive @SystemTestFrontStage
Feature: Sponsor Workspace

  @rsp-4846 @SponsorWorkspacePageLabelValidation
  Scenario: Validate the sponsor workspace page
    Given I have navigated to the 'System_Administration_Page'
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
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'Authorisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the sponsor workspace page
    And I can see the ui labels in sponsor workspace page

  @rsp-4846 @SponsorWorkspacePageValidationWhenUserEnabledOrDisabled
  Scenario: Validate the sponsor workspace page when the user is enabled or disabled for a sponsor organisation in backstage
    Given I have navigated to the 'System_Administration_Page'
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
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the sponsor workspace page
    And I can see a 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I can see the ui labels in sponsor workspace page
    And I capture the page screenshot
    And I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the 'Access_Denied_Page'
    And I capture the page screenshot
    And I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Active' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the sponsor workspace page
    And I can see a 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I can see the ui labels in sponsor workspace page
    And I capture the page screenshot

  @rsp-4846 @SponsorWorkspacePageValidationWhenSponsorOrganisationEnabledOrDisabled
  Scenario: Validate the sponsor workspace page when the sponsor organisation is enabled or disabled in backstage
    Given I have navigated to the 'System_Administration_Page'
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
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the sponsor workspace page
    And I can see a 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I can see the ui labels in sponsor workspace page
    And I capture the page screenshot
    And I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the sponsor organisation disabled successful message on manage sponsor organisation page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the 'Access_Denied_Page'
    And I capture the page screenshot
    And I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Disabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the sponsor organisation enabled successful message on manage sponsor organisation page
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    Then I can see the sponsor workspace page
    And I can see a 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I can see the ui labels in sponsor workspace page
    And I capture the page screenshot

  @rsp-5191 @SponsorAuthorisationMandatorySelectionOnOutcomeError @jsEnabled
  Scenario: Validate error message displayed in sponsor check and and authorise page when no option selection to action the modification
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
    Then I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Nhs_Involvement_Yes' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
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
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    And I capture the page screenshot
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I validate 'Summary_Only_Error_Select_Outcome' displayed on 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot

  @CreateDataApprovedModificationAuthorizationListPage
  Scenario Outline: Create approved modifications for modification authorization list page
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
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot

    Examples:
      | Changes                                            | Research_Locations                     |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_England          |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Northern_Ireland |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Scotland         |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Wales            |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_England          |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Northern_Ireland |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Scotland         |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Wales            |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_England          |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Northern_Ireland |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Scotland         |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_England          |

  @CreateDataNotApprovedModificationAuthorizationListPage @Release_2.0
  Scenario Outline: Create not approved modifications for modification authorization list page
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
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    And I capture the page screenshot
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id from sponsor authorisations page
    And I can see the sponsor check and authorise page
    When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the modification not authorised page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And I fill the modification not authorised page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    And I click the 'Not_Authorised_Confirm' button on the 'Modification_Not_Authorised_Page'
    And I validate confirmation screen for modification not authorised by sponsor
    And I capture the page screenshot

    Examples:
      | Changes                                            | Research_Locations                     |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_England          |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Northern_Ireland |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Scotland         |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Wales            |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_England          |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Northern_Ireland |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Scotland         |
      | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Wales            |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_England          |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Northern_Ireland |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Scotland         |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_England          |

  @rsp-5190 @ValidateModificationListPageSortingPagination
  Scenario: Verify that a sponsor user can access the modification authorization list page, view all modification records, apply sorting on the list, and navigate through records using pagination.
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
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    And I can see the list of modifications received for sponsor approval is sorted by 'descending' order of the 'date received'
    When I click the '<Sort_Button>' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I can see the list of modifications received for sponsor approval is sorted by 'ascending' order of the '<Sort_Field>'
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on for sponsor workspace authorisations page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    Then I can see the list of modifications received for sponsor approval is sorted by 'ascending' order of the '<Sort_Field>'
    When I click the '<Sort_Button>' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on for sponsor workspace authorisations page using 'Sponsor_Organisation_UniversityOfSouthampton'
    Then I can see the list of modifications received for sponsor approval is sorted by 'descending' order of the '<Sort_Field>'
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on for sponsor workspace authorisations page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    Then I can see the list of modifications received for sponsor approval is sorted by 'descending' order of the '<Sort_Field>'

    Examples:
      | Sort_Button         | Sort_Field          |
      | Modification_Id     | modification id     |
      | Short_Project_Title | short project title |
      | Date_Received       | date received       |
      | Date_Actioned       | date actioned       |
      | Status              | status              |
      # | Chief_Investigator  | chief investigator  |

  @rsp-6864 @ValidateOutcomeOptionsForSponsorCheckAndAuthorisePage @Release_2.0
  Scenario: Validate the outcome options displayed in sponsor check and authorise page
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
    When I enter '<Organisation_User>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    When I fill the add user permission page using '<Authoriser>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Authoriser>'
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
    Then I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Nhs_Involvement_Yes' dataset
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
    And I have navigated to the 'Home_Page' as '<User_Login>'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I capture the page screenshot
    When I click on the searched modification id
    And I can see the sponsor check and authorise page
    And I capture the page screenshot
    And I can see the ui labels in sponsor check and authorise page
    And I validate the sponsor outcome options displayed in sponsor check and authorise page

    Examples:
      | User_Login             | Organisation_User        | Authoriser             | Changes                                                |
      | Sponsor_User           | automation sponsor email | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One |
      | Sponsor_User           | automation sponsor email | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One     |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One     |
      | System_Admin           | system admin email       | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One |
      | System_Admin           | system admin email       | Sponsor_Authoriser_Yes | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One     |

  @rsp-6825 @ValidateStatusesAndOutcomeOptionsAfterRequestRevision @Release_2.0
  Scenario: Validate modification statuses and the outcome options displayed after the applicant has sent the modification back to sponsor which had come for revision
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
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
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Request_Revisions'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    Then I can see the request revisions page
    And I capture the page screenshot
    And I fill the request revisions page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Send_Request' button on the 'Request_Revisions_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'In draft' status displayed for all documents in the table
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'In draft' status in project overview page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I validate the status 'Modification_Status_Indraft' is displayed on the page
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'In draft' status displayed for all documents in the table
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in project overview page
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
    And I capture the page screenshot
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I capture the page screenshot
    And I validate the sponsor outcome options displayed without request revision optionin sponsor check and authorise page

  @rsp-6825 @ValidateErrorMessagesInRequestRevisionsPage @Release_2.0 @KNOWN-DEFECT_RSP-7375
  Scenario Outline: Validate error messages in request revisions page
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
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
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Request_Revisions'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    Then I can see the request revisions page
    And I capture the page screenshot
    And I fill the request revisions page with '<Request_Revisions_Description>'
    And I capture the page screenshot
    When I click the 'Send_Request' button on the 'Request_Revisions_Page'
    And I capture the page screenshot
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Request_Revisions_Page'

    Examples:
      | Request_Revisions_Description | Field_And_Summary_Error_Message |
      | Empty_Data_All_Fields         | Empty_Field_Error               |
      | Max_Char_Data_All_Fields      | Max_Character_Field_Error       |

  @rsp-6827 @ValidateErrorMessagesInModificationNotAuthorisedPage @Release_2.0 @KNOWN-DEFECT_RSP-7394
  Scenario Outline: Validate error messages in modification not authorised page
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
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
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the modification not authorised page
    And I capture the page screenshot
    And I fill the modification not authorised page with '<Modification_Not_Authorised_Reason>'
    And I capture the page screenshot
    And I click the 'Not_Authorised_Confirm' button on the 'Modification_Not_Authorised_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Modification_Not_Authorised_Page'

    Examples:
      | Modification_Not_Authorised_Reason | Field_And_Summary_Error_Message |
      | Max_Char_Data_All_Fields           | Max_Character_Field_Error       |
      # | Empty_Data_All_Fields              | Empty_Field_Error               |

  @rsp-6827 @ValidateNotAuthorisedModificationNotAvailableBackstageUsers @Release_2.0
  Scenario Outline: Validate backstage users should not see the modification which is not authorised by sponsor
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One' for the created modification
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
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
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the modification not authorised page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And I fill the modification not authorised page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    And I click the 'Not_Authorised_Confirm' button on the 'Modification_Not_Authorised_Page'
    And I have navigated to the 'Home_Page' as '<Backstage_User>'
    And I have navigated to the 'Search_Modifications_Page'
    And I capture the page screenshot
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'Search_Modifications_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed

    Examples:
      | Backstage_User       |
      | Workflow_Coordinator |
      | Studywide_Reviewer   |
      | Team_Manager         |

  @rsp-6827 @ReviewableModificationSponsorOrgAdminNotAuthorised @Release_2.0
  Scenario: Validate that sponsor organisation admin can action to not authorise the reviewable modifications
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
    When I enter 'sponsor org admin email' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using 'Sponsor_Org_User_Role_Org_Admin'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
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
    And I have navigated to the 'Home_Page' as 'Sponsor_Org_Admin_User'
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
    And I validate all fields on modification page using 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' for collapsed view and by expanding the view details
    And I capture the page screenshot
    When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the modification not authorised page
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And I fill the modification not authorised page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    And I click the 'Not_Authorised_Confirm' button on the 'Modification_Not_Authorised_Page'
    And I validate confirmation screen for modification not authorised by sponsor
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'Not authorised' status in the sponsor authorisations page
    And I can see the searched modification to be present in the list with date actioned with 'Not authorised' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the modification page for sponsor view
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
    And I validate the reason for not authorised on modifications page using 'Valid_Data_All_Fields' dataset
    When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the 'Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One' dataset under the tabs sections
    And I capture the page screenshot
    When I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Not authorised' status displayed for all documents in the table
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Not authorised' status displayed for all documents in the table
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'Not authorised' status in project overview page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'Not authorised' status displayed for all documents in the table
    And I capture the page screenshot

  @rsp-6826 @NonReviewableModificationSponsorReviseAndAuthorise @Release_2.0 @run
  Scenario: Validate that sponsor can revise and authorise by making revisions to the modification - change made to documents, sponsor reference and change
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
    Then I fill the research locations page with 'Data_With_Lead_Nation_England'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using 'Change_To_Planned_End_Date' and 'Data_With_Lead_Nation_England' dataset
    And I create 'Change_To_Planned_End_Date' for the created modification
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
    And I fill the sponsor check and authorise page with 'Sponsor_Revise_And_Authorise'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I can see the revise and authorise page
    And I capture the page screenshot
    When I click the 'Change' link on the 'Revise_And_Authorise_Page'
    And I capture the page screenshot
    When I click the change link 'New_Planned_End_Date' on modification review changes page
    Then I can see the 'Planned_End_Date' page for modifications
    And I capture the page screenshot
    And I fill the planned project end date modifications page with 'Valid_Data_All_Fields_Change'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Modifications_Page'
    And I capture the page screenshot
    And I can see the modification review changes page
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the revise and authorise page
    And I modify the current sponsor details with 'Valid_Data_All_Fields_Changes' for the created modification
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields_Changes'
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    And I upload 'Single_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Single_File' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    And I can see the revise and authorise page
    And I can validate the 'Multiple_Files_Three_Change' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I validate the change details are displayed as per the 'Change_To_Planned_End_Date_Changed' dataset for revise and authorise page
    And I fill the revise and authorise page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Authorise' button on the 'Revise_And_Authorise_Page'
    And I validate confirmation screen for modification has been authorised by sponsor and approved
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'Approved' status in the sponsor authorisations page
    And I can see the searched modification to be present in the list with date actioned with 'Approved' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the modification page for sponsor view
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_Approved' is displayed on the page
    When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields_Changes'
    And I capture the page screenshot
    When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the 'Change_To_Planned_End_Date_Changed' dataset under the tabs sections
    And I capture the page screenshot
    When I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can validate the 'Multiple_Files_Three_Change' are displayed in the supporting documents table
    And I can see the 'Approved' status displayed for all documents in the table
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I can validate the 'Multiple_Files_Three_Change' are displayed in the supporting documents table
    And I can see the 'Approved' status displayed for all documents in the table
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'Approved' status in project overview page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I validate the status 'Modification_Status_Approved' is displayed on the page
    When I click the 'Sponsor_Details' link on the 'Modification_Post_Submission_Page'
    And I validate sponsor details are displayed with 'Valid_Data_All_Fields_Changes'
    And I capture the page screenshot
    When I click the 'Modification_Details' link on the 'Modification_Post_Submission_Page'
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the 'Change_To_Planned_End_Date_Changed' dataset
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can validate the 'Multiple_Files_Three_Change' are displayed in the supporting documents table
    And I can see the 'Approved' status displayed for all documents in the table
