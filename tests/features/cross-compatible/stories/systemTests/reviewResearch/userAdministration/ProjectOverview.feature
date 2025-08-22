@ProjectOverview @FrontStageUser @SystemTest
Feature: User Administration: Project Overview

    Background:
        Given I have navigated to the 'Home_Page'
        And I can see the my account home page
        And I have navigated to the 'My_Research_Page'
        And I can see the 'My_Research_Page'

    @rsp-1864
    Scenario Outline: Verify user is able to click on the project link on my research page and able to navigate to project overview page
        And I can see the '<Validation_Text_Research>' ui labels on the my research project page
        And I capture the page screenshot
        And I click the '<Project_Details>' link on the my research page
        And I can see the project overview page
        And I capture the page screenshot
        And I can see the project details on project overview page for '<Project_Details>'
        And I can see the '<Validation_Text_Project>' ui labels on the project overview page
        And I validate the data displayed '<Project_Details>' in the project details tab of project overview page
        And I capture the page screenshot
        When I click the 'Key_Project_Roles' link on the 'Project_Overview_Page'
        And I can see the '<Key_Project_Roles_Details>' in the key project roles tab of project overview page
        And I capture the page screenshot
        Then I click the 'Research_Locations' link on the 'Project_Overview_Page'
        And I can see the '<Research_Locations_Details>' in the research locations tab of project overview page
        And I capture the page screenshot

        Examples:
            | Validation_Text_Research | Project_Details               | Validation_Text_Project | Key_Project_Roles_Details               | Research_Locations_Details               |
            | Label_Texts              | Valid_Project_Details_Nhs     | Label_Texts             | Valid_Key_Project_Roles_Details_Nhs     | Valid_Research_Locations_Details_Nhs     |
            | Label_Texts              | Valid_Project_Details_Non_Nhs | Label_Texts             | Valid_Key_Project_Roles_Details_Non_Nhs | Valid_Research_Locations_Details_Non_Nhs |