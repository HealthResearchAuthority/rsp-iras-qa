@UserAdministration @ManageReviewBodies @AddUserToReviewBody @adminUser @SystemTest @rsp-3258
Feature: User Administration: Manage Review Bodies - Add user to review body

    Background:
        Given I have navigated to the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I can see the user list page of the review body
        And I click the 'Add_User_To_Review_Body' link on the 'Review_Body_User_List_Page'
        And I can see the search for user to add to review body page
        And I capture the page screenshot

    @addUserReviewBodySearchFunctionResults
    Scenario Outline: Verify that the search function, for existing users that can be added to the review body, returns expected results
        When I fill the search input for add users to review body with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
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
        When I fill the search input for add users to review body with 'Non_Existant_User_Data' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        Then I can see that the add users to review body search page contains 'No_Results'
        And I capture the page screenshot

    @verifySearchAddUserReviewbodyPageNavigationLinks
    Scenario Outline: Verify the user can navigate away from the add users to review body search page using the available links
        And I fill the search input for add users to review body with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I capture the page screenshot
        When I click the '<Link>' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the '<Page>'
        And I capture the page screenshot

        Examples:
            | Search_Query                | Link          | Page                       |
            | Existing_QA_User_First_Name | Back          | Review_Body_User_List_Page |
            | Non_Existant_User_Data      | Back_To_Users | Review_Body_User_List_Page |
            | Non_Existant_User_Data      | Manage_Users  | Manage_Users_Page          |

    @verifyCheckAddUserReviewbodyPageValues
    Scenario: Verify the check add user to review body page displays the correct user details
        And I fill the search input for add users to review body with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I can see that the add users to review body search page contains 'Results'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the check and add user to review body page
        And I capture the page screenshot
        And the check and add user to review body page displays the expected user details

    @verifyCheckAddUserReviewbodyPageBackLink
    Scenario: Verify the user can navigate back from the check add user to review body page using the back link
        And I fill the search input for add users to review body with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I can see the check and add user to review body page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Check_Add_User_Review_Body_Page'
        Then I can see the search for user to add to review body page
        And I capture the page screenshot

    @verifyAddUserReviewbodyConfirmationPageContent
    Scenario:  Verify the add user to review body confirmation page displays the expected messaging
        And I fill the search input for add users to review body with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I can see that the add users to review body search page contains 'Results'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I can see the check and add user to review body page
        And I capture the page screenshot
        When I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        Then I can see the add user to review body confirmation page
        And I capture the page screenshot
        And the add user to review body confirmation page displays the expected guidance text

    @verifyAddUserReviewbodyConfirmationPageNavigationLinks
    Scenario Outline:  Verify the user can navigate away from the add user to review body confirmation page using the available links
        And I fill the search input for add users to review body with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I can see the check and add user to review body page
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I can see the add user to review body confirmation page
        And I capture the page screenshot
        When I click the '<Link>' link on the 'Add_User_Review_Body_Confirmation_Page'
        Then I can see the '<Page>'
        And I capture the page screenshot

        Examples:
            | Link                         | Page                             |
            | Add_Another_User             | Search_Add_User_Review_Body_Page |
            | Back_To_Manage_Review_Bodies | Manage_Review_Bodies_Page        |

    @verifySearchForAddedReviewbodyUserNoResults
    Scenario Outline: Verify that when a user is added to a review body, that user now appears in the review body users list
        And I fill the search input for add users to review body with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I can see that the add users to review body search page contains 'Results'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I can see the check and add user to review body page
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I can see the add user to review body confirmation page
        And I capture the page screenshot
        And I have navigated to the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I can see the user list page of the review body
        And I capture the page screenshot
        And I fill the search input for add users to review body with 'Same_Users_Email' as the search query
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        # Add Tiji step - check one result + first name, last name, email values using getters

        Examples:
            | Search_Query                |
            | Existing_QA_User_First_Name |
            | Existing_QA_User_Last_Name  |
            | Existing_QA_User_Email      |

    @verifySearchForAddedReviewbodyUserNoResults
    Scenario Outline: Verify that when a user is added to a review body, that user no longer appears in the add user to review body search
        And I fill the search input for add users to review body with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        And I can see that the add users to review body search page contains 'Results'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I can see the check and add user to review body page
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I can see the add user to review body confirmation page
        And I capture the page screenshot
        And I click the 'Add_Another_User' link on the 'Add_User_Review_Body_Confirmation_Page'
        And I can see the search for user to add to review body page
        And I capture the page screenshot
        When I fill the search input for add users to review body with 'Same_Users_Email' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        Then I can see that the add users to review body search page contains 'No_Results'
        And I capture the page screenshot

        Examples:
            | Search_Query                |
            | Existing_QA_User_First_Name |
            | Existing_QA_User_Last_Name  |
            | Existing_QA_User_Email      |


# Add user and check rev body user list updated (need Tiji code)
# For search on existing user list, search by email, expect count 1 and expect first/last name + email to show using getters