@UserAdministration @ManageReviewBodies @SysAdminUser @SystemTest @AuditHistoryReviewBody @rsp-2927
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @VerifyAuditHistoryCreateReviewBody
    Scenario Outline: Verify the user can view the audit history after creating a review body
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I capture the page screenshot
        Then I can see the check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the 'newly created review body'
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the selected review body for '<Add_Review_Body>'
        And I capture the page screenshot
        And I can see the audit history for the review body 'created' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Audit_History      |
            | Valid_Data_In_All_Fields           | Create_Review_Body |
            | Valid_Data_In_All_Mandatory_Fields | Create_Review_Body |

    @VerifyAuditHistoryDisableReviewBody
    Scenario Outline: Verify the user can view the audit history after disabling a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with '<Status_Disabled>' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history for the review body 'disabled' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body          | Audit_History       | Status_Enabled | Status_Disabled |
            | Valid_Data_In_All_Fields | Disable_Review_Body | Enabled        | Disabled        |

    @VerifyAuditHistoryEnableReviewBody
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Disabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with '<Status_Enabled>' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history for the review body 'enabled' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Audit_History      | Status_Enabled | Status_Disabled |
            | Enable_Review_Body | Enabled        | Disabled        |

    @VerifyAuditHistoryEditReviewBodyOrgName
    Scenario Outline: Verify the user can view the audit history after editing organization name of a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history for 'Organisation_Name' edited event with '<Audit_History>'

        Examples:
            | Field_Name        | Edit_Review_Body                     | Audit_History                      | Status_Enabled |
            | Organisation_Name | Valid_Data_Organisation_Name_Another | Edit_Review_Body_Organisation_Name | Enabled        |

    @VerifyAuditHistoryEditReviewBodyCountry
    Scenario Outline: Verify the user can view the audit history after editing country of a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I can see the updated review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history page heading
        And I can see the audit history for 'Country' edited event with '<Audit_History>'

        Examples:
            | Field_Name | Edit_Review_Body           | Audit_History            | Status_Enabled |
            | Country    | Valid_Data_Country_Another | Edit_Review_Body_Country | Enabled        |

    @VerifyAuditHistoryEditReviewBodyEmail
    Scenario Outline: Verify the user can view the audit history after editing email address of a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I can see the updated review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history page heading
        And I can see the audit history for 'Email_Address' edited event with '<Audit_History>'

        Examples:
            | Field_Name    | Edit_Review_Body         | Audit_History                  | Status_Enabled |
            | Email_Address | Valid_Data_Email_Another | Edit_Review_Body_Email_Address | Enabled        |

    @VerifyAuditHistoryEditReviewBodyDescription @fail
    Scenario Outline: Verify the user can view the audit history after editing description of a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I can see the updated review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history page heading
        And I can see the audit history for 'Description' edited event with '<Audit_History>'

        Examples:
            | Field_Name  | Edit_Review_Body               | Audit_History                | Status_Enabled |
            | Description | Valid_Data_Description_Another | Edit_Review_Body_Description | Enabled        |

    @VerifyAuditHistoryEditReviewBodyAllFields
    Scenario Outline: Verify the user can view the audit history after editing all the fields of a review body
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name_One>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_One>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Two>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Three>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Four>'
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history for all the fields edited event with '<Audit_History>'

        Examples:
            | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Edit_Review_Body           | Audit_History               | Status_Enabled |
            | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_Edit_All_Fields | Edit_Review_Body_All_Fields | Enabled        |


    @VerifyAuditHistoryDefaultSort
    Scenario: Verify the default sort of the audit history should be the most recent entry first based on date and time
        And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with 'disabled' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with 'Enabled' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the change link against 'Organisation_Name' on the review body profile page
        And I capture the page screenshot
        And I can see the edit review body page
        When I fill the edit review body page using 'Valid_Data_Organisation_Name_Another' for field 'Organisation_Name'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        And I capture the page screenshot
        Then I now see the review body profile page with the updated 'Valid_Data_Organisation_Name_Another' for field 'Organisation_Name'
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the default sort should be the most recent entry first based on date and time

    @VerifyAuditHistoryBackLinkNavigation
    Scenario: Verify the user can navigate from audit History page of the review body by clicking 'Back' link
        And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I capture the page screenshot
        And I can see the review body profile page


# Points to note:
# Validate date time format.>>will change later
# Validate audit history for each review body when the the system admin user email is updated.- Suitable for manual validation
# Out of scope now >>need to cover later when the feature is developed[User added to review body/User removed from review body]
# User added to review body- [User email address] was added to [Organisation name]
# User removed from review body-[User email address] was removed from [Organisation name]
# fail in this case when the previous description was empty
# Description was changed from (null) to qaauto_Responsible for confirmation of research governance compliance Test Update all fields