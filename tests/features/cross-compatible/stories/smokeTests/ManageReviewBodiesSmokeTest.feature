@SysAdminUser @ManageReviewBodiesSmokeFeature @Smoke
Feature: User Administration: Manage Review Bodies

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'

  @ManageReviewBodiesSmokeVerifyEnableAndEditReviewBodyAuditHistory @KNOWN-DEFECT-RSP-5003 @fail
  Scenario Outline: Verify the user can view the audit history after enabling a review body
    When I enter 'QA Automation' into the search field
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using 'Advanced_Filter_All_Countries_Disabled'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is '<Status_Disabled>'
    And I can see the review body profile page
    And I capture the page screenshot
        # enable review body
    And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
    And I capture the page screenshot
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Clear_All_Filters' link on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters 'Advanced_Filter_All_Countries_Disabled' are removed from active filters for manage review bodies page
    When I enter 'name of the previously used review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I can see the 'previously used review body' should be present in the list with '<Status_Enabled>' status in the manage review bodies page
    And I capture the page screenshot
    Then I click the view edit link
    And I capture the page screenshot
    And I can see the review body profile page
    And I capture the page screenshot
        # edit review body
    When I click the change link against '<Field_Name_One>' on the review body profile page
    And I can see the edit review body page
    And I capture the page screenshot
    When I fill the edit review body page using '<Edit_Review_Body>'
    And I capture the page screenshot
    And I click the 'Save' button on the 'Edit_Review_Body_Page'
    And I capture the current time for 'Audit_History_Review_Body_Page'
        # validate edited data in review body profile page
    Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_One>'
    Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Two>'
    Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Three>'
    Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Four>'
    And I capture the page screenshot
        # audit history
    And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
    Then I can see the audit history page of the review body
    And I capture the page screenshot
        # audit history sorting
    And I can see the default sort should be the most recent entry first based on date and time
    And I can see the audit history for all the fields edited event with '<Audit_History>'

    Examples:
      | Add_Review_Body          | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Edit_Review_Body           | Audit_History               | Status_Enabled | Status_Disabled |
      | Valid_Data_In_All_Fields | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_Edit_All_Fields | Edit_Review_Body_All_Fields | Enabled        | Disabled        |
