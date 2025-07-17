@UserAdministration @ViewReviewBodies @SysAdminUser @SystemTest @rsp-2571 @rsp-2569
Feature: User Administration: Manage Review Bodies list and view review bodies profile details

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @viewListOfReviewBodies
    Scenario Outline: Verify the user is able to view list of review bodies in alphabetical order of Organisation Name
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
        And I capture the page screenshot
        When I enter 'name of the new review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot

        Examples:
            | Add_Review_Body          | Status  |
            | Valid_Data_In_All_Fields | Enabled |

    @verifyManageReviewBodiesPageBackButtonFlow
    Scenario: Verify the user can navigate from 'Manage review bodies' page by clicking 'Back' button
        And I click the 'Back' link on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I can see the 'System_Administration_Page'


    @viewEnabledDisabledReviewBodies
    Scenario Outline: Verify that user is able to view active and disabled review bodies
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I select a 'QA Automation' review Body to View and Edit which is '<Status>'
        And I capture the page screenshot
        Then I can see the review body profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'

        Examples:
            | Review_Body_Name                  | Status   |
            | Valid_Data_In_All_Fields          | Enabled  |
            | Valid_Data_In_All_Fields_Disabled | Disabled |


    @viewNewReviewBody
    Scenario Outline: Verify that user is able to view review body details with blank last updated date for the new record
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        When I fill the new review body page using '<Review_Body_Name>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Review_Body_Name>'
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Review_Body_Name>'
        And I capture the page screenshot
        When I have navigated to the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'
        When I enter 'name of the new review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'newly created review body' should be present in the list with '<Status_Enabled>' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        Then I can see the last updated date field is blank

        Examples:
            | Review_Body_Name         | Status  |
            | Valid_Data_In_All_Fields | Enabled |

    @rsp-3523 @ManageReviewBodiesPagination @ManageReviewBodiesPaginationFirstPage @ManageReviewBodiesPaginationPageNumber @ManageReviewBodiesPaginationNextLinkClick
    Scenario: Verify pagination in manage review bodies page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
            | Navigation_Method       |
            | clicking on page number |
            | clicking on next link   |

    @rsp-3523 @ManageReviewBodiesPagination @ManageReviewBodiesPaginationLastPage @ManageReviewBodiesPaginationPageNumber @ManageReviewBodiesPaginationPreviousLinkClick
    Scenario: Verify pagination in manage review bodies page when user is on the last page and navigate through each page by clicking page number or by by clicking on previous link
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each page by '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
            | Navigation_Method         |
            | clicking on page number   |
            | clicking on previous link |

    @rsp-3459 @ManageReviewBodiesSearchResultsFound @Smoke @skip
    Scenario Outline: Verify search results in manage review bodies page when user search by first and last organisation names
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then the system displays review bodies matching the search criteria
        And I capture the page screenshot
        Examples:
            | Field_Name        | Position |
            | Organisation_Name | First    |
            | Organisation_Name | Last     |

    @rsp-3459 @ManageReviewBodiesSearchNoResultsFound
    Scenario Outline: Verify no results found message will be presented to the user in manage review bodies page if there is no review body on the system that matches the search criteria
        When I fill the search input for searching 'review bodies' with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then the system displays no results found message if there is no 'review body' on the system that matches the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query      |
            | Non_Existant_Data |

    @rsp-3459 @ManageReviewBodiesSearchResultsFound
    Scenario Outline: Verify results are displayed when the user searches with existing review body details
        When I fill the search input for searching 'review bodies' with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then the system displays review bodies matching the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query           |
            | Existing_QA_Data_One   |
            | Existing_QA_Data_Two   |
            | Existing_QA_Data_Three |

    # out of scope for now
    @rsp-3459 @ManageReviewBodiesSearchLeadingAndTrailingWhiteSpaces @fail @skip
    Scenario Outline: Verify search results in manage review bodies page when the search keyword contains leading and trailing white spaces
        When I fill the search input for searching 'review bodies' with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then the system displays review bodies matching the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query                          |
            | Leading_White_Space_Data              |
            | Leading_And_Trailing_White_Space_Data |
            | Trailing_White_Space_Data             |
