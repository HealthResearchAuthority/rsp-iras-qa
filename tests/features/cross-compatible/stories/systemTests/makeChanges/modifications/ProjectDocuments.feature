@ApplicantUser @CreateModifications @ProjectDocumentsModifications @SystemTest @jsEnabled
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
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page

  @rsp-3876 @ValidateUploadDocumentsModificationsPageLabels @KNOWN_DEFECT_RSP-4801
  Scenario Outline: Validate the ui labels displayed for upload documents pages in modifications
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
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

  @rsp-3876 @4684 @ValidateDocumentUploadAndReviewForModificationsPage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
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
    When I click the 'Save_For_Later' button on the 'Add_Document_Modifications_Page'
    Then I can see the modification progress saved successful message on project overview page
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files | Document_Upload_Files_New  |
      # | Correction_Of_Typographical_Errors           | PNG_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | GIF_File              | PNG_File                  |
      # | Correction_Of_Typographical_Errors           | BMP_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | SVG_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | JPG_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | JPEG_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | DOC_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | DOCX_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | DOT_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | DOTX_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | XLS_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | XLSX_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | PDF_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | TXT_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | CSV_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | PPT_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | PPTX_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | RTF_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | ODT_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | OFD_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | XPS_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | XML_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | HTML_File             | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | HTM_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | VCF_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | EML_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | MSG_File              | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | Multiple_Files        | GIF_File                  |
      # | Correction_Of_Typographical_Errors           | Multiple_Files        | Multiple_Files            |
      # | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files            |
      # | CRF_Other_Study_Data_Records                 | Multiple_Files        | GIF_File                  |
      # | GDPR_Wording                                 | Multiple_Files        | GIF_File                  |
      # | Other_Minor_Change_To_Study_Documents        | Multiple_Files        | GIF_File                  |
      # | Post_Trial_Information_For_Participants      | Multiple_Files        | GIF_File                  |
      # | Protocol_Non_Substantial_Changes             | Multiple_Files        | GIF_File                  |
      # | Translations_Addition_Of_Translated_Versions | Multiple_Files        | GIF_File                  |
      | Correction_Of_Typographical_Errors | MP4_File              | AVI_File                   |
      | Correction_Of_Typographical_Errors | BMP_File              | Multiple_Files_Video_Valid |
      | Correction_Of_Typographical_Errors | AVI_File              | MP4_File                   |
      | Correction_Of_Typographical_Errors | MOV_File              | MKV_File                   |
      | Correction_Of_Typographical_Errors | MKV_File              | MOV_File                   |
      | Correction_Of_Typographical_Errors | MPG_File              | MPEG_File                  |
      | Correction_Of_Typographical_Errors | MPEG_File             | MPG_File                   |
      | Correction_Of_Typographical_Errors | WMV_File              | WEBM_File                  |
      | Correction_Of_Typographical_Errors | WEBM_File             | WMV_File                   |

  @4684 @ValidateDocumentUploadAndReviewForModificationsPage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
  Scenario Outline: Verify that a relevant error message is shown when the user attempts to upload a video file that has already been uploaded
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
    Then I validate 'Duplicate_File_Upload_Error' displayed on 'Add_Document_Modifications_Page' while uploading documents
    And I capture the page screenshot

    Examples:
      | Specific_Change                    | Document_Upload_Files      | Document_Upload_Files_New  |
      | Correction_Of_Typographical_Errors | MP4_File                   | MP4_File                   |
      | Correction_Of_Typographical_Errors | Multiple_Files_Video_Valid | Multiple_Files_Video_Valid |


  @4684 @ValidateDocumentUploadAndReviewForModificationsPage @KNOWN_DEFECT_RSP-4801_4844_4920_4921
  Scenario Outline: Verify that an appropriate error message is displayed when the user uploads a video file with an invalid format
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files_Invalid>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Invalid_Format_Video_File_Error' displayed on 'Add_Document_Modifications_Page' while uploading documents
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files_Invalid |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Video_Invalid  |
      | CRF_Other_Study_Data_Records                 | ASF_File                      |
      | GDPR_Wording                                 | FLAC_File                     |
      | Other_Minor_Change_To_Study_Documents        | MP3_File                      |
      | Post_Trial_Information_For_Participants      | MPEG1_File                    |
      | Protocol_Non_Substantial_Changes             | OGG_File                      |
      | Translations_Addition_Of_Translated_Versions | PS_File                       |
      | CRF_Other_Study_Data_Records                 | RAW_File                      |
      | GDPR_Wording                                 | TS_File                       |
      | Correction_Of_Typographical_Errors           | WAV_File                      |

  # cover error validation when exceeding 100MB - via manual execution only
  # cover error validation - list of files containing few duplicate files, few incorrect format files(mix of valid and invalid files)-via automation - clarication

  @rsp-3876 @ValidateDocumentUploadModificationsPageErrprMessages @KNOWN_DEFECT_RSP-4801_4920
  Scenario Outline: Validate the user is able to see error messages for invalid actions on upload documents for modifications
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-3876 @ValidateBackLinkRetainDocumentsInReviewUploadedDocumentPage @KNOWN_DEFECT_RSP-4801
  Scenario Outline: Validate the user is able to see the previously uploaded documents in eview uploaded documents page after navigating away using back link
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    Then I upload 'PNG_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded 'PNG_File' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'
    And I click the 'Back' link on the 'Review_Uploaded_Document_Modifications_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    Then I upload 'GIF_File' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the uploaded 'PNG_File' documents are listed along with size and delete option in the review uploaded documents page
    And I validate the uploaded 'GIF_File' documents are listed along with size and delete option in the review uploaded documents page
    And I can see the list is sorted by default in the alphabetical order of the 'uploaded documents'

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |
