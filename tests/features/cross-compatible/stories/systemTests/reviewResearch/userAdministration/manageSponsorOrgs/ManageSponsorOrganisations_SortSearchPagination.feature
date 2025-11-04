@SysAdminUser @SystemTest @UserAdministration @ManageSponsorOrgs @SortSearchSponsorOrgs @BackStage
Feature: User Administration: Manage Sponsor Organisations- Sort, search and pagination of sponsor organisations list

    Background:
        Given I have navigated to the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'manage sponsor organisations' list sorted by 'ascending' order of the 'organisation name' on the 'first' page

    @sortSponsorOrgListByColumn @rsp-5229
    Scenario Outline: Verify the user is able to sort the manage sponsor organisations list by ascending and descending order for each table column
        When I click the '<Sort_Button>' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'manage sponsor organisations' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'first' page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I can see the 'manage sponsor organisations' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'last' page
        When I click the '<Sort_Button>' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the 'manage sponsor organisations' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'first' page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I can see the 'manage sponsor organisations' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'last' page

        Examples:
            | Sort_Button | Sort_Field        | Initial_Sort | Secondary_Sort |
            | Org_Name    | organisation name | descending   | ascending      |
            | Country     | country           | ascending    | descending     |
            | Status      | status            | ascending    | descending     |

    @rsp-5229 @ManageSponsorOrgsPagination @ManageSponsorOrgsPaginationFirstPage @ManageSponsorOrgsPaginationPageNumber @ManageSponsorOrgsPaginationNextLinkClick
    Scenario: Verify pagination in manage sponsor organisation page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I sequentially navigate through each 'Manage_Sponsor_Organisations_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
            | Navigation_Method |
            | page number       |
            | next link         |

    @rsp-5229 @ManageSponsorOrgsPagination @ManageSponsorOrgsPaginationLastPage @ManageSponsorOrgsPaginationPageNumber @ManageSponsorOrgsPaginationPreviousLinkClick
    Scenario: Verify pagination in manage sponsor organisation page when user is on the last page and navigate through each page by clicking page number or by by clicking on previous link
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Manage_Sponsor_Organisations_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
            | Navigation_Method |
            | page number       |
            | previous link     |

    @rsp-5229 @ManageSponsorOrgsSearchResultsFound
    Scenario Outline: Verify search results in manage sponsor organisation page when user search by first and last organisation names
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I capture the page screenshot
        Examples:
            | Field_Name        | Position |
            | Organisation_Name | First    |
            | Organisation_Name | Last     |

    @rsp-5229 @ManageSponsorOrgsSearchNoResultsFound
    Scenario Outline: Verify no results found message will be presented to the user in manage sponsor organisation page if there is no sponsor organisation on the system that matches the search criteria
        When I fill the search input for searching 'sponsor organisations' with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the no search results found message is displayed
        And I capture the page screenshot
        Examples:
            | Search_Query      |
            | Non_Existant_Data |

    @rsp-5229 @ManageSponsorOrgsSearchResultsFound
    Scenario Outline: Verify results are displayed when the user searches with existing sponsor organisation details
        When I fill the search input for searching 'sponsor organisations' with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then the system displays 'sponsor organisations' matching the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query           |
            | Existing_QA_Data_One   |
            | Existing_QA_Data_Two   |
            | Existing_QA_Data_Three |
