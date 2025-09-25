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
        When I click the 'View_Project_Overview' link on the 'Project_Overview_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
        And I capture the page screenshot
        And I can see the review your document information page
        And I capture the page screenshot
        Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
        And I capture the page screenshot
        And I can see the review your document information page
        And I capture the page screenshot
        Then I validate the field values 'New_Valid_Data_Fields' displayed in the review your document information page
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
        And I can see the review your document information page
        And I can see document type guidance text next to each document type
        And I capture the page screenshot
        When I click the 'Save_For_Later' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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
        When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
        And I can see the review your document information page
        And I can see document type guidance text next to each document type
        And I capture the page screenshot
        And I select a document type 'New_Valid_Document_Type' and validate the changes in review your information page
        And I capture the page screenshot
        When I click the 'Save_For_Later' button on the 'Review_Your_Document_Infomation_Modifications_Page'
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