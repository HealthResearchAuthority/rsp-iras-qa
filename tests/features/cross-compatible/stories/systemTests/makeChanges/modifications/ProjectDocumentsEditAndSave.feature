@ApplicantUser @CreateModifications @ProjectDocumentsEditAndSave @SystemTest @jsEnabled
Feature: Create Amendment - Project Documents Edit and Save

        Background:
                Given I have navigated to the my research projects page
                And I can see the my research projects page
                And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
                And I click the 'Start' button on the 'Create_Project_Record_Page'
                And I fill the unique iras id in project details iras page
                And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
                And I capture the page screenshot
                Then I can see the project identifiers page
                Then I fill the project identifiers page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
                And I fill the project details title page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
                Then I fill the chief investigator page with 'Valid_Data_All_Fields'
                Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
                Then I fill the research locations page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Research_Locations_Page'
                Then I can see the review your answers page
                And I capture the page screenshot
                When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
                Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
                Then I can see the project overview page
                When I click the 'Post_Approval' link on the 'Project_Overview_Page'
                When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
                And I can see the select area of change page

        @rsp-3889 @AddDetailsToUploadedDocumentsIncompleteStatus @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to enter details for uploaded documents with incomplete status and review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                And I capture the page screenshot
                Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |


        @rsp-3889 @AddDetailsToUploadedDocumentsCompletedStatus @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to enter details for uploaded documents with completed status and review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                And I click on the document link with status 'Document_Status_Complete' and enter 'New_Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                And I capture the page screenshot
                Then I validate the field values 'New_Valid_Data_Fields' displayed in the review your document information page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

        @rsp-3889 @SaveAndContinueAfterMakingChanges @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to change and save the updated document details after reaching the review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                And I capture the page screenshot
                Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
                And I click on the document type change link next to each document and enter new 'New_Valid_Document_Type' in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the document version change link next to each document and enter new 'New_Valid_Document_Version' in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the document date change link next to each document and enter new 'New_Valid_Document_Date' and validate if 'New_Full_Valid_Document_Date' is displayed in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the document previously approved option change link next to each document and enter new 'New_Valid_Document_Previously_Approved_Value' in the add document details for the uploaded documents page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

        @rsp-3889 @SaveAndContinueWithoutMakingChanges @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to save without changing and document details are retained after reaching the review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                And I capture the page screenshot
                Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
                And I capture the page screenshot
                And I click on the 'document_type' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the 'document_version' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the 'document_date' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
                And I capture the page screenshot
                And I click on the 'previously_approved' change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page
                And I capture the page screenshot
                Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Document_Infomation_Page'
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

        @rsp-4539 @SaveForLaterWithoutSelectingDocumentType @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to save for later without selecting document type in the review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I can see the review your document information page
                And I can see document type guidance text next to each document type
                And I capture the page screenshot
                When I click the 'Save_For_Later' button on the 'Review_Document_Infomation_Page'
                And I capture the page screenshot
                And I can see the modification progress saved successful message on project overview page
                And I capture the page screenshot
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

        @rsp-4539 @SaveForLaterSelectingOnlyDocumentType @KNOWN-DEFECT-RSP-5091
        Scenario Outline: Verify the user is able to save for later after selecting only document type in the review your information page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I can see the review your document information page
                And I can see document type guidance text next to each document type
                And I capture the page screenshot
                And I select a document type 'New_Valid_Document_Type' and validate the changes in review your information page
                And I capture the page screenshot
                When I click the 'Save_For_Later' button on the 'Review_Document_Infomation_Page'
                And I can see the modification progress saved successful message on project overview page
                And I capture the page screenshot
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files |
                        | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
                        | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
                        | GDPR_Wording                                 | Multiple_Files_Three  |
                        | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
                        | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
                        | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
                        | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

        @rsp-4314 @ValidateDocumentTypeDropDownList @ValidateNonRECStudyTypeOptionalDocumentVersionDate
        Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are optional, for documents uploaded with an Incomplete status, and review the entered information
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                And I select document type '<Document_Types_Optional>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                And I enter document details for the uploaded documents using '<Document_Details_Info_Optional>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Optional                                                                                       | Version_Date | Document_Details_Info_Optional          |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Evidence_Of_Insurance_Or_Indemnity                                                                            | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Facing_Material_Other                                                                             | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Validated                                                                                       | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Curriculum_Vitae_CV_Suitability_Of_Researcher                                                                 | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Student_Research_Criteria_Eligibility_Declaration                                                             | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Dear_Investigator_Letter                                                                                      | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Funder_Letters_Outcome_Of_Funding_Panel                                                                       | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Statisticians_Letter                                                                                          | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Referees_Or_Other_Scientific_Critique_Report                                                                  | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Sponsor_Site_Agreement                                                                                        | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Schedule_Of_Events_Or_Schedule_Of_Events_Cost_Attribution_Template_SoECAT                                     | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Data_Flow_Diagram_Or_Documents_Demonstrating_Conformity_With_Data_Protection_And_Confidentiality_Requirements | optional     | Valid_Data_Fields_Optional_Version_Date |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Miscellaneous                                                                                                 | optional     | Valid_Data_Fields_Optional_Version_Date |

        @rsp-4314 @ValidateErrorNonRECStudyTypeOptionalDocumentVersionDate
        Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing, using document types applicable to Non-REC study types where document version and date are optional, for documents uploaded with an Incomplete status
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I capture the page screenshot
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                And I select document type '<Document_Types_Optional>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Optional                                                                                       | Version_Date | Field_And_Summary_Error_Message                      |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Evidence_Of_Insurance_Or_Indemnity                                                                            | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Facing_Material_Other                                                                             | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Validated                                                                                       | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Curriculum_Vitae_CV_Suitability_Of_Researcher                                                                 | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Student_Research_Criteria_Eligibility_Declaration                                                             | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Dear_Investigator_Letter                                                                                      | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Funder_Letters_Outcome_Of_Funding_Panel                                                                       | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Statisticians_Letter                                                                                          | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Referees_Or_Other_Scientific_Critique_Report                                                                  | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Sponsor_Site_Agreement                                                                                        | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Schedule_Of_Events_Or_Schedule_Of_Events_Cost_Attribution_Template_SoECAT                                     | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Data_Flow_Diagram_Or_Documents_Demonstrating_Conformity_With_Data_Protection_And_Confidentiality_Requirements | optional     | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Miscellaneous                                                                                                 | optional     | Missing_Mandatory_Question_Previously_Approved_Error |

        @rsp-4314 @ValidateErrorNonRECStudyTypeMissingMandatoryFields
        Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing for documents uploaded with an Incomplete status
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I capture the page screenshot
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I click the error displayed on 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I enter document details for the uploaded documents using '<Document_Details_Info>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Changes' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                    | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Field_And_Summary_Error_Message | Document_Details_Info                        |
                        | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Mandatory_Data_Fields_Optional_Version_Date  |
                        | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Mandatory_Data_Fields_Mandatory_Version_Date |

        @rsp-4314 @ValidateErrorNonRECStudyTypeMissingMandatoryFields
        Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing for documents uploaded with an Incomplete status-alternate flow
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I capture the page screenshot
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I click the error displayed on 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I enter document details for the uploaded documents using '<Document_Details_Info>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Changes' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message_Another>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot

                Examples:
                        | Specific_Change                    | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Field_And_Summary_Error_Message | Document_Details_Info                                | Field_And_Summary_Error_Message_Another              |
                        | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Missing_Mandatory_Data_Fields_Optional_Version_Date  | Missing_Mandatory_Question_Previously_Approved_Error |
                        | Correction_Of_Typographical_Errors | PNG_File              | Non_REC_Study_Types                         | Missing_Mandatory_Fields_Error  | Missing_Mandatory_Data_Fields_Mandatory_Version_Date | Missing_Mandatory_Question_Previously_Approved_Error |


        @rsp-4314 @ValidateDocumentTypeDropDownList @ValidateNonRECStudyTypeMandatoryDocumentVersionDate
        Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are mandatory, for documents uploaded with an Incomplete status, and review the entered information
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                And I enter document details for the uploaded documents using 'Valid_Data_Fields_Mandatory_Version_Date' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Complete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                And I can see the modification progress saved successful message on project overview page
                And I can see the project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    |

        @rsp-4314 @ValidateErrorNonRECStudyTypeMandatoryDocumentVersionDate
        Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when mandatory details are missing, using document types applicable to Non-REC study types where document version and date are mandatory, for documents uploaded with an Incomplete status
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date | Field_And_Summary_Error_Message                                            |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    | Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error |

        @rsp-4314 @ValidateErrorNonRECStudyTypeMandatoryDocumentVersionOrDate
        Scenario Outline: Verify that the user sees appropriate error messages on the review document information page when few mandatory details are missing, using document types applicable to Non-REC study types where document version and date are mandatory, for documents uploaded with an Incomplete status
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I can see the document type drop down list shows only the document types for '<Document_Types_Dropdown_List_For_Study_Type>'
                And I capture the page screenshot
                And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                And I enter document details for the uploaded documents using '<Valid_Data_Fields_Mandatory_Version_Or_Date>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                Then I validate the field values 'Valid_Data_All_Fields' displayed in the review your document information page
                When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
                And I capture the page screenshot
                Then I validate the error '<Field_And_Summary_Error_Message>' displayed on 'Review_Your_Document_Infomation_Modifications_Page'

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Dropdown_List_For_Study_Type | Document_Types_Mandatory                         | Version_Date | Field_And_Summary_Error_Message                   | Valid_Data_Fields_Mandatory_Version_Or_Date |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Protocol_Clinical_Investigation_Plan             | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Non_REC_Study_Types                         | Participant_Information_Sheet_PIS                | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
                        | GDPR_Wording                                 | PNG_File              | Non_REC_Study_Types                         | Consent_form                                     | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Non_REC_Study_Types                         | Recruitment_Invitation_To_Potential_Participants | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Non_REC_Study_Types                         | Recruitment_Materials_Other                      | mandatory    | Missing_Mandatory_Question_Document_Version_Error | Valid_Data_Fields_Mandatory_Version         |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Non_REC_Study_Types                         | Interviews_Or_Focus_Group_Topic_Guides           | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Non_REC_Study_Types                         | Questionnaire_Non_Validated                      | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Non_REC_Study_Types                         | Participant_Diary_Sample                         | mandatory    | Missing_Mandatory_Question_Document_Date_Error    | Valid_Data_Fields_Mandatory_Date            |

        @ValidateErrorMessage @rsp-5261 @KNOWN-DEFECT-RSP-5595
        Scenario Outline: Verify that appropriate error messages are displayed when mandatory fields, such as dates, are missing on the 'Add Document Details' page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I capture the page screenshot
                And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                And I enter document details for the uploaded documents using '<Missing_Mandatory_Field>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Add_Document_Details_For_Specific_Document_Modifications_Page'

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Mandatory                         | Missing_Mandatory_Field               | Field_And_Summary_Error_Message            |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Protocol_Clinical_Investigation_Plan             | Invalid_Day_Number                    | Invalid_Sponsor_Document_Date_Error        |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                | Invalid_Day_Letters                   | Invalid_Sponsor_Document_Date_Error        |
                        | GDPR_Wording                                 | PNG_File              | Consent_form                                     | Invalid_Year_Number_1                 | Invalid_Sponsor_Document_Date_Error        |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants | Invalid_Year_Number_2                 | Invalid_Sponsor_Document_Date_Error        |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Year_Letters                  | Invalid_Sponsor_Document_Date_Error        |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Interviews_Or_Focus_Group_Topic_Guides           | Invalid_Date_Future                   | Invalid_Sponsor_Document_Future_Date_Error |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Questionnaire_Non_Validated                      | Invalid_Date_No_Day                   | No_Sponsor_Document_Date_Day_Error         |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Participant_Diary_Sample                         | Invalid_Date_No_Month                 | No_Sponsor_Document_Date_Month_Error       |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                | Invalid_Date_No_Year                  | No_Sponsor_Document_Date_Year_Error        |
                        | GDPR_Wording                                 | PNG_File              | Consent_form                                     | Invalid_Date_No_Day_No_Month          | No_Sponsor_Document_Date_Day_Month_Error   |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants | Invalid_Date_No_Day_No_Year           | No_Sponsor_Document_Date_Day_Year_Error    |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Date_No_Month_No_Year         | No_Sponsor_Document_Date_Month_Year_Error  |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      | Invalid_Date_No_Date_No_Month_No_Year | No_Sponsor_Document_Date_Error             |


        @EditTheDateFiledAndValidateErrorMessage @rsp-5261 @KNOWN-DEFECT-RSP-5595
        Scenario Outline: Verify the user is able to edit the sponsor document date field from review your document information and validate the error message
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
                And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
                And I capture the page screenshot
                And I can see the review your document information page
                And I capture the page screenshot
                Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
                And I click on the document date change link next to each document and enter new 'Invalid_Day_Number' and validate if '' is displayed in the add document details for the uploaded documents page
                And I capture the page screenshot
                Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Add_Document_Details_For_Specific_Document_Modifications_Page'

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Missing_Mandatory_Field               | Field_And_Summary_Error_Message            |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Invalid_Day_Number                    | Invalid_Sponsor_Document_Date_Error        |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Invalid_Day_Letters                   | Invalid_Sponsor_Document_Date_Error        |
                        | GDPR_Wording                                 | PNG_File              | Invalid_Year_Number_1                 | Invalid_Sponsor_Document_Date_Error        |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Invalid_Year_Number_2                 | Invalid_Sponsor_Document_Date_Error        |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Year_Letters                  | Invalid_Sponsor_Document_Date_Error        |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Invalid_Date_Future                   | Invalid_Sponsor_Document_Future_Date_Error |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Invalid_Date_No_Day                   | No_Sponsor_Document_Date_Day_Error         |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Invalid_Date_No_Month                 | No_Sponsor_Document_Date_Month_Error       |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Invalid_Date_No_Year                  | No_Sponsor_Document_Date_Year_Error        |
                        | GDPR_Wording                                 | PNG_File              | Invalid_Date_No_Day_No_Month          | No_Sponsor_Document_Date_Day_Month_Error   |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Invalid_Date_No_Day_No_Year           | No_Sponsor_Document_Date_Day_Year_Error    |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Date_No_Month_No_Year         | No_Sponsor_Document_Date_Month_Year_Error  |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Invalid_Date_No_Date_No_Month_No_Year | No_Sponsor_Document_Date_Error             |

        @SaveForLaterWithoutSelectingDocumentDate @rsp-5261
        Scenario Outline: Verify the user is able to save for later without selecting document date in add document detail page
                And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
                When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
                Then I can see the add documents for '<Specific_Change>' page
                And I upload '<Document_Upload_Files>' documents
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
                Then I can see the review uploaded documents for '<Specific_Change>' page
                And I capture the page screenshot
                When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
                When I can see the add document details for '<Specific_Change>' page
                And I capture the page screenshot
                And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
                And I capture the page screenshot
                And I select document type '<Document_Types_Mandatory>' for which document version and date are '<Version_Date>' and I can see mandatory fields are displayed based on the selected document type
                And I capture the page screenshot
                When I click the 'Save_For_Later' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
                And I capture the page screenshot
                And I can see the modification progress saved successful message on project overview page
                And I capture the page screenshot

                Examples:
                        | Specific_Change                              | Document_Upload_Files | Document_Types_Mandatory                         |
                        | Correction_Of_Typographical_Errors           | PNG_File              | Protocol_Clinical_Investigation_Plan             |
                        | CRF_Other_Study_Data_Records                 | PNG_File              | Participant_Information_Sheet_PIS                |
                        | GDPR_Wording                                 | PNG_File              | Consent_form                                     |
                        | Other_Minor_Change_To_Study_Documents        | PNG_File              | Recruitment_Invitation_To_Potential_Participants |
                        | Post_Trial_Information_For_Participants      | PNG_File              | Recruitment_Materials_Other                      |
                        | Protocol_Non_Substantial_Changes             | PNG_File              | Interviews_Or_Focus_Group_Topic_Guides           |
                        | Translations_Addition_Of_Translated_Versions | PNG_File              | Questionnaire_Non_Validated                      |
