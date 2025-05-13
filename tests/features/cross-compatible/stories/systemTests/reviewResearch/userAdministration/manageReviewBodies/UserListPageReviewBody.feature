@UserAdministration @ManageReviewBodies @adminUser @SystemTest @UserListReviewBody @rsp-3270
Feature: User Administration: Manage Review Bodies - View user list page of the review body, Search for the users and remove user from the review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @VerifyUserListCreateReviewBody @NoUsersReviewBody
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
        Then the system displays no results found message

    @DefaultSort
    Scenario: Verify the user can view the user list page of any selected review body and it is sorted by default in the alphabetical order of the 'First Name'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user ends here
        And I capture the page screenshot
        And I can see the user list of the selected review body is sorted by default in the alphabetical order of the 'First Name'


    @SearchResultsFound @BackToReviewBodyProfileLink
    Scenario Outline: Verify the user can search for the users in the user list page and navigate back to review body profile page
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        # add user ends here
        And I capture the page screenshot
        When I enter an input into the search field to search for the existing '<Position>' user of the current review body for '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on '<Field_Name>'
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
    # bug for full name search

    @NoResultsFoundRemoveUser @rsp-3273 @RemoveAnotherUserFromTheReviewBodyLink
    Scenario: Verify the user can search and remove existing user of the selected review body and navigate to manage users page when no results found in the search for removed user
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on 'Email_Address'
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
        And I search and click on view edit link for the removed user from the review body in the manage user page
        Then I can see the user profile page of the removed user from the review body

    @rsp-3273 @ManageUsersLink
    Scenario: Verify the user can search and remove existing user of the selected review body and repeat the process with remove another user from the review body link
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on 'Email_Address'
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
        Then the system displays search results matching the search criteria based on 'Email_Address'
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

    @BackToReviewBodyUserListAfterRemoveUser @rsp-3273 @BackToUsersLink
    Scenario: Verify the user can search and remove the user from the selected review body and navigate to review body user list page when no results found for the removed user
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on 'Email_Address'
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


    @BackToManageReviewBodiesRemoveUser @rsp-3273
    Scenario: Verify the user can search and remove the existing user from the selected review body and navigate to manage review bodies page from the confirmation page
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on 'Email_Address'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'

    @BackToReviewBodyUserListCheckRemoveUser @rsp-3273
    Scenario: Verify the user can navigate to user list page of the review body from check and remove user profile page using back link
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        # add user ends here
        When I enter an input into the search field to search for the existing 'last' user of the current review body for 'Email_Address'
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria based on 'Email_Address'
        When I click the first 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
        Then I can see the user list page of the review body

    @RemoveUserNoSearch @rsp-3273
    Scenario: Verify the user can navigate to user list page of the review body and remove any user from the review body without using search
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        # add user and then search
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_For_User_To_Add_To_Review_Body'
        When I click the first 'Add_User' link on the 'Search_For_User_To_Add_To_Review_Body'
        And I click the 'Add_User_Profile' button on the 'Check_Add_User_Profile_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_For_User_To_Add_To_Review_Body'
        Then I can see the user list page of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        # add user ends here
        And I capture the page screenshot
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
# https://nihr.atlassian.net/browse/RSP-3506 >> Manage review body - Remove user associated with review body - Success screen - typo
# Expected Result: First hyperlink to state: Remove another user from the review body
# Actual Result: First hyperlink states: Remove another user from review body
# bug for full name search










