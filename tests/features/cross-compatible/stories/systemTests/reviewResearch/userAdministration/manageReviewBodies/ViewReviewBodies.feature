@UserAdministration @ViewReviewBodies @adminUser @SystemTest @rsp-2571 @rsp-2569
Feature: User Administration: Manage Review Bodies list and view review bodies profile details

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @viewListOfReviewBodies
    Scenario Outline: Verify the user is able to view list of review bodies in alphabetical order of Organisation Name
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I have navigated to the 'Manage_Review_Bodies_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        Then I can see the review body for '<Add_Review_Body>' is present in the list
        And I capture the page screenshot
        And I can see the status of the review body is '<Status>'
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'

        Examples:
            | Add_Review_Body          | Status  |
            | Valid_Data_In_All_Fields | enabled |

    @verifyManageReviewBodiesPageBackButtonFlow
    Scenario: Verify the user can navigate from 'Manage review bodies' page by clicking 'Back' button
        And I click the 'Back' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'System_Administration_Page'


    @viewEnabledDisabledReviewBodies
    Scenario Outline: Verify that user is able to view active and disabled review bodies
        When I search 'existing' review body and click on view edit link for '<Review_Body_Name>' with '<Status>' status
        Then I can see the review body profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'

        Examples:
            | Review_Body_Name                  | Status   |
            | Valid_Data_In_All_Fields          | ACTIVE   |
            | Valid_Data_In_All_Fields_Disabled | DISABLED |


    @viewNewReviewBody
    Scenario Outline: Verify that user is able to view review body details with blank last updated date for the new record
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        When I fill the new review body page using '<Review_Body_Name>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Review_Body_Name>'
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Review_Body_Name>'
        And I capture the page screenshot
        When I have navigated to the 'Manage_Review_Bodies_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I search 'new' review body and click on view edit link for '<Review_Body_Name>' with '<Status>' status
        And I can see the review body profile page
        And I capture the page screenshot
        Then I can see the last updated date field is blank

        Examples:
            | Review_Body_Name         | Status |
            | Valid_Data_In_All_Fields | ACTIVE |


