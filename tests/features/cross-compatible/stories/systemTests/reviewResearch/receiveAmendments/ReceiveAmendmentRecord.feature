@ReceiveAmendments @SysAdminUser @BackStageUser @SystemTest @rsp-4011 @rsp-4016
Feature: Receive Amendment - Staff dashboard/worklist
    As a member of approvals staff
    I want to be notified of amendments that don't require actioning
    So that I have a complete record of all amendments made to the project

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'Approvals' link on the 'Home_Page'
        # Then I can see the approvals home page
        And I capture the page screenshot
        When I click the 'Search_For_Modifications' link on the 'Approvals_Page'
        And I capture the page screenshot
        Then I can see the 'Search_Modifications_Page'
        And I capture the page screenshot

    @viewListOfModifications
    Scenario Outline: Verify the user is able to view list of modifications in the descending order of the modification id
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
        And I capture the page screenshot
        When I enter 'name of the new review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot

        Examples:
            | Search_Advanced_Filters  |
            | Valid_Data_In_All_Fields |

### https://nihr.atlassian.net/browse/RSP-4011   dev/test - Develop the search & filters for modification records

##Scenario 1 -Happy Paths:

# 1. Valid IRAS ID + No Filters >>Click Search>>Results displayed

# 2. Valid IRAS ID + filters(64 combinations) >>Click Apply Filters>>Results displayed (some combinations can't give results) (Search button is not clicked)

# 3. No IRAS ID+Filters(64 combinations)>>Click Apply Filters>>Results displayed  (Search button is not clicked)>>Do I need to click search

# 4. Valid IRAS ID >>Click Search>>Results displayed>> Select Advanced Filters(64 combinations)>> Click Apply Filters>>Results displayed(filtered results) & vice versa

# 5. Does the results will be displayed by default? No I think (performance issue)/blank search will also not work

##Scenario 2 -Unhappy paths:

# 1. No IRAS ID + No Filters >> Click Search>>No results

# 2. No IRAS ID + No Filters >> Click Apply Filters>>No results

# 3. Invalid IRAS ID + No Filters >>Click Search>>No results

# 4. Invalid IRAS ID + filters(64 combinations) >>Search>>No results

# 5. Valid IRAS ID + filters(combinations  can't give results) >>Click Apply Filters>>No results (some combinations can't give results)

##Scenario 3 -Validation of Advanced filters

# Advanced filters  JS Enabled

# •  Filter may be expanded by default when JS disabled

# ○ Chief Investigator name — free text field

# ○ Short project title — free text field

# ○ Date modification submitted — date range picker

# ○ Sponsor organisation — search with checklist and radio buttons (Only one sponsor?) JS Enabled

# ○ Lead nation — checkbox + multi-select list

# ○ Modification type — checkbox + multi-select list

##Scenario 4 -'Date Modification submitted' filter validation

### Scenario 4.1 -'Date Modification submitted' error validation

# ○ GIVEN I am applying the ‘Date Modification submitted’ filters,
# WHEN I select an end date in the field that is earlier than the start date,
# THEN I should see a clear validation error message ‘This date you’ve selected is before the search above'

### Scenario 4.2 -'Date Modification submitted' selection (4 combinations- blank, from, to , from and to)

# AND the system should allow users to enter a single specific date without requiring a date range or a ‘from-to’ search.

##Scenario 5 -'Sponsor organisation' filter validation

# ○ Sponsor organisation — search with checklist and radio buttons (Only one sponsor?) JS Enabled

# • The search should begin after entering the first three characters.

# § If more than three results are returned, only the first three should be displayed initially, with the rest accessible via a vertically scrollable list.

# § If no results are found, the system must display an appropriate error message to the user.

##Scenario 6 -Selected filters validation

# • Selected filters are displayed under active filters>>tags/labels for each filter validation

##Scenario 6.1 -Remove filters validation

# • Remove filters>>one by one on clicking 'x'/ all together by clicking 'Clear all filters'
# ○ The search results update accordingly


# ## https://nihr.atlassian.net/browse/RSP-4016  dev/test - Display modification results after search

#     Scenario : 1- Default sorting

#     GIVEN I have performed a search,
#     WHEN the search results are displayed,
#     THEN I see modification records in a table view showing modification ID, short project title, modification type, chief investigator, lead nation, and project link.
#     AND by default, the records should be sorted in the descending order of the modification id

#     Scenario: 2 – Clearing active filters (one by one / all at once)

#     GIVEN I have applied filters during my search,
#     WHEN the search results are displayed,
#     THEN I see all active filters clearly visible,
#     AND I can remove individual filters by clicking the ‘x' button or clear all filters at once by clicking the 'Clear all filters’ button,
#     AND The search results update accordingly.

#     Scenario: 3 – No results found

#     GIVEN there are no records to display,
#     WHEN I view the search results area,
#     THEN I see an empty state that informs me no modifications exist for the search criteria. (RR-Receive amendment record – Figma)

#     Scenario : 4- Pagination

#     GIVEN the search has returned a large volume of results,
#     WHEN the user views the list of results,
#     THEN the default page size should be 20 records,
#     AND the pagination controls should be displayed at the bottom of the page.

#     Scenario: 4.1- The user is on the first page

#     GIVEN I am on the first page,
#     WHEN I view the paginated results,
#     THEN the ‘Previous’ button will be disabled and not visible First page pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page after the current page and the last page First page – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number Pagination with numbered labels – Pagination.

#     Scenario : 4.2 - The user is on the last page

#     GIVEN I am on the last page,
#     WHEN I view the paginated results,
#     THEN the ‘Next’ button will be disabled and not visible Last page pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page immediately before the current page and the first page Last page – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number Pagination with numbered labels – Pagination.

#     Scenario : 4.3 – The user selects a page number

#     GIVEN I identify which page I am on,
#     WHEN the page number is selected,
#     THEN the corresponding page should be displayed Number pagination,
#     AND the current page number should be visually highlighted to indicate the active page I am on,
#     AND the pagination should show at least one page immediately before and after the current page and the first and last pages Pagination with numbered labels – Pagination,
#     AND if there are any skipped pages then ellipses (…) will be used to replace the number. Pagination with numbered labels – Pagination.

#     Scenario: 4.4 – The user selects ‘Next'

#     GIVEN I can view the ‘Next’ link,
#     WHEN the ‘Next’ button is selected,
#     THEN the data on the next page should be displayed,
#     AND the current page number should be visually highlighted to indicate the active page I am on.

#     Scenario: 4.5 – The user selects ‘Previous’

# GIVEN I can view the ‘Previous’ link,
# WHEN I select the ‘Previous’ button,
# THEN the data on the previous page should be displayed,
# AND the current page number should be visually highlighted to indicate the active page I am on