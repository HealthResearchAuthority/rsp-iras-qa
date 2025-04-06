@UserAdministration @ManageReviewBodies @viewReviewBodies @adminUser @rsp-2571 @rsp-2569
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Admin' link on the 'Banner'
        And I can see the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the Manage review bodies list page

    @viewListOfReviewBodies
    Scenario Outline: Verify the user is able to view list of review bodies in alphabetical order of Organisation Name
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        And I can see the Add a new review body page
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the Manage review bodies list page
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
            | Add_Review_Body                    |
            | Valid_Data_In_All_Fields           |
            | Valid_Data_In_All_Mandatory_Fields |


    @verifyManageReviewBodiesPageBackButtonFlow
    Scenario: Verify the user can navigate from 'Manage review bodies' page by clicking 'Back' button
        And I click the 'Back' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'System_Administration_Page'


    @viewReviewBodies
    Scenario Outline: Verify that user is able to view active and disabled review bodies
        When I search and click on view edit link for '<Review_Body_Name>' review body with '<Status>' status
        Then I can see the review body profile page
        And I can verify the field values on review body profile page for '<Review_Body_Name>'
        When I click the 'Back' link on the 'Review_Body_Profile_Page'
        Then I can see the Manage review bodies list page

        Examples:
            | Review_Body_Name                  | Status   |
            | Valid_Data_In_All_Fields          | ACTIVE   |
            | Valid_Data_In_All_Fields_Disabled | DISABLED |


    @viewNewReviewBody
    Scenario Outline: Verify that user is able to view review body details with blank last updated date for the new record
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        And I can see the Add a new review body page
        When I fill the new review body page using '<Review_Body_Name>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Review_Body_Name>'
        When I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'
        And I can see the create Review body confirmation page for '<Review_Body_Name>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the Manage review bodies list page
        And I search and click on view edit link for '<Review_Body_Name>' review body with '<Status>' status
        And I can see the review body profile page
        Then I can see the last updated date field is blank

        Examples:
            | Review_Body_Name         | Status |
            | Valid_Data_In_All_Fields | ACTIVE |


