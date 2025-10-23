@UserAdministration @ManageSponsorOrgs @SysAdminUser @SystemTest @DisableEnableSponsorOrg @STSysAdmin
Feature: Feature: User Administration: Manage Sponsor Organisations- Enable / Disable Sponsor Organisations

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'

  @rsp-5264 @DisableExistingSponsorOrg
  Scenario Outline: Verify the user is able to disable a review body
    When I enter 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    # When I click the view edit link
    And I capture the page screenshot
    Then I can see the '<Disable_Label_Texts>' ui labels on the manage review body profile page
    And I capture the page screenshot
    When I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Disable_Review_Body_Labels>' labels displayed in disable review body confirmation page using the organisation name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    # Sponsor organisation disabled
    # Then I can see the sponsor organisation disabled successful message on manage sponsor organisation page
    Then I can see the user added successful message on sponsor organisation user list page
    And I capture the page screenshot
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' should be present in the list with '<Status_Disabled>' status in the manage sponsor organisation page
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Status_Enabled | Disable_Label_Texts | Disable_Review_Body_Labels | Status_Disabled |
      | Valid_Data_In_All_Fields | enabled        | Disable_Label_Texts | Disable_Review_Body_Labels | disabled        |

  @rsp-5264 @BreadcrumbDisableExistingSponsorOrg
  Scenario Outline: Validate breadcrumb navigations in disable review body confirmation page
    When I enter 'Academic Medical Center at the University of Amsterdam (Netherlands)' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'Academic Medical Center at the University of Amsterdam (Netherlands)' should be present in the list with 'Active' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I capture the page screenshot
    # When I click the view edit link
    When I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see a 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Navigation_Link | Disable_Label_Texts | Status_Enabled |
      | Valid_Data_In_All_Fields | Back            | Disable_Label_Texts | enabled        |

  @rsp-5327 @EnableExistingSponsorOrg
  Scenario Outline: Verify the user is able to enable a disabled review body
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the view edit link for the 'newly created review body'
    And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    Then I can see the review body for '<Add_Review_Body>' is present in the list with '<Status_Disabled>' status
    And I capture the page screenshot
    When I click the view edit link
    Then I can see the '<Enable_Label_Texts>' ui labels on the manage review body profile page
    And I capture the page screenshot
    When I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Enable_Review_Body_Labels>' labels displayed in enable review body confirmation page using the organisation name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I validate '<Enable_Review_Body_Labels>' labels displayed in enable review body success page using the organisation name
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    Then I can see the review body for '<Add_Review_Body>' is present in the list with '<Status_Enabled>' status
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Status_Enabled | Enable_Label_Texts | Enable_Review_Body_Labels | Status_Disabled |
      | Valid_Data_In_All_Fields | enabled        | Enable_Label_Texts | Enable_Review_Body_Labels | disabled        |

  @rsp-5327 @BreadcrumbEnableSponsorOrg
  Scenario Outline: Validate breadcrumb navigations in enable review body confirmation page
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Disabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see a 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Navigation_Link | Enable_Label_Texts |
      | Valid_Data_In_All_Fields | Back            | Enable_Label_Texts |
