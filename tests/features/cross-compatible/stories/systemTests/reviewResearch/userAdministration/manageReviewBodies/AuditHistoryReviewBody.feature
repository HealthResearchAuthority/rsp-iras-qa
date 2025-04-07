@UserAdministration @ManageReviewBodies @adminUser @SystemTest @rsp-2927
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the manage review bodies list page
    # And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    # And I can see the add a new review body page
    # When I fill the new review body page using 'Valid_Data_In_All_Mandatory_Fields'
    # And I click the 'Continue' button on the 'Create_Review_Body_Page'
    # Then I can see the Check and create review body page for 'Valid_Data_In_All_Mandatory_Fields'
    # When I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
    # Then I can see the create Review body confirmation page for 'Valid_Data_In_All_Mandatory_Fields'
    # And I capture the current time after creating a review body
    # When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
    # Then I can see the manage review bodies list page

    @VerifyAuditHistoryCreateReviewBody
    Scenario Outline: Verify the user can view the audit history after creating a review body
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_this_review_body_audit_history' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body created event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Validation_Text | Audit_History      |
            # | Valid_Data_In_All_Fields | header_Texts    | Create_Review_Body |
            | Valid_Data_In_All_Mandatory_Fields | header_Texts    | Create_Review_Body |

    @VerifyAuditHistoryDisableReviewBody
    Scenario Outline: Verify the user can view the audit history after disabling a review body
        # When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        # And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        # And I click the 'Confirm' button on the 'Confirmation_Page'
        # And I capture the current time after disabling a review body
        # And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        # Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'DISABLED' status from the manage review bodies page
        And I click the 'View_this_review_body_audit_history' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body disabled event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Validation_Text | Audit_History       |
            | Valid_Data_In_All_Mandatory_Fields | header_Texts    | Disable_Review_Body |
    # | Valid_Data_In_All_Fields           | header_Texts    | Disable_Review_Body |

    @VerifyAuditHistoryEnableReviewBody
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'DISABLED' status from the manage review bodies page
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time after enabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_this_review_body_audit_history' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body enabled event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Validation_Text | Audit_History      |
            | Valid_Data_In_All_Mandatory_Fields | header_Texts    | Enable_Review_Body |
    # | Valid_Data_In_All_Fields           | header_Texts    | Enable_Review_Body |

    @VerifyAuditHistoryEditReviewBody
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        # When I click the 'Change' link against '<Field_Name>' on the 'Review_Body_Profile_Page'
        When I click the change link against '<Field_Name>' on the review body profile page
        Then I can see the edit review body page for '<Add_Review_Body>'
        And I capture the current time after enabling a review body
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_this_review_body_audit_history' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body enabled event with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Field_Name        | Add_Another_Review_Body          | Validation_Text | Audit_History    |
            | Valid_Data_In_All_Mandatory_Fields | Organisation_Name | Valid_Data_In_All_Fields_Another | header_Texts    | Edit_Review_Body |
        # | Valid_Data_In_All_Fields           | header_Texts    | Enable_Review_Body |


        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the manage review bodies list page

        Examples:
            | Add_Review_Body          | Field_Name        | Add_Another_Review_Body          |
            | Valid_Data_In_All_Fields | Organisation_Name | Valid_Data_In_All_Fields_Another |
            | Valid_Data_In_All_Fields | Country           | Valid_Data_In_All_Fields_Another |
            | Valid_Data_In_All_Fields | Email_Address     | Valid_Data_In_All_Fields_Another |
            | Valid_Data_In_All_Fields | Description       | Valid_Data_In_All_Fields_Another |