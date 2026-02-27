@MyOrganisationsUserProfile @SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive @TestTiji
Feature: Sponsor Workspace - My Organisations Page - User Profile

    Background:
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        And I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfLeeds'
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

    @rsp-6466 @ViewMyOrgUserProfilePage
    Scenario Outline: Validate that the my organisations user profile page displays as expected
        When I enter '<User_Email>' into the search field
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
        Then I can see the 'user added' successful message on sponsor organisation user list page
        When I have navigated to the 'My_Organisations_Sponsor_Org_Profile_Page' as '<Login_User>'
        And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        And I capture the page screenshot
        Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
        When I click the '<Link>' link on the 'My_Organisations_Users_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_User_Profile_Page'
        And I '<Change_Permission>' see the change links on my organisations user profile page
        When I click the 'Sponsor_Organisation_UniversityOfLeeds_Breadcrumb' link in the breadcrumbs on the 'My_Organisations_User_Profile_Page'
        Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
        When I navigate 'back'
        Then I can see the 'My_Organisations_User_Profile_Page'
        When I click the 'My_Organisations_Breadcrumb' link in the breadcrumbs on the 'My_Organisations_User_Profile_Page'
        Then I can see the my organisations page
        When I navigate 'back'
        Then I can see the 'My_Organisations_User_Profile_Page'
        When I click the 'Sponsor_Workspace_Breadcrumb' link in the breadcrumbs on the 'My_Organisations_User_Profile_Page'
        Then I can see the sponsor workspace page
        When I navigate 'back'
        Then I can see the 'My_Organisations_User_Profile_Page'
        When I click the 'My_Account_Breadcrumb' link in the breadcrumbs on the 'My_Organisations_User_Profile_Page'
        Then I can see the 'Home_Page'

        Examples:
            | Login_User             | User_Email               | Sponsor_Organisation | Select_User_Role                | Select_User_Permission  | Link   | Change_Permission |
            | System_Admin           | system admin email       | University of Leeds  | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | can               |
            | Sponsor_User           | automation sponsor email | University of Leeds  | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | View   | cannot            |
            | Sponsor_Org_Admin_User | sponsor org admin email  | University of Leeds  | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | can               |

    @rsp-6467 @ViewMyOrgEditUserProfilePage
    Scenario Outline: Validate that the my organisations edit user profile page displays as expected
        When I enter '<User_Email>' into the search field
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
        Then I can see the 'user added' successful message on sponsor organisation user list page
        When I have navigated to the 'My_Organisations_Sponsor_Org_Profile_Page' as '<Login_User>'
        And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        And I capture the page screenshot
        Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
        When I click the '<Link>' link on the 'My_Organisations_Users_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_User_Profile_Page'
        When I click the change link against '<Change>' on my organisations user profile page
        Then I can see the 'My_Organisations_Edit_User_Profile_Page'
        And I capture the page screenshot
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_Edit_User_Profile_Page'
        When I click the 'Back' link in the breadcrumbs on the 'My_Organisations_Edit_User_Profile_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        When I click the change link against '<Change>' on my organisations user profile page
        Then I can see the 'My_Organisations_Edit_User_Profile_Page'
        When I fill the my organisation edit user profile page using '<Edit_Input>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'My_Organisations_Edit_User_Profile_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I can see the successful user update message on my organisations user profile page
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_User_Profile_Page'

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation | Select_User_Role                | Select_User_Permission  | Link   | Change_Permission | Change     | Edit_Input                    |
            | System_Admin           | system admin email      | University of Leeds  | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | Manage | can               | Role       | Role_Org_Admin_Authoriser_Yes |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Leeds  | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | can               | Authoriser | Role_Sponsor_Authoriser_No    |

    @rsp-6809 @OrgAdminRoleAsNoAuthorisorSelectedError
    Scenario Outline: As <Login_User>, validate error message displayed when selecting role=OrgAdmin and Authorior=No in edit user profile page
        When I enter '<User_Email>' into the search field
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
        Then I can see the 'user added' successful message on sponsor organisation user list page
        When I have navigated to the 'My_Organisations_Sponsor_Org_Profile_Page' as '<Login_User>'
        And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        And I capture the page screenshot
        Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation 'University of Leeds'
        When I click the 'Manage' link on the 'My_Organisations_Users_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_User_Profile_Page'
        When I click the change link against '<Change>' on my organisations user profile page
        Then I can see the 'My_Organisations_Edit_User_Profile_Page'
        And I capture the page screenshot
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_Edit_User_Profile_Page'
        When I fill the my organisation edit user profile page using 'Role_Org_Admin_Authoriser_No'
        And I capture the page screenshot
        And I click the 'Save' button on the 'My_Organisations_Edit_User_Profile_Page'
        Then I validate 'Summary_Only_OrgAdmin_NotAuthorisor_Error' displayed on 'My_Organisations_Edit_User_Profile_Page'
        When I fill the my organisation edit user profile page using 'Role_Org_Admin_Authoriser_Yes'
        And I capture the page screenshot
        And I click the 'Save' button on the 'My_Organisations_Edit_User_Profile_Page'
        Then I can see the 'My_Organisations_User_Profile_Page'
        And I capture the page screenshot
        And I can see the successful user update message on my organisations user profile page
        And I see the details for '<Login_User>' are correctly displayed on 'My_Organisations_User_Profile_Page'

        Examples:
            | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Change_Permission | Change     |
            | System_Admin           | system admin email      | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | can               | Role       |
            | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | can               | Authoriser |