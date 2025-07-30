@UserAdministration @ManageUsers @SortSearchFilterUsers @SysAdminUser @SystemTest
Feature: User Administration: Sort, search and filter the manage users list

  Background:
    Given I have navigated to the 'Manage_Users_Page'
    And I can see the manage users list sorted by 'ascending' order of the 'first name'

  @sortUserListByColumn @RSP-3553
  Scenario Outline: Verify the user is able to sort the manage users list by ascending and descending order for each table column
    When I click the '<Sort_Button>' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the manage users list sorted by '<Initial_Sort>' order of the '<Sort_Field>'
    When I click the '<Sort_Button>' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the manage users list sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

    Examples:
      | Sort_Button    | Sort_Field     | Initial_Sort | Secondary_Sort |
      | First_Name     | first name     | descending   | ascending      |
      | Last_Name      | last name      | ascending    | descending     |
      | Email_Address  | email address  | ascending    | descending     |
      | Status         | status         | ascending    | ascending      |
      | Last_Logged_In | last logged in | ascending    | descending     |