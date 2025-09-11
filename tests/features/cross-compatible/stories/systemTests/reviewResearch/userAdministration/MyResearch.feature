@MyResearch @ApplicantUser @SystemTest
Feature: User Administration: My Research

  Background:
    Given I have navigated to the 'Home_Page'
    And I can see the my account home page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'

  @rsp-3424 @myResearchProjectsPage @Smoke @skip
  Scenario: Validate the my research page and Navigation back to home page
    When I click the 'Back' link on the 'My_Research_Page'
    Then I can see the my account home page
    Then I capture the page screenshot
    When I have navigated to the 'My_Research_Page'
    When I click the 'Home' link on the 'Banner'
    Then I can see the my account home page
    Then I capture the page screenshot

  @rsp-2854 @MyResearchProjectsPage
  Scenario Outline: Validate the my research page with projects
    And I can see a 'Search' button on the 'My_Research_Projects_Page'
    And I can see a 'Advanced_filter' button on the 'My_Research_Projects_Page'
    And I can see the '<Validation_Text>' ui labels on the my research project page
    And I capture the page screenshot
    And the default page size should be twenty
    Then I can see my research page is sorted by 'descending' order of the 'date created'

    Examples:
      | Validation_Text |
      | Label_Texts     |

  @rsp-2854 @SortProjectsByColumn
  Scenario Outline: Verify the user is able to sort the list of projects under my research by ascending and descending order for each table column other than status
    When I click the '<Sort_Button>' button on the 'My_Research_Projects_Page'
    And I capture the page screenshot
    Then I can see my research page is sorted by 'ascending' order of the '<Sort_Field>'
    When I click the '<Sort_Button>' button on the 'My_Research_Projects_Page'
    And I capture the page screenshot
    Then I can see my research page is sorted by 'descending' order of the '<Sort_Field>'

    Examples:
      | Sort_Button         | Sort_Field          |
      | Short_Project_Title | short project title |
      | Iras_Id             | iras id             |
      | Date_Created        | date created        |

  @rsp-2854 @MyResearchPagination @MyResearchPaginationFirstPage
  Scenario: Verify pagination in my research page when user is on the first page
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot

  @rsp-2854 @MyResearchPagination @MyResearchPaginationLastPage
  Scenario: Verify pagination in my research page when user is on the last page
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot


