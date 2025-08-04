@FrontStageUser @ParticipatingOrganisationViewAndSearch @SystemTest @jsEnabled
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
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I can see the page heading is changed for '<Specific_Change>' on participating organisation page
    And I capture the page screenshot
    Then I can see the '<Validation_Text>' ui labels on the participating organisation page
    And the default page size should be ten
    And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
    And I capture the page screenshot
    And I see the total number of results displayed in the participating organisation page
    And I confirm checkbox is displayed in participating organisation page

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link | Validation_Text |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Modifications_Tile      | Column_Label    |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Modifications_Tile      | Column_Label    |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      | Column_Label    |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      | Column_Label    |

  @rsp-4063 @OrganisationSearch
  Scenario Outline: Verify that user can search on the participating organisation screen
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    When I enter '<Organisation_Name>' into the search field in the participating organisation page
    And I click the 'Search' button on the 'Participating_Organisations_Page'
    And I capture the page screenshot
    And I see the total number of results displayed in the participating organisation page
    And I can see the results matching the search '<Organisation_Name>' in the participating organisation page
    And I capture the page screenshot

    Examples:
      | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link | Organisation_Name     |
      | Participating_Organisation | Addition_Of_sites_Option                                   | Modifications_Tile      | Valid_Search_Text_One |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Modifications_Tile      | Valid_Search_Text_One |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      | Valid_Search_Text_Two |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      | Valid_Search_Text_Two |

  @rsp-4063 @ParticipatingOrganisationsSummaryErrorValidation
  Scenario Outline: Validate the summary error message on participating organisation page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    When I enter '<Organisation_Name>' into the search field in the participating organisation page
    And I click the 'Search' button on the 'Participating_Organisations_Page'
    Then I validate '<Summary_Error_Message>' displayed on 'Participating_Organisations_Page'
    And I capture the page screenshot

    Examples:
      | Summary_Error_Message                     | Area_Of_Change             | Specific_Change                                            | Modifications_Tile_Link | Organisation_Name       |
      | Summary_Error_participating_organisations | Participating_Organisation | Addition_Of_sites_Option                                   | Modifications_Tile      | Invalid_Search_Text_One |
      | Summary_Error_participating_organisations | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   | Modifications_Tile      | Invalid_Search_Text_One |
      | Summary_Error_participating_organisations | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      | Modifications_Tile      | Invalid_Search_Text_Two |
      | Summary_Error_participating_organisations | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option | Modifications_Tile      | Invalid_Search_Text_Two |


  @rsp-4063 @ParticipatingOrganisationsPagination
  Scenario Outline: Validate pagination for first few pages in participating organisation page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    Then I can see the '<Validation_Text>' ui labels on the participating organisation page
    When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate the first few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Method       | Modifications_Tile_Link | Area_Of_Change             | Specific_Change                                            |
      | Column_Label    | clicking on page number | Modifications_Tile      | Participating_Organisation | Addition_Of_sites_Option                                   |
      | Column_Label    | clicking on next link   | Modifications_Tile      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   |
      | Column_Label    | clicking on page number | Modifications_Tile      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |
      | Column_Label    | clicking on next link   | Modifications_Tile      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option |


  @rsp-4063 @ParticipatingOrganisationsPagination
  Scenario Outline: Validate pagination for last few pages in participating organisation page
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    Then I can see the '<Validation_Text>' ui labels on the participating organisation page
    When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate the last few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Method         | Modifications_Tile_Link | Area_Of_Change             | Specific_Change                                            |
      | Column_Label    | clicking on page number   | Modifications_Tile      | Participating_Organisation | Addition_Of_sites_Option                                   |
      | Column_Label    | clicking on previous link | Modifications_Tile      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   |
      | Column_Label    | clicking on page number   | Modifications_Tile      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |
      | Column_Label    | clicking on previous link | Modifications_Tile      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option |