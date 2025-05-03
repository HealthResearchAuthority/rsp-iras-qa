@UserAdministration @ManageReviewBodies @adminUser @SystemTest @UserListReviewBody @rsp-3270
Feature: User Administration: Manage Review Bodies - View user list page of the review body, Search for the users and remove user from the review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @VerifyUserListCreateReviewBody @NoUsersReviewBody
    #  when there is no data to populate a table, then the table would not appear. something like 'There are no users, you can [add users]'
    Scenario Outline: Verify the user can view the user list page of the newly created review body
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
        And I can see no users in the review body with a message to add users to the review body

        Examples:
            | Add_Review_Body                    |
            | Valid_Data_In_All_Mandatory_Fields |

    @VerifyUserListAnyReviewBody
    Scenario: Verify the user can view the user list page of the any selected review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body



    @SearchResultsFound @BackToReviewBodyProfileLink @TestOnly
    Scenario Outline: Verify the user can view the user list page and search for the users in it and then navigate  back to review body profile page
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user ends here
        And I capture the page screenshot
        And I can see the user list of the selected review body is sorted by default in the alphabetical order of the 'First Name'
        When I enter an input into the search field to search for the existing 'first' user of the current review body for '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Back_To_Review_Body_Profile' link on the 'Review_Body_User_List_Page'
        Then I can see the review body profile page

        Examples:
            | Field_Name    |
            | First_Name    |
            # | Last_Name     |
            | Email_Address |
    # there is bug  with Last name search: searck key is getting cleared when clicking next button,previous button also,count also different,earlier it was 44 now it is 45



    @SearchResultsFound @NoResultsFoundRemoveUser @rsp-3273 @RemoveAnotherUserFromTheReviewBodyLink @ManageUsersLink
    Scenario: Verify the user can search and remove existing user of the selected review body and navigate to manage users page when no results found in the search for removed user
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message
        When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Users_Page'

    @SearchResultsFound @NoResultsFoundRemoveUser @rsp-3273 @RemoveAnotherUserFromTheReviewBodyLink @ManageUsersLink
    Scenario: Verify the user can search and remove existing user of the selected review body and repeat the process with remove another user from the review body link
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message
        When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Users_Page'

    @SearchResultsFound @NoResultsFoundRemoveUser @BackToReviewBodyUserListAfterRemoveUser @rsp-3273 @RemoveAnotherUserFromTheReviewBodyLink
    Scenario: Verify the user can search and remove the user from the selected review body and navigate to review body user list page when no results found for the removed user
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message
        When I click the 'Back_To_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
    # Back to Users HRA1  >>bug Back to Users for HRA1

    @SearchResultsFound @BackToManageReviewBodiesRemoveUser @rsp-3273
    Scenario: Verify the user can search and remove the existing user from the selected review body and navigate to manage review bodies page from the confirmation page
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'

    @SearchResultsFound @BackToReviewBodyUserListCheckRemoveUser @rsp-3273
    Scenario: Verify the user can navigate to user list page of the review body from check and remove user profile page using back link
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        # When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
        Then I can see the user list page of the review body

    @RemoveUserNoSearch @rsp-3273
    Scenario: Verify the user can navigate to user list page of the review body and remove any user from the review body without using search
        When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        And I enter an input into the search field to search for a user not added in the current review body
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        # add user ends here
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
        Then I can see the user list page of the review body

# Notes:
# One design change :when there is no data to populate a table, then the table would not appear. something like 'There are no users, you can [add users]'
# https://nihr.atlassian.net/browse/RSP-3422 >> Manage review body - List of users associated with review body - search results when no matches
# Expected Result:  AC 5.1 b. If there is not a user of the current review body that matches the search criteria then the no results found message will be presented to the user https://www.figma.com/design/w7EIAoM1EPyHZN9Z3Cj9Kf/User-administration---Manage-review-bodies?node-id=6016-4425&t=UmhNPFR7PZlgggfR-1Connect your Figma account
# Actual Result: Text in search box disappears ,No results found message does not appear
# https://nihr.atlassian.net/browse/RSP-3384 >> Manage review body - List of users associated with review body - typo
# Expected Result: AC 2.3.i. When on the no results message page if the user selects the ‘Back to Users for [review body name]’ link then the user will be taken to the review body’s list of users
# Actual Result: Link states ‘Back to Users [review body name]’
# https://nihr.atlassian.net/browse/RSP-3506 >> Manage review body - Remove user associated with review body - Success screen - typo
# Expected Result: First hyperlink to state: Remove another user from the review body
# Actual Result: First hyperlink states: Remove another user from review body










