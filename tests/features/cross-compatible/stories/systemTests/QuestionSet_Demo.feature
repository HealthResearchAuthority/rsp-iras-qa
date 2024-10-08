@adminUser @questionSetDemo @SystemTest
Feature: Question Set - Research Application - Combined Question Set Demo

    Background:
        Given I have navigated to the 'Home_Page'

    @rsp-1500 @rsp-1504
    Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
        And I click the '<Application_Button>' button on the 'Home_Page'
        And I can see the project filter page
        When I fill the project details section in the project filter page with '<Project_Details>'
        And I fill the project scope section in the project filter page with '<Project_Scope>'
        And I fill the research location section in the project filter page with '<Research_Location>'
        Then I click the '<Navigation_Button>' button on the 'Question_Set'
        And I can see the project details page
        When I fill the Project Information section on the project details page with '<Project_Information>'
        And I fill the Public Involvement section on the project details page with '<Public_Involvement>'
        And I fill the Research Design and Methodology section on the project details page with '<Research_Design>'
        And I fill the Research Activities section on the project details page with '<Research_Activities>'
        And I fill the Participants section on the project details page with '<Participants>'
        Then I click the '<Navigation_Button>' button on the 'Question_Set'

        Examples:
            | Application_Button | Project_Details           | Project_Scope         | Research_Location        | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Navigation_Button |
            | New_Application    | Project_Details_Common    | Project_Scope_Common  | Research_Location_Common | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Continue          |
            | New_Application    | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields    | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields | Continue          |