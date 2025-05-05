@UserAdministration @ManageReviewBodies @AddUserToReviewBody @adminUser @SystemTest @rsp-3258 @only
Feature: User Administration: Manage Review Bodies - Add user to review body

    Background:
        Given I have navigated to the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        # Add Tiji Assert on page step
        And I click the 'Add_User_To_Review_Body' link on the 'Review_Body_Users_Page'
        And I can see the search for user to add to review body page
        And I capture the page screenshot

    @addUserReviewBodySearchFunctionResults
    Scenario Outline: Verify that the search function, for existing users that can be added to the review body, returns expected results
        When I fill the search input with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Review_Body_Users_Page'
        Then I can see that the add users to review body search page contains 'Results'
        And I capture the page screenshot
        And the add users to review body search has returned results with the '<Search_Query>'

        Examples:
            | Search_Query                |
            | Existing_QA_User_First_Name |
            | Existing_QA_User_Last_Name  |
            | Existing_QA_User_Email      |
            # | Existing_QA_User_Full_Name  | defect?

    @addUserReviewBodySearchFunctionNoResults
    Scenario: Verify that the add users to review body search function returns a no results page, when no such user exists
        When I fill the search input with 'Non_Existant_User_Data' as the search query
        And I click the 'Search' button on the 'Review_Body_Users_Page'
        Then I can see that the add users to review body search page contains 'No_Results'
        And I capture the page screenshot
    # Need to use Tiji step to set found review body name var and get to assert back to <Review body name> link


    @verifySearchAddUserReviewbodyPageNavigationLinks
    Scenario Outline: Verify the user can navigate away from the add users to review body search page using the available links
        And I fill the search input with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Review_Body_Users_Page'
        And I capture the page screenshot
        When I click the '<Link>' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the '<Page>'

        Examples:
            | Search_Query                | Link          | Page                   |
            | Existing_QA_User_First_Name | Back          | Review_Body_Users_Page |
            | Non_Existant_User_Data      | Back_To_Users | Review_Body_Users_Page |
            | Non_Existant_User_Data      | Manage_Users  | Manage_Users_Page      |

    @verifyCheckAddUserReviewbodyPageBackLink
    Scenario Outline: Verify the user can navigate back from the check add user to review body page using the back link
        And I fill the search input with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Review_Body_Users_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        # Then I can see the 'Check_Add_User_Review_Body_Page' Create Check Page and Add unique Page step
        And I capture the page screenshot
        And I click the 'Back' link on the 'Check_Add_User_Review_Body_Page'
        And I can see the search for user to add to review body page
        And I capture the page screenshot

    # Undo last commit and add it to new feature branch before continuing
    # Add user and check rev body user list updated (need Tiji code)
    # Add user and search to add same user - no results expected
    # Check nav from success page (scenario 5)