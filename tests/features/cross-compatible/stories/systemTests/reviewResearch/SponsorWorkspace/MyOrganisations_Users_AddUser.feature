@SponsorWorkspace @SystemTest @SysAdminUser @SetupNewSponsorOrgGoLive
Feature: Sponsor Workspace-My Organisations-Users-Add user

  Background:
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfBirmingham'
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    And I capture the page screenshot
    And I keep note of the organisation name for sponsor organisation setup
    When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
    And I capture the page screenshot
    Then I can see the sponsor organisation added successful message on manage sponsor organisation page
    # When I enter 'name of the newly added sponsor organisation' into the search field
    When I enter 'University of Birmingham' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'newly added sponsor organisation'
    And I capture the page screenshot
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    And I capture the page screenshot

  @rsp-6461 @MyOrganisationsAddUserPage @KNOWN-DEFECT-RSP-6723
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
    And the users tab is underlined
    And the add a user section is '<Add_A_User_Section_Visibility>' based on the logged in user role
    Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
    And I capture the page screenshot
    Then I navigate to the add user page for the selected sponsor organisation '<Sponsor_Organisation>'

    Examples:
      | Login_User             | User_Email              | Link | Add_A_User_Section_Visibility | Sponsor_Organisation     | Select_User_Role                | Select_User_Permission  |
      # | System_Admin           | system admin email      | Manage | visible                       | University of Birmingham | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |
      | Sponsor_Org_Admin_User | sponsor org admin email | View | visible                       | University of Birmingham | Sponsor_Org_User_Role_Org_Admin | No_Permission_To_Select |





# # Validation error when no role selected

# Given I am on the "Add user role" page

# And no role is selected

# When I click "Save and continue"

# Then a notification page stating "There is a problem" is displayed with guidance notes

# And I cannot proceed until a role is selected

##  https://nihr.atlassian.net/browse/RSP-6461



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


##  https://nihr.atlassian.net/browse/RSP-6425


# #Authorisation capability based on role and permission

# Given the user has role: Organisation Administrator or Sponsor with authorisation = Yes

# Then they can authorise project modifications/submissions.



# Given  the user has role: Sponsor with authorisation = No

# Then they have view‑only access to project modifications/submissions.


## https://nihr.atlassian.net/browse/RSP-6465


## Display role options and guidance

# Given I am on the "Add user role" page

# Then I see an important guidance banner “Authorisation Guidance”

# And I see a "Role" section with radio options "Organisation Administrator" and "Sponsor"

# And guidance notes are displayed for the role selection

# And only one role can be selected by the Organisation Administrator or System Administrator



# Back breadcrumb from Add user role

# Given I am on the "Add user role" page

# Then I see a breadcrumb labelled "Back"

# When I click "Back"

# Then I return to the "Add users" page



# Selecting Organisation Administrator auto-assigns authoriser and proceeds

# Given I select the role "Organisation Administrator"

# When I click "Save and continue"

# Then the user’s authoriser permission is set to "Yes" automatically

# And I am navigated to the "Check and confirm user" page



# Selecting Sponsor proceeds to Add user permission page

# Given I select the role "Sponsor"

# When I click "Save and continue"

# Then I am navigated to the "Add user permission" page



# Validation error when no role selected

# Given I am on the "Add user role" page

# And no role is selected

# When I click "Save and continue"

# Then a notification page stating "There is a problem" is displayed with guidance notes

# And I cannot proceed until a role is selected



# Display permission option for Sponsor

# Given I am on the "Add user permission" page

# Then I see a permissions section with guidance

# And I see a checkbox labelled "User can authorise submissions"

# And I see a breadcrumb labelled "Back" that returns to the "Add user role" page



# Save and continue from Add user permission

# Given I have optionally ticked the checkbox "User can authorise submissions" for a sponsor assigned role

# When I click "Save and continue"

# Then I am navigated to the "Check and confirm user" page



# Review assigned details and change if needed

# Given I am on the "Check and confirm user" page

# Then I see three rows: "Email address", "Role", and "Authoriser"

# And each row has a "Change" hyperlink

# When I click "Change" on "Email address"

# Then I am taken to the "Add users" page

# When I click "Change" on "Role"

# Then I am taken to the "Add user role" page

# When I click "Change" on "Authoriser"

# Then I am taken to the "Add user permission" page



# Confirm saves details and shows success banner

# Given I am satisfied with the details on the "Check and confirm user" page

# When I click "Confirm"

# Then the user details are saved

# And I see a success notification banner "User added" on the Users page



# Cancel discards details and returns to Users page

# Given I am on the "Check and confirm user" page

# When I click "Cancel"

# Then no changes are saved

# And I am returned to the Users page



# Authorisation capability based on role and permission

# Given the user has role: Organisation Administrator or Sponsor with authorisation = Yes

# Then they can authorise project modifications/submissions.



# Given  the user has role: Sponsor with authorisation = No

# Then they have view‑only access to project modifications/submissions.





