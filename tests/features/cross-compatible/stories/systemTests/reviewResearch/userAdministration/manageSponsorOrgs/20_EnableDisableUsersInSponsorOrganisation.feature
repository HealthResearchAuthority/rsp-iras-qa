@UserAdministration @ManageSponsorOrgs @SysAdminUser @SystemTest @DisableEnableUsersSponsorOrg @STSysAdmin
Feature: Feature: User Administration: Manage Sponsor Organisations- Enable / Disable users in the selected Sponsor Organisations

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'

  @rsp-5332 @rsp-5357 @rsp-5358 @DisableExistingSponsorOrgUser @EnableExistingSponsorOrgUser @BreadcrumbEnableSponsorOrgUser
  Scenario Outline: Verify the user is able to disable a user from the selected sponsor organisation and then enable it
    When I enter 'name of the previously added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the user list page of the 'sponsor organisation'
    And I capture the page screenshot
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    When I enter 'QA Automation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    And the check and add user to sponsor organisation page displays the expected user details
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    Then I can see the user list page of the 'sponsor organisation'
    And I capture the page screenshot
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'View_Edit_User_Profile_Page'
    And I can see the view and edit user profile page of the sponsor organisation
    Then I can see the '<Disable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
    And I capture the page screenshot
    When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Disable_User_In_Sponsor_Organisation_Labels>' labels displayed in disable user in sponsor organisation confirmation page using the user name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I can see the 'Sponsor_Org_User_List_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I capture the page screenshot
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the '<Enable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
    And I capture the page screenshot
    When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Enable_User_In_Sponsor_Organisation_Labels>' labels displayed in enable user in sponsor organisation confirmation page using the user name
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see a 'Enable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
    And I capture the page screenshot
    And I capture the page screenshot
    Then I can see the 'Sponsor_Org_User_List_Page'
    Then I can see the user list page of the 'sponsor organisation'

    Examples:
      | Status_Enabled | Disable_Label_Texts | Disable_User_In_Sponsor_Organisation_Labels | Status_Disabled | Enable_Label_Texts | Enable_User_In_Sponsor_Organisation_Labels | Navigation_Link |
      | enabled        | Disable_Label_Texts | Disable_User_In_Sponsor_Organisation_Labels | disabled        | Enable_Label_Texts | Enable_User_In_Sponsor_Organisation_Labels | Back            |

  @rsp-5332 @rsp-5357 @BreadcrumbDisableExistingSponsorOrgUser
  Scenario Outline: Validate breadcrumb navigations in disable sponsor organisation confirmation page
    When I enter 'name of the previously added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the user list page of the 'sponsor organisation'
    And I capture the page screenshot
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    When I enter 'QA Automation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    And the check and add user to sponsor organisation page displays the expected user details
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    Then I can see the user list page of the 'sponsor organisation'
    And I capture the page screenshot
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'View_Edit_User_Profile_Page'
    And I can see the view and edit user profile page of the sponsor organisation
    Then I can see the '<Disable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
    And I capture the page screenshot
    When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see a 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Navigation_Link | Status_Enabled | Disable_Label_Texts |
      | Back            | enabled        | Disable_Label_Texts |