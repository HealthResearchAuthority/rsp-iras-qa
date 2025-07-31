@AdvancedFilterReviewBody @SysAdminUser @SystemTest
Feature: Review Bodies - Advanced Filter and Search combinations in the Manage review bodies page

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'

  @rsp-3547 @VerifyValidSearchAndAdvancedFilterReviewBody
  Scenario Outline: Verify the user is able to view the list of review bodies by entering a valid organisation name, selecting the advanced filters, and clicking the 'Apply filters' button
    When I enter '<Organisation_Name>' into the search field for manage review bodies page
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters for manage review bodies page
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters      |
      | Existing_QA_Data_One | Advanced_Filter_One   |
      | Empty_Search_Data    | Advanced_Filter_One   |
      | Existing_QA_Data_One | Advanced_Filter_Two   |
      | Existing_QA_Data_One | Advanced_Filter_Three |
      | Existing_QA_Data_One | Advanced_Filter_Four  |
      | Existing_QA_Data_One | Advanced_Filter_Five  |
      | Existing_QA_Data_One | Advanced_Filter_Six   |
      | Existing_QA_Data_One | Advanced_Filter_Seven |
      | Existing_QA_Data_One | Advanced_Filter_Eight |
      | Existing_QA_Data_One | Advanced_Filter_Nine  |
      | Existing_QA_Data_One | Advanced_Filter_Ten   |

  @rsp-3547 @VerifySearchButtonClickAndAdvancedFilterReviewBody
  Scenario Outline: Verify the user is able to view the list of review bodies by entering valid organisation name, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
    When I enter '<Organisation_Name>' into the search field for manage review bodies page
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters for manage review bodies page
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters    |
      | Existing_QA_Data_One | Advanced_Filter_One |
      | Empty_Search_Data    | Advanced_Filter_One |

  @rsp-3547 @VerifyApplyingFilterFirstAndSearch
  Scenario Outline: Verify the user can view the list of review bodies by selecting advanced filters and click on apply filters button then entering valid organisation name and click on search button
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters for manage review bodies page
    And I can see the results matching the filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot
    When I enter '<Organisation_Name>' into the search field for manage review bodies page
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters      |
      | Existing_QA_Data_One | Advanced_Filter_One   |
      | Empty_Search_Data    | Advanced_Filter_One   |
      | Existing_QA_Data_One | Advanced_Filter_Two   |
      | Existing_QA_Data_One | Advanced_Filter_Three |
      | Existing_QA_Data_One | Advanced_Filter_Four  |
      | Existing_QA_Data_One | Advanced_Filter_Five  |
      | Existing_QA_Data_One | Advanced_Filter_Six   |
      | Existing_QA_Data_One | Advanced_Filter_Seven |
      | Existing_QA_Data_One | Advanced_Filter_Eight |
      | Existing_QA_Data_One | Advanced_Filter_Nine  |
      | Existing_QA_Data_One | Advanced_Filter_Ten   |

  @rsp-3547 @VerifyNoResultsFoundInvalidSearchAlone
  Scenario: Verify the user can see no matching results found message on clicking search button with invalid organisation name
    When I enter '<Organisation_Name>' into the search field for manage review bodies page
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the '<No_Results_Found>' ui labels

    Examples:
      | Organisation_Name | No_Results_Found           |
      | Non_Existant_Data | No_Matching_Search_Results |

  @rsp-3547 @VerifyNoResultsFoundInvalidSearchAdvancedFilters
  Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
    When I enter '<Organisation_Name>' into the search field for manage review bodies page
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters for manage review bodies page
    And I capture the page screenshot
    Then I can see the '<No_Results_Found>' ui labels

    Examples:
      | Organisation_Name | Advanced_Filters    | No_Results_Found           |
      | Non_Existant_Data | Advanced_Filter_One | No_Matching_Search_Results |

  @rsp-3547 @jsEnabled @VerifyHintLabelForSelectedCountryCheckboxAdvancedFilters @rsp-4273
  Scenario: When javascript enabled verify the hint text for country advanced filters when user select multiple checkboxes
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I verify the hint text based on the '<Advanced_Filters>' for manage review bodies page

    Examples:
      | Advanced_Filters                    |
      | Advanced_Filter_No_Country_Selected |
      | Advanced_Filter_One                 |
      | Advanced_Filter_Three               |
      | Advanced_Filter_Seven               |
      | Advanced_Filter_Nine                |

  @rsp-3547 @jsDisabled @VerifyHintLabelForSelectedCountryCheckboxAdvancedFilters @rsp-4273
  Scenario: When javascript disabled verify the hint text for country advanced filters when user select multiple checkboxes
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I expand the chevrons for '<Advanced_Filters>' in manage review bodies page
    And I capture the page screenshot
    And I verify the hint text based on the '<Advanced_Filters>' for manage review bodies page

    Examples:
      | Advanced_Filters                    |
      | Advanced_Filter_No_Country_Selected |
      | Advanced_Filter_One                 |
      | Advanced_Filter_Three               |
      | Advanced_Filter_Seven               |
      | Advanced_Filter_Nine                |

  @rsp-3547 @VerifyHintTextForAdvanceFilters @rsp-4273
  Scenario: Validate hint labels for advanced filters in mange review body page
    And I expand the chevrons for '<Advanced_Filters>' in manage review bodies page
    And I capture the page screenshot
    And I can see the '<Advanced_Filters_Labels>' ui labels in manage review bodies page

    Examples:
      | Advanced_Filters    | Advanced_Filters_Labels      |
      | Advanced_Filter_One | Advanced_Filters_Hint_Labels |

  @rsp-3547 @ValidateClearAllFiltersManageReviewBody
  Scenario: Validate clear all filters removes all active filters in mange review body page
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then I can see the selected filters '<Advanced_Filters>' are displayed under active filters for manage review bodies page
    And I capture the page screenshot
    And I click the 'Clear_All_Filters' link on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters '<Advanced_Filters>' are removed from active filters for manage review bodies page

    Examples:
      | Advanced_Filters    |
      | Advanced_Filter_One |