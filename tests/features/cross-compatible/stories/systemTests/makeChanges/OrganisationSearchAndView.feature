@FrontStageUser @organisationSearch @SystemTest @jsEnabled
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
    # Then I fill the key project roles page with 'Valid_Data_All_Fields'
    # Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    # Then I fill the research locations page with 'Valid_Data_All_Fields'
    # When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    # Then I can see the review your answers page
    # When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
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
    #And I see the total number of results in the page
    #And I confirm checkbox exists in every row across all pages
        
  Examples:
      | Area_Of_Change             | Specific_Change                                            |  Modifications_Tile_Link |  Validation_Text  |
      | Participating_Organisation | Addition_Of_sites_Option                                   |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option |  Modifications_Tile      |  Column_Label     |

@rsp-4063 @OrganisationSearchView @def
  Scenario Outline: Verify that user can view the participating organisation screen 
    When I click the '<Modifications_Tile_Link>' link on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    And I fill the search criteria '<Participating_Organisation_Search>'
    
 Examples:
       | Area_Of_Change             | Specific_Change                                            |  Modifications_Tile_Link |  Participating_Organisation_Search  |
      | Participating_Organisation | Addition_Of_sites_Option                                   |  Modifications_Tile      |  Valid_Data_Fields     |
      # | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   |  Modifications_Tile      |  Valid_Data_Fields    |
      # | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |  Modifications_Tile      |  Valid_Data_Fields     |
      # | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option |  Modifications_Tile      |  Valid_Data_Fields     |


#Given that I have entered 3 or more characters into the search bar

# When I click on the ‘search' button

# Then I see a list of matching results 

# Search additional

# Specific search (not fuzzy)

# Search against the ‘participating organisation name’