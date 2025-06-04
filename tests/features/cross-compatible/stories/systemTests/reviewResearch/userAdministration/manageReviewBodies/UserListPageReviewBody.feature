@UserAdministration @ManageReviewBodies @adminUser @SystemTest @UserListReviewBody @rsp-3270
Feature: User Administration: Manage Review Bodies - View user list page of the review body, Search for the users and remove user from the review body

        Background:
                Given I have navigated to the 'System_Administration_Page'
                And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
                Then I can see the 'Manage_Review_Bodies_Page'

        @VerifyUserListCreateReviewBody @UserListReviewBodyNoUsersReviewBody
        Scenario: Verify the user can view the user list page of the newly created review body
                And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
                Then I can see the 'Create_Review_Body_Page'
                And I capture the page screenshot
                When I fill the new review body page using 'Valid_Data_In_All_Mandatory_Fields'
                And I capture the page screenshot
                And I click the 'Continue' button on the 'Create_Review_Body_Page'
                And I capture the page screenshot
                Then I can see the check and create review body page for 'Valid_Data_In_All_Mandatory_Fields'
                When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
                Then I can see the create Review body confirmation page for 'Valid_Data_In_All_Mandatory_Fields'
                And I capture the page screenshot
                When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
                Then I can see the 'Manage_Review_Bodies_Page'
                And I capture the page screenshot
                When I enter unique organisation name of the newly created review body into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                Then I click the view edit link for the newly created review body
                And I can see the review body profile page
                And I capture the page screenshot
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                Then I can see the user list page of the review body
                And I capture the page screenshot
                And I can see no users in the review body with a message to add users to the review body
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays no results found message in the user list page of the review body

        @UserListReviewBodyDefaultSort
        Scenario: Verify the user can view the user list page of any selected review body and it is sorted by default in the alphabetical order of the 'First Name'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                Then I can see the user list page of the review body
                And I capture the page screenshot
                And I can see the user list of the selected review body is sorted by default in the alphabetical order of the 'First Name'


        @UserListReviewBodySearchResultsFound @UserListReviewBodyBackToReviewBodyProfileLink
        Scenario Outline: Verify the user can search for the users in the user list page and navigate back to review body profile page
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                And I capture the page screenshot
                When I enter the '<Field_Name>' of the '<Position>' user shown on the current review body users list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Back_To_Review_Body_Profile' link on the 'Review_Body_User_List_Page'
                Then I can see the review body profile page

                Examples:
                        | Field_Name    | Position |
                        | First_Name    | First    |
                        | Last_Name     | First    |
                        | Email_Address | First    |
                        | First_Name    | Last     |
                        | Last_Name     | Last     |
                        | Email_Address | Last     |
                        | Full_Name     | First    |
                        | Full_Name     | Last     |

        @UserListReviewBodyNoResultsFoundRemoveUser @rsp-3273 @UserListReviewBodyRemoveAnotherUserFromTheReviewBodyLink
        Scenario: Verify the user can search and remove existing user of the selected review body and navigate to manage users page when no results found in the search for removed user
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                Then I can see the user list page of the review body
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
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
                Then the system displays no results found message in the user list page of the review body
                When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Users_Page'
                And I search and click on view edit link for the removed user from the review body in the manage user page
                Then I can see the user profile page of the removed user from the review body

        @rsp-3273 @UserListReviewBodyManageUsersLink
        Scenario: Verify the user can search and remove existing user of the selected review body and repeat the process with remove another user from the review body link
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                Then I can see the user list page of the review body
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the check and remove user profile page
                And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
                And I capture the page screenshot
                And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
                And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
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
                Then the system displays no results found message in the user list page of the review body
                When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Users_Page'

        @UserListReviewBodyBackToReviewBodyUserListAfterRemoveUser @rsp-3273 @UserListReviewBodyBackToUsersLink
        Scenario: Verify the user can search and remove the user from the selected review body and navigate to review body user list page when no results found for the removed user
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
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
                Then the system displays no results found message in the user list page of the review body
                When I click the 'Back_To_Users' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body


        @UserListReviewBodyBackToManageReviewBodiesRemoveUser @rsp-3273
        Scenario: Verify the user can search and remove the existing user from the selected review body and navigate to manage review bodies page from the confirmation page
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the check and remove user profile page
                And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
                And I capture the page screenshot
                And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
                When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Review_Bodies_Page'

        @UserListReviewBodyBackToReviewBodyUserListCheckRemoveUser @rsp-3273
        Scenario: Verify the user can navigate to user list page of the review body from check and remove user profile page using back link
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                When I enter the 'Email Address' of the 'last' user shown on the current review body users list, into the search field
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then the system displays search results matching the search criteria
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the check and remove user profile page
                And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
                Then I can see the user list page of the review body

        @UserListReviewBodyRemoveUserNoSearch @rsp-3273
        Scenario: Verify the user can navigate to user list page of the review body and remove any user from the review body without using search
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
                And I select a 'QA Automation' Review Body to View and Edit which is 'Enabled'
                And I capture the page screenshot
                And I can see the review body profile page
                And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the review body
                And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
                When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
                And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
                And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
                Then I can see the user list page of the review body
                And I click the 'Search' button on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                When I click the 'Remove' link on the 'Review_Body_User_List_Page'
                And I capture the page screenshot
                Then I can see the check and remove user profile page
                And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
                Then I can see the user list page of the review body











