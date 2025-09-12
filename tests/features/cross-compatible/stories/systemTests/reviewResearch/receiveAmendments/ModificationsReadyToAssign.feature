@WorkFlowCoordinator @ReceiveAmendments @ModificationsReadyToAssign @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    # Date_Submitted,Days_Since_Submission sort is failing
    @SortTasklistByColumn @rsp-4091 @fail
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
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |

    @ModificationsTasklistPaginationFirst @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the first page and navigate through each page by clicking page number or by clicking next link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the default page size should be 'twenty'
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method       |
            | Label_Texts     | clicking on page number |
            | Label_Texts     | clicking on next link   |

    @ModificationsTasklistPaginationLast @rsp-4040 @rsp-4309
    Scenario Outline: Verify pagination in Modification Ready to Assign page when user is on the last page and navigate through each page by clicking page number or by clicking Previous link
        Then I can see the '<Validation_Text>' ui labels on the modifications ready to assign page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Modifications_Tasklist_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Validation_Text | Navigation_Method         |
            | Label_Texts     | clicking on page number   |
            | Label_Texts     | clicking on previous link |

    @ModificationsTasklistRandomSelection @rsp-4105 @KNOWN-DEFECT-RSP-4971
    Scenario: Verify checkboxes are visible and accessible and also the modification records can be selected across pages
        When I confirm checkbox exists in every row across pages
        And I capture the page screenshot
        And I check random row and validate if the row is checked even after navigation
        And I capture the page screenshot

    @ModificationsTasklistSelectAllWithJs @rsp-4105 @jsEnabled
    Scenario: With JavaScript enabled, Verify if user selects the check all checkbox on the first page and confirm checkboxes are checked and status retained even after navigation
        When I select check all checkbox on the current page and validate all checkboxes are checked
        And I capture the page screenshot
        When I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
        And I confirm all checkboxes are 'checked'
        And I capture the page screenshot
        Then I can see a 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'

    @ModificationsTasklistSelectAllWithoutJs @rsp-4105 @jsDisabled
    Scenario: With JavaScript disabled, Verify user selects the check all checkbox on the first page and confirm checkboxes are unchecked and status retained even after navigation
        When JavaScript is disabled I select check all checkbox on the current page and validate all checkboxes are unchecked
        And I capture the page screenshot
        And I navigate by 'clicking on next link' within the Modifications Ready to assign page
        And I navigate by 'clicking on previous link' within the Modifications Ready to assign page
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
            | Date_Submitted        |
            | Days_Since_Submission |

    @ModificationsSelectAllAndSort @rsp-4105 @KNOWN-DEFECT-RSP-4976
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
            | Date_Submitted        |
            | Days_Since_Submission |

    @WFCAssignModificationSWR @rsp-4076 @rsp-4849
    Scenario Outline: Validate the workflow co-ordinator can assign a study-wide reviewer to a modification from the modifications ready to assign page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I select a study wide reviewer in the select a reviewer page using '<Study_Wide_Reviewer>'
        And I capture the page screenshot
        And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
        And I capture the page screenshot
        Then I can see the modifications assignment confirmation page for '<Study_Wide_Reviewer>'
        And I capture the page screenshot
        And  I click the 'Back_To_Tasklist' link on the 'Modifications_Assignment_Confirmation_Page'
        And I capture the page screenshot
        Then I can see the 'Modifications_Tasklist_Page'
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see previously assigned modification is no longer displayed in the modifications ready to assign table for '<Modification_Id>'

        Examples:
            | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                           |
            | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_One |
    # | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Two        |
    # | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Three_Four |

    # @NoAuth
    # UI issues:- Page heading is not matching/Guidance text is missing
    @StudyWideReviewer @SWRTasklist @rsp-4076 @rsp-4849 @fail @KNOWN-DEFECT-RSP-XXXX
    Scenario Outline: Validate the SWR Tasklist page after the workflow co-ordinator assigns a study-wide reviewer to a modification from the modifications ready to assign page
        # Then I logged out from the system
        # Then I capture the page screenshot
        # Given I have navigated to the 'SWR_My_Tasklist_Page' as 'Studywide_Reviewer'
        Given I have navigated to the 'SWR_My_Tasklist_Page'
        Then I capture the page screenshot
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'SWR_My_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the modifications assigned from WFC to SWR are now visible in my task list for '<Modification_Id>'

        Examples:
            | Valid_Iras_Id                       | Modification_Id                                                    |
            | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_All_Assigned_From_WFC_To_SWR |

    @ModificationsList @rsp-4076 @rsp-4849
    Scenario Outline: Validate whether all the selected modifications are displayed based on the 'Select a reviewer' page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I can see all the selected modifications on that page including details such as the short project title and the modification id
        And I capture the page screenshot

        Examples:
            | Valid_Iras_Id                       | Study_Wide_Reviewer             | Modification_Id                                |
            | Valid_Iras_Id_Ln_England_Pn_England | Study_Wide_Reviewer_HRA_England | Modification_Id_Ln_England_Pn_England_Five_Six |

    @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListActiveLeadNationEngland @rsp-4076 @rsp-4849
    Scenario Outline: Validate whether the active study-wide reviewers are displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
        Given I have navigated to the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the add a new user profile page
        When I fill the new user profile page using '<User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        Then I can see previously filled values in the new user profile page for '<User_Profile>' displayed on the check and create user profile page
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I can see the newly created user record should be present in the list for '<User_Profile>' with 'Active' status in the manage user page
        And I capture the page screenshot
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
        And I capture the page screenshot

        Examples:
            | User_Profile                                                       | Valid_Iras_Id                       | Modification_Id                                | Advanced_Filters_Users                                | Lead_Nation      | Availability  |
            | Valid_Data_In_All_Fields_Role_Studywide_Reviewer                   | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England          | Available     |
            | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another           | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Wales            | Not Available |
            | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer         | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Northern Ireland | Not Available |
            | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | Scotland         | Not Available |

    @SysAdminUser @StudyWideReviewerList @StudyWideReviewerListDisabledLeadNationEngland @rsp-4076 @rsp-4849
    Scenario Outline: Validate whether disabled study-wide reviewer is not displayed based on the lead nation of the selected modification and the corresponding review body(Lead nation - England)
        Given I have navigated to the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the add a new user profile page
        When I fill the new user profile page using '<User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        Then I can see previously filled values in the new user profile page for '<User_Profile>' displayed on the check and create user profile page
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the user profile page
        And I can see the 'Disable_Label_Texts' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I validate 'Disable_User_Profile_Labels' labels displayed in disable user profile confirmation page using the '<User_Profile>' details
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using 'Advanced_Filter_Role_Studywide_Reviewer_Status_Disabled'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<User_Profile>' user with 'DISABLED' status from the manage user page
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        And I can see newly created study-wide reviewer '<User_Profile>' of '<Lead_Nation>' is '<Availability>' in the dropdown based on the lead nation of the selected modification and the review body
        And I capture the page screenshot

        Examples:
            | User_Profile                                              | Valid_Iras_Id                       | Modification_Id                                | Advanced_Filters_Users                                | Lead_Nation | Availability  |
            | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Disabled | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six | Advanced_Filter_Role_Studywide_Reviewer_Status_Active | England     | Not Available |

    @BackLinkNavigation @RetainSelectedCheckboxes @rsp-4076 @rsp-4849 @KNOWN-DEFECT-RSP-5011  @fail
    Scenario Outline: Validate the workflow co-ordinator navigates to the modifications task list page from the 'Select a reviewer' page on clicking 'Back' button on 'Select a reviewer' page
        When I enter '<Valid_Iras_Id>' into the search field in the modifications ready to assign page
        And I click the 'Search' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        # Then I can now see the modifications ready to assign table contains the expected search results for '<Search_Input>'
        When I select modifications with ids as '<Modification_Id>' by clicking the checkbox in the modifications ready to assign page
        And I capture the page screenshot
        And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the 'Select_Study_Wide_Reviewer_Page'
        When I click the 'Back' link on the 'Select_Study_Wide_Reviewer_Page'
        And I capture the page screenshot
        Then I can see the 'Modifications_Tasklist_Page'
        And I can see previously selected modifications checkboxes are retained for '<Modification_Id>'
        And I capture the page screenshot

        Examples:
            | Valid_Iras_Id                       | Modification_Id                                |
            | Valid_Iras_Id_Ln_England_Pn_England | Modification_Id_Ln_England_Pn_England_Five_Six |