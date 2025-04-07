@UserAdministration @ManageReviewBodies @adminUser @SystemTest @rsp-2927
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the manage review bodies list page
    # And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    # And I can see the add a new review body page

    @VerifyAuditHistoryCreateReviewBody
    Scenario Outline: Verify the user can view the audit history after creating a review body
        # When I fill the new review body page using '<Add_Review_Body>'
        # And I click the 'Continue' button on the 'Create_Review_Body_Page'
        # Then I can see the Check and create review body page for '<Add_Review_Body>'
        # When I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
        # Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        # When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        # Then I can see the manage review bodies list page
        When I search and click on view edit link of the newly created review body for '<Add_Review_Body>' with 'ACTIVE' status from the manage review bodies page
        And I click the 'View_this_review_body_audit_history' link on the 'View_Review_Body_Page'
        Then I can see the audit history page of the review body
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for '<Audit_History>'

        Examples:
            | Add_Review_Body          | Validation_Text | Audit_History      |
            | Valid_Data_In_All_Fields | header_Texts    | Create_Review_Body |
# | Valid_Data_In_All_Mandatory_Fields |header_Texts|Create_Review_Body||

