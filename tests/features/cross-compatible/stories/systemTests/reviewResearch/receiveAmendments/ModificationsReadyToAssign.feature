@ReceiveAmendments @ModificationsReadyToAssign @ApplicantUser @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    @SortTasklistByColumn @rsp-4091 @KNOWN-DEFECT-RSP-4305
    Scenario: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Modification_Id       | modification id       | ascending    | descending     |
            | Short_Project_Title   | short project title   | ascending    | descending     |
            | Modification_Type     | modification type     | ascending    | descending     |
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |

    @ModificationsTasklistPagination @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be twenty
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate the first few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method       |
            | Label_Texts     | clicking on page number |
            | Label_Texts     | clicking on next link   |

    @ModificationsTasklistPagination @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate the last few pages by '<Navigation_Method>' to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method         |
            | Label_Texts     | clicking on page number   |
            | Label_Texts     | clicking on previous link |

    @ModificationsTasklistRandomSelection @rsp-4105
    Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
        When I confirm checkbox exists in every row across all pages
        And I capture the page screenshot
        And I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot

    @ModificationsTasklistSelectAll @rsp-4105 @jsEnabled
    Scenario: With jsEnabled, Verify if user selects the check all checkbox on the first couple of pages and confirm all checkboxes are checked and retained even after navigation
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I navigate by 'clicking on next link' within the Modifications Ready to assign page
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'checked'
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I capture the page screenshot
        Then I can see a 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'

    @ModificationsTasklistSelectAll @rsp-4105 @jsDisabled @abc
    Scenario: With jsDisabled, Verify user selects the check all checkbox on the first couple of pages and confirm all checkboxes are unchecked and retained even after navigation
        When jsDisabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        When jsDisabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Then I can see a 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'

    @ModificationsRandomSelectionAndSort @rsp-4105
    Scenario: Verify user selects few checkboxes on the first page, then applying sort resets all the checkboxes
        When I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sort_Button           |
            | Modification_Id       |
            | Short_Project_Title   |
            | Modification_Type     |
            | Date_Submitted        |
            | Days_Since_Submission |

    @ModificationsSelectAllAndSort @rsp-4105
    Scenario: Verify user selects check all on the first page, then applying sort resets all the checkboxes
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I confirm all checkboxes are 'unchecked'
        And I capture the page screenshot
        Examples:
            | Sort_Button           |
            | Modification_Id       |
            | Short_Project_Title   |
            | Modification_Type     |
            | Date_Submitted        |
            | Days_Since_Submission |



