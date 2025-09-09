@ApplicantUser @ParticipatingOrganisationViewAndSearch @SystemTest @jsEnabled
Feature: Organisation Search and View

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    And I capture the page screenshot

  @rsp-4063 @OrganisationView
  Scenario Outline: Verify that user can view the participating organisation screen
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

  @rsp-4063 @OrganisationSearch
  Scenario Outline: Verify that user can search on the participating organisation screen
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

  @rsp-4063 @ParticipatingOrganisationsSummaryErrorValidation
  Scenario Outline: Validate the summary error message on participating organisation page
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

  @rsp-4063 @ParticipatingOrganisationsPaginationFirst
  Scenario Outline: Validate pagination for first few pages in participating organisation page
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

  @rsp-4063 @ParticipatingOrganisationsPaginationLast 
  Scenario Outline: Validate pagination for last few pages in participating organisation page
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