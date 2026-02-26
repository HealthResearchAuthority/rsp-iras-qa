@UserAdministration @ManageReviewBodies @AdvancedFilterReviewBody @SysAdminUser @SystemTest @STSysAdmin
Feature: Manage review bodies-Advanced Filter and Search

  Background:
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'

  @rsp-3547 @VerifyValidSearchAndAdvancedFilterReviewBody
  Scenario Outline: Verify the user is able to view the list of review bodies by entering a valid organisation name, selecting the advanced filters, and clicking the 'Apply filters' button
    When I fill the search input for searching 'review bodies' with '<Organisation_Name>' as the search query
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters                     |
      | Existing_QA_Data_One | Advanced_Filter_All_Countries_Active |
      # | Existing_QA_Data_One | Advanced_Filter_All_Countries_Disabled |
      | Existing_QA_Data_One | Advanced_Filter_Eng_Active           |
      | Existing_QA_Data_One | Advanced_Filter_NI_Active            |
      | Existing_QA_Data_One | Advanced_Filter_Sco_Active           |
      | Existing_QA_Data_One | Advanced_Filter_Wal_Active           |
      | Existing_QA_Data_One | Advanced_Filter_Eng_NI_Active        |
      | Existing_QA_Data_One | Advanced_Filter_NI_Sco_Wal_Active    |
      | Existing_QA_Data_One | Advanced_Filter_Eng_Wal_Active       |
  # | Existing_QA_Data_One | Advanced_Filter_NI_Wal_Disabled        |

  @rsp-3547 @VerifyNoSearchAndAdvancedFilterReviewBody
  Scenario Outline: Verify the user is able to view the list of review bodies by selecting the advanced filters, and clicking the 'Apply filters' button
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name | Advanced_Filters                     |
      | Empty_Search_Data | Advanced_Filter_All_Countries_Active |

  @rsp-3547 @VerifySearchButtonClickAndAdvancedFilterReviewBody
  Scenario Outline: Verify the user is able to view the list of review bodies by entering valid organisation name, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
    When I fill the search input for searching 'review bodies' with '<Organisation_Name>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters                     |
      | Existing_QA_Data_One | Advanced_Filter_All_Countries_Active |

  @rsp-3547 @VerifyApplyingFilterFirstAndSearch
  Scenario Outline: Verify the user can view the list of review bodies by selecting advanced filters and click on apply filters button then entering valid organisation name and click on search button
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I can see the results matching the filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot
    When I fill the search input for searching 'review bodies' with '<Organisation_Name>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the results matching the search '<Organisation_Name>' and filter criteria '<Advanced_Filters>' for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Organisation_Name    | Advanced_Filters                     |
      | Existing_QA_Data_One | Advanced_Filter_All_Countries_Active |
      # | Existing_QA_Data_One | Advanced_Filter_All_Countries_Disabled |
      | Existing_QA_Data_One | Advanced_Filter_Eng_Active           |
      | Existing_QA_Data_One | Advanced_Filter_NI_Active            |
      | Existing_QA_Data_One | Advanced_Filter_Sco_Active           |
      | Existing_QA_Data_One | Advanced_Filter_Wal_Active           |
      | Existing_QA_Data_One | Advanced_Filter_Eng_NI_Active        |
      | Existing_QA_Data_One | Advanced_Filter_NI_Sco_Wal_Active    |
      | Existing_QA_Data_One | Advanced_Filter_Eng_Wal_Active       |
  # | Existing_QA_Data_One | Advanced_Filter_NI_Wal_Disabled        |

  @rsp-3547 @VerifyNoResultsFoundInvalidSearchAlone
  Scenario: Verify the user can see no matching results found message on clicking search button with invalid organisation name
    When I fill the search input for searching 'review bodies' with '<Organisation_Name>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed

    Examples:
      | Organisation_Name |
      | Non_Existant_Data |

  @rsp-3547 @VerifyNoResultsFoundInvalidSearchAdvancedFilters
  Scenario: Verify the user can see no matching results found message on click on apply filter button with invalid filter/search criteria
    When I fill the search input for searching 'review bodies' with '<Organisation_Name>' as the search query
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then the no search results found message is displayed

    Examples:
      | Organisation_Name | Advanced_Filters                     |
      | Non_Existant_Data | Advanced_Filter_All_Countries_Active |

  @rsp-3547 @jsEnabled @VerifyHintLabelForSelectedCountryCheckboxAdvancedFilters @rsp-4273
  Scenario: When javascript enabled verify the hint text for country advanced filters when user select multiple checkboxes
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I verify the hint text based on the '<Advanced_Filters>' for manage review bodies page

    Examples:
      | Advanced_Filters                     |
      | Advanced_Filter_No_Country_Selected  |
      | Advanced_Filter_All_Countries_Active |
      | Advanced_Filter_Eng_Active           |
      | Advanced_Filter_Eng_NI_Active        |
      | Advanced_Filter_Eng_Wal_Active       |

  @rsp-3547 @jsDisabled @VerifyHintLabelForSelectedCountryCheckboxAdvancedFilters @rsp-4273
  Scenario: When javascript disabled verify the hint text for country advanced filters when user select multiple checkboxes
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    And I expand the chevrons for '<Advanced_Filters>' in manage review bodies page
    And I capture the page screenshot
    And I verify the hint text based on the '<Advanced_Filters>' for manage review bodies page

    Examples:
      | Advanced_Filters                     |
      | Advanced_Filter_No_Country_Selected  |
      | Advanced_Filter_All_Countries_Active |
      | Advanced_Filter_Eng_Active           |
      | Advanced_Filter_Eng_NI_Active        |
      | Advanced_Filter_Eng_Wal_Active       |

  @rsp-3547 @VerifyHintTextForAdvanceFilters @rsp-4273
  Scenario: Validate hint labels for advanced filters in mange review body page
    And I expand the chevrons for '<Advanced_Filters>' in manage review bodies page
    And I capture the page screenshot
    And I can see the '<Advanced_Filters_Labels>' ui labels in manage review bodies page

    Examples:
      | Advanced_Filters                     | Advanced_Filters_Labels      |
      | Advanced_Filter_All_Countries_Active | Advanced_Filters_Hint_Labels |

  @rsp-3547-run @ValidateClearAllFiltersManageReviewBody
  Scenario: Validate clear all filters removes all active filters in mange review body page
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Clear_All_Filters' link on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the selected filters '<Advanced_Filters>' are removed from active filters for manage review bodies page

    Examples:
      | Advanced_Filters                     |
      | Advanced_Filter_All_Countries_Active |

  @rsp-3547 @ValidateRemoveFiltersOneByOneManageReviewBody
  Scenario: Validate removes all active filters one by one in mange review body page
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I 'cannot' see the advanced filters panel
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then 'I remove the selected filters from' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'

    Examples:
      | Advanced_Filters                     |
      | Advanced_Filter_All_Countries_Active |

  @rsp-4381 @AdvancedFiltersPersistOnPaginationWhenClearOnOutsidePageNavigation
  Scenario: Verify active filters persist during pagination and are automatically cleared when navigating away from mange review body page
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Manage_Review_Bodies_Page' by clicking on 'previous link' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    When I click the 'System_Admin_Breadcrumb' link on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then I can see the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    Then I can see the selected filters '<Advanced_Filters>' are removed from active filters for manage review bodies page
    And I capture the page screenshot

    Examples:
      | Advanced_Filters                     |
      | Advanced_Filter_All_Countries_Active |

  @rsp-4381 @ActiveFilterRemainAppliedAfterCreateNewReviewBody @KNOWN-DEFECT-RSP-7490
  Scenario Outline: Verify that the active filter remains applied after creating a new review body with valid data
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    Then I can see the 'Create_Review_Body_Page'
    When I fill the new review body page using '<Add_Review_Body>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    Then I can see the check and create review body page for '<Add_Review_Body>'
    And I capture the page screenshot
    When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    Then I can see the create Review body confirmation page for '<Add_Review_Body>'
    And I capture the page screenshot
    When I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot

    Examples:
      | Add_Review_Body          | Status  | Advanced_Filters                     |
      | Valid_Data_In_All_Fields | enabled | Advanced_Filter_All_Countries_Active |

  @rsp-4381 @ActiveFilterRemainAppliedAfterEditTheReviewBody
  Scenario Outline: Verify that the active filter remains applied after edit the review body and save their changes
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I capture the page screenshot
    And I click the change link against '<Field_Name>' on the review body profile page
    And I can see the edit review body page
    And I capture the page screenshot
    When I fill the edit review body page using '<Edit_Review_Body>'
    And I capture the page screenshot
    And I click the 'Save' button on the 'Edit_Review_Body_Page'
    Then I now see the review body profile page with the updated '<Edit_Review_Body>'
    And I capture the page screenshot
    When I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot

    Examples:
      | Edit_Review_Body         | Field_Name        | Advanced_Filters                     |
      | Valid_Data_In_All_Fields | Organisation_Name | Advanced_Filter_All_Countries_Active |

