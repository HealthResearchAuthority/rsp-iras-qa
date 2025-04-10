@UserAdministration @ManageReviewBodies @adminUser @SystemTest
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the manage review bodies list page

    @VerifyAuditHistoryCreateReviewBody @rsp-2927
    Scenario Outline: Verify the user can view the audit history after creating a review body
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        And I can see the add a new review body page
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        And I capture the current time after creating a review body
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the selected review body for '<Add_Review_Body>'
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body created event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Validation_Text | Audit_History      |
            # | Valid_Data_In_All_Fields | header_Texts    | Create_Review_Body |
            | Valid_Data_In_All_Mandatory_Fields | header_Texts    | Create_Review_Body |

    @VerifyAuditHistoryDisableReviewBody @rsp-2927
    Scenario Outline: Verify the user can view the audit history after disabling a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time after disabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the disabled review body with 'DISABLED' status from the manage review bodies page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body disabled event with '<Audit_History>'

        Examples:
            | Validation_Text | Audit_History       |
            | header_Texts    | Disable_Review_Body |
    # | header_Texts    | Disable_Review_Body |

    @VerifyAuditHistoryEnableReviewBody @rsp-2927
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the disabled review body with 'DISABLED' status from the manage review bodies page
        And I can see the review body profile page
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time after enabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the enabled review body with 'ACTIVE' status from the manage review bodies page
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body enabled event with '<Audit_History>'

        Examples:
            | Validation_Text | Audit_History      |
            | header_Texts    | Enable_Review_Body |
    #  | header_Texts    | Enable_Review_Body |

    @VerifyAuditHistoryEditReviewBodyOrgName @rsp-2927
    Scenario Outline: Verify the user can view the audit history after editing organization name of a review body
        # When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time after editing a review body
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for organisation name edited event with '<Audit_History>'

        Examples:
            | Field_Name        | Edit_Review_Body                     | Validation_Text | Audit_History                      |
            | Organisation_Name | Valid_Data_Organisation_Name_Another | header_Texts    | Edit_Review_Body_Organisation_Name |

    @VerifyAuditHistoryEditReviewBodyCountry @rsp-2927
    Scenario Outline: Verify the user can view the audit history after editing country of a review body
        # When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        # Then I can see the edit review body page for audit
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        # And I fill the new review body page for audit using '<Edit_Review_Body>'
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time after editing a review body
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name>'
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for country edited event with '<Audit_History>'

        Examples:
            | Field_Name | Edit_Review_Body           | Validation_Text | Audit_History            |
            | Country    | Valid_Data_Country_Another | header_Texts    | Edit_Review_Body_Country |

    @VerifyAuditHistoryEditReviewBodyEmail
    Scenario Outline: Verify the user can view the audit history after editing email address of a review body
        # When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        When I click the change link against '<Field_Name>' on the review body profile page
        # Then I can see the edit review body page for audit
        And I can see the review body profile page
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        # And I fill the new review body page for audit using '<Edit_Review_Body>'
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time after editing a review body
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for organisation name edited event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Field_Name    | Edit_Review_Body         | Validation_Text | Audit_History                  |
            | Valid_Data_In_All_Mandatory_Fields | Email_Address | Valid_Data_Email_Another | header_Texts    | Edit_Review_Body_Email_Address |

    @VerifyAuditHistoryEditReviewBodyDescription
    Scenario Outline: Verify the user can view the audit history after editing email address of a review body
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        When I click the change link against '<Field_Name>' on the review body profile page
        # When I click the change link against '<Field_Name>' on the review body profile page
        Then I can see the edit review body page for audit
        And I fill the new review body page for audit using '<Edit_Review_Body>'
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time after editing a review body
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for organisation name edited event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Field_Name  | Edit_Review_Body               | Validation_Text | Audit_History                |
            | Valid_Data_In_All_Mandatory_Fields | Description | Valid_Data_Description_Another | header_Texts    | Edit_Review_Body_Description |

    @VerifyAuditHistoryDefaultSort @rsp-2927  @VerifyAuditHistoryBackLinkNavigation
    Scenario: Verify the default sort of the audit history should be the most recent entry first based on date and time
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        # Then I can see the audit history page of the review body
        Then I can see the audit history page of the selected review body
        And I can see the 'header_Texts' ui labels on the audit history page of the review body
        And I can see the audit history for the review body created event with 'Create_Review_Body'
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I click the 'Back' link on the 'Review_Body_Profile_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'ACTIVE' status from the manage review bodies page
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time after disabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'DISABLED' status from the manage review bodies page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the 'header_Texts' ui labels on the audit history page of the review body
        And I can see the audit history for the review body disabled event with 'Disable_Review_Body'
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I click the 'Back' link on the 'Review_Body_Profile_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'DISABLED' status from the manage review bodies page
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time after enabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the 'header_Texts' ui labels on the audit history page of the review body
        And I can see the audit history for the review body enabled event with 'Enable_Review_Body'
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I click the 'Back' link on the 'Review_Body_Profile_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'ACTIVE' status from the manage review bodies page
        When I click the change link against 'Organisation_Name' on the review body profile page
        # When I click the change link against '<Field_Name>' on the review body profile page
        Then I can see the edit review body page for audit
        And I fill the new review body page for audit using 'Organisation_Name_Another'
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time after editing a review body
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the 'header_Texts' ui labels on the audit history page of the review body
        And I can see the audit history for organisation name edited event with 'Edit_Review_Body_Organisation_Name'
        # When I search and click on view edit link of the newly created review body for 'Valid_Data_In_All_Mandatory_Fields' with 'ACTIVE' status from the manage review bodies page
        # When I click the change link against 'Email_Address' on the review body profile page
        # # When I click the change link against '<Field_Name>' on the review body profile page
        # Then I can see the edit review body page for audit
        # And I fill the new review body page for audit using 'Email_Another'
        # And I click the 'Save' button on the 'Edit_Review_Body_Page'
        # And I capture the current time after editing a review body
        # And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        # Then I can see the audit history page of the review body
        # And I can see the 'header_Texts' ui labels on the audit history page of the review body
        # And I can see the audit history for email address edited event with 'Edit_Review_Body_Email_Address'
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the default sort should be the most recent entry first based on date and time








# Validate date time format.>>will change later
# Validate audit history for each review body when the the system admin user email is updated.- Suitable for manual validation
# Edit all field together and check audit history
# Out of scope now >>need to cover later when the feature is developed[User added to review body/User removed from review body]
# User added to review body- [User email address] was added to [Organisation name]
# User removed from review body-[User email address] was removed from [Organisation name]