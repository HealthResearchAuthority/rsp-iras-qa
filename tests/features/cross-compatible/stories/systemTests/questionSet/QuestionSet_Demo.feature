@adminUser @questionSetDemo
# This Qset work was completed during Alpha phase with placeholder UI Screens
# QSet Feature not yet developed in actual application
# Therefore this feature is not part of the test pack
# But is being kept as most of the steps can be re-used once Qset is in development
# And the feature can be re-worked
Feature: Question Set - Research Application - Combined Question Set Demo

    Background:
        Given I have navigated to the 'Create_Application_Page'

    @rsp-1500 @rsp-1501 @rsp-1502 @rsp-1504
    Scenario Outline: Validate the entire flow of a new research application
        And I enter the application name and description for '<Project>'
        And I click the 'Create' button on the 'Create_Application_Page'
        And I can see the proceed application page for '<Project>'
        And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
        And I can see the 'Project_Filter' question set
        When I fill the 'Project_Details' section in the project filter page with '<Project_Details>'
        And I fill the 'Project_Scope' section in the project filter page with '<Project_Scope>'
        And I fill the 'Research_Location' section in the project filter page with '<Research_Location>'
        Then I click the 'Continue' button on the 'Question_Set'
        And I can see the 'Project_Details' question set
        When I fill the 'Project_Information' section on the project details page with '<Project_Information>'
        And I fill the 'Public_Involvement' section on the project details page with '<Public_Involvement>'
        And I fill the 'Research_Design' section on the project details page with '<Research_Design>'
        And I fill the 'Research_Activities' section on the project details page with '<Research_Activities>'
        And I fill the 'Participants' section on the project details page with '<Participants>'
        And I fill the 'Consent' section on the project details page with '<Consent>'
        And I fill the 'Risks_Conflicts' section on the project details page with '<Risks_Conflicts>'
        And I fill the 'Summary_Ethical_Issues' section on the project details page with '<Summary_Ethical_Issues>'
        And I fill the 'Research_Analysis' section on the project details page with '<Research_Analysis>'
        And I fill the 'Governance_Management' section on the project details page with '<Governance_Management>'
        And I fill the 'Transparency' section on the project details page with '<Transparency>'
        And I fill the 'Confidentiality_Info_Management' section on the project details page with '<Confidentiality_Info_Management>'
        Then I click the 'Continue' button on the 'Question_Set'

        Examples:
            | Project   | Project_Details           | Project_Scope         | Research_Location     | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Consent                  | Risks_Conflicts          | Summary_Ethical_Issues   | Research_Analysis        | Governance_Management    | Transparency             | Confidentiality_Info_Management |
            | Project_X | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields        |
            | Project_Y | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | No_Risks_Or_Conflicts    | No_Ethical_Concerns      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Negative_Responses       | The_Answer_No                   |