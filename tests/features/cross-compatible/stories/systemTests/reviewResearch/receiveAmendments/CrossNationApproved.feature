@SystemTest @CrossNationApproved @SysAdminUser @SetupNewSponsorOrgGoLive
Feature: Login as a role which is not same lead nation who created project: search the record and provide approval

    Background:
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfBristol'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I keep note of the organisation name for sponsor organisation setup
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I capture the page screenshot
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'newly added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
        Then I click the view edit link of the 'newly added sponsor organisation'
        And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
        And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
        When I enter 'automation sponsor email' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
        When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
        And I capture the page screenshot
        When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
        And I capture the page screenshot
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        #Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
        And I fill the project identifiers page with 'Sponsor_Organisation_Full_Text_Bristol'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the chief investigator page with 'Valid_Data_All_Fields'
        Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'

    Scenario Outline: Validate for <Research_Locations> project record, <Other_Backend_User> searches and approves the modification
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
        When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
        And I capture the page screenshot
        Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
        Then I can see the review all changes page
        And I capture the page screenshot
        Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
        Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
        And I capture the page screenshot
        And I have navigated to the 'Home_Page' as 'Sponsor_User'
        When I click the 'Sponsor' link on the 'Home_Page'
        And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id from sponsor authorisations page
        And I can see the sponsor check and authorise page
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
        And I capture the page screenshot
        When I have navigated to the 'Home_Page' as '<Other_Backend_User>'
        Then I click the 'Approvals' link on the 'Home_Page'
        #And I can see the approvals home page //Once the titles issue sorted for all pages as part of other stories, this needs to be uncommented
        And I click the 'Search_Records' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the 'Choose_A_Record_Type_To_Search_Page'
        And I capture the page screenshot
        And I select the radio button for 'Modification_Record' in the choose a record type to search page
        And I capture the page screenshot
        And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
        And I capture the page screenshot
        Then I can see the 'Search_Modifications_Page'
        And I capture the page screenshot
        And I enter 'new iras id' into the search field
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then I can now see a table of search results for 'modifications received for approval'
        And I 'can' see the modification displayed in the 'Search_Modifications_Page' list with 'Modification_Status_Received' status
        When I click the modification id displayed on the 'Search_Modifications_Page'
        #Then I can see the modifications details page in the readonly view //This will be uncommented once the page heading story validated.
        When I click the 'Continue' link on the 'Modification_Details_Page'
        Then I can see the review outcome section
        When I provide the '<Outcome>' outcome for the modification with '<Outcome_Reason>' reason
        When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
        Then I see the check and send review outcome page with '<Outcome>' outcome and '<Outcome_Reason>' reason
        When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
        Then I validate confirmation screen for modification review outcome sent
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        When I enter 'new iras id' into the search field
        And I click the 'Search' button on the 'My_Research_Page'
        And I click on the short project title for the searched iras id from my research projects page
        Then I can see the project overview page
        And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
        And I capture the page screenshot
        And I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'Approved'

        Examples:
            | Changes                                                            | Research_Locations                     | Other_Backend_User      | Outcome  | Outcome_Reason | Outcome_Status               |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_England          | Workflow_Coordinator_NI | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_England          | Workflow_Coordinator_S  | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_England          | Workflow_Coordinator_W  | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_England          | Studywide_Reviewer_NI   | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_England          | Studywide_Reviewer_S    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_England          | Studywide_Reviewer_W    | Approved | Blank          | Modification_Status_Approved |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_England          | Team_Manager_NI         | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_England          | Team_Manager_S          | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_England          | Team_Manager_W          | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_Northern_Ireland | Workflow_Coordinator    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_Northern_Ireland | Workflow_Coordinator_S  | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Northern_Ireland | Workflow_Coordinator_W  | Approved | Blank          | Modification_Status_Approved |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_Northern_Ireland | Studywide_Reviewer      | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_Northern_Ireland | Studywide_Reviewer_S    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_Northern_Ireland | Studywide_Reviewer_W    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_Northern_Ireland | Team_Manager            | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_Northern_Ireland | Team_Manager_S          | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Northern_Ireland | Team_Manager_W          | Approved | Blank          | Modification_Status_Approved |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_Scotland         | Workflow_Coordinator    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_Scotland         | Workflow_Coordinator_NI | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_Scotland         | Workflow_Coordinator_W  | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_Scotland         | Studywide_Reviewer      | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_Scotland         | Studywide_Reviewer_NI   | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Scotland         | Studywide_Reviewer_W    | Approved | Blank          | Modification_Status_Approved |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_Scotland         | Team_Manager            | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_Scotland         | Team_Manager_NI         | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_Scotland         | Team_Manager_W          | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_Wales            | Workflow_Coordinator    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_Wales            | Workflow_Coordinator_NI | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Wales            | Workflow_Coordinator_S  | Approved | Blank          | Modification_Status_Approved |
            | Other_Minor_Change_To_Project_Management                           | Data_With_Lead_Nation_Wales            | Studywide_Reviewer      | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 | Data_With_Lead_Nation_Wales            | Studywide_Reviewer_NI   | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 | Data_With_Lead_Nation_Wales            | Studywide_Reviewer_S    | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Reviewable_Set_Three                              | Data_With_Lead_Nation_Wales            | Team_Manager            | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four   | Data_With_Lead_Nation_Wales            | Team_Manager_NI         | Approved | Blank          | Modification_Status_Approved |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Wales            | Team_Manager_S          | Approved | Blank          | Modification_Status_Approved |