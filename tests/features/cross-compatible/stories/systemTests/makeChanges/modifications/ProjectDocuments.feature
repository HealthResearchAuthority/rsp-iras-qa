@ApplicantUser @createModifications @projectDocumentsModifications @SystemTest @jsEnabled
Feature: Create Amendment - Project Documents Modifications

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

  @rsp-3876 @ValidateUploadDocumentsModificationsPageLabels
  Scenario Outline: Validate the ui labels displayed for upload documents pages in modifications
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using '<Label_Texts>' dataset displayed on modifications page
    And I validate the ui labels for add documents modifications page
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-3876 @ValidateDocumentUploadAndReviewForModificationsPage
  Scenario Outline: Validate the user is able to upload and review documents for modifications
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files_New>' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    And I validate the uploaded '<Document_Upload_Files_New>' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    And I click the 'Back' link on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    When I click the 'Save_For_Later' button on the 'Add_Document_Modifications_Page'
    Then I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files | Document_Upload_Files_New |
      | Correction_Of_Typographical_Errors           | PNG_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | GIF_File              | PNG_File                  |
      | Correction_Of_Typographical_Errors           | BMP_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | SVG_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | JPG_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | JPEG_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | DOC_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | DOCX_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | DOT_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | DOTX_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | XLS_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | XLSX_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | PDF_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | TXT_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | CSV_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | PPT_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | PPTX_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | RTF_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | ODT_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | OFD_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | XPS_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | XML_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | HTML_File             | GIF_File                  |
      | Correction_Of_Typographical_Errors           | HTM_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | VCF_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | EML_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | MSG_File              | GIF_File                  |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | GIF_File                  |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | Multiple_Files            |
      | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files            |
      | CRF_Other_Study_Data_Records                 | Multiple_Files        | GIF_File                  |
      | GDPR_Wording                                 | Multiple_Files        | GIF_File                  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files        | GIF_File                  |
      | Post_Trial_Information_For_Participants      | Multiple_Files        | GIF_File                  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files        | GIF_File                  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files        | GIF_File                  |
