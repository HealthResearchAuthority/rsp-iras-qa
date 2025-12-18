@SponsorAuthorised @Regression @SetupNewSponsorOrgGoLive @SponsorUser @jsEnabled
Feature: This feature covers scenarios related to sponsor not authorised modifications

    Background:
        Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
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
        And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
        Then I can see the 'user added' successful message on sponsor organisation user list page
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
        And I fill the project identifiers page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the chief investigator page with 'Valid_Data_All_Fields'
        Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'

    @rsp-5191 @rsp-5192 @rsp-5475 @rsp-5476 @rsp-5535 @rsp-5536 @rsp-5338 @ReviewableModificationSponsorAuthorised
    @rsp-5191 @rsp-5192 @rsp-5475 @rsp-5476 @rsp-5535 @rsp-5536 @rsp-5338 @ReviewableModificationSponsorAuthorised
    Scenario Outline: Validate that sponsor can action to not authorise the reviewable modifications
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
        And I have navigated to the 'Home_Page' as 'Sponsor_User'
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
        And I can see the ui labels in sponsor check and authorise page
        And I capture the page screenshot
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate all fields on modification page using '<Changes>' for collapsed view and by expanding the view details
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'With sponsor' status displayed for all documents in the table
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification not authorised by sponsor
        And I capture the page screenshot
        And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in the sponsor authorisations page
        And I can see the searched modification to be present in the list with date actioned with 'Not authorised' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I can see the modification page for sponsor view
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate the change details are displayed as per the '<Changes>' dataset under the tabs sections
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        When I enter 'iras id' into the search field
        And I click the 'Search' button on the 'My_Research_Page'
        And I click on the short project title for the searched iras id from my research projects page
        When I click the 'Project_Documents' link on the 'Project_Overview_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Post_Approval_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in project overview page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot

        Examples:
            | Changes                                            | Research_Locations                     |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_England          |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Northern_Ireland |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Scotland         |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One | Data_With_Lead_Nation_Wales            |
            | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_England          |
            | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Northern_Ireland |
            | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Scotland         |
            | Other_Minor_Change_To_Project_Management           | Data_With_Lead_Nation_Wales            |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_England          |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Northern_Ireland |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Scotland         |
            | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two | Data_With_Lead_Nation_Wales            |
            | Multiple_Changes_Reviewable_Set_Three              | Data_With_Lead_Nation_England          |
            | Multiple_Changes_Reviewable_Set_Three              | Data_With_Lead_Nation_Northern_Ireland |
            | Multiple_Changes_Reviewable_Set_Three              | Data_With_Lead_Nation_Scotland         |
            | Multiple_Changes_Reviewable_Set_Three              | Data_With_Lead_Nation_Wales            |

    @rsp-5191 @rsp-5192 @rsp-5475 @rsp-5476 @rsp-5535 @rsp-5536 @rsp-5338 @NonReviewableModificationSponsorAuthorised
    Scenario Outline: Validate that sponsor can action to not authorise the non reviewable modifications
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
        And I have navigated to the 'Home_Page' as 'Sponsor_User'
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
        And I can see the ui labels in sponsor check and authorise page
        And I capture the page screenshot
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate all fields on modification page using '<Changes>' for collapsed view and by expanding the view details
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'With sponsor' status displayed for all documents in the table
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification not authorised by sponsor
        And I capture the page screenshot
        And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in the sponsor authorisations page
        And I can see the searched modification to be present in the list with date actioned with 'Not authorised' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I can see the modification page for sponsor view
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate the change details are displayed as per the '<Changes>' dataset under the tabs sections
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        When I enter 'iras id' into the search field
        And I click the 'Search' button on the 'My_Research_Page'
        And I click on the short project title for the searched iras id from my research projects page
        When I click the 'Project_Documents' link on the 'Project_Overview_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Post_Approval_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in project overview page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot

        Examples:
            | Changes                                                          | Research_Locations  |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One           | Nhs_Involvement_Yes |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One           | Nhs_Involvement_No  |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two           | Nhs_Involvement_Yes |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two           | Nhs_Involvement_No  |
            | Multiple_Changes_Non_Reviewable_Set_One                          | Nhs_Involvement_Yes |
            | Multiple_Changes_Non_Reviewable_Set_One                          | Nhs_Involvement_No  |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability | Nhs_Involvement_Yes |
            | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability | Nhs_Involvement_No  |
            | Change_Of_Sponsor_legal_Representative                           | Nhs_Involvement_Yes |
            | Modification_To_Add_Administrative_Details_Set_One               | Nhs_Involvement_Yes |
            | Modification_To_Add_Administrative_Details_Set_Two               | Nhs_Involvement_No  |
            | Multiple_Changes_Non_Reviewable_Set_Two                          | Nhs_Involvement_Yes |
            | Multiple_Changes_Non_Reviewable_Set_Two                          | Nhs_Involvement_No  |

    @rsp-5191 @rsp-5192 @rsp-5475 @rsp-5476 @rsp-5535 @rsp-5536 @rsp-5338 @ReviewableAndNonReviewableModificationSponsorAuthorised
    Scenario Outline: Validate that sponsor can action to not authorise the combination of reviewable and non reviewable modifications
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
        And I have navigated to the 'Home_Page' as 'Sponsor_User'
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
        And I can see the ui labels in sponsor check and authorise page
        And I capture the page screenshot
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate all fields on modification page using '<Changes>' for collapsed view and by expanding the view details
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Sponsor_Check_And_Authorise_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'With sponsor' status displayed for all documents in the table
        And I capture the page screenshot
        And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
        And I capture the page screenshot
        When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
        And I validate confirmation screen for modification not authorised by sponsor
        And I capture the page screenshot
        And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in the sponsor authorisations page
        And I can see the searched modification to be present in the list with date actioned with 'Not authorised' status in the sponsor authorisations page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I can see the modification page for sponsor view
        And I validate the project information labels using dataset displayed on modifications page
        And I validate the date created for modification in sponsor check and authorise page
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
        And I validate the individual and overall ranking of changes on the relevant modification page
        And I validate the change details are displayed as per the '<Changes>' dataset under the tabs sections
        And I capture the page screenshot
        When I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
        When I enter 'iras id' into the search field
        And I click the 'Search' button on the 'My_Research_Page'
        And I click on the short project title for the searched iras id from my research projects page
        When I click the 'Project_Documents' link on the 'Project_Overview_Page'
        And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        When I enter 'modification id' into the search field
        And I click the 'Search' button on the 'Post_Approval_Page'
        And I can see the searched modification to be present in the list with 'Not authorised' status in project overview page
        And I capture the page screenshot
        Then I click on the searched modification id
        And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
        And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
        And I can see the 'Not authorised' status displayed for all documents in the table
        And I capture the page screenshot

        Examples:
            | Changes                                                            | Research_Locations                     |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_England          |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Northern_Ireland |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Scotland         |
            | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_Wales            |
