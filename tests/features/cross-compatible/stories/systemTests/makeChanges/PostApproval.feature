@PostApproval @ApplicantUser @SystemTest
Feature: Project Overview

    @abc
    Scenario Outline:dfgdg
        #project creation
        Given I have navigated to the my research projects page
        And I can see the my research projects page
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        When I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        Then I can see the project identifiers page
        Then I fill the project identifiers page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        And I fill the chief investigator page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
        And I fill the research locations page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        Then I can see the project overview page
        #Modification creation
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        #loop this for 5 times
        And I create '<Modifications>' and click on save for later on the select area of change page
        # create 5 modifications for approved status
        # create 5 modifications for sponsor review status

        Examples:
            | Modifications          |
            | Multiple_Modifications |