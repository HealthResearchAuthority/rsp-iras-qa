@MyResearch @FrontStageUser @SystemTest
Feature: User Administration: My Research

  Background:
    Given I have navigated to the 'Home_Page'
    And I can see the my account home page

  @rsp-3424 @myResearchProjectsPage @Smoke @Skip
  Scenario Outline: Validate the my research page and Navigation back to home page
    Given I have navigated to the 'My_Research_Page'
    Then I can see the 'My_Research_Page'
    When I click the 'Back' link on the 'My_Research_Page'
    Then I can see the my account home page
    Then I capture the page screenshot
    When I have navigated to the 'My_Research_Page'
    When I click the 'Home' link on the 'Banner'
    Then I can see the my account home page
    Then I capture the page screenshot
