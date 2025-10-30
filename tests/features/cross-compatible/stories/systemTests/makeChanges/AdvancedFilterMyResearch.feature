@ApplicantUser  @SystemTest
Feature:My research-Create Project

  Background:
    Given I have navigated to the 'Home_Page'
    And I can see the my account home page
    And I have navigated to the 'My_Research_Page'
    And I can see the 'My_Research_Page'

    @VerifyValidSearchAndAdvancedFilterMyResearch @rsp-4650 
    Scenario Outline: Verify the user is able to view the list of projects by entering a valid short project title,IRAS ID selecting the advanced filters, and clicking the 'Apply filters' button
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

    @ValidateLastLoggedInInvalidDateErrorMessageMyResearch @rsp-4650 
    Scenario Outline: Verify the user can see validation error message that Search to date must be after Search from date in my research page
        And I click the 'Advanced_Filters' button on the 'My_Research_Page'
        And I select advanced filters in the my research page using '<Date_Submitted_Invalid_Data>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'My_Research_Page'
        And I capture the page screenshot
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'My_Research_Page' in advanced filters
        And I capture the page screenshot

        Examples:
            | Date_Submitted_Invalid_Data                                   | Field_And_Summary_Error_Message                  |
            | Advanced_Filter_Project_Created_To_Date_Before_From_Date      | Invalid_Date_Created_Range_To_Before_From_Error  |
            | Advanced_Filter_Project_Created_No_Month_From_Date            | Invalid_Date_Created_From_Error                  | 
            | Advanced_Filter_Project_Created_No_Day_From_Date              | Invalid_Date_Created_From_Error                  |     
            | Advanced_Filter_Project_Created_No_Year_From_Date             | Invalid_Date_Created_From_Error                  |
            | Advanced_Filter_Project_Created_No_Month_To_Date              | Invalid_Date_Created_To_Error                    |
            | Advanced_Filter_Project_Created_No_Day_To_Date                | Invalid_Date_Created_To_Error                    |
            | Advanced_Filter_Project_Created_No_Year_To_Date               | Invalid_Date_Created_To_Error                    | 
            | Advanced_Filter_Project_Created_Invalid_Year_Number_From_Date | Invalid_Date_Created_From_Error                  | 
            | Advanced_Filter_Project_Created_Invalid_Year_Number_To_Date   | Invalid_Date_Created_To_Error                    |  
            | Advanced_Filter_Project_Created_Invalid_Day_Number_To_Date    | Invalid_Date_Created_To_Error                    | 
            | Advanced_Filter_Project_Created_Invalid_Day_Letters_To_Date   | Invalid_Date_Created_To_Error                    |    
            | Advanced_Filter_Project_Created_Invalid_Year_Letters_To_Date  | Invalid_Date_Created_To_Error                    |
  
    @VerifyNoResultsFoundInvalidSearchOnlyMyResearch @rsp-4650 
    Scenario: Verify the user can see no matching results found message on clicking search button with invalid user name
        When I fill the search input for searching 'my research' with 'Non_Existant_Data' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'My_Research_Page'
        And I capture the page screenshot
        Then the no search results found message is displayed

    @VerifyNoResultsFoundInvalidSearchAdvancedFiltersMyResearch @rsp-4650 
    Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
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
            | Advanced_Filters                                |
            | Advanced_Filter_One_All                         |
            | Advanced_Filter_Project_Created_From_Date_Only  |
            | Advanced_Filter_Project_Created_To_Date_Only    |

    @RemoveAllActiveFiltersOneByOne @rsp-4650  
    Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly
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
    
    