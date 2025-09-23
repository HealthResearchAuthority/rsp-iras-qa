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

    @rsp-3889 @AddDetailsToUploadedDocumentsIncompleteStatus @IncompleteStatusSaveAndContinue
    Scenario Outline: Verify the user is able to enter details for uploaded documents with Incomplete status and review the information
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
        And I validate the file names and the status of each document is 'Document_Status_Incomplete' in add document details page
        And I capture the page screenshot
        And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' in the add document details for specific document page
        And I capture the page screenshot
        And I validate the file names and the status of each document is 'Document_Status_Complete' in add document details page
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


    @rsp-3889 @AddDetailsToUploadedDocumentsCompletedStatus @CompletedStatusSaveAndContinue
    Scenario Outline: Verify the user is able to enter details for uploaded documents with Incomplete status and review the information
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
        And I validate the file names and the status of each document is 'Document_Status_Incomplete' in add document details page
        And I capture the page screenshot
        And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' in the add document details for specific document page
        And I capture the page screenshot
        And I validate the file names and the status of each document is 'Document_Status_Complete' in add document details page
        And I click on the document link with status 'Document_Status_Complete' and enter 'Valid_Data_Fields' in the add document details for specific document page
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

    @rsp-3889 @SaveAndContinueAfterMakingChanges
    Scenario Outline: Verify the user is able to enter details for uploaded documents with Incomplete status and review the information
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
        And I click on the document type change link next to each document and enter new 'New_Valid_Document_Type' in the add document details for the uploaded documents
        And I capture the page screenshot
        And I click on the document version change link next to each document and enter new 'New_Valid_Document_Version' in the add document details for the uploaded documents
        And I capture the page screenshot
        And I click on the document date change link next to each document and enter new 'New_Valid_Document_Date' and validate if 'New_Full_Valid_Document_Date' is displayed in the add document details for the uploaded documents
        And I capture the page screenshot
        And I click on the document previously approved option change link next to each document and enter new 'New_Valid_Document_Previously_Approved_Value' in the add document details for the uploaded documents
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
        And I can see the modification progress saved successful message on project overview page
        And I can see the project overview page
        And I capture the page screenshot

        Examples:
            | Specific_Change                              | Document_Upload_Files |
            | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
            | CRF_Other_Study_Data_Records                 | PNG_File              |
            | GDPR_Wording                                 | PNG_File              |
            | Other_Minor_Change_To_Study_Documents        | PNG_File              |
            | Post_Trial_Information_For_Participants      | PNG_File              |
            | Protocol_Non_Substantial_Changes             | PNG_File              |
            | Translations_Addition_Of_Translated_Versions | PNG_File              |

    @rsp-3889 @SaveAndContinueWithoutMakingChanges
    Scenario Outline: Verify the user is able to enter details for uploaded documents with Incomplete status and review the information
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
        And I click on the change link next to 'document_type' in the add document details for specific document page
        And I capture the page screenshot
        Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
        And I capture the page screenshot
        # And I click on the document version change link next to each document and enter new 'New_Valid_Document_Version' in the add document details for the uploaded documents
        # And I capture the page screenshot
        # And I click on the document date change link next to each document and enter new 'New_Valid_Document_Date' and validate if 'New_Full_Valid_Document_Date' is displayed in the add document details for the uploaded documents
        # And I capture the page screenshot
        # And I click on the document previously approved option change link next to each document and enter new 'New_Valid_Document_Previously_Approved_Value' in the add document details for the uploaded documents
        # And I capture the page screenshot
        # When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
        # And I can see the modification progress saved successful message on project overview page
        # And I can see the project overview page
        # And I capture the page screenshot

        Examples:
            | Specific_Change                              | Document_Upload_Files |
            | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
            | CRF_Other_Study_Data_Records                 | PNG_File              |
            | GDPR_Wording                                 | PNG_File              |
            | Other_Minor_Change_To_Study_Documents        | PNG_File              |
            | Post_Trial_Information_For_Participants      | PNG_File              |
            | Protocol_Non_Substantial_Changes             | PNG_File              |
            | Translations_Addition_Of_Translated_Versions | PNG_File              |

    @rsp-4314 @ValidateDocumentTypesOptionalMandatoryFields
    Scenario Outline: Verify the user is able to enter details for uploaded documents with Incomplete status and review the information
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
        And I click on the document link with status 'Document_Status_Incomplete'
        # And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded '<Document_Upload_Files>' in the add document details for specific document page
        # And I capture the page screenshot
        # And I validate the status of each document is 'Document_Status_Complete' in add document details page
        # When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
        # And I capture the page screenshot
        # And I can see the review your document information page
        # And I capture the page screenshot
        # Then I validate the field values 'Valid_Data_Fields' displayed in the review your document information page
        # And I click on the document type change link next to each document and enter new 'New_Valid_Document_Type' in the add document details for the uploaded documents
        # And I capture the page screenshot
        # And I click on the document version change link next to each document and enter new 'New_Valid_Document_Version' in the add document details for the uploaded documents
        # And I capture the page screenshot
        # And I click on the document date change link next to each document and enter new 'New_Valid_Document_Date' and validate if 'New_Full_Valid_Document_Date' is displayed in the add document details for the uploaded documents
        # And I capture the page screenshot
        # And I click on the document previously approved option change link next to each document and enter new 'New_Valid_Document_Previously_Approved_Value' in the add document details for the uploaded documents
        # And I capture the page screenshot
        # When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
        # And I can see the modification progress saved successful message on project overview page
        # And I can see the project overview page
        # And I capture the page screenshot

        Examples:
            | Specific_Change                              | Document_Upload_Files |
            | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
            | CRF_Other_Study_Data_Records                 | PNG_File              |
            | GDPR_Wording                                 | PNG_File              |
            | Other_Minor_Change_To_Study_Documents        | PNG_File              |
            | Post_Trial_Information_For_Participants      | PNG_File              |
            | Protocol_Non_Substantial_Changes             | PNG_File              |
            | Translations_Addition_Of_Translated_Versions | PNG_File              |

#         Scenario 1: Verify that the applicant can choose a document type for my study

#         Given that I am on screen title Add documents details for {first document in the list}

#         When I click on click on document types

#         Then  am able to choose a document type from a drop down list

#         And the drop down list shows only the document type for my study type  - see excel sheet data  in notes. The document type names can be found in column D.  Only document types that have “1 “shown in column X should be included for non-REC studies.

#         And date and version numbers are mandatory for only those document types identified as mandatory in column F in the excel data sheet. For all other document types identified as applicable for non-REC studies, they will be optional fields.

#         Scenario 2 : Verify that the applicant can see validation for filling out mandatory document types

#         Given that I have selected a document type from a drop down list where version numbers and date are mandatory to be entered (as shown in column F in the excel sheet.

#         AND I have either:

#         not entered a ‘document date'

#         not entered a ‘document version’

#         or not entered both ‘document date’ and ‘document version’

#         AND I click on ‘Save and continue’ on the document details

#         AND I am redirected to the ‘Add document details for {specific area of change}’ page

#         And I click on the ‘Save and continue’ on the ‘Add document details for {specific area of change}’ page

#         And I am redirected to the 'Review your document information' page

#         When I click on the ‘Save and continue’ button on the  'Review your document information' page

# THEN I can see the following error messages depending on which field is missing:

# ‘Enter a document date’ error validation message IF I have not entered a ‘document date’

# ‘Enter a document version’ error validation message IF I have not entered a ‘document version’

# ‘Enter a document date’ and a separate ‘Enter document version’ error validation message IF I have not entered either of the 'Document date and ‘document version’ fields


