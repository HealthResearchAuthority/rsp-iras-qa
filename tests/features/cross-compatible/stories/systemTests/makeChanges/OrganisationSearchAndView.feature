@FrontStageUser @createModifications @SystemTest @jsEnabled
Feature: Organisation Search and View

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the key project roles page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I can see the project overview page
    And I capture the page screenshot

@rsp-4063 @OrganisationView @abc
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
    And I see the total number of results in the page
  Examples:
      | Area_Of_Change             | Specific_Change                                            |  Modifications_Tile_Link |  Validation_Text  |
      | Participating_Organisation | Addition_Of_sites_Option                                   |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Early_closure_withdrawal_of_sites_Option                   |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |  Modifications_Tile      |  Column_Label     |
      | Participating_Organisation | Early_closure_Of_Participant_Identification_Centres_Option |  Modifications_Tile      |  Column_Label     |


# AC1

# Given I navigate to the "Select participating organisations" screen -> done

# the screen is loaded with the results by default in Alphabetical order by participating organisation name -> done

# The following organisations columns are displayed - Name, Address, Organisation type, and Country -> done

# Each row contains a checkbox 

# The number of results is displayed on the table
# find total rows excluding the header row.
# Read what is available in the screen 
# compare both

# The default size of the results displayed - 10 or 20 is not decided yet. -> done