@ApplicantUser @createProject @createAmendment @SystemTest
Feature: Create Project

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @rsp-1858 @rsp-1862 @rsp-1903 @ValidateUserAbleToCreateProjectUsingIRAS
  Scenario: Validate user is able to create a project using an iras id
    And I can see the my research projects page
    And I capture the page screenshot
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I capture the page screenshot

  @rsp-1858
  Scenario: Validate breadcrumb navigations in project details iras id page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Project_Details_IRAS_Page'
    Then I can see the create project record page
    And I capture the page screenshot

  @rsp-1859 @rsp-3819 @ValidateUserAbleToFillProjectDetailsPage
  Scenario Outline: Validate user is able to fill project details page for project end date
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the project details title page
    Then I can see the 'Label_Texts' ui labels on the project details title page
    And I validate the planned project end date 'Dropdown_Values'
    Then I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Chief_Investigator_Page'
    Then I can see previously saved values for '<Project_Details_Title>' displayed on the project details title page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title       |
      | Valid_Data_All_Fields       |
      | Valid_Data_All_Empty_Fields |

  @rsp-1859 @rsp-1865
  Scenario Outline: Validate breadcrumb navigations in project details short project title page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I can see the project details title page
    And I can see a 'Back' link on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with '<Chief_Investigator>'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I click the change link '<Change_Link_Field>' on review your answers page
    And I capture the page screenshot
    And I click the 'Back' link on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page

    Examples:
      | Navigation_Button_Fourth | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field |
      | Confirm_Project_Details  | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  |

  @rsp-1897 @rsp-4209
  Scenario Outline: Validate user is able to fill chief investigator page with valid data
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    Then I can see the 'Label_Texts' ui labels on the chief investigator page
    And I capture the page screenshot
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    When I click the 'Back' link on the 'Research_Locations_Page'
    Then I can see the chief investigator page
    Then I can see previously saved values for '<Chief_Investigator>' displayed on the chief investigator page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator                  |
      | Valid_Data_All_Fields | Valid_Data_All_Fields               |
      | Valid_Data_All_Fields | Valid_Email_Data                    |
      | Valid_Data_All_Fields | Valid_Email_Underscore              |
      | Valid_Data_All_Fields | Valid_Email_Data_Hyphen             |
      | Valid_Data_All_Fields | Valid_Email_Data_Plus               |
      | Valid_Data_All_Fields | Valid_Email_Data_Exclamation        |
      | Valid_Data_All_Fields | Valid_Email_Data_Hash               |
      | Valid_Data_All_Fields | Valid_Email_Data_Dollar             |
      | Valid_Data_All_Fields | Valid_Email_Data_Percentage         |
      | Valid_Data_All_Fields | Valid_Email_Data_Ampersand          |
      | Valid_Data_All_Fields | Valid_Email_Data_Single_Quote       |
      | Valid_Data_All_Fields | Valid_Email_Data_Star               |
      | Valid_Data_All_Fields | Valid_Email_Data_Slash              |
      | Valid_Data_All_Fields | Valid_Email_Data_Equal_Symbol       |
      | Valid_Data_All_Fields | Valid_Email_Data_Question_Mark      |
      | Valid_Data_All_Fields | Valid_Email_Data_Cap_Symbol         |
      | Valid_Data_All_Fields | Valid_Email_Data_Right_Single_Quote |
      | Valid_Data_All_Fields | Valid_Email_Data_Curly_Brackets     |
      | Valid_Data_All_Fields | Valid_Email_Data_Pipe_Symbol        |
      | Valid_Data_All_Fields | Valid_Email_Data_Tilde_Symbol       |
      | Valid_Data_All_Fields | Valid_Email_Data_Special_Characters |
      | Valid_Data_All_Fields | Valid_Email_Data_Hyphen_Underscore  |
      | Valid_Data_All_Fields | Valid_Email_Data_Domain             |
  # | Valid_Data_All_Fields | Valid_Email_Data_Unicode              |
  # | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Unicode     |
  # | Valid_Data_All_Fields | Valid_Email_Data_Multiple_Sub_Domains |
  # | Valid_Data_All_Fields | Valid_Email_Data_Other_Language       |

  @rsp-1897 @rsp-4209
  Scenario: Validate breadcrumb navigations in chief investigator page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I can see the chief investigator page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Chief_Investigator_Page'
    Then I can see the project details title page
    And I capture the page screenshot

  @rsp-1901 @rsp-2922 @ValidateUserAbleToFillResearchLocationsPage
  Scenario Outline: Validate user is able to fill research locations page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    Then I can see the 'Label_Texts' ui labels on the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I validate the guidance content displayed based on the data entered using '<Research_Locations>' dataset on the research locations page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your application page
    And I capture the page screenshot
    When I navigate 'back'
    Then I can see the research locations page
    Then I can see previously saved values for '<Research_Locations>' displayed on the research locations page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations                     |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                  |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC                   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Northern_Ireland |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Scotland         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_Lead_Nation_Wales            |

  @rsp-1901 @jsEnabled
  Scenario Outline: Validate lead nation radio option when javascript is enabled
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option for '<Research_Locations>'

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC  |

  @rsp-1901 @jsDisabled
  Scenario Outline: Validate lead nation radio option when javascript is disabled
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    Then I fill the research locations page with '<Research_Locations>'
    Then I validate lead nation radio option when javascript disabled

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Data_With_No_NHS_HSC |

  @rsp-1901
  Scenario Outline: Validate breadcrumb navigations in research locations page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I can see the research locations page
    When I click the 'Back' link on the 'Research_Locations_Page'
    Then I can see the chief investigator page

    Examples:
      | Project_Details_Title | Chief_Investigator    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-1863 @rsp-3819 @rsp-4874 @saveLaterProjectTitle
  Scenario Outline: Verify product details are saved when user saves the record on create project - Project details page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I validate the ui fields on project overview unfinished projects page
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title       |
      | Valid_Data_All_Fields       |
      | Valid_Data_All_Empty_Fields |
      | Valid_Data_Only_Date_Fields |

  @rsp-1863 @rsp-4874 @rsp-4209 @saveLaterProjectRoles
  Scenario Outline: Verify product details are saved when user saves the record on create project - chief investigator page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    When I click the 'Save_For_Later' button on the 'Chief_Investigator_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I validate the ui fields on project overview unfinished projects page
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator                       |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    |
      | Valid_Data_All_Fields | Valid_Data_All_Empty_Fields              |
      | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field |

  @rsp-1863 @rsp-4874 @saveLaterProjectLocations
  Scenario Outline: Verify product details are saved when user saves the record on create project - research locations page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Research_Locations_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I validate the ui fields on project overview unfinished projects page
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I click the 'My_Research_Breadcrumb' link on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the my research projects page
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations                       | Project_Details       |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Empty_Fields              | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Sponsor_Email_Field      | Valid_Data_All_Fields |

  @rsp-1861 @rsp-3670 @rsp-4200 @jsEnabled
  Scenario Outline: Validate user is able to fill sponsor organisation in project identifiers page with valid data
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    And I capture the page screenshot
    Then I can see the 'Label_Texts' ui labels on the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    When I click the 'Back' link on the 'Research_Locations_Page'
    Then I can see the chief investigator page
    Then I can see previously saved values for '<Chief_Investigator>' displayed on the chief investigator page
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers>' displayed on the project identifiers page
    And I capture the page screenshot
    And I fill the project identifiers page with '<Project_Identifiers_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers_Change>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers_Change>' displayed on the project identifiers page
    And I capture the page screenshot
    And I fill the project identifiers page with '<Project_Identifiers_Change_Blank>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers_Change_Blank>' page
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers_Change_Blank>' displayed on the project identifiers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Project_Identifiers   | Project_Identifiers_Change             | Project_Identifiers_Change_Blank | Research_Locations    | Change_Link_Field            | Enter_Link_Field             |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Full_Text_Aalborg | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Brackets     | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Amp          | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Dot_Comma    | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Slash        | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Hyphen       | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |

  @rsp-1861 @rsp-3670 @rsp-4200 @jsEnabled @skip
  Scenario Outline: Validate the primary sponsor organisation suggestion list in project identifiers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I capture the page screenshot
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
    And I type valid '<Sponsor_Organisation>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I type invalid '<Sponsor_Organisation_Invalid>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I type min characters '<Sponsor_Organisation_Min>' for primary sponsor organisation suggestion box and validate the suggestion list along with '<Suggestion_List_Headers>'
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Sponsor_Organisation                          | Sponsor_Organisation_Invalid      | Sponsor_Organisation_Min      | Suggestion_List_Headers        | RTS_API_Data         | RTS_Request                                 |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Partial_Text_NHS         | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Brackets    | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Dot_Comma   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Slash       | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Hyphen      | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_Start_Space | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Partial_End_Space   | Sponsor_Organisation_Invalid_Data | Sponsor_Organisation_Min_Char | Suggestion_List_Common_Headers | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

  @rsp-1861 @jsEnabled @skip
  Scenario Outline: Validate the active primary sponsor organisation from rts with data in database
    When I authorise the rts api using '<RTS_API_Data>'
    Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation
    And I validate the list of sponsor organisations retrieved in ui compared to the rts response received using '<RTS_Request>'

    Examples:
      | RTS_API_Data         | RTS_Request                                 |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS         |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_MAN         |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Brackets    |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Dot_Comma   |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Slash       |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Hyphen      |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Start_Space |
      | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_Ends_Space  |

  @rsp-3939 @rsp-4200 @rsp-3940 @searchSelectSponsorOrgJsDisabled @jsDisabled
  Scenario Outline: Validate user is able to search and select sponsor organisation in project identifiers page with valid data
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    Then I can see the 'Label_Texts' ui labels on the chief investigator page
    Then I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    When I click the 'Back' link on the 'Research_Locations_Page'
    Then I can see the chief investigator page
    Then I can see previously saved values for '<Chief_Investigator>' displayed on the chief investigator page
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I fill the research locations page with '<Research_Locations>'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers>' displayed on the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with '<Project_Identifiers_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers_Change>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers_Change>' displayed on the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with '<Project_Identifiers_Change_Blank>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers_Change_Blank>' page
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the project identifiers page
    Then I can see previously saved values for '<Project_Identifiers_Change_Blank>' displayed on the project identifiers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Chief_Investigator    | Project_Identifiers   | Project_Identifiers_Change             | Project_Identifiers_Change_Blank | Research_Locations    | Change_Link_Field            | Enter_Link_Field             |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Full_Text_Aalborg | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Brackets     | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Amp          | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Dot_Comma    | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Slash        | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Sponsor_Organisation_Text_Hyphen       | Sponsor_Organisation_Text_Blank  | Valid_Data_All_Fields | primary_sponsor_organisation | primary_sponsor_organisation |

  @rsp-5340 @validateProjectRecordFromInDraftToActiveStatus
  Scenario: Validate project status transition from in draft to active in the my research page and project overview page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Identifiers_Page'
    And I can see the project overview for unfinished projects page
    Then I can see the project status as 'Project_Status_Draft' on the project overview for unfinished project page
    And I capture the page screenshot
    And I validate the iras id displayed on the project overview unfinished projects page
    And I click the 'My_Research_Breadcrumb' link on the 'Project_Overview_Unfinished_Projects_Page'
    And I have navigated to the my research projects page
    Then I can see the my research projects page
    Then I can see the project status as 'Project_Status_Draft' on the my research page
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    And I capture the page screenshot
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I click the enter link 'Project_End_Date' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I click the enter link 'chief_investigator_email' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I click the enter link 'nations_participating' on review your answers page
    Then I can see the research locations page
    And I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I capture the page screenshot

  @rsp-5340 @validateActiveProjectCanCreateModification @jsEnabled
  Scenario Outline: Validate project status with active status can create modification
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    Then I can see the project status as 'Project_Status_Active' on the project overview page
    And I capture the page screenshot
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Participating_Organisation' from area of change dropdown and 'Addition_Of_Sites_Option' from specific change dropdown
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    And I can see the modification progress saved successful message on project overview page
    And I can see the project overview page
    And I capture the page screenshot

  @rsp-5340 @validateProjectRecordInDraftStatusRetains
  Scenario: Validate project status in draft is retained if partial project information is saved
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Identifiers_Page'
    And I can see the project overview for unfinished projects page
    Then I can see the project status as 'Project_Status_Draft' on the project overview for unfinished project page
    And I capture the page screenshot
    And I validate the iras id displayed on the project overview unfinished projects page
    And I click the 'My_Research_Breadcrumb' link on the 'Project_Overview_Unfinished_Projects_Page'
    And I have navigated to the my research projects page
    Then I can see the my research projects page
    Then I can see the project status as 'Project_Status_Draft' on the my research page
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    And I capture the page screenshot
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I click the enter link 'Project_End_Date' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
    Then I can see the project status as 'Project_Status_Draft' on the project overview for unfinished project page
    And I capture the page screenshot
    And I click the 'My_Research_Breadcrumb' link on the 'Project_Overview_Unfinished_Projects_Page'
    And I have navigated to the my research projects page
    Then I can see the my research projects page
    Then I can see the project status as 'Project_Status_Draft' on the my research page
    And I capture the page screenshot

  @rsp-1900 @validateGuidanceContentProjectIdentifiersPage
  Scenario: Validate the guidance content displayed on project identifiers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I validate the guidance content displayed on project identifiers page
    And I capture the page screenshot

  @rsp-1866 @rsp-5185 @DeleteProjectRecord
  Scenario Outline: Verify that user is able to delete the created project record
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I click the 'Delete_Project' button on the 'Project_Overview_Unfinished_Projects_Page'
    And I can see the delete project confirmation page based on the short project title
    And I capture the page screenshot
    When I click the 'Keep_Project' button on the 'Confirmation_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I click the 'Delete_Project' button on the 'Project_Overview_Unfinished_Projects_Page'
    When I click the 'Delete_Project' button on the 'Confirmation_Page'
    And I can see the my research projects page
    And I can see the project delete success message on my research page
    And I capture the page screenshot
    And I validate deleted project does not exist in the my research projects list
    And I capture the page screenshot
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I fill the existing iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I can see the project identifiers page
    And I capture the page screenshot
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I can see the project details title page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title |
      | Valid_Data_All_Fields |

  @rsp-5302 @ValidateConfirmProjectDetailsPage
  Scenario: Validate confirm project details page and confirm the project journey displays the project titles
    And I capture the page screenshot
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I can see the confirm project details page
    And I confirm the values displayed in the confirm project details page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I capture the page screenshot
    Then I can see the project details title page
    Then I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I capture the page screenshot
    Then I can see the chief investigator page
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I capture the page screenshot
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of 'Valid_Data_All_Fields' page 'Valid_Data_All_Fields' page 'Valid_Data_All_Fields' and 'Valid_Data_All_Fields' page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    And I capture the page screenshot
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    And I can see the iras id and short project title on project overview page
    And I can see project details along with 'Valid_Data_All_Fields' sponsor organisation and 'Valid_Planned_End_Date' on the project overview page
    And I capture the page screenshot

  @rsp-5302 @ValidateReturnToIrasIdAndBackButtonFunctionalityConfirmProjectDetailsPage @KNOWN_DEFECT_RSP-6187
  Scenario: Validate return to iras id button and back button functionality in confirm project details page
    And I capture the page screenshot
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I can see the confirm project details page
    And I confirm the values displayed in the confirm project details page
    And I capture the page screenshot
    And I click the 'Return_to_Iras_Id' button on the 'Confirm_Project_Details_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I can see the confirm project details page
    And I click the 'Back' link on the 'Confirm_Project_Details_Page'
    And I capture the page screenshot
    And I can see the project details iras page

  @rsp-4887 @VerifyValidSearchPostApproval
  Scenario Outline: Verify the user is able to search the modifications with a valid search criteria
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I enter '<Search_Queries>' into the search field for post approval page
    And I click the 'Search' button on the 'Search_Modifications_Page'
    Then I can now see the table of modifications contains the expected search results for '<Search_Queries>'
    And I capture the page screenshot

    Examples:
      | Changes                                                | Search_Queries                     |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two | Full_Modification_ID               |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two | Partial_Modification_ID            |
      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two | Partial_Modification_ID_With_Slash |

  @rsp-4887 @VerifyNoResultsFoundInvalidSearchOnlyPostApproval
  Scenario: Verify the user can see no matching results found message on clicking search button with invalid modification id
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    When I fill the search input for searching 'modifications in post approval' with '<Search_Input>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Post_Approval_Page'
    Then the no search results found message is displayed
    And I capture the page screenshot

    Examples:
      | Search_Input                         |
      | Non_Existant_Modification_ID         |
      | Leading_White_Space_Modification_ID  |
      | Trailing_White_Space_Modification_ID |

  @rsp-4887 @ApplyFiltersAndSearchPostApproval
  Scenario Outline: Verify the user is able to filter modifications using a combination of advanced filters and search criteria
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I keep note of the individual and overall ranking of changes created using '<Changes>' and 'Valid_Data_All_Fields' dataset
    And I create '<Changes>' for the created modification
    And I can see the modifications details page
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    Then I click the 'Return_To_Project_Overview' button on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I capture the page screenshot
    And I enter '<Search_Queries>' into the search field for post approval page
    And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
    And I capture the page screenshot
    And I enter values in the '<Advanced_Filters>' of the post approval page
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
    And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for post approval page
    And I capture the page screenshot

    Examples:
      | Search_Queries                     | Advanced_Filters                                    | Changes                                                |
      | Partial_Modification_ID_With_Slash | Advanced_Filter_Status_Only                         | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
      | Partial_Modification_ID            | Advanced_Filter_All_Fields                          | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
      | Empty_Search_Data                  | Advanced_Filter_Submitted_Date_Field_Only           | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
      | Empty_Search_Data                  | Advanced_Filter_Modification_Type_Only              | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
      | Empty_Search_Data                  | Advanced_Filter_Submitted_From_Date_Field_Only      | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |
      | Empty_Search_Data                  | Advanced_Filter_Submitted_To_Future_Date_Field_Only | Multiple_Changes_Bulk_Free_Text_Non_Reviewable_Set_Two |

  @rsp-4887 @ValidateClearAllFiltersPostApproval
  Scenario: Validate clear all filters removes all active filters in the post approval page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
    When I enter values in the '<Advanced_Filters>' of the post approval page
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
    And I capture the page screenshot
    And I click the 'Clear_All_Filters' link on the 'Post_Approval_Page'
    And I capture the page screenshot
    And I 'cannot' see active filters displayed

    Examples:
      | Advanced_Filters                          |
      | Advanced_Filter_All_Fields                |
      | Advanced_Filter_Submitted_Date_Field_Only |
      | Advanced_Filter_Status_Only               |

  @rsp-4887 @RemoveAllActiveFiltersOneByOnePostApproval
  Scenario Outline: Verify the user can remove all the selected filters one by one
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
    When I enter values in the '<Advanced_Filters>' of the post approval page
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
    And I capture the page screenshot
    And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'Post_Approval_Page'
    And I capture the page screenshot
    And I 'cannot' see active filters displayed

    Examples:
      | Advanced_Filters                          | Advanced_Filters_Remove                   |
      | Advanced_Filter_All_Fields                | Advanced_Filter_All_Fields                |
      | Advanced_Filter_Submitted_Date_Field_Only | Advanced_Filter_Submitted_Date_Field_Only |

  @rsp-2837 @rsp-3819 @rsp-4874 @rsp-4868 @reviewYourAnswersAllFields
  Scenario Outline: Verify that user completed all question and can review the answers on create project journey
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview for unfinished projects page
    And I capture the page screenshot
    And I validate the ui fields on project overview unfinished projects page
    And I click the 'Edit_Project_Record' button on the 'Project_Overview_Unfinished_Projects_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Project_Identifiers   | Research_Locations    |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-2837 @rsp-3819 @rsp-4868 @reviewAnswersChangeProjTitleFields
  Scenario Outline: Verify that user can change the project title details all fields from review the answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title_Change>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator    | Research_Locations    | Project_Identifiers   | Change_Link_Field | Project_Details_Title_Change    |
      | Valid_Data_Only_Date_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Valid_Data_Only_Date_Fields_Two |

  @rsp-2837 @rsp-4209 @rsp-4868 @reviewAnswersChangeProjKeyRoles
  Scenario Outline: Verify that user can change the project key roles all fields from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with '<Chief_Investigator_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator_Change>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title | Chief_Investigator                       | Chief_Investigator_Change                    | Research_Locations    | Project_Identifiers   | Change_Link_Field             |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email      |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_first_name |
      | Valid_Data_All_Fields | Valid_Data_All_Fields                    | Valid_Data_All_Fields_Two                    | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_last_name  |
      | Valid_Data_All_Fields | Valid_Data_Only_Investigator_Email_Field | Valid_Data_Only_Investigator_Email_Field_Two | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email      |

  @rsp-2837 @rsp-4868 @reviewAnswersChangeResearchLoc
  Scenario Outline: Verify that user can change the project research locations fields from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the research locations page
    And I fill the research locations page with '<Research_Locations_Change>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations_Change>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations                      | Research_Locations_Change                   | Change_Link_Field     | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields                   | Valid_Data_All_Fields_Two                   | nations_participating | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_Nations_Participating   | Valid_Data_Only_Nations_Participating_Two   | nations_participating | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_is_nhs_hsc_organisation      | Valid_Data_is_nhs_hsc_organisation_Two      | nhs_hsc_organisation  | Valid_Data_All_Fields |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_Only_is_nhs_hsc_organisation | Valid_Data_Only_is_nhs_hsc_organisation_Two | nhs_hsc_organisation  | Valid_Data_All_Fields |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersEnterProjTitle
  Scenario Outline: Verify that user has not completed all questions and can enter project title details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can see enter link for all the incomplete fields '<Review_Answers>'
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title_Enter>' page '<Chief_Investigator>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field | Review_Answers             | Project_Details_Title_Enter | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Project_End_Date | Enter_Links_Missing_Fields | Valid_Data_Only_Date_Fields | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-4868 @reviewAnswersEnterKeyRoles
  Scenario Outline: Verify that user has not completed all questions and can enter project key roles details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can see enter link for all the incomplete fields '<Review_Answers>'
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I fill the chief investigator page with '<Chief_Investigator_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator_Enter>' page '<Research_Locations>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field         | Review_Answers             | Chief_Investigator_Enter                 | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Valid_Data_All_Fields                    | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | chief_investigator_email | Enter_Links_Missing_Fields | Valid_Data_Only_Investigator_Email_Field | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-1867 @rsp-3819 @rsp-4868 @reviewAnswersEnterResearchLoc
  Scenario Outline: Verify that user has not completed all questions and can enter research locations details from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can see enter link for all the incomplete fields '<Review_Answers>'
    And I click the enter link '<Enter_Link_Field>' on review your answers page
    Then I can see the research locations page
    And I fill the research locations page with '<Research_Locations_Enter>'
    And I capture the page screenshot
    When I click the 'Save_Changes' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    Then I can validate the field values of '<Project_Details_Title>' page '<Chief_Investigator>' page '<Research_Locations_Enter>' and '<Project_Identifiers>' page

    Examples:
      | Project_Details_Title       | Chief_Investigator          | Research_Locations          | Enter_Link_Field      | Review_Answers             | Research_Locations_Enter                | Project_Identifiers             |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_All_Fields                   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_Only_Nations_Participating   | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nhs_hsc_organisation  | Enter_Links_Missing_Fields | Valid_Data_is_nhs_hsc_organisation      | Sponsor_Organisation_Text_Blank |
      | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | Valid_Data_All_Empty_Fields | nations_participating | Enter_Links_Missing_Fields | Valid_Data_Only_is_nhs_hsc_organisation | Sponsor_Organisation_Text_Blank |

  @rsp-2837 @rsp-4868 @reviewAnswersNavigationResLocProjTitle
  Scenario Outline: Verify back navigation on project title and research locations page from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Review_Your_Answers_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the project details title page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Project_Details_Title_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Project_End_Date  | Valid_Data_All_Fields |

  @rsp-2837 @rsp-4868 @reviewAnswersNavigationKeyRoles
  Scenario Outline: Verify back navigation on chief investigator page from review your answers page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    And I click the change link '<Change_Link_Field>' on review your answers page
    Then I can see the chief investigator page
    And I capture the page screenshot
    When I click the 'Back' link on the 'Chief_Investigator_Page'
    Then I can see the review your answers page
    And I capture the page screenshot

    Examples:
      | Project_Details_Title | Chief_Investigator    | Research_Locations    | Change_Link_Field        | Project_Identifiers   |
      | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | chief_investigator_email | Valid_Data_All_Fields |

  @rsp-1867 @rsp-3819 @rsp-4868 @ValidateConfirmProjectFlow
  Scenario Outline: Validate user is able to see the project overview page when user submit the review answer page with all mandatory fields entered correctly
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Project_Details_Title | Chief_Investigator    | Research_Locations    | Project_Identifiers   |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-1867 @rsp-3819 @rsp-4880 @rsp-4868 @ValidateConfirmProjectPage
  Scenario Outline: Validate user is able to see the project success confirmation screen and then the project overview page when user submit the review answer page with all mandatory fields entered correctly
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    And I fill the project identifiers page with '<Project_Identifiers>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with '<Project_Details_Title>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with '<Chief_Investigator>'
    And I capture the page screenshot
    And I click the '<Navigation_Button_Third>' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with '<Research_Locations>'
    And I capture the page screenshot
    When I click the '<Navigation_Button_Third>' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the '<Navigation_Button_Fourth>' button on the 'Review_Your_Answers_Page'
    And I capture the page screenshot
    Then I validate 'Project_Record_Created_Labels' labels displayed in confirmation page for project created
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot
    And I can see the 'created' project details on project overview page for '<Project_Details_Title>'

    Examples:
      | Navigation_Button_First | Navigation_Button_Second | Navigation_Button_Third | Navigation_Button_Fourth | Project_Details_Title | Chief_Investigator    | Research_Locations    | Project_Identifiers   |
      | Create_Project_Record   | Start                    | Save_Continue           | Confirm_Project_Details  | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields | Valid_Data_All_Fields |

  @rsp-1864 @ProjectOverviewPage
  Scenario Outline: Verify user is able to click on the project link on my research page and able to navigate to project overview page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with '<Research_Project_Details>'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    And I capture the page screenshot
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    Given I have navigated to the 'Home_Page'
    And I can see the my account home page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I can see the '<Validation_Text_Research>' ui labels on the my research project page
    And I capture the page screenshot
    And I click on the short project title for the searched iras id from my research projects page
    And I can see the project overview page
    And I capture the page screenshot
    And I can see the 'created' project details on project overview page for '<Project_Details>'
    And I can see the '<Validation_Text_Project>' ui labels on the project overview page
    And I validate the 'created' data for '<Project_Details>' is displayed in the project details tab of project overview page
    And I capture the page screenshot
    When I click the 'Project_Team' link on the 'Project_Overview_Page'
    And I validate the 'created' data for '<Project_Team_Details>' is displayed in the project team tab of project overview page
    And I capture the page screenshot
    Then I click the 'Research_Locations' link on the 'Project_Overview_Page'
    And I validate the data for '<Research_Locations_Details>' is displayed in the research locations tab of project overview page
    And I capture the page screenshot

    Examples:
      | Validation_Text_Research | Project_Details       | Research_Project_Details | Validation_Text_Project | Project_Team_Details  | Research_Locations_Details               |
      | Label_Texts              | Valid_Data_All_Fields | Valid_Data_All_Fields    | Label_Texts             | Valid_Data_All_Fields | Valid_Research_Locations_Details_Nhs     |
      | Label_Texts              | Valid_Data_All_Fields | Data_With_No_NHS_HSC     | Label_Texts             | Valid_Data_All_Fields | Valid_Research_Locations_Details_Non_Nhs |

  @ProjectOverviewTabs @rsp-4876 @rsp-5047 @rsp-5048 @rsp-5049 @rsp-5050
  Scenario Outline: Validate the expected data is available and displayed on the project overview page
    And I navigate to the project overview page of the '<Project_Name>' project
    And I capture the page screenshot
    And I can see the 'existing' project details on project overview page for '<Project_Name>'
    And I can see the project status for '<Project_Name>' displayed on the project overview page
    When I click the 'Project_Details' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the 'existing' data for '<Project_Name>' is displayed in the project details tab of project overview page
    When I click the 'Project_Team' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the 'existing' data for '<Project_Name>' is displayed in the project team tab of project overview page
    When I click the 'Research_Locations' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I validate the data for '<Project_Name>' is displayed in the research locations tab of project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    Then I can see the 'Post_Approval_Tab' ui labels on the project overview page

    Examples:
      | Project_Name                         |
      | Salford_Primary_Care_Workforce_Study |

  @rsp-4876 @PostApprovalPageSort
  Scenario Outline: Validate the user is able to sort the post approval fields
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I capture the page screenshot
    And the default page size should be 'twenty'
    And I capture the page screenshot
    When I click the '<Sort_Button>' button on the 'Post_Approval_Page'
    Then I can see the modifications is sorted by 'ascending' order of the '<Sort_Field>'
    And I capture the page screenshot
    When I click the '<Sort_Button>' button on the 'Post_Approval_Page'
    Then I can see the modifications is sorted by 'descending' order of the '<Sort_Field>'
    And I capture the page screenshot

    Examples:
      | Sort_Button     | Sort_Field      |
      | Modification_Id | modification id |

  @rsp-4876 @PostApprovalPaginationFirstPage
  Scenario Outline: Verify pagination in post approval page when user is on the first page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I capture the page screenshot
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Post_Approval_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | next link         |

  @rsp-4876 @PostApprovalPaginationLastPage
  Scenario Outline: Verify pagination in post approval page when user is on the last page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
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
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
    And I capture the page screenshot
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Post_Approval_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | previous link     |

  @rsp-4545 @rsp-5280 @ProjectDocumentsTab
  Scenario: Validate the user is able to access and view the project documents details from the project overview page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using 'Change_To_Planned_End_Date' and 'Nhs_Involvement_Yes' dataset
    And I create 'Change_To_Planned_End_Date' for the created modification
    And I can see the modifications details page
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see a 'Search' button on the 'Project_Documents_Page'
    And I click the 'Advanced_Filters' button on the 'Project_Documents_Page'
    And I can see the 'Project_Documents_Tab' ui labels on the project overview page
    And I can see the list is sorted by default in the alphabetical order of the 'document type'

  @rsp-4545 @ProjectDocumentsPaginationFirstPage
  Scenario Outline: Verify pagination in project documents page when user is on the first page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using 'Change_To_Planned_End_Date' and 'Nhs_Involvement_Yes' dataset
    And I create 'Change_To_Planned_End_Date' for the created modification
    And I can see the modifications details page
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can now see a table of search results for project documents page
    And the default page size should be 'twenty'
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Project_Documents_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | next link         |

  @rsp-4545 @ProjectDocumentsPaginationLastPage
  Scenario Outline: Verify pagination in project documents page when user is on the last page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using 'Change_To_Planned_End_Date' and 'Nhs_Involvement_Yes' dataset
    And I create 'Change_To_Planned_End_Date' for the created modification
    And I can see the modifications details page
    When I click the 'Add_Documents' button on the 'Modification_Details_Page'
    Then I can see add supporting documents page
    And I upload 'Multiple_Files' documents
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I validate the status of each document is 'Document_Status_Uploaded' in the add documents page
    And I can see 'Save_Continue' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I can see 'Save_For_Later' button 'Enabled' on the 'Add_Document_Modifications_Page'
    And I validate the uploaded 'Multiple_Files' documents are listed along with size and delete option in the review uploaded documents page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Incomplete' in add document details page
    And I capture the page screenshot
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'Multiple_Files' in the add document details for specific document page
    And I capture the page screenshot
    And I validate the status of each document is 'Document_Status_Complete' in add document details page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Page'
    And I capture the page screenshot
    And I can see the review your document information page
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can now see a table of search results for project documents page
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Project_Documents_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | previous link     |

  @rsp-3930 @ProjectDocumentDownload
  Scenario: Validate the user is able to download the project document from the project overview page
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    And I capture the page screenshot
    And I can see the 'Label_Texts' ui labels on the project details iras page
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Nhs_Involvement_Yes'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I keep note of the individual and overall ranking of changes created using 'Change_To_Planned_End_Date' and 'Nhs_Involvement_Yes' dataset
    And I create 'Change_To_Planned_End_Date' for the created modification
    And I can see the modifications details page
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
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Review_Your_Document_Infomation_Modifications_Page'
    And I capture the page screenshot
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    And I capture the page screenshot
    Then I can see the review all changes page
    Then I click the 'Save_For_Later' button on the 'Review_All_Changes_Page'
    And I capture the page screenshot
    Then I can see the project overview page
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    And I capture the page screenshot
    And I can see the 'Project_Documents_Tab' ui labels on the project overview page
    And I capture the page screenshot
    When I click a 'file name' on the project overview page and validate the downlaoded file in the download folder
    And I capture the page screenshot

  @VerifyValidSearchAndAdvancedFilterMyResearch @rsp-4650
  Scenario Outline: Verify the user is able to view the list of projects by entering a valid short project title,IRAS ID selecting the advanced filters, and clicking the 'Apply filters' button
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    When I fill the search input for searching 'my research' with '<Search_Queries>' as the search query
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for my research page
    And I capture the page screenshot

    Examples:
      | Search_Queries                          | Advanced_Filters                               |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_One_All                        |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_Two                            |
      | Existing_Short_Project_Title_Data_Three | Advanced_Filter_Three                          |
      | Existing_Iras_Id_Data_Three             | Advanced_Filter_Four                           |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Five                           |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Six                            |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_Project_Created_From_Date_Only |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Project_Created_To_Date_Only   |

  @VerifyApplyingFilterFirstAndSearch @rsp-4650
  Scenario Outline: Verify the user can view the list of projects by selecting advanced filters and click on apply filters button then entering valid short project title and click on search button
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I can see the results matching the filter criteria '<Advanced_Filters>' for my research page
    And I capture the page screenshot
    When I fill the search input for searching 'my research' with '<Search_Queries>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'My_Research_Page'
    And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for my research page
    And I capture the page screenshot

    Examples:
      | Search_Queries                          | Advanced_Filters                               |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_One_All                        |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_Two                            |
      | Existing_Short_Project_Title_Data_Three | Advanced_Filter_Three                          |
      | Existing_Iras_Id_Data_Three             | Advanced_Filter_Four                           |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Five                           |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Six                            |
      | Existing_Short_Project_Title_Data_One   | Advanced_Filter_Project_Created_From_Date_Only |
      | Existing_Iras_Id_Data                   | Advanced_Filter_Project_Created_To_Date_Only   |

  @VerifyNoResultsFoundInvalidSearchOnlyMyResearch @rsp-4650
  Scenario: Verify the user can see no matching results found message on clicking search button with invalid data
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    When I fill the search input for searching 'my research' with 'Non_Existant_Data' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed

  @VerifyNoResultsFoundInvalidSearchAdvancedFiltersMyResearch @rsp-4650
  Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    When I fill the search input for searching 'my research' with 'Non_Existant_Data' as the search query
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    Then 'I can see the selected filters are displayed under' active filters 'Advanced_Filter_Country_All_Status_Active_From_Date_To_Date_Role_All_Reviewbody_All' in the 'My_Research_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed

    Examples:
      | Advanced_Filters                                |
      | Advanced_Filter_One_All                         |
      | Advanced_Filter_Project_Created_From_Date_Only  |
      | Advanced_Filter_Project_Created_In_To_Date_Only |

  @ValidateClearAllFilters @rsp-4650
  Scenario: Validate clear all filters removes all active filters in my research page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I capture the page screenshot
    And I click the 'Clear_All_Filters' link on the 'My_Research_Page'
    And I capture the page screenshot
    And I 'cannot' see active filters displayed

    Examples:
      | Advanced_Filters                               |
      | Advanced_Filter_One_All                        |
      | Advanced_Filter_Project_Created_From_Date_Only |
      | Advanced_Filter_Project_Created_To_Date_Only   |

  @RemoveAllActiveFiltersOneByOne @rsp-4650
  Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I capture the page screenshot
    And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'My_Research_Page'
    And I capture the page screenshot
    And I 'cannot' see active filters displayed

    Examples:
      | Advanced_Filters        | Advanced_Filters_Remove |
      | Advanced_Filter_One_All | Advanced_Filter_One_All |
      | Advanced_Filter_Two     | Advanced_Filter_Two     |

  @VerifyActiveFiltersRemainVisibleDuringPagination @rsp-4650
  Scenario: Verify that active filters remain visible during pagination, and that they are cleared when navigating to a different page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'
    And I click the 'Advanced_Filters' button on the 'My_Research_Page'
    And I select advanced filters in the my research page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'My_Research_Page'
    And I capture the page screenshot
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'My_Research_Projects_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'My_Research_Page'
    And I capture the page screenshot
    And I click the 'My_Account' link on the 'My_Research_Page'
    And I have navigated to the 'My_Research_Page'
    And I 'cannot' see active filters displayed
    And I capture the page screenshot

    Examples:
      | Navigation_Method | Advanced_Filters                               |
      | page number       | Advanced_Filter_Project_Created_From_Date_Only |
      | next link         | Advanced_Filter_Project_Created_From_Date_Only |
