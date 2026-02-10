@OrganisationsDisabledUsers @SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive
Feature: Sponsor Workspace - Organisations Disabled Users

    Background:
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        And I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I keep note of the organisation name for sponsor organisation setup
        And I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
        And I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot

    @rsp-6664 @DisableUsersViaSysAdmin
    Scenario Outline: Validate that sponsor organisation users have their roles and permissions updated when their status changes via System administration
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user permission page based on '<Select_User_Permission>'
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
        And I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I have performed this action as the '<Admin_User>'
        Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
        When I have navigated to the 'Home_Page' as '<Added_User>'
        Then I cannot see a 'Sponsor' link on the 'Home_Page'
        When I have navigated to the 'Sponsor_Workspace_Page'
        Then I can see the 'Access_Denied_Page'
        When I have navigated to the 'Manage_Users_Page' as '<Admin_User>'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Manage_Users_Page'
        And I can see the user profile page
        Then I can see the 'Org_Admin_User_No_Roles' user has the correct roles assigned on their profile page
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        Then I can see the users audit history with the 'Unassign_User' event as the most recent entry
        When I have navigated to the 'Manage_Sponsor_Organisations_Page'
        And I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
        And I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
        And I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
        When I have navigated to the 'Manage_Users_Page'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Manage_Users_Page'
        And I can see the user profile page
        Then I can see the '<Added_User>' user has the correct roles assigned on their profile page
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        Then I can see the users audit history with the 'Assign_User' event as the most recent entry
        When I have navigated to the 'Home_Page' as '<Added_User>'
        Then I can see a 'Sponsor' link on the 'Home_Page'
        When I click the 'Sponsor' link on the 'Home_Page'
        Then I can see the sponsor workspace page

        Examples:
            | Admin_User   | Admin_User_Email   | Added_User             | Added_User_Email        | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  |
            | System_Admin | system admin email | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |

    @rsp-6664 @DisableUsersViaSponsor
    Scenario Outline: Validate that sponsor organisation users have their roles and permissions updated when their status changes via Sponsor workspace
        When I enter '<Admin_User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using 'Sponsor_Org_User_Role_Org_Admin'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user permission page based on 'No_Permission_To_Select'
        When I fill the add user permission page using 'No_Permission_To_Select'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'No_Permission_To_Select'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user permission page based on '<Select_User_Permission>'
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I have navigated to the 'My_Organisations_Sponsor_Org_Profile_Page' as '<Admin_User>'
        When I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'My_Organisations_Users_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Users_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        When I click the 'Disable_User' button on the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'My_Organisations_Confirm_User_Status_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I have performed this action as the '<Admin_User>'
        Then I can see the successful user update message on my organisations user profile page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Added_User>'
        Then I cannot see a 'Sponsor' link on the 'Home_Page'
        When I have navigated to the 'Sponsor_Workspace_Page'
        Then I can see the 'Access_Denied_Page'
        When I have navigated to the 'Manage_Users_Page' as 'System_Admin'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Manage_Users_Page'
        And I can see the user profile page
        Then I can see the 'Sponsor_User_No_Roles' user has the correct roles assigned on their profile page
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        Then I can see the users audit history with the 'Unassign_User' event as the most recent entry
        When I have navigated to the 'My_Organisations_Sponsor_Org_Profile_Page' as '<Admin_User>'
        When I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'My_Organisations_Users_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Users_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        When I click the 'Enable_User' button on the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'My_Organisations_Confirm_User_Status_Page'
        And I capture the current time for 'Audit_History_User_Page'
        Then I can see the successful user update message on my organisations user profile page
        When I have navigated to the 'Manage_Users_Page' as 'System_Admin'
        When I enter '<Added_User_Email>' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'View_Edit' link on the 'Manage_Users_Page'
        And I can see the user profile page
        Then I can see the '<Added_User>' user has the correct roles assigned on their profile page
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        Then I can see the users audit history with the 'Assign_User' event as the most recent entry
        When I have navigated to the 'Home_Page' as '<Added_User>'
        Then I can see a 'Sponsor' link on the 'Home_Page'
        When I click the 'Sponsor' link on the 'Home_Page'
        Then I can see the sponsor workspace page

        Examples:
            | Admin_User             | Admin_User_Email        | Added_User   | Added_User_Email         | Sponsor_Organisation      | Select_User_Role              | Select_User_Permission |
            | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_User | automation sponsor email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Authoriser_No          |