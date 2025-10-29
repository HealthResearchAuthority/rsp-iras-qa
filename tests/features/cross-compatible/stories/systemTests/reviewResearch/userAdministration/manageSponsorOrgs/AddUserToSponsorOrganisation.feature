@UserAdministration @ManageReviewBodies @AddUserToReviewBody @SysAdminUser @SystemTest @rsp-5234 @STSysAdmin
Feature: User Administration: Manage Sponsor Organisations - Add user to sponsor organisation

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I capture the page screenshot
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
        Then I click the view edit link of the 'previously added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the 'sponsor organisation'
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        And I can see the search for user to add to sponsor organisation page
        And I capture the page screenshot

    @addUserSponsorOrgSearchFunctionResults
    Scenario Outline: Verify that the search function, for existing users that can be added to the sponsor organisation, returns expected results
        When I fill the search input for searching 'adding users' with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        Then I can see that the add users to 'sponsor organisation' search page contains 'Results'
        And I capture the page screenshot
        And the add users to 'sponsor organisation' search has returned results with the '<Search_Query>'

        Examples:
            | Search_Query                |
            | Existing_QA_User_First_Name |
            | Existing_QA_User_Last_Name  |
            | Existing_QA_User_Email      |
            | Existing_QA_User_Full_Name  |

    @addUserSponsorOrgSearchFunctionNoResults @TestOnly
    Scenario: Verify that the add users to sponsor organisation search function returns a no results page, when no such user exists
        When I fill the search input for searching 'adding users' with 'Non_Existant_User_Data' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And the no search results found message is displayed
        # Then I can see that the add users to 'sponsor organisation' search page contains 'No_Results'
        And I capture the page screenshot

    @verifySearchAddUserSponsorOrgPageNavigationLinks
    Scenario Outline: Verify the user can navigate away from the add users to sponsor organisation search page using the available links
        And I fill the search input for searching 'adding users' with '<Search_Query>' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the '<Link>' link on the 'Search_Add_User_Sponsor_Org_Page'
        Then I can see the '<Page>'
        And I capture the page screenshot

        Examples:
            | Search_Query                | Link | Page                       |
            | Existing_QA_User_First_Name | Back | Sponsor_Org_User_List_Page |
    # | Non_Existant_User_Data      | Back_To_Users | Sponsor_Org_User_List_Page |
    # | Non_Existant_User_Data      | Manage_Users  | Manage_Users_Page          |

    @verifyCheckAddUserSponsorOrgPageValues
    Scenario: Verify the check add user to sponsor organisation page displays the correct user details
        And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I can see that the add users to 'sponsor organisation' search page contains 'Results'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        Then I can see the 'Check_Add_User_Sponsor_Org_Page'
        # Then I can see the check and add user to review body page
        And I capture the page screenshot
        And the check and add user to sponsor organisation page displays the expected user details
    # And the check and add user to review body page displays the expected user details

    @verifyCheckAddUserSponsorOrgPageBackLink
    Scenario: Verify the user can navigate back from the check add user to sponsor organisation page using the back link
        And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        Then I can see the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Back' link on the 'Check_Add_User_Sponsor_Org_Page'
        And I can see the search for user to add to sponsor organisation page
        And I capture the page screenshot

    @verifyAddUserSponsorOrgConfirmationPageContent
    Scenario:  Verify the add user to sponsor organisation confirmation page displays the expected messaging
        And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I can see that the add users to 'review body' search page contains 'Results'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        Then I can see the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the user added successful message on sponsor organisation user list page
        Then I can see the user list page of the 'sponsor organisation'

    # @verifyAddUserSponsorOrgConfirmationPageNavigationLinks
    # Scenario Outline:  Verify the user can navigate away from the add user to sponsor organisation confirmation page using the available links
    #     And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
    #     And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    #     And I capture the page screenshot
    #     And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    #     Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    #     And I capture the page screenshot
    #     And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    #     And I am on the confirmation screen
    #     And I capture the page screenshot
    #     When I click the '<Link>' link on the 'Add_User_Review_Body_Confirmation_Page'
    #     Then I can see the '<Page>'
    #     And I capture the page screenshot

    #     Examples:
    #         | Link                         | Page                             |
    #         | Add_Another_User             | Search_Add_User_Review_Body_Page |
    #         | Back_To_Manage_Review_Bodies | Manage_Review_Bodies_Page        |

    @verifySearchSponsorOrgUserListAddedUser
    Scenario: Verify that when a user is added to a sponsor organisation, that user now appears in the sponsor organisation users list
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I can see that the add users to 'sponsor organisation' search page contains 'Results'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the 'Check_Add_User_Sponsor_Org_Page'
        And the check and add user to sponsor organisation page displays the expected user details
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the user added successful message on sponsor organisation user list page
        Then I can see the user list page of the 'sponsor organisation'
        And I capture the page screenshot
        When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        Then I see that the newly added user appears in the user list page for the 'sponsor organisation'

    @verifySearchForAddedSponsorOrgUserNoResults
    Scenario: Verify that when a user is added to a sponsor organisation, that user no longer appears in the add user to sponsor organisation search
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I can see that the add users to 'sponsor organisation' search page contains 'Results'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the 'Check_Add_User_Sponsor_Org_Page'
        And the check and add user to sponsor organisation page displays the expected user details
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the user added successful message on sponsor organisation user list page
        Then I can see the user list page of the 'sponsor organisation'
        And I capture the page screenshot
        When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        Then I see that the newly added user appears in the user list page for the 'sponsor organisation'
        And I capture the page screenshot
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And the no search results found message is displayed
        # Then I can see that the add users to 'sponsor organisation' search page contains 'No_Results'
        And I capture the page screenshot

    @rsp-3890 @addUserSponsorOrgSearchMultiTerms
    Scenario Outline: Verify the add user to sponsor organisation search utilises AND logic to produce accurate search results
        When I fill the search input for searching 'adding users' with '<Initial_Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And the list displays 'multiple user records'
        And I capture the page screenshot
        When I fill the search input for searching 'users' with '<Second_Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And the list displays 'a single user record'
        And I capture the page screenshot
        Examples:
            | Initial_Search_Query              | Second_Search_Query             |
            | Admin_User_Full_Name_Email_Prefix | Admin_User_Full_Name_Full_Email |