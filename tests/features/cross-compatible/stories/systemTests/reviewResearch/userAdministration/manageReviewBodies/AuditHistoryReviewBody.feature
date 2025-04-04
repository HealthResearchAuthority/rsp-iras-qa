@UserAdministration @ManageReviewBodies @adminUser @SystemTest @rsp-2927
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Admin' link on the 'Banner'
        And I can see the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the Manage review bodies list page
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        And I can see the Add a new review body page

    @verifyCreateReviewBody
    Scenario Outline: Verify the user is able to create a new review body with valid data
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the Manage review bodies list page
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        # Can I Reuse below step from Create?
        # And I can see the list is sorted by default in the alphabetical order of the 'First Name'
        # Update Valid Data Org Name with timestamps to enable search for below
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
            | Add_Review_Body                    |
            | Valid_Data_In_All_Fields           |
            | Valid_Data_In_All_Mandatory_Fields |