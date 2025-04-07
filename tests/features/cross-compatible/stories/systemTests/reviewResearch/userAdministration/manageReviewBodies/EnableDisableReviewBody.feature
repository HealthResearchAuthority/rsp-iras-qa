@UserAdministration @ManageReviewBodies @adminUser @SystemTest
Feature: User Administration: Manage Review Bodies - Enable / Disable Review Bodies

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'System_Admin' link on the 'Banner'
    And I can see the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    And I can see the manage review bodies list page
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I can see the Add a new review body page

  @rsp-2573 @DisableReviewBody
  Scenario Outline: Verify the user is able to disable a review body
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    And I can see the review body for '<Add_Review_Body>' is present in the list
    And I can see the status of the review body is '<Status_Enabled>'
    When I click the view edit link for the newly created review body
    Then I can see the '<Disable_Label_Texts>' ui labels on the manage review body profile page
    And I capture the page screenshot
    When I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Disable_Review_Body_Labels>' labels displayed in disable review body confirmation page using the organisation name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I validate '<Disable_Review_Body_Labels>' labels displayed in disable review body success page using the organisation name
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the manage review bodies list page
    And I can see the review body for '<Add_Review_Body>' is present in the list
    And I can see the status of the review body is '<Status_Disabled>'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Status_Enabled | Disable_Label_Texts | Disable_Review_Body_Labels | Status_Disabled |
      | Valid_Data_In_All_Fields | enabled        | Disable_Label_Texts | Disable_Review_Body_Labels | disabled        |

  @rsp-2573 @BreadcrumbDisableReviewBody
  Scenario Outline: Validate breadcrumb navigations in disable review body confirmation page
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    When I click the view edit link for the newly created review body
    When I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see a 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Navigation_Link | Disable_Label_Texts |
      | Valid_Data_In_All_Fields | Back            | Disable_Label_Texts |

  @rsp-2929 @EnableReviewBody
  Scenario Outline: Verify the user is able to enable a disabled review body
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    And I can see the review body for '<Add_Review_Body>' is present in the list
    And I can see the status of the review body is '<Status_Disabled>'
    When I click the view edit link for the newly created review body
    Then I can see the '<Enable_Label_Texts>' ui labels on the manage review body profile page
    And I capture the page screenshot
    When I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    Then I can see a 'Confirm' button on the 'Confirmation_Page'
    And I validate '<Enable_Review_Body_Labels>' labels displayed in enable review body confirmation page using the organisation name
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I validate '<Enable_Review_Body_Labels>' labels displayed in enable user profile success page using the organisation name
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the manage review bodies list page
    And I can see the review body for '<Add_Review_Body>' is present in the list
    And I can see the status of the review body is '<Status_Enabled>'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Status_Enabled | Enable_Label_Texts | Enable_Review_Body_Labels | Status_Disabled |
      | Valid_Data_In_All_Fields | enabled        | Enable_Label_Texts | Enable_Review_Body_Labels | disabled        |

  @rsp-2929 @BreadcrumbEnableReviewBody
  Scenario Outline: Validate breadcrumb navigations in enable review body confirmation page
    When I fill the new review body page using '<Add_Review_Body>'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    And I can see the manage review bodies list page
    And I click the view edit link for the newly created review body
    And I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see a 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Navigation_Link | Enable_Label_Texts |
      | Valid_Data_In_All_Fields | Back            | Enable_Label_Texts |
