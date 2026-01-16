@SponsorWorkspace @SystemTest @SysAdminUser @jsEnabled @SetupNewSponsorOrgGoLive
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
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

  @CreateDataNotApprovedModificationAuthorizationListPage
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
      # | Chief_Investigator  | chief investigator  |
      | Status              | status              |

  @rsp-6418 @rsp-6419 @MyOrganisationsPageLabelValidation @KNOWN_DEFECT_RSP-6628
  Scenario: Validate that <Login_User> able to navigate to 'My Organisations' page successfully
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I keep note of the organisation country for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    And I can see the ui labels in sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I can see the 'sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'My_Organisations_Page' page
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |

  @rsp-6419 @MyOrganisationsPageSearchValidation
  Scenario: Validate the search box functionality of my organisations for <Login_User>
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I keep note of the organisation country for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    When I enter '<Invalid_Input>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And the no search results found message is displayed
    And I capture the page screenshot
    When I enter '<Empty_Input>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I capture the page screenshot
    When I enter partial 'organisation name' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I capture the page screenshot

    Examples:
      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Invalid_Input | Empty_Input |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | invalid       |             |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | invalid       |             |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | invalid       |             |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | invalid       |             |

  @rsp-6420 @MyOrganisationsProfilePageBreadcrumbValidation
  Scenario: Breadcrumb navigation for <Login_User> on sponsor organisation profile page
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I keep note of the organisation country for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I capture the page screenshot
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'
    And I capture the page screenshot
    When I click the 'My_Organisations_Breadcrumb' link in the breadcrumbs on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    When I click the 'Sponsorworkspace_Breadcrumb' link in the breadcrumbs on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    Then I can see the sponsor workspace page
    Then I capture the page screenshot
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    When I click the 'My_Account_Breadcrumb' link in the breadcrumbs on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |

  @rsp-6420 @MyOrganisationsProfileTabValidation @RTS @skip
  Scenario: Validate the data under profile tab for <Login_User> with rts data
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton' and  retrive country
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    And I can see the ui labels in sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I can see the 'sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'My_Organisations_Page' page
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'
    And I validate the sponsor organisation data displayed in profile tab with rts data
    And I capture the page screenshot

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | RTS_API_Data         | RTS_Request                         |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |

  @rsp-6421 @MyOrganisationsProjectsTabValidation
  Scenario: Validate the data under projects tab for <Login_User>
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I keep note of the organisation country for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I can see the 'sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'My_Organisations_Page' page
    And I capture the page screenshot
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'
    Then I click the 'Projects_Link' link on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the '<Validation_Text_Research>' ui labels on the my research project page
    And Each 'short project title' displayed on the 'Sponsor_Organisation_Profile_Page' is a link
    When I click a 'short project title' on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the project overview page
    And I capture the page screenshot

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Validation_Text_Research |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | Label_Texts              |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | Label_Texts              |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Label_Texts              |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Label_Texts              |

  @rsp-6421 @MyOrganisationsProjectsTabValidation
  Scenario: Validate the sort and search functionality under projects tab for <Login_User>
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
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the 'sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'My_Organisations_Page' page
    And I capture the page screenshot
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'
    Then I click the 'Projects_Link' link on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I keep note of the project data displayed in the table
    Then I can see the project records are sorted by 'descending' order of 'date created'
    When I click the 'Short_Project_Title' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'ascending' order of 'short project title'
    When I click the 'Short_Project_Title' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'descending' order of 'short project title'
    And I capture the page screenshot
    When I click the 'Iras_Id' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'ascending' order of 'iras id'
    When I click the 'Iras_Id' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'descending' order of 'iras id'
    And I capture the page screenshot
    When I click the 'Date_Created' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'ascending' order of 'date created'
    When I click the 'Date_Created' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the project records are sorted by 'descending' order of 'date created'
    When I enter partial 'iras id' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the project data displaying in the table
    And I capture the page screenshot
    When I enter '<Empty_Input>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the project data displaying in the table
    And I capture the page screenshot

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Empty_Input |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  |             |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   |             |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |             |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |             |

  @rsp-6421 @MyOrganisationsProjectsTabValidation @KNOWN_DEFECT_RSP-6714
  Scenario: Validate the advanced filter functionality under projects tab for <Login_User>
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
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    Then I click the 'Projects_Link' link on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    When I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    When I fill the search input for searching 'my research' with '<Search_Queries>' as the search query
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for my research page
    And I click the 'Clear_All_Filters' link on the 'My_Research_Page'
    And I 'cannot' see active filters displayed


    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Advanced_Filters                                         | Search_Queries              |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | Advanced_Filter_Project_Created_From_Date_Only           | Existing_Iras_Id_Data_Three |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | Advanced_Filter_Project_Created_To_Date_Only             | Non_Existant_Data           |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Advanced_Filter_Project_Created_To_Date_Before_From_Date | Existing_Iras_Id_Data       |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Advanced_Filter_Project_Created_From_Date_Only           | Existing_Iras_Id_Data_Three |

  @rsp-6421 @MyOrganisationsProjectsTabValidation
  Scenario: Validate the pagination functionality under projects tab for <Login_User>
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
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    When I fill the add user permission page using '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    Then I click the 'Projects_Link' link on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'My_Research_Projects_Page' by clicking on '<Navigation_Method1>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot
    Then I click the 'Projects_Link' link on the 'MyOrg_Sponsor_Organisation_Profile_Page'
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'My_Research_Projects_Page' by clicking on '<Navigation_Method2>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:

      | Login_User             | User_Email               | Link   | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Navigation_Method1 | Navigation_Method2 |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | page number        | page number        |
      | Sponsor_User           | automation sponsor email | View   | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | next link          | previous link      |
      | System_Admin           | system admin email       | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | page number        | previous link      |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | page number        | next link          |
  @rsp-6418 @rsp-6419 @MyOrganisationsPageLabelValidation @KNOWN_DEFECT_RSP-6628
  Scenario: Validate that <Login_User> able to navigate to 'My Organisations' page successfully
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton' and  retrive country
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    And I can see the ui labels in sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I can see the 'sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'My_Organisations_Page' page
    Then I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations

    Examples:
      | Login_User             | User_Email               | Link   | RTS_API_Data         | RTS_Request                         |
      | Sponsor_User           | automation sponsor email | View   | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
      | System_Admin           | system admin email       | Manage | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |

  @rsp-6419 @MyOrganisationsPageSearchValidation
  Scenario: Validate the search box functionality of my organisations
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton' and  retrive country
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    When I enter '<Invalid_Input>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And the no search results found message is displayed
    And I capture the page screenshot
    When I enter '<Empty_Input>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I capture the page screenshot

    Examples:
      | Login_User             | User_Email               | Link   | RTS_API_Data         | RTS_Request                         | Invalid_Input | Empty_Input |
      | Sponsor_User           | automation sponsor email | View   | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | invalid       |             |
      | System_Admin           | system admin email       | Manage | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | invalid       |             |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | invalid       |             |