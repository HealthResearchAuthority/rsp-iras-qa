@SysAdminUser @SystemTest
Feature: This feature file is to validate the assisted digital test coverage as a system admininstrator for known scenarios

    Background:
        Given I have navigated to the my research projects page
        And I can see the my research projects page

    @AuthoriseAndApproveModification
    Scenario: Validate system admininstrator is able to authorise and approve a modification
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
        Then I can see the project identifiers page
        And I fill the project identifiers page with 'Ministry_Of_Defence'
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the chief investigator page with 'Valid_Data_All_Fields'
        Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
        Then I fill the research locations page with '<Research_Locations>'
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        Then I can see the review your answers page
        And I capture the page screenshot
        When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
        And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
        And I create '<Changes>' for the created modification
        And I can see the modifications details page
        And I validate the project information labels using dataset displayed on modifications page
        And I capture the page screenshot
        When I click the 'Add_Documents' button on the 'Modification_Details_Page'
        And I upload 'Multiple_Files_Three' documents
        When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
        When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
        When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
        And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
        And I capture the page screenshot
        Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
        Then I can see the review all changes page
        And I capture the page screenshot
        Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
        Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
        And I capture the page screenshot
        Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the project overview page
        And I capture the page screenshot
        When I click the 'Home' link on the 'Banner'
        And I capture the page screenshot
        When I click the 'Sponsor' link on the 'Home_Page'
        And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I can see the sponsor check and authorise page
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
        And I capture the page screenshot
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'With sponsor' status displayed for all documents in the table
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
        And I capture the page screenshot
        And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'With review body' status in the sponsor authorisations page
        And I can see the searched modification to be present in the list with date actioned with 'with reviewbody' status in the sponsor authorisations page
        And I capture the page screenshot
        When I click the 'Home' link on the 'Banner'
        When I click the 'Approvals' link on the 'Home_Page'
        And I click the 'Search_Records' link on the 'Approvals_Page'
        And I select the radio button for 'Modification_Record' in the choose a record type to search page
        And I capture the page screenshot
        And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
        Then I can see the 'Search_Modifications_Page'
        And I enter 'new iras id' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I can now see a table of search results for 'modifications received for approval'
        When I click a 'modification id' on the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Modification_Page'
        When I provide the '<Outcome>' outcome for the modification with '<Outcome_Reason>' reason
        When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
        And I capture the page screenshot
        When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
        And I capture the page screenshot
        Then I validate confirmation screen for modification review outcome sent

        Examples:
            | Changes                                            | Research_Locations  | Outcome  | Outcome_Reason |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Nhs_Involvement_Yes | Approved | Blank          |


    @AuthoriseAndAssignModificationToStudyWideReviewer
    Scenario: Validate system adminintrator is able to authorise and assign modification to a study wide reviewer
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
        Then I can see the project identifiers page
        And I fill the project identifiers page with 'Ministry_Of_Defence'
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the chief investigator page with 'Valid_Data_All_Fields'
        Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
        Then I fill the research locations page with '<Research_Locations>'
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        Then I can see the review your answers page
        And I capture the page screenshot
        When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
        And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
        And I create '<Changes>' for the created modification
        And I can see the modifications details page
        And I validate the project information labels using dataset displayed on modifications page
        And I capture the page screenshot
        When I click the 'Add_Documents' button on the 'Modification_Details_Page'
        And I upload 'Multiple_Files_Three' documents
        When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
        When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
        When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
        And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
        And I capture the page screenshot
        Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
        Then I can see the review all changes page
        And I capture the page screenshot
        Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
        Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
        And I capture the page screenshot
        Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the project overview page
        And I capture the page screenshot
        When I click the 'Home' link on the 'Banner'
        And I capture the page screenshot
        When I click the 'Sponsor' link on the 'Home_Page'
        And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I can see the sponsor check and authorise page
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
        And I capture the page screenshot
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'With sponsor' status displayed for all documents in the table
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
        And I capture the page screenshot
        When I click the 'Home' link on the 'Banner'
        When I click the 'Approvals' link on the 'Home_Page'
        And I click the 'Modifications_Tasklist' link on the 'Approvals_Page'
        And I enter 'new iras id' into the search field
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I 'can' see the modification displayed in the 'Team_Manager_Dashboard_Page' list with 'Modification_Status_Received' status
        When I select the modification in order to assign it
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
        And I capture the page screenshot
        And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
        And I capture the page screenshot
        And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
        Then I 'can' see the modification displayed in the 'Team_Manager_Dashboard_Page' list with 'Modification_Status_Review_In_Progress' status
        And I capture the page screenshot

        Examples:
            | Changes                                            | Research_Locations  | Outcome  | Outcome_Reason | Study_Wide_Reviewer             |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Nhs_Involvement_Yes | Approved | Blank          | Study_Wide_Reviewer_HRA_England |
