@SponsorWorkspace @SystemTest @SysAdminUser @jsEnabled @SetupNewSponsorOrgGoLive
Feature: Sponsor Workspace - My Organisations Page - Users

  Background:
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I authorise the rts api using 'RTS_NIHR_FHIR_Config'
    Then I make a request to the rts api using 'RTS_Active_Sponsor_Organisation_NHS' dataset for sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton' and  retrive country
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I keep note of the organisation name for sponsor organisation setup
    And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    And I capture the page screenshot
    When I enter 'name of the newly added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'

  @rsp-6422 @MyOrganisationsPageLabelValidation
  Scenario: Validate that <Login_User> able to navigate to Users page for the selected sponsor organisation
    When I enter '<User_Email>' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
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
    And I can see the associated organisations displaying in the table for '<Login_User>'
    And I click the '<Link>' link on the 'My_Organisations_Page'
    And I capture the page screenshot
    # And I can see the sponsor organisation profile page from my organisations
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'My_Organisations_Users_Page'
    Then I can see tabs are displayed based on the logged in user role '<Login_User>'
    And the 'Users' tab is underlined
    And the 'Add_A_User_Section_Visibility' based on the logged in user role
    And the 'Action_Column_Visibility' based on the logged in user role
    And the list is sorted alphabetically by Name in ascending order
    #  And I can see the 'sponsor organisation users' list sorted by 'ascending' order of the 'first name' on the 'first' page


    Examples:
      | Login_User             | User_Email               | Link   | Add_A_User_Section_Visibility     | Action_Column_Visibility                  |
      | Sponsor_User           | automation sponsor email | View   | Add a user section is not visible | Action column shows View as a hyperlink   |
      | System_Admin           | system admin email       | Manage | Add a user section is visible     | Action column shows Manage as a hyperlink |
      | Sponsor_Org_Admin_User | sponsor org admin email  | Manage | Add a user section is visible     | Action column shows Manage as a hyperlink |

#  https://nihr.atlassian.net/browse/RSP-6422

# # Breadcrumb navigation is displayed and functional

# Given I am on the Users page

# And I see breadcrumbs "My Account > Sponsor Workspace > My Organisations"

# And each breadcrumb is a clickable hyperlink

# When I click any breadcrumb

# Then I am navigated back to the respective page


# # Role-based navigation tabs

# Given I am on the Sponsor Organisation Profile page

# And my role is Organisation Administrator or System Administrator

# Then I see tabs in the following order: Profile, Projects, Users and Audit

# And the "Users" tab is underlined



# Given I am on the Sponsor Organisation Profile page

# And my role is Sponsor

# Then I see tabs in the following order: Profile, Projects, and Users

# And the "Users" tab is underlined


# # Add User tab visibility

# Given I am on the Users page

# And my role is Organisation Administrator or System Administrator

# Then I see a clickable "Add User" tab

# And the tab allows adding a registered user to the organisation


# # Default view shows user list

# Given I am on the Users page

# When the page loads

# Then I see a table with columns "Name", "Email Address", "Status", "Role", "Authoriser", and "Action"

# And the list is sorted alphabetically by Name in ascending order


# # Search with input

# Given I enter letters, numbers, or a mix into the search bar

# When I click "Search"

# Then the table lists users containing the input string

# And ignores leading or trailing spaces

# And the list is sorted alphabetically by Name in ascending order



# # Search with no input

# Given the search bar is empty

# When I click "Search" as the Organisation Administrator or Sponsor or System Administrator

# Then the table lists all users for the sponsor organisation

# And the list is sorted alphabetically by Name in ascending order



# # No matching results

# Given I enter a name that does not exist as the Organisation Administrator or Sponsor or System Administrator

# When I click "Search"

# Then I see a page with the message "There are no matching results"

# And I see guidance notes per the referenced design



# # Role-based actions in Action column

# Given I am on the Users page

# And my role is Organisation Administrator or System Administrator

# Then the Action column shows "Manage" as a hyperlink for each user



# Given I am on the Users page

# And my role is Sponsor

# Then the Action column shows "View" as a hyperlink for each user



# # Non-member is denied when attempting to open the Users page

# Given I am signed in

# And I am not associated with the target sponsor organisation

# And I attempt to access the Sponsor Organisation "Users" page from any navigation entry point

# When the page loads

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design



# # Non-member is denied when using a direct URL to the Users page

# Given I paste or follow a direct URL that points to a sponsor organisation's "Users" page as a non-member

# When the request is processed

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design

# And I am not redirected to any privileged page



# # Member of a different organisation is denied access

# Given I am associated with sponsor organisation A

# And I am not associated with sponsor organisation B

# When I try to access organisation B's "Users" page

# Then I see an "Access denied" page

# And no user or organisation details are displayed

# And I see guidance per the approved design



## Pagination behaviour for project list

# Given there are more than 20 users in the list

# When I view the users page as the Organisation Administrator or Sponsor

# Then the users list should be paginated with a maximum of 20 rows per page

# And pagination controls should appear at the bottom of the page



## First Page Behaviour

# Given I am on the first page

# When I view the paginated results

# Then the "Previous" button should be disabled and not visible

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page after the current page and the last page First page – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# # Last Page Behaviour

# Given I am on the last page

# When I view the paginated results

# Then the "Next" button should be disabled and not visible

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page immediately before the current page and the first page Last page – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# #Page Number Selection

# Given I identify which page I am on

# When I select a page number

# Then the corresponding page should be displayed

# And the current page number should be visually highlighted to indicate the active page

# And the pagination should show at least one page immediately before and after the current page, as well as the first and last pages Pagination with numbered labels – Pagination

# And if there are any skipped pages, ellipses (…) should be used to replace the number Pagination with numbered labels – Pagination



# #Next Button Navigation

# Given I can view the "Next" link

# When I select the "Next" button

# Then the data on the next page should be displayed

# And the current page number should be visually highlighted to indicate the active page



# #Previous Button Navigation

# Given I can view the "Previous" link

# When I select the "Previous" button

# Then the data on the previous page should be displayed

# And the current page number should be visually highlighted to indicate the active page


# https://nihr.atlassian.net/browse/RSP-6461

# # Organisation Administrator/System Administrator  visibility of Add user tab

# Given I am signed in as an Organisation Administrator or System Administrator

# When I am on the Users page of the Sponsor Organisation Profile

# Then I see a clickable "Add user" tab

# And the "Add user" tab is visible only to Organisation Administrators



# # Navigate to Add user page

# Given I am signed in as an Organisation Administrator or System Administrator

# And I am on the Users page of the Sponsor Organisation Profile

# When I click the "Add user" tab

# Then I am taken to the page titled "Add user to <Organisation Name>"



# # Back breadcrumb returns to Users page

# Given I am on the "Add user to <Organisation Name>" page

# And I see a breadcrumb labelled "Back" at the top left

# When I click "Back"

# Then I am returned to the Users page



# # Email field and primary action are present

# Given I am on the "Add user to <Organisation Name>" page

# Then I see an input field labelled "Email address"

# And I see a "Save and continue" control below the email field



# # Error when email is not a registered user

# Given I enter an email address that is not registered on the system

# When I click "Save and continue"

# Then I see a notification page stating "An account does not exist for this email address"

# And I see guidance notes per the design

# And I cannot proceed until a registered user's email address is entered



# # Error when email is invalid or blank

# Given the email field is blank or contains an invalid email format

# When I click "Save and continue"

# Then I see a notification page stating "There is a problem"

# And I see guidance notes per the design

# And I cannot proceed until a valid registered user's email address is entered



# # Proceed to Add user role on valid registered email

# Given I enter a valid email address for a registered user

# When I click "Save and continue"

# Then I am taken to the "Add user role" page for that user


