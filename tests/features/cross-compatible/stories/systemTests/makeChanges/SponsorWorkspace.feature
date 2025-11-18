@SponsorWorkspace @SystemTest
Feature: Sponsor Workspace

  @rsp-4846 @SponsorWorkspacePageLabelValidation @SysAdminUser @SetupNewSponsorOrgGoLive
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

  @rsp-4846 @SponsorWorkspacePageValidationWhenUserEnabledOrDisabled @SysAdminUser @SetupNewSponsorOrgGoLive
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

  @rsp-4846 @SponsorWorkspacePageValidationWhenSponsorOrganisationEnabledOrDisabled @SysAdminUser @SetupNewSponsorOrgGoLive
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
