@ApplicantUser @AuditHistoryForModifications @SystemTest 
Feature:AuditHistory for Modification- This feature file help an applicant to complete the modification journey and log the event in the audit history page
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

  @rsp-5268 @LogTheModificationCreatedEventinAuditHistoryPage @testOnly
  Scenario Outline: Validate that user can create modifications and complete the entire modifications journey till send modification to sponsor confirmation page and return to project overview page and validate event in Audit History page
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
    And I validate the ui labels on modification details page using 'Modification_Details_Label_Texts'
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files_Three' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
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
    And I can see the 'supporting_documents_table' ui labels on the review all changes page
    And I can validate the 'Multiple_Files_Three' are displayed in the supporting documents table
    And I can see the 'Complete' status displayed for all documents in the table
    And I capture the page screenshot
    And the 'Add_Documents' button should be 'available' on the 'Review_All_Changes_Page'
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    And I capture the current time for 'Modification_Audit_History__Page'
    Then I validate 'Modification_Sent_To_Sponsor_Labels' labels displayed in the success confirmation page when the modification has been sent to sponsor
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
    And I capture the page screenshot
    And I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as 'With sponsor'
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the modification post submission page
    And I capture the page screenshot
    And I click the 'History' link on the 'Modification_Post_Submission_Page'
    And I can validate the 'history_table' ui labels on the modification history page
    And I capture the page screenshot
    And I can see the audit history for the 'ModificationSentToSponsor' event with date and user details 
    And I can see the audit history for the 'ModificationCreated' event with date and user details
    And I capture the page screenshot

    Examples:
      | Changes                                            | Research_Locations  |
      | Other_Minor_Change_To_Project_Management           | Nhs_Involvement_Yes |
     
  

    
