@ApplicantUser @CreateModifications @ProjectDocumentsEditAndSave @SystemTest @jsEnabled
Feature: Create Amendment - Project Documents Edit and Save

    Background:
        Given I have navigated to the my research projects page
        And I can see the my research projects page
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the key project roles page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
        Then I fill the research locations page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        Then I can see the review your answers page
        And I capture the page screenshot
        When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I can see the project overview page
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
        And I can see the select area of change page

    @rsp-3889 @abc
    Scenario Outline: Validate the ui labels displayed for upload documents pages in modifications
        And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
        When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
        #Then I can see the add documents for '<Specific_Change>' page
        Then I upload 'PNG_File' documents
        When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
        #Then I can see the review uploaded documents for '<Specific_Change>' page

        #When I click the 'Save_Continue' button on the 'Documents_Added_Modifications_Page'
        # And I can see the add document details for '<Specific_Change>' page
        # And I capture the page screenshot
        # And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        # And I validate the ui labels for add document details modifications page

        Examples:
            | Specific_Change                    |
            | Correction_Of_Typographical_Errors |
# | CRF_Other_Study_Data_Records                 |
# | GDPR_Wording                                 |
# | Other_Minor_Change_To_Study_Documents        |
# | Post_Trial_Information_For_Participants      |
# | Protocol_Non_Substantial_Changes             |
# | Translations_Addition_Of_Translated_Versions |
