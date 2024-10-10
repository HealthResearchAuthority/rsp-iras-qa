@adminUser @questionSetDemo @SystemTest
Feature: Question Set - Research Application - Combined Question Set Demo

    Background:
        Given I have navigated to the 'Create_Application_Page'

    @rsp-1500 @rsp-1504
    Scenario Outline: Validate the entire flow of a new research application
        And I enter the application name and description for '<Project>'
        And I click the 'Create' button on the 'Create_Application_Page'
        And I can see the proceed application page for '<Project>'
        And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
        And I can see the 'Project_Filter' question set
        When I fill the project details section in the project filter page with '<Project_Details>'
        And I fill the project scope section in the project filter page with '<Project_Scope>'
        And I fill the research location section in the project filter page with '<Research_Location>'
        Then I click the 'Continue' button on the 'Question_Set'
        And I can see the 'Project_Details' question set
        When I fill the project information section on the project details page with '<Project_Information>'
        And I fill the public involvement section on the project details page with '<Public_Involvement>'
        And I fill the research design and methodology section on the project details page with '<Research_Design>'
        And I fill the research activities section on the project details page with '<Research_Activities>'
        And I fill the participants section on the project details page with '<Participants>'
        Then I click the 'Continue' button on the 'Question_Set'

        Examples:
            | Project   | Project_Details           | Project_Scope         | Research_Location     | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             |
            | Project_X | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields |
            | Project_Y | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields |