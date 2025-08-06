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
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Users_Page'
        And I can see the results matching the filter criteria '<Advanced_Filters>' for manage users page
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
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I validate '<Field_Error_Message>' displayed on advanced filters in manage users page
        And I capture the page screenshot
        Examples:
            | Advanced_Filters                            | Field_Error_Message             |
            | Advanced_Filter_Last_Logged_In_Invalid_Date | Field_Error_Date_Last_Logged_In |

    @VerifyNoResultsFoundInvalidSearchAloneManageUser @KNOWN-DEFECT-RSP-4363
    Scenario: Verify the user can see no matching results found message on clicking search button with invalid user name
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the '<No_Results_Found>' ui labels

        Examples:
            | Search_Queries         | No_Results_Found           |
            | Non_Existant_User_Data | No_Matching_Search_Results |

    @VerifyNoResultsFoundInvalidSearchAdvancedFiltersManageUser @KNOWN-DEFECT-RSP-4363
    Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
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

