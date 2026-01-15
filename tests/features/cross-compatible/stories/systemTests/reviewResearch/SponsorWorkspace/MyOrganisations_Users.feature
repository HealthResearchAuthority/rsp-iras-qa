@SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive
Feature: Sponsor Workspace - My Organisations Page - Users

  Background:
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I capture the page screenshot
    And I keep note of the organisation name for sponsor organisation setup
    And I keep note of the organisation country for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    And I capture the page screenshot
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    When I enter 'name of the newly added sponsor organisation' into the search field
    # When I enter 'University of Southampton' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot

  @rsp-6422 @rsp-6425 @rsp-6490 @rsp-6418 @rsp-6419 @KNOWN_DEFECT_RSP-6628 @MyOrganisationsUsersPage @AddUserRolePermission @KNOWN-DEFECT-RSP-6723 @KNOWN-DEFECT-RSP-6749 @KNOWN-DEFECT-RSP-6752
  Scenario Outline: Validate that <Login_User> is able to navigate to Users page of <Sponsor_Organisation> from Manage sposnor organisations of System admin workspace and add a user with <Select_User_Role> and <Select_User_Permission>
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
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    And the view and edit user profile page displays the expected user details for the selected '<Select_User_Permission>'
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page from my organisations for '<Login_User>'
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    Then I can see tabs are displayed based on the logged in user role '<Login_User>'
    And the users tab is underlined
    And the add a user section is '<Add_A_User_Section_Visibility>' based on the logged in user role
    And the action column section shows the hyperlink as '<Action_Column_Visibility>' based on the logged in user role
    # And I can see the 'sponsor organisation users' list sorted by 'ascending' order of the 'name' on the 'first' page
    Examples:
      | Login_User             | User_Email               | Link   | Add_A_User_Section_Visibility | Action_Column_Visibility | Sponsor_Organisation      | Select_User_Role                | Select_User_Permission  |
      | Sponsor_User           | automation sponsor email | View   | not visible                   | View                     | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  |
      | Sponsor_User           | automation sponsor email | View   | not visible                   | View                     | University of Southampton | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   |
      # | System_Admin           | system admin email       | Manage | visible                       | Manage                   | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | visible                       | Manage                   | University of Southampton | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |

  @rsp-6425 @BackBreadCrumbs
  Scenario Outline: Validate that back breadcrumb from add user role page
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    And I click the 'Back' link on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    Examples:
      | User_Email               |
      | automation sponsor email |

  @rsp-6425 @BackBreadCrumbs
  Scenario Outline: Validate that back breadcrumb from add permission page
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
    And I click the 'Back' link on the 'Add_User_Permission_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    Examples:
      | User_Email               | Select_User_Role              | Select_User_Permission |
      | automation sponsor email | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_Yes |
      | automation sponsor email | Sponsor_Org_User_Role_Sponsor | Sponsor_Authoriser_No  |

  @rsp-6425 @BackBreadCrumbs @KNOWN-DEFECT-RSP-6752
  Scenario Outline: Validate that back breadcrumb from check and add user page
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
    And I click the 'Back' link on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on '<Select_User_Permission>'
    Examples:
      | User_Email               | Select_User_Role                | Select_User_Permission  | Sponsor_Organisation      |
      | automation sponsor email | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_Yes  | University of Southampton |
      | automation sponsor email | Sponsor_Org_User_Role_Sponsor   | Sponsor_Authoriser_No   | University of Southampton |
      # | system admin email       | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | University of Southampton |
      | sponsor org admin email  | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select | University of Southampton |

  @rsp-6425 @NoUserRoleSelectedError @KNOWN-DEFECT-RSP-6697
  Scenario Outline: Validate that Validation error when no role selected on add user role page
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the add user role page
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I validate '<Summary_Error_Message>' displayed when no role selected in 'Add_User_Role_Sponsor_Org_Page'
    Examples:
      | User_Email               | Summary_Error_Message  |
      | automation sponsor email | No_Role_Selected_Error |

  @rsp-6422 @sortUserListByColumn
  Scenario Outline: Verify that <Login_User> is able to sort the users list for <Sort_Button>
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    And I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    When I click the '<Sort_Button>' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I can see the 'sponsor organisation users' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'first' page
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    Then I can see the 'sponsor organisation users' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'last' page
    When I click the '<Sort_Button>' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I can see the 'sponsor organisation users' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'first' page
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    Then I can see the 'sponsor organisation users' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'last' page

    Examples:
      | Login_User             | User_Email               | Link   | Sort_Button   | Sort_Field    | Initial_Sort | Secondary_Sort | Sponsor_Organisation      |
      | Sponsor_User           | automation sponsor email | View   | Name          | name          | descending   | ascending      | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Email_Address | email address | ascending    | descending     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Status        | status        | ascending    | descending     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Role          | role          | ascending    | descending     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Authoriser    | authoriser    | ascending    | descending     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Name          | name          | descending   | ascending      | University of Southampton |
      | System_Admin           | system admin email       | Manage | Email_Address | email address | ascending    | descending     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Status        | status        | ascending    | descending     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Role          | role          | ascending    | descending     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Authoriser    | authoriser    | ascending    | descending     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Name          | name          | descending   | ascending      | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Email_Address | email address | ascending    | descending     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Status        | status        | ascending    | descending     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Role          | role          | ascending    | descending     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Authoriser    | authoriser    | ascending    | descending     | University of Southampton |

  @rsp-6422 @UserListSponsorOrgSearchResultsFound
  Scenario Outline: Verify that <Login_User> can search for the users in the user tab by <Field_Name> and <Position>
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    When I enter the '<Field_Name>' of the '<Position>' user shown on the current 'sponsor organisation' users list, into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then the system displays search results matching the search criteria

    Examples:
      | Login_User             | User_Email               | Link   | Field_Name    | Position | Sponsor_Organisation      |
      | Sponsor_User           | automation sponsor email | View   | First_Name    | First    | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Last_Name     | First    | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Email_Address | First    | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | First_Name    | Last     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Last_Name     | Last     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Email_Address | Last     | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Full_Name     | First    | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | Full_Name     | Last     | University of Southampton |
      | System_Admin           | system admin email       | Manage | First_Name    | First    | University of Southampton |
      | System_Admin           | system admin email       | Manage | Last_Name     | First    | University of Southampton |
      | System_Admin           | system admin email       | Manage | Email_Address | First    | University of Southampton |
      | System_Admin           | system admin email       | Manage | First_Name    | Last     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Last_Name     | Last     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Email_Address | Last     | University of Southampton |
      | System_Admin           | system admin email       | Manage | Full_Name     | First    | University of Southampton |
      | System_Admin           | system admin email       | Manage | Full_Name     | Last     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | First_Name    | First    | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Last_Name     | First    | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Email_Address | First    | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | First_Name    | Last     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Last_Name     | Last     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Email_Address | Last     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Full_Name     | First    | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Full_Name     | Last     | University of Southampton |

  @rsp-6422 @UserListSponsorOrgSearchNoResultsFound
  Scenario Outline: Verify no results found message if there is no user added to the selected sponsor organisation matches the search criteria
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    When I fill the search input for searching 'users in sponsor organisations' with '<Search_Query>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed
    And I capture the page screenshot
    Examples:
      | Login_User             | User_Email               | Link   | Search_Query           | Sponsor_Organisation      |
      | Sponsor_User           | automation sponsor email | View   | Non_Existant_User_Data | University of Southampton |
      | System_Admin           | system admin email       | Manage | Non_Existant_User_Data | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Non_Existant_User_Data | University of Southampton |

  @rsp-6422 @UserlistSponsorOrgPagination @UserlistSponsorOrgPaginationFirstPage @UserlistSponsorOrgPaginationPageNumber @UserlistSponsorOrgPaginationNextLinkClick
  Scenario: Verify pagination in user tab of sponsor organisation when <Login_User> is on the first page and navigate through each page by clicking <Navigation_Method>
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
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
      | Login_User             | User_Email               | Link   | Navigation_Method | Sponsor_Organisation      |
      | Sponsor_User           | automation sponsor email | View   | page number       | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | next link         | University of Southampton |
      | System_Admin           | system admin email       | Manage | page number       | University of Southampton |
      | System_Admin           | system admin email       | Manage | next link         | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | page number       | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | next link         | University of Southampton |

  @rsp-6422 @UserlistSponsorOrgPagination @UserlistSponsorOrgPaginationLastPage @UserlistSponsorOrgPaginationPageNumber @MUserlistSponsorOrgPaginationPreviousLinkClick
  Scenario: Verify pagination in user tab of sponsor organisation when <Login_User> is on the last page and navigate through each page by clicking <Navigation_Method>
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I can see the 'user added' successful message on sponsor organisation user list page
    And I capture the page screenshot
    # And I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page
    And I capture the page screenshot
    When I have navigated to the 'Home_Page' as '<Login_User>'
    Then I click the 'Sponsor' link on the 'Home_Page'
    And I can see the sponsor workspace page
    Then I capture the page screenshot
    And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
    Then I can see the my organisations page
    And I can see the 'My_Organisations_Table' ui labels on the my organisations page
    And I capture the page screenshot
    And I can now see a table of results for my organisations
    When I enter '<Sponsor_Organisation>' into the search field
    Then I click the 'Search' button on the 'My_Organisations_Page'
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the users tab in the sponsor organisation profile for the selected sponsor organisation '<Sponsor_Organisation>'
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Sponsor_Org_User_List_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot
    Examples:
      | Login_User             | User_Email               | Link   | Navigation_Method | Sponsor_Organisation      |
      | Sponsor_User           | automation sponsor email | View   | page number       | University of Southampton |
      | Sponsor_User           | automation sponsor email | View   | previous link     | University of Southampton |
      | System_Admin           | system admin email       | Manage | page number       | University of Southampton |
      | System_Admin           | system admin email       | Manage | previous link     | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | page number       | University of Southampton |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | previous link     | University of Southampton |

#  https://nihr.atlassian.net/browse/RSP-6422

# # Breadcrumb navigation is displayed and functional -not covering via automation

# Given I am on the Users page

# And I see breadcrumbs "My Account > Sponsor Workspace > My Organisations"

# And each breadcrumb is a clickable hyperlink

# When I click any breadcrumb

# Then I am navigated back to the respective page


# # Role-based navigation tabs -automated

# Given I am on the Sponsor Organisation Profile page

# And my role is Organisation Administrator or System Administrator

# Then I see tabs in the following order: Profile, Projects, Users and Audit

# And the "Users" tab is underlined



# Given I am on the Sponsor Organisation Profile page -automated

# And my role is Sponsor

# Then I see tabs in the following order: Profile, Projects, and Users

# And the "Users" tab is underlined


# # Add User tab visibility -automated

# Given I am on the Users page

# And my role is Organisation Administrator or System Administrator

# Then I see a clickable "Add User" tab

# And the tab allows adding a registered user to the organisation


# # Default view shows user list -automated

# Given I am on the Users page

# When the page loads

# Then I see a table with columns "Name", "Email Address", "Status", "Role", "Authoriser", and "Action"

# And the list is sorted alphabetically by Name in ascending order


# # Search with input -automated

# Given I enter letters, numbers, or a mix into the search bar

# When I click "Search"

# Then the table lists users containing the input string

# And ignores leading or trailing spaces

# And the list is sorted alphabetically by Name in ascending order



# # Search with no input - not automated

# Given the search bar is empty

# When I click "Search" as the Organisation Administrator or Sponsor or System Administrator

# Then the table lists all users for the sponsor organisation

# And the list is sorted alphabetically by Name in ascending order



# # No matching results-automated

# Given I enter a name that does not exist as the Organisation Administrator or Sponsor or System Administrator

# When I click "Search"

# Then I see a page with the message "There are no matching results"

# And I see guidance notes per the referenced design



# # Role-based actions in Action column -automated

# Given I am on the Users page

# And my role is Organisation Administrator or System Administrator

# Then the Action column shows "Manage" as a hyperlink for each user



# Given I am on the Users page -automated

# And my role is Sponsor

# Then the Action column shows "View" as a hyperlink for each user



# # Non-member is denied when attempting to open the Users page - not automated

# Given I am signed in

# And I am not associated with the target sponsor organisation

# And I attempt to access the Sponsor Organisation "Users" page from any navigation entry point

# When the page loads

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design



# # Non-member is denied when using a direct URL to the Users page - not automated

# Given I paste or follow a direct URL that points to a sponsor organisation's "Users" page as a non-member

# When the request is processed

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design

# And I am not redirected to any privileged page



# # Member of a different organisation is denied access - not automated

# Given I am associated with sponsor organisation A

# And I am not associated with sponsor organisation B

# When I try to access organisation B's "Users" page

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design



## Pagination behaviour for project list - automated

# Given there are more than 20 users in the list

# When I view the users page as the Organisation Administrator or Sponsor

# Then the users list should be paginated with a maximum of 20 rows per page

# And pagination controls should appear at the bottom of the page



## First Page Behaviour - automated

# Given I am on the first page

# When I view the paginated results

# Then the "Previous" button should be disabled and not visible

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page after the current page and the last page First page – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# # Last Page Behaviour - automated

# Given I am on the last page

# When I view the paginated results

# Then the "Next" button should be disabled and not visible

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page immediately before the current page and the first page Last page – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# #Page Number Selection - automated

# Given I identify which page I am on

# When I select a page number

# Then the corresponding page should be displayed

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page immediately before and after the current page, as well as the first and last pages Pagination with numbered labels – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# #Next Button Navigation - automated

# Given I can view the "Next" link

# When I select the "Next" button

# Then the data on the next page should be displayed

# And the current page number should be visually highlighted to indicate the active page



# #Previous Button Navigation - automated

# Given I can view the "Previous" link

# When I select the "Previous" button

# Then the data on the previous page should be displayed

# And the current page number should be visually highlighted to indicate the active page
