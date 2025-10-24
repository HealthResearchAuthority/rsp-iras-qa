@SysAdminUser @homePageSmokeFeature @Smoke
Feature: As an Authenticated Admin User I have Access to Authorised Application Features

    Background:
        Given I have navigated to the 'Home_Page'

    @logoutSmoke
    Scenario: I am able to Logout
        When I click the 'Logout' link on the 'Banner'
        And I can see a 'Start_Now' button on the 'Home_Page'

    @accessResearchAccountHomePageSmoke
    Scenario: I am able to access the my account home page
        Then I can see the 'Home_Page'
        And I can see project guidance text on the home_page
