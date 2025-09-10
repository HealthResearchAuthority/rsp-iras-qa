@AdvancedFilterManageUser @SysAdminUser @SystemTest @rsp-3556
Feature: users - Advanced Filter and Search combinations in the Manage users page

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'System_Administration' link on the 'Home_Page'
        Then I can see the system administration home page
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'

    @VerifyValidSearchAndAdvancedFilterManageUser
    Scenario Outline: Verify the user is able to view the list of users by entering a valid first name, last name,email address selecting the advanced filters, and clicking the 'Apply filters' button
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for manage users page
        And I capture the page screenshot

        Examples:
            | Search_Queries              | Advanced_Filters                              |
            | Existing_QA_User_First_Name | Advanced_Filter_One                           |
            | Existing_QA_User_Last_Name  | Advanced_Filter_Two                           |
            | Existing_QA_User_Email      | Advanced_Filter_Three                         |
            | Existing_QA_User_First_Name | Advanced_Filter_Four                          |
            | Existing_QA_User_First_Name | Advanced_Filter_Five                          |
            | Existing_QA_User_First_Name | Advanced_Filter_Six                           |
            | Existing_QA_User_First_Name | Advanced_Filter_Seven                         |
            | Existing_QA_User_First_Name | Advanced_Filter_Eight                         |
            | Existing_QA_User_First_Name | Advanced_Filter_Nine                          |
            | Existing_QA_User_First_Name | Advanced_Filter_Ten                           |
            | Empty_Search_Data           | Advanced_Filter_One                           |
            | Empty_Search_Data           | Advanced_Filter_Last_Logged_In_From_Date_Only |
            | Empty_Search_Data           | Advanced_Filter_Last_Logged_In_To_Date_Only   |

    @VerifySearchButtonClickAndAdvancedFilterManageUser
    Scenario Outline: Verify the user is able to view the list of users by entering valid first name, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for manage users page
        And I capture the page screenshot

        Examples:
            | Search_Queries              | Advanced_Filters    |
            | Existing_QA_User_First_Name | Advanced_Filter_One |
            | Empty_Search_Data           | Advanced_Filter_One |

    @VerifyApplyingFilterFirstAndSearch
    Scenario Outline: Verify the user can view the list of users by selecting advanced filters and click on apply filters button then entering valid first name and click on search button
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I can see the results matching the search '' and filter criteria '<Advanced_Filters>' for manage users page
        And I capture the page screenshot
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for manage users page
        And I capture the page screenshot

        Examples:
            | Search_Queries              | Advanced_Filters      |
            | Existing_QA_User_First_Name | Advanced_Filter_One   |
            | Empty_Search_Data           | Advanced_Filter_One   |
            | Existing_QA_User_First_Name | Advanced_Filter_Two   |
            | Existing_QA_User_First_Name | Advanced_Filter_Three |
            | Existing_QA_User_First_Name | Advanced_Filter_Four  |
            | Existing_QA_User_First_Name | Advanced_Filter_Five  |
            | Existing_QA_User_First_Name | Advanced_Filter_Six   |
            | Existing_QA_User_First_Name | Advanced_Filter_Seven |
            | Existing_QA_User_First_Name | Advanced_Filter_Eight |
            | Existing_QA_User_First_Name | Advanced_Filter_Nine  |
            | Existing_QA_User_First_Name | Advanced_Filter_Ten   |

    @ValidateLastLoggedInInvalidDateErrorMessageManageUser
    Scenario Outline: Verify the user can see validation error message that Search to date must be after Search from date
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I validate '<Field_Error_Message>' displayed on advanced filters in manage users page
        And I capture the page screenshot
        Examples:
            | Advanced_Filters                            | Field_Error_Message             |
            | Advanced_Filter_Last_Logged_In_Invalid_Date | Field_Error_Date_Last_Logged_In |

    @VerifyNoResultsFoundInvalidSearchAloneManageUser
    Scenario: Verify the user can see no matching results found message on clicking search button with invalid user name
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the '<No_Results_Found>' ui labels

        Examples:
            | Search_Queries         | No_Results_Found           |
            | Non_Existant_User_Data | No_Matching_Search_Results |

    @VerifyNoResultsFoundInvalidSearchAdvancedFiltersManageUser
    Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the '<No_Results_Found>' ui labels

        Examples:
            | Search_Queries         | Advanced_Filters    | No_Results_Found           |
            | Non_Existant_User_Data | Advanced_Filter_One | No_Matching_Search_Results |


    @jsDisabled @VerifyHintLabelForSelectedCountryCheckboxAdvancedFiltersManageUser
    Scenario: When javascript disabled verify the hint text for country advanced filters when user select multiple checkboxes
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I expand the chevrons for '<Advanced_Filters>' in manage users page
        And I capture the page screenshot
        And I verify the hint text based on the '<Advanced_Filters>' for manage users page

        Examples:
            | Advanced_Filters                    |
            | Advanced_Filter_No_Country_Selected |
            | Advanced_Filter_One                 |
            | Advanced_Filter_Three               |
            | Advanced_Filter_Seven               |
            | Advanced_Filter_Nine                |

    @rsp-4273  @VerifyHintTextForAdvanceFiltersManageUsers
    Scenario: Validate hint labels for advanced filters in mange users page
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I expand the chevrons for '<Advanced_Filters>' in manage users page
        And I capture the page screenshot
        And I can see the '<Advanced_Filters_Labels>' ui labels in manage users page
        Examples:
            | Advanced_Filters    | Advanced_Filters_Labels      |
            | Advanced_Filter_One | Advanced_Filters_Hint_Labels |

    @rsp-4273 @jsEnabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
    Scenario Outline: When javascript enabled verify the hint text for advanced filters when user select multiple checkboxes
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I verify the hint text based on the '<Advanced_Filters>' for manage users page
        Examples:
            | Advanced_Filters                    |
            | Advanced_Filter_No_Country_Selected |
            | Advanced_Filter_One                 |
            | Advanced_Filter_Three               |
            | Advanced_Filter_Seven               |
            | Advanced_Filter_Nine                |


    @rsp-4273 @jsDisabled @VerifyHintLabelForSelectedCheckboxAdvancedFilters
    Scenario Outline: When javascript disabled verify the hint text for advanced filters when user select multiple checkboxes
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I expand the chevrons for '<Advanced_Filters>' in manage users page
        And I capture the page screenshot
        And I verify the hint text based on the '<Advanced_Filters>' for manage users page
        Examples:
            | Advanced_Filters                    |
            | Advanced_Filter_No_Country_Selected |
            | Advanced_Filter_One                 |
            | Advanced_Filter_Three               |
            | Advanced_Filter_Seven               |
            | Advanced_Filter_Nine                |

    @ValidateClearAllFilters
    Scenario: Validate clear all filters removes all active filters in mange users page
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Clear_All_Filters' link on the 'Manage_Users_Page'
        And I capture the page screenshot
        And all selected filters displayed under active Filters have been successfully removed

        Examples:
            | Advanced_Filters                              |
            | Advanced_Filter_One                           |
            | Advanced_Filter_Last_Logged_In_From_Date_Only |
            | Advanced_Filter_Last_Logged_In_To_Date_Only   |

    @RemoveAllActiveFiltersOneByOne
    Scenario Outline: Verify the user can remove all the selected filters one by one and the search results update accordingly
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        And all selected filters displayed under active Filters have been successfully removed

        Examples:
            | Advanced_Filters    | Advanced_Filters_Remove |
            | Advanced_Filter_One | Advanced_Filter_One_All |
            | Advanced_Filter_Two | Advanced_Filter_Two_All |

    @rsp-4418 @ValidateActiveReviewbodies
    Scenario Outline: Validate the review body checkbox in the advanced filters of manage users page incorporates all currently enabled review bodies from the manage review bodies page
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I expand the chevrons for '<Advanced_Filters_Users>' in manage users page
        And I capture the page screenshot
        And I retrieve the list of review bodies displayed in the review body checkbox in the advanced filters of manage users page
        And I have navigated to the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage review bodies page using '<Advanced_Filters_Review_Bodies>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the review body field in the review body checkbox in the advanced filters of manage users page should contain all currently enabled review bodies from the manage review bodies page
        And I capture the page screenshot
        Examples:
            | Advanced_Filters_Review_Bodies       | Advanced_Filters_Users                             |
            | Advanced_Filter_All_Countries_Active | Advanced_Filter_Country_No_Review_Body_HRA_Role_No |
            | Advanced_Filter_All_Countries_Active | Advanced_Filter_Country_No_Review_Body_HRA_Role_No |

    # Few failures due to data issues- to be re executed once data issues are fixed(review body and country)
    @rsp-4418 @ValidateFilters
    Scenario Outline: Verify the user is able to view the list of users by selecting the advanced filters, and clicking the 'Apply filters' button
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I can see the results matching the search '' and filter criteria '<Advanced_Filters>' for manage users page
        And I capture the page screenshot
        When I click the 'View_Edit' link on the 'Manage_Users_Page'
        And I can see the user profile page
        And I capture the page screenshot
        And I can see the '<Advanced_Filters>' user has the selected roles in the filter assigned on their profile page
        And I can see the '<Advanced_Filters>' user has the selected review bodies in the filter assigned on their profile page
        And I can see the '<Advanced_Filters>' user has the selected countries in the filter assigned on their profile page

        Examples:
            | Advanced_Filters                                                        |
            | Advanced_Filter_Country_All_Review_Body_All_Role_All_Status_Active      |
            | Advanced_Filter_Country_No_Review_Body_HRA_Role_No                      |
            | Advanced_Filter_Country_No_Review_Body_HSCNI_Role_No                    |
            | Advanced_Filter_Country_No_Review_Body_HCRW_Role_No                     |
            | Advanced_Filter_Country_No_Review_Body_NRSPCC_Role_No                   |
            | Advanced_Filter_Country_No_Review_Body_No_Role_Applicant                |
            | Advanced_Filter_Country_No_Review_Body_No_Role_Studywide_Reviewer       |
            | Advanced_Filter_Country_No_Review_Body_No_Role_System_Admin             |
            | Advanced_Filter_Country_No_Review_Body_No_Role_Workflow_Coordinator     |
            | Advanced_Filter_Country_No_Review_Body_All_Role_All                     |
            | Advanced_Filter_Country_No_Review_Body_No_Role_No_Status_Active_To_Date |    @rsp-4381 
    Scenario Outline: verify that all active filters are automatically cleared when the user navigates away from the current page in mange user page
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'Back' link on the 'Manage_Users_Page'
        Then I can see the 'System_Administration_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'
        And all selected filters displayed under active Filters have been successfully removed
        And I capture the page screenshot
        Examples:
            | Navigation_Method        | Advanced_Filters     |
            | clicking on page number  | Advanced_Filter_Nine |

  @rsp-4381 @verifyUserCreation 
  Scenario Outline: Verify that the active filter remains applied after creating a new user profile with valid data
      And I select advanced filters in the manage users page using '<Advanced_Filters>'
      And I capture the page screenshot
      And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
      And I capture the page screenshot
      Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
      And I capture the page screenshot
      When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
      And I capture the page screenshot
      Then I can see the add a new user profile page
      When I fill the new user profile page using '<Add_User_Profile>'
      And I capture the page screenshot
      And I click the 'Continue' button on the 'Create_User_Profile_Page'
      Then I can see the check and create user profile page
      And I capture the page screenshot
      Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
      And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
      Then I can see the create user profile confirmation page for '<Add_User_Profile>'
      And I capture the page screenshot
      When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
      Then I can see the 'Manage_Users_Page'
      And I capture the page screenshot
      Then I can see the '<Validation_Text_Manage_Users_List>' ui labels on the manage users list page
      And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
      And I capture the page screenshot
      Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
      And I capture the page screenshot
     
      Examples:
          | Add_User_Profile                                   | Validation_Text_Manage_Users_List | Status_Enabled | Advanced_Filters     |
          | Valid_Data_In_All_Fields_Role_Reviewer             | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Nine | 
    
  @rsp-4381  @SysAdminUser
  Scenario Outline: Verify that the active filter remains applied after edit the manage user and save their changes
      And I select advanced filters in the manage users page using '<Advanced_Filters>'
      And I capture the page screenshot
      And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
      And I capture the page screenshot
      Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
      And I capture the page screenshot
      And I search and click on view edit link for existing 'Valid_Data_Role_Operations' user with '<Status>' status from the manage user page
      Then I can see the user profile page
      When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
      Then I can see the edit user profile page
      And I update user profile with '<Edit_User_Field_Data>'
      And I click the 'Save' button on the 'Edit_User_Profile_Page'
      And I can see the user profile page
      Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
      When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
      And I update user profile with '<Original_Data>'
      And I click the 'Save' button on the 'Edit_User_Profile_Page'
      And I can see the user profile page
      When I click the 'Back' link on the 'User_Profile_Page'
      Then I can see the 'Manage_Users_Page'
      Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
      And I capture the page screenshot
      Examples:
          | Edit_User_Field   | User_Role  | Status  | Edit_User_Field_Data | Original_Data            | Advanced_Filters     |
          | title_text        | Operations | Enabled | User_Title_Text_One  | Original_Title_Text_One  | Advanced_Filter_Nine |