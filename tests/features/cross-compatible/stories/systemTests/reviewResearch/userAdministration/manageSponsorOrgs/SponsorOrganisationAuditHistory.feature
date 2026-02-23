@SystemTest @SysAdminUser @SponsorOrgAdminUser @SetupNewSponsorOrgGoLive @ManageSponsorOrgs
Feature: Sponsor organisation audit history

    Background:
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I keep note of the organisation name for sponsor organisation setup
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        And I record the 'Sponsor_Organisation_Created' event for the user 'Blank_User_Details' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        When I enter 'University of Southampton' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot

    @rsp-6499 @SponsorOrganisationAuditHistoryOrgAdminUser
    Scenario Outline: Validate audit history event when organisation admin user added with authoriser access and switched to sponsor with no authoriser access to the selected sponsor organisation
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        And I can see the add user permission page based on '<Select_User_Permission>'
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
        And I capture the page screenshot
        And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>'
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Org_Admin' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Users' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'My_Organisations_Page'
        When I click the 'Manage' link on the 'My_Organisations_Page'
        When I click the 'Change' link on the 'Check_Create_User_Profile_Page'
        When I fill the add user role page using 'Authoriser_No'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Check_Create_User_Profile_Page'
        And I record the 'User_Unassigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'Sponsor_Org_Admin_User'
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Users' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'My_Organisations_Page'
        When I click the 'Manage' link on the 'My_Organisations_Page'
        When I click the 'Change' link on the 'Check_Create_User_Profile_Page'
        When I fill the add user role page using '<Change_User_Role>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Check_Create_User_Profile_Page'
        And I record the 'User_Unassigned_Org_Admin' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'Sponsor_Org_Admin_User'
        And I record the 'User_Assigned_Sponsor' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'Sponsor_Org_Admin_User'
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'View' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
        And I capture the page screenshot
        And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
        And the 'Users' tab is active and underlined
        And the add a user section is 'not visible' based on the logged in user role
        And the action column section shows the hyperlink as 'View' based on the logged in user role

        Examples:
            | Login_User             | User_Email              | Link | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Change_User_Role              |
            | Sponsor_Org_Admin_User | sponsor org admin email | View | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Sponsor_Org_User_Role_Sponsor |

    @rsp-6499 @SponsorOrganisationAuditHistorySponsorUserNoAuthoriser
    Scenario Outline: Validate audit history event when sponsor user assigned with no authoriser access to the selected sponsor organisation
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Sponsor' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation      | Select_User_Role              | Select_User_Permission  | Change_User_Role                |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | No_Permission_To_Select | Sponsor_Org_User_Role_Org_Admin |

    @rsp-6499 @SponsorOrganisationAuditHistorySponsorUserAuthoriser
    Scenario Outline: Validate audit history event when sponsor user assigned with authoriser access to the selected sponsor organisation
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Sponsor' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation      | Select_User_Role              | Select_User_Permission | Change_User_Role                |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes | Sponsor_Org_User_Role_Org_Admin |

    @rsp-6499 @SponsorOrganisationEnableDisableAuditHistoryOrgAdminUser
    Scenario Outline: Validate audit history event when user has been enabled and disabled for the selected sponsor organisation
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        And I can see the add user permission page based on '<Select_User_Permission>'
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
        And I capture the page screenshot
        And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>'
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Org_Admin' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I capture the page screenshot
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I capture the page screenshot
        When I enter 'University of Southampton' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        When I enter '<Test_User>' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        And I can see the add user permission page based on '<Select_User_Permission>'
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on '<Select_User_Permission>'
        And I capture the page screenshot
        And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>'
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user '<Test_User>' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Org_Admin' event for the user '<Test_User>' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user '<Test_User>' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        When I enter '<Test_User>' into the search field
        And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
        Then I can see the 'View_Edit_User_Profile_Page'
        When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
        And I capture the page screenshot
        When I click the 'Confirm' button on the 'Confirmation_Page'
        And I record the 'User_Disabled' event for the user '<Test_User>' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I capture the page screenshot
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I capture the page screenshot
        When I enter '<Test_User>' into the search field
        And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
        And I capture the page screenshot
        When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
        Then I can see the 'View_Edit_User_Profile_Page'
        When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
        And I capture the page screenshot
        When I click the 'Confirm' button on the 'Confirmation_Page'
        And I record the 'User_Enabled' event for the user '<Test_User>' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  | Change_User_Role              | Test_User             |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Sponsor_Org_User_Role_Sponsor | Studywide_Reviewer_NI |

    @rsp-6814 @SponsorOrganisationAuditPagination
    Scenario Outline: Validate audit history and  Verify pagination in user list page of sponsor organisation when user is on the first page and navigate through each page by clicking page number or by by clicking next link
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Sponsor' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each 'Sponsor_Org_User_List_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation      | Select_User_Role              | Select_User_Permission | Change_User_Role                | Navigation_Method |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes | Sponsor_Org_User_Role_Org_Admin | page number       |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes | Sponsor_Org_User_Role_Org_Admin | next link         |

    @rsp-6814 @SponsorOrganisationAuditPagination
    Scenario Outline: Validate audit history and  Verify pagination in user list page of sponsor organisation when user is on the last page and navigate through each page by clicking page number or by by clicking on previous link
        When I enter '<User_Email>' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        And I capture the page screenshot
        Then I can see the add user role page
        When I fill the add user role page using '<Select_User_Role>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        When I fill the add user permission page using '<Select_User_Permission>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        And I record the 'User_Added' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Sponsor' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I record the 'User_Assigned_Authoriser' event for the user 'Sponsor_Org_Admin_User' to store the sponsor organisation audit history triggered by 'System_Admin'
        And I capture the page screenshot
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Login_User>'
        Then I click the 'Sponsor' link on the 'Home_Page'
        And I can see the sponsor workspace page
        Then I capture the page screenshot
        And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
        And I capture the page screenshot
        When I click the 'Manage' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        When I click the 'Audit' link on the 'My_Organisations_Page'
        And I capture the page screenshot
        Then I validate the audit history table for sponsor organisation
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Sponsor_Org_User_List_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Login_User             | User_Email              | Sponsor_Organisation      | Select_User_Role              | Select_User_Permission | Change_User_Role                | Navigation_Method |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes | Sponsor_Org_User_Role_Org_Admin | page number       |
            | Sponsor_Org_Admin_User | sponsor org admin email | University of Southampton | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes | Sponsor_Org_User_Role_Org_Admin | previous link     |
