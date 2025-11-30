@Superseded
Feature: Superseded Scenarios - Fronstage (Retained for Traceability)

  @rsp-4063
  Scenario Outline: Verify that user can view the participating organisation screen
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Participating_Organisation' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I can see the page heading is changed for '<Specific_Change>' on participating organisation page
    And I capture the page screenshot
    Then I can see the 'Column_Label' ui labels on the participating organisation page
    And the default page size should be 'ten'
    And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
    And I capture the page screenshot
    And I see the total number of results displayed in the participating organisation page
    And I confirm checkbox is displayed in participating organisation page

    Examples:
      | Specific_Change                                            |
      | Addition_Of_Sites_Option                                   |
      | Early_Closure_Withdrawal_Of_Sites_Option                   |
      | Addition_Of_Participant_Identification_Centres_Option      |
      | Early_Closure_Of_Participant_Identification_Centres_Option |

  @rsp-4063
  Scenario Outline: Verify that user can search on the participating organisation screen
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Participating_Organisation' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I fill the search input for searching 'organisations' with '<Organisation_Name>' as the search query
    And I click the 'Search' button on the 'Participating_Organisations_Page'
    And I capture the page screenshot
    And I can see the results matching the search '<Organisation_Name>' in the participating organisation page
    And I capture the page screenshot

    Examples:
      | Specific_Change                                            | Organisation_Name             |
      | Addition_Of_Sites_Option                                   | Valid_Search_Text_NHS         |
      | Early_Closure_Withdrawal_Of_Sites_Option                   | Valid_Search_Text_NHS         |
      | Addition_Of_Participant_Identification_Centres_Option      | Valid_Search_Text_VACC_CENTRE |
      | Early_Closure_Of_Participant_Identification_Centres_Option | Valid_Search_Text_VACC_CENTRE |

  @rsp-4063
  Scenario Outline: Validate the summary error message on participating organisation page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Participating_Organisation' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I fill the search input for searching 'organisations' with '<Organisation_Name>' as the search query
    And I click the 'Search' button on the 'Participating_Organisations_Page'
    Then I validate 'Summary_Only_Error_Participating_Organisations' displayed on 'Participating_Organisations_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                                            | Organisation_Name               |
      | Addition_Of_Sites_Option                                   | Invalid_Search_Text_One_Letter  |
      | Early_Closure_Withdrawal_Of_Sites_Option                   | Invalid_Search_Text_One_Letter  |
      | Addition_Of_Participant_Identification_Centres_Option      | Invalid_Search_Text_Two_Letters |
      | Early_Closure_Of_Participant_Identification_Centres_Option | Invalid_Search_Text_Two_Letters |

  @rsp-4063
  Scenario Outline: Validate pagination for first few pages in participating organisation page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Participating_Organisation' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Participating_Organisations_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method | Specific_Change                                            |
      | page number       | Addition_Of_Sites_Option                                   |
      | next link         | Early_Closure_Withdrawal_Of_Sites_Option                   |
      | page number       | Addition_Of_Participant_Identification_Centres_Option      |
      | next link         | Early_Closure_Of_Participant_Identification_Centres_Option |

  @rsp-4063
  Scenario Outline: Validate pagination for last few pages in participating organisation page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Participating_Organisation' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Participating_Organisations_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method | Specific_Change                                            |
      | page number       | Addition_Of_Sites_Option                                   |
      | previous link     | Early_Closure_Withdrawal_Of_Sites_Option                   |
      | page number       | Addition_Of_Participant_Identification_Centres_Option      |
      | previous link     | Early_Closure_Of_Participant_Identification_Centres_Option |

  @rsp-3876 @rsp-4684
  Scenario Outline: Validate the user is able to upload and review documents for modifications
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
      | Specific_Change                              | Document_Upload_Files | Document_Upload_Files_New  |
      | Correction_Of_Typographical_Errors           | PNG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | GIF_File              | PNG_File                   |
      | Correction_Of_Typographical_Errors           | BMP_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | SVG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | JPG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | JPEG_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOC_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOCX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | DOTX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XLS_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XLSX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PDF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | TXT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | CSV_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PPT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | PPTX_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | RTF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | ODT_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | OFD_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XPS_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | XML_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | HTML_File             | GIF_File                   |
      | Correction_Of_Typographical_Errors           | HTM_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | VCF_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | EML_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | MSG_File              | GIF_File                   |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | GIF_File                   |
      | Correction_Of_Typographical_Errors           | Multiple_Files        | Multiple_Files             |
      | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files             |
      | CRF_Other_Study_Data_Records                 | Multiple_Files        | GIF_File                   |
      | GDPR_Wording                                 | Multiple_Files        | GIF_File                   |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files        | GIF_File                   |
      | Post_Trial_Information_For_Participants      | Multiple_Files        | GIF_File                   |
      | Protocol_Non_Substantial_Changes             | Multiple_Files        | GIF_File                   |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files        | GIF_File                   |
      | Correction_Of_Typographical_Errors           | MP4_File              | AVI_File                   |
      | Correction_Of_Typographical_Errors           | BMP_File              | Multiple_Files_Video_Valid |
      | Correction_Of_Typographical_Errors           | AVI_File              | MP4_File                   |
      | Correction_Of_Typographical_Errors           | MOV_File              | MKV_File                   |
      | Correction_Of_Typographical_Errors           | MKV_File              | MOV_File                   |
      | Correction_Of_Typographical_Errors           | MPG_File              | MPEG_File                  |
      | Correction_Of_Typographical_Errors           | MPEG_File             | MPG_File                   |
      | Correction_Of_Typographical_Errors           | WMV_File              | WEBM_File                  |
      | Correction_Of_Typographical_Errors           | WEBM_File             | WMV_File                   |

  @rsp-3889
  Scenario Outline: Verify the user is able to enter details for uploaded documents with incomplete status and review your information page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-3889
  Scenario Outline: Verify the user is able to enter details for uploaded documents with completed status and review your information page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-3889
  Scenario Outline: Verify the user is able to change and save the updated document details after reaching the review your information page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-3889
  Scenario Outline: Verify the user is able to save without changing and document details are retained after reaching the review your information page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-4314
  Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are optional, for documents uploaded with an Incomplete status, and review the entered information
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-4314
  Scenario Outline: Verify that the user can enter details using document types applicable to Non-REC study types, where document version and date are mandatory, for documents uploaded with an Incomplete status, and review the entered information
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
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

  @rsp-3876
  Scenario Outline: Validate the ui labels displayed for upload documents pages in modifications
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the ui labels for add documents modifications page
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for '<Specific_Change>' page
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page

    Examples:
      | Specific_Change                              |
      | Correction_Of_Typographical_Errors           |
      | CRF_Other_Study_Data_Records                 |
      | GDPR_Wording                                 |
      | Other_Minor_Change_To_Study_Documents        |
      | Post_Trial_Information_For_Participants      |
      | Protocol_Non_Substantial_Changes             |
      | Translations_Addition_Of_Translated_Versions |

  @rsp-3876
  Scenario Outline: Validate the user is able to see the previously uploaded documents in eview uploaded documents page after navigating away using back link
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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

  @rsp-3888
  Scenario Outline: Validate the user is able to delete all documents after uploading
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I capture the page screenshot
    And I click the 'Delete_All' link on the 'Documents_Added_For_Change_Page'
    Then I can see the delete multiple documents confirmation page
    And I capture the page screenshot
    And I click the 'Delete_Documents' button on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
    And I capture the page screenshot

    Examples:
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | Specific_Change                              | Document_Upload_Files |
      | Correction_Of_Typographical_Errors           | Multiple_Files_Three  |
      | CRF_Other_Study_Data_Records                 | Multiple_Files_Three  |
      | GDPR_Wording                                 | Multiple_Files_Three  |
      | Other_Minor_Change_To_Study_Documents        | Multiple_Files_Three  |
      | Post_Trial_Information_For_Participants      | Multiple_Files_Three  |
      | Protocol_Non_Substantial_Changes             | Multiple_Files_Three  |
      | Translations_Addition_Of_Translated_Versions | Multiple_Files_Three  |

  @rsp-3888
  Scenario Outline: Validate the user is able to delete documents one by one from documents added for page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I delete the documents one by one from the documents added page of '<Specific_Change>' modifications in reference to the uploaded '<Document_Upload_Files>' documents
    And I capture the page screenshot
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
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

  @rsp-3888
  Scenario Outline: Validate the user is able to delete documents from add document details page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I capture the page screenshot
    And I validate the project information labels using dataset displayed on modifications page
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for '<Specific_Change>' page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and delete the uploaded document in the add document details for specific document page
    Then I can see the add documents for '<Specific_Change>' page
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
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

  @rsp-5341
  Scenario Outline: Validate the user is able to add and delete documents when the modification is in draft status
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I validate the project information labels using dataset displayed on modifications page
    And I capture the page screenshot
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    And I click on the modification id hyperlink in the post approval tab
    And I can see the modifications details page
    When I click the 'Add_Another_Change' button on the 'Modification_Details_Page'
    And I can see the select area of change page
    And I select 'Project_Documents' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I capture the page screenshot
    Then I upload '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the uploaded '<Document_Upload_Files>' documents are listed along with size and delete option in the review uploaded documents page
    And I delete the documents one by one from the documents added page of '<Specific_Change>' modifications in reference to the uploaded '<Document_Upload_Files>' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I capture the page screenshot
    Then I validate 'Field_Error_Upload_Documents_Mandatory' displayed on 'Add_Document_Modifications_Page'
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

  @rsp-5341
  Scenario Outline: Validate modification status transition from in draft to with sponsor for reviewable and non reviewable modifications
    Then I fill the research locations page with 'Nhs_Involvement_Yes'
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
    And I validate the project information labels using dataset displayed on modifications page
    And I create '<Changes>' for the created modification
    When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    Then I validate submitted date field value for 'Modification_Status_Indraft' modifications and confirm 'In draft' status
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes modifications page
    And I validate the project information labels using dataset displayed on modifications page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Modification_Sent_To_Sponsor_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the modification status as 'Modification_Status_With_Sponsor' on the post approval page
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes modifications page
    And the 'Delete_Modification' link should be 'not available' on the 'Review_All_Changes_Page'
    And I validate the status 'Modification_Status_With_Sponsor' is displayed on the page
    And I capture the page screenshot

    Examples:
      | Changes                                                            |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One             |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two             |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable |

  @rsp-5341
  Scenario Outline: Validate modification status transition from in draft to with regulator for reviewable modification and combination of reviewable non reviewable modifications
    Then I fill the research locations page with 'Nhs_Involvement_Yes'
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
    And I validate the project information labels using dataset displayed on modifications page
    And I create '<Changes>' for the created modification
    When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    Then I validate submitted date field value for 'Modification_Status_Indraft' modifications and confirm 'In draft' status
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes modifications page
    And I validate the project information labels using dataset displayed on modifications page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Submit_To_Regulator' button on the 'Modification_Sent_To_Sponsor_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the modification status as 'Modification_Status_With_Review_Body' on the post approval page
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes modifications page
    And the 'Delete_Modification' link should be 'not available' on the 'Review_All_Changes_Page'
    And I validate the status 'Modification_Status_With_Review_Body' is displayed on the page
    And I capture the page screenshot

    Examples:
      | Changes                                                            |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_One                 |
      | Multiple_Changes_Bulk_Free_Text_Reviewable_Set_Two                 |
      | Multiple_Changes_Bulk_Free_Text_Combined_Reviewable_Non_Reviewable |

  @rsp-4039 @rsp-4065
  Scenario Outline: Verify that user can save the modifications progress on search participating organisations page
    Then I fill the research locations page with 'Valid_Data_All_Fields'
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
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I capture the page screenshot
    And I validate the guidance content displayed on modifications participating organisations page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Participating_Organisations_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page

    Examples:
      | Area_Of_Change             | Specific_Change                                            |
      | Participating_Organisation | Addition_Of_Sites_Option                                   |
      | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |
      | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option |

  @rsp-4893 @rsp-4977 @rsp-5341
  Scenario Outline: Validate modification status transition from in draft to approved and submitted date field for non reviewable modification
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I validate the project information labels using dataset displayed on modifications page
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I create '<Changes>' for the created modification
    When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    Then I can see the modification progress saved successful message on project overview page
    Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
    Then I validate submitted date field value for 'Modification_Status_Indraft' modifications and confirm 'In draft' status
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    And I can see the modifications details page
    And I validate the project information labels using dataset displayed on modifications page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes modifications page
    And I validate the project information labels using dataset displayed on modifications page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the modification status as 'Modification_Status_Approved' on the post approval page
    Then I validate submitted date field value for 'Modification_Status_Approved' modifications and confirm 'Approved' status
    And I capture the page screenshot
    And I click on the modification id hyperlink in the post approval tab
    Then I can see the review all changes modifications page
    And the 'Delete_Modification' link should be 'not available' on the 'Review_All_Changes_Page'
    And I validate the status 'Modification_Status_Approved' is displayed on the page
    And I capture the page screenshot

    Examples:
      | Changes                                                |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_One |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
