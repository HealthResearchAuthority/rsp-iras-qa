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

  @rsp-5478 @rsp-5532 @rsp-4062 @rsp-4386 @rsp-4380 @rsp-5200 @rsp-5272 @rsp-4881 @rsp-4094 @rsp-4095 @rsp-4980 @rsp-4982 @rsp-5588 @ModificationsJourneyEntireJourney @ModificationsToAddBulkFreeTextNonReviewable
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

  @6371
  Scenario Outline: Validate that user can create one indraft modification and creating another modification displays error
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
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    #Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page

    # And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    # And I can see the select area of change page
    # And I validate the project information labels using dataset displayed on modifications page
    # And I capture the page screenshot
    # And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    # And I capture the page screenshot
    # When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    # Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    #Error page is displayed
    And I can see the create modification error page
    And I validate the field values and labels displayed on the create modification error page
    And I click the 'Return_To_Project_Overview' button on the 'Create_Modification_Error_Page'

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |

  @6371
  Scenario Outline: Validate that user can create one modification with Sponsor and no error messages are displayed if another new modification is created
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
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |

  @abc
  Scenario Outline: Validate that user can create one modification with review body and no error messages are displayed if another new modification is created
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
    And I validate the project information labels using dataset displayed on modifications page
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
    
    Then I have navigated to the 'My_Research_Page' as 'Applicant_User'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I enter 'modification id' into the search field
    And I click the 'Search' button on the 'Post_Approval_Page'
    And I can see the searched modification to be present in the list with 'With review body' status in project overview page

    Examples:
      | Changes                                                            | Research_Locations  |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable | Nhs_Involvement_Yes |







#Scenario Outline: One modification in with review body + user can create another modification in draft

#Scenario Outline: One modification in with sponsor + user selecting ‘Send modification to sponsor’ displays error message

#Scenario Outline: One modification in with review body  + user selecting ‘Send modification to sponsor’ displays error message

#Scenario Outline: Few modifications in approved, not approved, not authorised statues,  One modification in with sponsor/review body, One modification in draft
#user creating another modification displays error


# Also, need to verify existing scenarios wherever multiple modifications are created in draft status
#mostly in createproject.feature
#And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page