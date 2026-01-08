@SysAdminUser @SystemTest @UserAdministration @ManageSponsorOrgs @SortSearchSponsorOrgs @BackStage @rsp-5233
Feature: Sort, search and pagination of users list in the selected sponsor org

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter 'name of the previously added sponsor organisation' into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    And I capture the page screenshot
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Active' status in the manage sponsor organisation page
    And I capture the page screenshot
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I capture the page screenshot
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    And I capture the page screenshot
    Then I can see the user list page of the 'sponsor organisation'
    And I can see the 'sponsor organisation users' list sorted by 'ascending' order of the 'first name' on the 'first' page

  @rsp-5233 @sortUserListByColumn
  Scenario Outline: Verify the user is able to sort the users list by ascending and descending order for each table column
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
      | Sort_Button   | Sort_Field    | Initial_Sort | Secondary_Sort |
      | First_Name    | first name    | descending   | ascending      |
      | Last_Name     | last name     | ascending    | descending     |
      | Email_Address | email address | ascending    | descending     |
      | Status        | status        | ascending    | descending     |

  @rsp-5233 @sortUserListByColumn
  Scenario Outline: Verify the user is able to sort the users list by ascending and descending order for each table column-last logged in
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
      | Sort_Button    | Sort_Field     | Initial_Sort | Secondary_Sort |
      | Last_Logged_In | last logged in | ascending    | descending     |

  @rsp-5233 @UserlistSponsorOrgPagination @UserlistSponsorOrgPaginationFirstPage @UserlistSponsorOrgPaginationPageNumber @UserlistSponsorOrgPaginationNextLinkClick
  Scenario: Verify pagination in user list page of sponsor organisation when user is on the first page and navigate through each page by clicking page number or by by clicking next link
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
      | Navigation_Method |
      | page number       |
      | next link         |

  @rsp-5233 @UserlistSponsorOrgPagination @UserlistSponsorOrgPaginationLastPage @UserlistSponsorOrgPaginationPageNumber @MUserlistSponsorOrgPaginationPreviousLinkClick
  Scenario: Verify pagination in user list page of sponsor organisation when user is on the last page and navigate through each page by clicking page number or by by clicking on previous link
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Sponsor_Org_User_List_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot
    Examples:
      | Navigation_Method |
      | page number       |
      | previous link     |