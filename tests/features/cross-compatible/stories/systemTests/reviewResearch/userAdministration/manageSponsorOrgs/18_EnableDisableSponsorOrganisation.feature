@UserAdministration @ManageSponsorOrgs @SysAdminUser @SystemTest @DisableEnableSponsorOrg @STSysAdmin @rsp-5264 @rsp-5327 @KNOWN_DEFECT-RSP-5531
Feature: Feature: User Administration: Manage Sponsor Organisations- Enable / Disable Sponsor Organisations

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'

  @rsp-5264 @rsp-5327 @DisableExistingSponsorOrg @EnableExistingSponsorOrg @BreadcrumbEnableSponsorOrg
  Scenario Outline: Verify the user is able to disable a sponsor organisation and then enable it
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
    Then I can see the '<Disable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
    And I capture the page screenshot
    When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Disable_Sponsor_Organisation_Labels>' labels displayed in disable sponsor organisation confirmation page using the organisation name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the sponsor organisation disabled successful message on manage sponsor organisation page
    And I capture the page screenshot
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter 'name of the previously added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Disabled>' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    Then I can see the '<Enable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
    And I capture the page screenshot
    When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Enable_Sponsor_Organisation_Labels>' labels displayed in enable sponsor organisation confirmation page using the organisation name
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see a 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the sponsor organisation enabled successful message on manage sponsor organisation page
    And I capture the page screenshot
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter 'name of the previously added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
    And I capture the page screenshot

    Examples:
      | Status_Enabled | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Status_Disabled | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Navigation_Link |
      | enabled        | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | disabled        | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Back            |

  @rsp-5264 @BreadcrumbDisableExistingSponsorOrg
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
    When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see a 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Navigation_Link | Status_Enabled |
      | Back            | enabled        |