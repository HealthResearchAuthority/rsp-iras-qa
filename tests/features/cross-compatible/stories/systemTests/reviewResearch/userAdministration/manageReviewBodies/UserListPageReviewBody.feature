@UserAdministration @ManageReviewBodies @adminUser @SystemTest @UserListReviewBody @rsp-3270
Feature: User Administration: Manage Review Bodies - View user list page of the review body and Search for the users

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @VerifyUserListCreateReviewBody
    Scenario Outline: Verify the user can view the user list page of the review body and search for the users after creating a review body
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
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the newly created review body
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                    |
            | Valid_Data_In_All_Fields           |
            | Valid_Data_In_All_Mandatory_Fields |

    @VerifyUserListFirstReviewBody @SearchResultsFound
    Scenario: Verify the user can view the user list page of the first review body and search for the users in it
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        When I enter an input into the search field to search for the existing user of the current review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        Then the system displays search results matching the search criteria

    @VerifyUserListFirstReviewBody @NoResultsFound
    Scenario: Verify the user can view the user list page of the first review body and search for the users in it
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        When I enter an input into the search field to search for the existing user of the current review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        # When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        Then the system displays no results found message


    # When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
    # Back to Users HRA1

    # Given the user has entered an input into the search field
    # When they select search
    # Then the system will search on first name, last name, and email address to find a user of the current review body who matches the search criteria
    # a. If there is a user/users on the system that matches the search criteria in 10.1 then they will appear in the table
    # b. If there is not a user of the current review body that matches the search criteria then the no results found message will be presented to the user

    # i. When on the no results message page if the user selects the ‘Back to Users for [review body name]’ link then the user will be taken to the review body’s list of users
    # ii. When on the no results message page if the user selects the ‘Manage users’ then the user will be taken to the manage users list page

    # And I can see the audit history for the review body 'created' event for '<Add_Review_Body>' with '<Audit_History>'


    @VerifyUserListAnyReviewBody
    Scenario: Verify the user can view the user list page of the selected review body and search for the users in it
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot


