@Regression @ApplicantUser @createModifications
Feature: Create Modification

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'

  @rsp-5478 @rsp-5675 @rsp-4062 @rsp-5532 @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @rsp-5204 @rsp-4088 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextReviewable
  Scenario Outline: Validate that user can create and submit reviewable modifications
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate all fields on modification page '<Changes>'
    And I validate the ui labels on modification details page using 'Modification_Details_Label_Texts'
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files_Three' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files_Three' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    And I can see the 'supporting_documents_table' ui labels on the review all changes page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Complete' status displayed for all documents in the table
    And I capture the page screenshot
    And the 'Add_Documents' button should be 'available' on the 'Review_All_Changes_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    Then I validate overall modification ranking on post approval tab
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the modification post submission page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'documents_table' ui labels on the modification post submission page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    Examples:
      | Changes                                                          | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One               | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One               | Nhs_Involvement_No  |
      | Other_Minor_Change_To_Project_Management                         | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two               | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two               | Nhs_Involvement_No  |
      | Multiple_Changes_Reviewable_Set_Three                            | Nhs_Involvement_Yes |
      | Multiple_Changes_Reviewable_Set_Three                            | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Reviewable_Set_Four | Nhs_Involvement_No  |

  @rsp-5478 @rsp-5532 @rsp-4062 @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @rsp-4094 @rsp-4095 @rsp-4980 @rsp-4982 @rsp-5588 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextNonReviewable @KNOWN_DEFECT_RSP_6666
  Scenario Outline: Validate that user can create and submit non reviewable modifications
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the project information labels using dataset displayed on modifications page
    Then I validate all fields on modification page '<Changes>'
    And I validate the ui labels on modification details page using 'Modification_Details_Label_Texts'
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files_Three' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files_Three' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I can see the 'supporting_documents_table' ui labels on the review all changes page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Complete' status displayed for all documents in the table
    And I capture the page screenshot
    And the 'Add_Documents' button should be 'available' on the 'Review_All_Changes_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    Then I validate overall modification ranking on post approval tab
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the modification post submission page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'documents_table' ui labels on the modification post submission page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table

    Examples:
      | Changes                                                           | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One            | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One            | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two            | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two            | Nhs_Involvement_No  |
      | Multiple_Changes_Non_Reviewable_Set_One                           | Nhs_Involvement_Yes |
      | Multiple_Changes_Non_Reviewable_Set_One                           | Nhs_Involvement_No  |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability  | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Non_Applicability  | Nhs_Involvement_No  |
      | Change_Of_Sponsor_legal_Representative                            | Nhs_Involvement_Yes |
      | Modification_To_Add_Administrative_Details_Set_One                | Nhs_Involvement_Yes |
      | Modification_To_Add_Administrative_Details_Set_One                | Nhs_Involvement_No  |
      | Modification_To_Add_Administrative_Details_Set_Two                | Nhs_Involvement_Yes |
      | Modification_To_Add_Administrative_Details_Set_Two                | Nhs_Involvement_No  |
      | Multiple_Changes_Non_Reviewable_Set_Two                           | Nhs_Involvement_Yes |
      | Multiple_Changes_Non_Reviewable_Set_Two                           | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Three | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Three | Nhs_Involvement_No  |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Four  | Nhs_Involvement_Yes |
      | Multiple_Changes_Participating_Organisations_Non_Reviewable_Four  | Nhs_Involvement_No  |

  @rsp-5478 @rsp-5532 @rsp-4062 @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextCombined
  Scenario Outline: Validate that user can create modifications for reviewable and non reviewable modifications
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I capture the page screenshot
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    Then I validate all fields on modification page '<Changes>'
    And I validate the ui labels on modification details page using 'Modification_Details_Label_Texts'
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files_Three' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files_Three' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files_Three' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I can see the 'supporting_documents_table' ui labels on the review all changes page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Complete' status displayed for all documents in the table
    And I capture the page screenshot
    And the 'Add_Documents' button should be 'available' on the 'Review_All_Changes_Page'
    Then I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    Then I validate overall modification ranking on post approval tab
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the modification post submission page
    And I capture the page screenshot
    And I validate the individual and overall ranking of changes on the relevant modification page
    And I validate the change details are displayed as per the '<Changes>' dataset
    And I click the 'Documents' link on the 'Modification_Post_Submission_Page'
    And I can see the 'documents_table' ui labels on the modification post submission page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'With sponsor' status displayed for all documents in the table
    And I capture the page screenshot
    And I can see a 'Download_All' button on the 'Modification_Post_Submission_Page'

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_No  |

  @abc @6371 @SetupNewSponsorOrgGoLive @NotAuthorisedAndInDraftAndInDraftErrorPage @SysAdminUser
  Scenario Outline: Validate that the user can create one not authorised modification, one indraft modification and creating another in draft modification displays error message
    #Not authorised modification
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_Airedale'
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
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
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
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    #And I validate the project information labels using dataset displayed on modifications page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    #Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
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
    #And I validate the project information labels using dataset displayed on modifications Page
    And I keep a note of the displayed modification ID on the modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    #And I can see the ui labels in sponsor check and authorise page
    And I capture the page screenshot
    # When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    # And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    # And I capture the page screenshot
    # When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    # And I validate the individual and overall ranking of changes on the relevant modification page
    # And I validate all fields on modification page using '<Changes>' for collapsed view and by expanding the view details
    # And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Not_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I validate confirmation screen for modification not authorised by sponsor
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    # When I enter 'modification id' into the search field
    # And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    # And I can see the searched modification to be present in the list with 'Not authorised' status in the sponsor authorisations page
    # And I can see the searched modification to be present in the list with date actioned with 'Not authorised' status in the sponsor authorisations page
    # And I capture the page screenshot
    # Then I click on the searched modification id
    # And I can see the modification page for sponsor view
    #And I validate the project information labels using dataset displayed on modifications Page
    # And I keep a note of the displayed modification ID on the modifications page
    # And I validate the date created for modification in sponsor check and authorise page
    # And I validate the status 'Modification_Status_Not_Authorised' is displayed on the page
    # When I click the 'Sponsor_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    # And I validate sponsor details are displayed with 'Valid_Data_All_Fields'
    # And I capture the page screenshot
    # When I click the 'Modification_Details' link on the 'Sponsor_Check_And_Authorise_Page'
    # And I validate the individual and overall ranking of changes on the relevant modification page
    # And I validate the change details are displayed as per the '<Changes>' dataset under the tabs sections
    # And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    #When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    # In draft modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    And I validate i can see only one 'Modification_Status_Indraft' on the post approval page
    And I capture the page screenshot
    # Create another In draft modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the create modification error page
    And I capture the page screenshot
    And I validate the field values and labels displayed on the create modification error page
    And I click the 'Return_To_Project_Overview' button on the 'Create_Modification_Error_Page'

    Examples:
      | Changes                                                            | Research_Locations  | Logon_User     |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | System_Admin   |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | Applicant_User |
      | Other_Minor_Change_To_Project_Management                           | Nhs_Involvement_Yes | System_Admin   |
      | Other_Minor_Change_To_Project_Management                           | Nhs_Involvement_Yes | Applicant_User |

  @6371 @WithSponsorAndSubmittingInDraftModificationError
  Scenario Outline: Validate that the user can create one modification with Sponsor and another modification in draft but submitting the indraft modification to sponsor displays error message
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    # with sponsor modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes_for_WithSponsor_Modification>' and '<Research_Locations>' dataset
    And I create '<Changes_for_WithSponsor_Modification>' for the created modification
    And I can see the modifications details page
    #And I validate the project information labels using dataset displayed on modifications page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I capture the page screenshot
    # in draft modification and send to sponsor
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using '<Changes_for_Indraft_Modification>' and '<Research_Locations>' dataset
    And I create '<Changes_for_Indraft_Modification>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I can see the send modification to sponsor error page
    And I capture the page screenshot
    And I validate the field values and labels displayed on the send modification to sponsor error page
    And I click the 'Return_To_Project_Overview' button on the 'Send_Modification_To_Sponsor_Error_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate i can see only one 'Modification_Status_With_Sponsor' on the post approval page
    And I validate i can see only one 'Modification_Status_Indraft' on the post approval page

    Examples:
      | Changes_for_WithSponsor_Modification                               | Research_Locations  | Changes_for_Indraft_Modification                                   | Logon_User     |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | Multiple_Changes_Non_Reviewable_Set_Two                            | Applicant_User |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | Multiple_Changes_Non_Reviewable_Set_Two                            | System_Admin   |
      | Multiple_Changes_Non_Reviewable_Set_Two                            | Nhs_Involvement_Yes | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Applicant_User |
      | Multiple_Changes_Non_Reviewable_Set_Two                            | Nhs_Involvement_Yes | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | System_Admin   |

  @6371 @SetupNewSponsorOrgGoLive @WithReviewBodyAndSubmittingInDraftModificationError
  Scenario Outline: Validate that the user can create one modification with review body and another modification in draft but submitting the indraft modification to sponsor displays error message
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_Airedale'
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
    And I capture the page screenshot
    Then I can see the add user role page
    When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
    And I capture the page screenshot
    And I can see the add user permission page based on 'Sponsor_Authoriser_Yes'
    When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'AIREDALE NHS FOUNDATION TRUST' and 'Sponsor_Authoriser_Yes'
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    # with review body modification
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
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
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I have navigated to the 'Home_Page' as 'Sponsor_User'
    When I click the 'Sponsor' link on the 'Home_Page'
    And I click the 'Authorisations' link on the 'Sponsor_Workspace_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With sponsor' status in the sponsor authorisations page
    And I capture the page screenshot
    Then I click on the searched modification id
    And I can see the sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I capture the page screenshot
    And I click the 'Return_To_Authorisations' button on the 'Confirmation_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Sponsor_Authorisations_Page'
    And I can see the searched modification to be present in the list with 'With review body' status in the sponsor authorisations page
    # In draft modification submitting to sponsor
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'With review body' status in project overview page
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I can see the send modification to sponsor error page
    And I capture the page screenshot
    And I validate the field values and labels displayed on the send modification to sponsor error page
    And I click the 'Return_To_Project_Overview' button on the 'Send_Modification_To_Sponsor_Error_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I validate i can see only one 'Modification_Status_With_Review_Body' on the post approval page
    And I validate i can see only one 'Modification_Status_Indraft' on the post approval page

    Examples:
      | Changes                                                            | Research_Locations  | Logon_User     |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | Applicant_User |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes | System_Admin   |

  @6371 @SetupNewSponsorOrgGoLive @ApprovedNotApprovedAndInDraftAndInDraftErrorPage
  Scenario Outline: Validate that the user can create approved modification, not approved modification, indraft modification and creating another indraft modification displays error message
    Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_Airedale'
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
    And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
    And I capture the page screenshot
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    And I capture the page screenshot
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
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
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    # Approved Modification
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    #Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
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
    And I keep a note of the displayed modification ID on the modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as '<Workflow_User>'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    Then I can see the modifications assignment confirmation page for '<Workflow_User>' with reviewer '<Study_Wide_Reviewer>'
    And I capture the page screenshot
    And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Modifications_Tasklist_Page'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'cannot' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'My_Modifications_Tasklist_Page' as '<Reviewer_User>'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Approved' outcome for the modification with 'Blank' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    Then I see the check and send review outcome page with 'Approved' outcome and 'Blank' reason
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    Then I validate confirmation screen for modification review outcome sent
    When I click the 'Back_To_Tasklist' link on the 'Modification_Review_Outcome_Sent_Page'
    Then I can see the 'My_Modifications_Tasklist_No_Result_Page'
    And I capture the page screenshot
    # Not approved modification
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I keep a note of the displayed modification ID on the modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    And I capture the page screenshot
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    And I capture the page screenshot
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    #Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
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
    And I keep a note of the displayed modification ID on the modifications page
    And I validate the date created for modification in sponsor check and authorise page
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot
    And I fill the sponsor check and authorise page with 'Sponsor_Authorised'
    And I capture the page screenshot
    When I click the 'Confirm_Selection' button on the 'Sponsor_Check_And_Authorise_Page'
    And I validate confirmation screen for modification has been authorised by sponsor and submitted for review
    And I capture the page screenshot
    When I have navigated to the 'Modifications_Tasklist_Page' as '<Workflow_User>'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I select the modification in order to assign it
    And I capture the page screenshot
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    And I capture the page screenshot
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
    And I capture the page screenshot
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    And I capture the page screenshot
    Then I can see the modifications assignment confirmation page for '<Workflow_User>' with reviewer '<Study_Wide_Reviewer>'
    And I capture the page screenshot
    And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Modifications_Tasklist_Page'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    Then I 'cannot' see the modification displayed in the 'Modifications_Tasklist_Page' list with 'Modification_Status_Received' status
    When I have navigated to the 'My_Modifications_Tasklist_Page' as '<Reviewer_User>'
    And I enter 'new iras id' into the search field
    And I click the 'Search' button on the 'My_Modifications_Tasklist_Page'
    Then I 'can' see the modification displayed in the 'My_Modifications_Tasklist_Page' list with 'Modification_Status_Review_In_Progress' status
    When I click the modification id displayed on the 'My_Modifications_Tasklist_Page'
    Then I can see the modification post submission page
    When I click the 'Continue' link on the 'Modification_Details_Page'
    When I provide the 'Not_Approved' outcome for the modification with 'Lack_Of_Evidence' reason
    When I click the 'Save_And_Continue' button on the 'Modification_Details_Page'
    Then I see the check and send review outcome page with 'Not_Approved' outcome and 'Lack_Of_Evidence' reason
    When I click the 'Send_Review_Outcome' button on the 'Modification_Outcome_Check_Send_Page'
    Then I validate confirmation screen for modification review outcome sent
    When I click the 'Back_To_Tasklist' link on the 'Modification_Review_Outcome_Sent_Page'
    Then I can see the 'My_Modifications_Tasklist_No_Result_Page'
    # In draft modification
    Then I have navigated to the 'My_Research_Page' as '<Logon_User>'
    When I enter 'iras id' into the search field
    And I click the 'Search' button on the 'My_Research_Page'
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and '<Research_Locations>' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    And I validate i can see only one 'Modification_Status_Indraft' on the post approval page
    And I capture the page screenshot
    # Another in draft modification
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the create modification error page
    And I capture the page screenshot
    And I validate the field values and labels displayed on the create modification error page
    And I click the 'Return_To_Project_Overview' button on the 'Create_Modification_Error_Page'

    Examples:
      | Changes                                                            | Research_Locations            | Study_Wide_Reviewer             | Workflow_User        | Reviewer_User      | Logon_User     |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_England | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator | Studywide_Reviewer | Applicant_User |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Data_With_Lead_Nation_England | Study_Wide_Reviewer_HRA_England | Workflow_Coordinator | Studywide_Reviewer | System_Admin   |

