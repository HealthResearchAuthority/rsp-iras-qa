@SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive
Feature: Sponsor Workspace-My Organisations-Users-Add user

  Background:
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I capture the page screenshot
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    And I capture the page screenshot
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot

  @rsp-6461 @MyOrganisationsAddUserPage @BackBreadCrumbs
  Scenario Outline: Validate that <Login_User> is able to navigate to add users page for the selected sponsor organisation
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Then I can see tabs are displayed based on the logged in user role '<Login_User>'
    # And the users tab is underlined
    And the add a user section is '<Add_A_User_Section_Visibility>' based on the logged in user role
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    Then I navigate to the add user page for the selected sponsor organisation '<Sponsor_Organisation>'
    And I click the 'Back' link on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'

    Examples:
      | Login_User             | User_Email              | Link   | Add_A_User_Section_Visibility | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  |
      # | System_Admin           | system admin email      | Manage | visible                       | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |
      | Sponsor_Org_Admin_User | sponsor org admin email | Manage | visible                       | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |

  @rsp-6461 @ErrorValidation
  Scenario Outline: Validate error when attempting to add non registered users to sponsor organisation by <Login_User>
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Email_Address>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    Then I see a notification page stating '<Error_Message>'
    Then I click the 'Return_To_Sponsor_Org_profile' button on the 'My_Organisations_Users_Add_User_Non_Registered_User_Error_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I validate '<Summary_Error_Message>' displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in 'My_Organisations_Users_Add_User_Page' for the selected sponsor organisation '<Sponsor_Organisation>'
    And I click the 'Back' link on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Invalid_Email_Address>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I validate '<Summary_Error_Message>' displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in 'My_Organisations_Users_Add_User_Page' for the selected sponsor organisation '<Sponsor_Organisation>'
    And I click the 'Back' link on the 'My_Organisations_Users_Add_User_Non_Registered_User_Error_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Login_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I validate '<Existing_User_Notification>' displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in 'My_Organisations_Users_Add_User_Page' for the selected sponsor organisation '<Sponsor_Organisation>'
    And I click the 'Back' link on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @AddUserRolePermission
  Scenario Outline: Validate that <Login_User> is able to navigate to Users page of <Sponsor_Organisation> from sponsor workspace and add a user with <Select_User_Role> and <Select_User_Permission>
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    And I click the 'Confirm' button on the 'Check_Confirm_User_To_Add_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on users tab in the sponsor organisation profile for the selected sponsor organisation
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Another_Registered_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @AddUserRolePermissionCancel
  Scenario Outline: Validate that <Login_User> is able to navigate to Users page of <Sponsor_Organisation> from sponsor workspace and add a user with <Select_User_Role> and <Select_User_Permission> and Cancel discards details and returns to Users page
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    And I click the 'Cancel' button on the 'Check_Confirm_User_To_Add_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    And I capture the page screenshot
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @BackBreadCrumbs
  Scenario Outline: Validate that back breadcrumb from add user role page of sponsor workspace
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    And I click the 'Back' link on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I navigate to the add user page for the selected sponsor organisation '<Sponsor_Organisation>'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |


  @rsp-6465 @BackBreadCrumbs
  Scenario Outline: Validate that back breadcrumb from add permission page of sponsor workspace
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    When I fill the add user role page using '<Select_User_Role>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    And I click the 'Back' link on the 'Add_User_Permission_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @BackBreadCrumbs
  Scenario Outline: Validate that back breadcrumb from check and confirm user page of sponsor workspace
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    And I click the 'Back' link on the 'Check_Confirm_User_To_Add_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @ErrorValidation @NoUserRoleSelectedError
  Scenario Outline: Validate that Validation error when no role selected on add user role page of sponsor workspace
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I validate '<Summary_Error_Message>' displayed when no role selected in 'Add_User_Role_Sponsor_Org_Page'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message                    | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error                | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | No_Role_Selected_Sponsor_Workspace_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            |

  @rsp-6465 @ChangeLinkEmailAddress
  Scenario Outline: Validate the navigation on clicking change link against email address field
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    When I click the change link against '<Field_Name>' on the check and confirm page to add user to sponsor organisation page
    And I capture the page screenshot
    Then I navigate to the add user page for the selected sponsor organisation '<Sponsor_Organisation>'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User | Field_Name |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  | Email_Address |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            | Email      |

  @rsp-6465 @ChangeLinkRole
  Scenario Outline: Validate the navigation on clicking change link against role field
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    When I click the change link against '<Field_Name>' on the check and confirm page to add user to sponsor organisation page
    And I capture the page screenshot
    Then I can see the add user role page
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User | Field_Name |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  | Email_Address |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            | Role       |

  @rsp-6465 @ChangeLinkAuthoriser
  Scenario Outline: Validate the navigation on clicking change link against authoriser field
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
    And I capture the page screenshot
    #Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I capture the page screenshot
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    When I fill the add user page using '<Another_Registered_User>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
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
    And the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation '<Sponsor_Organisation>' and '<Select_User_Permission>' and for the user '<Another_Registered_User>'
    When I click the change link against '<Field_Name>' on the check and confirm page to add user to sponsor organisation page
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    Examples:
      | Login_User             | User_Email              | Select_User_Role                | Select_User_Permission  | Link   | Sponsor_Organisation      | Email_Address       | Error_Message             | Summary_Error_Message     | Invalid_Email_Address                                     | Existing_User_Notification | Another_Registered_User | Field_Name |
      # | System_Admin           | system admin email      | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Double_Dot                             | User_Exists_Message        | Sponsor_Org_Admin_User  | Email_Address |
      | Sponsor_Org_Admin_User | sponsor org admin email | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | Manage | University of Southampton | Non_Registered_User | Non_Registered_User_Error | Blank_Email_Address_Error | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | User_Exists_Message        | Sponsor_User            | Authoriser |
