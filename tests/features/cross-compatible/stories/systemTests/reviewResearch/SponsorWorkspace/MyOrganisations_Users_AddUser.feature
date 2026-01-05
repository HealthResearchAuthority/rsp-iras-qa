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

  @rsp-6461 @MyOrganisationsPageLabelValidation @Run
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
    And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'My_Organisations_Users_Page'


    Examples:
      | Login_User             | User_Email              | Link   | Add_A_User_Section_Visibility |
      | System_Admin           | system admin email      | Manage | Add a user section is visible |
      | Sponsor_Org_Admin_User | sponsor org admin email | Manage | Add a user section is visible |


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


