@UserAdministration @ManageSponsorOrgs @SysAdminUser @SystemTest @UserListSponsorOrgs @STSysAdmin @BackStage
Feature: User Administration: Manage Sponsor Organisations - View user list page of the sponsor organisations, Search for the users and add user to the sponsor organisation

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'

    @VerifyUserListNewSetupSponsorOrg @UserListSponsorOrgNoUsers
    Scenario: Verify the user can view the user list page of the newly setup sponsor organisation with no users
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation '<Setup_New_Sponsor_Organisation>' and  retrive country
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        And I capture the current time for 'Sponsor_Organisation_Profile_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        And I capture the page screenshot
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        # Then I can see the user list page of the review body
        Then I can see the user list page of the sponsor organisation
        And I capture the page screenshot
        # And I can see no users in the review body with a message to add users to the review body
        And I can see no users in the sponsor organisation with a message to add users to the sponsor organisation
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        # Then the system displays no results found message in the user list page of the review body
        Then the system displays no results found message in the user list page of the sponsor organisation

    @UserListSponsorOrgDefaultSort
    Scenario: Verify the user can view the user list page of any selected sponsor organisation and it is sorted by default in the alphabetical order of the 'First Name'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Then I click the view edit link of the 'previously added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the sponsor organisation
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        Then I can see the user added successful message on sponsor organisation user list page
        Then I can see the user list page of the sponsor organisation
        And I capture the page screenshot
        # And I can see the user list of the selected review body is sorted by default in the alphabetical order of the 'First Name'
        And I can see the user list of the selected sponsor organisation is sorted by default in the alphabetical order of the 'First Name'

    @UserListSponsorOrgSearchResultsFound @UserListSponsorOrgBackToSponsorOrgProfileLink
    Scenario Outline: Verify the user can search for the users in the user list page of selected sponsor organisation and navigate back to sponsor organisation profile page
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I can see the 'previously added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Then I click the view edit link of the 'previously added sponsor organisation'
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the sponsor organisation
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        Then I can see the user added successful message on sponsor organisation user list page
        Then I can see the user list page of the sponsor organisation
        And I capture the page screenshot
        # And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        # And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        When I enter the '<Field_Name>' of the '<Position>' user shown on the current 'sponsor organisation' users list, into the search field
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