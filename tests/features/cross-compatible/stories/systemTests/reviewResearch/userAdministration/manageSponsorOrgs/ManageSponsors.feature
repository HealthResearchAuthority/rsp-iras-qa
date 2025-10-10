@SysAdminUser @SystemTest @UserAdministration @ManageSponsorOrgs @BackStage
Feature: User Administration: Manage Sponsor Organisations

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'

    @ViewListOfSponsorOrgs @rsp-5229 @rsp-5230  @jsEnabled @Test
    Scenario Outline: Verify the user can add a sponsor organisation from manage sponsor organisation page and view the list of sponsor organisation in alphabetical order of organisation name
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page for '<Setup_New_Sponsor_Organisation>'
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Examples:
            | Setup_New_Sponsor_Organisation | Status_Enabled |
            | Sponsor_Organisation_One       | Enabled        |
    # | Sponsor_Organisation_Two         | Enabled        |
    # | Sponsor_Organisation_Three       | Enabled        |
    # | Sponsor_Organisation_Four        | Enabled        |
    # | Sponsor_Organisation_Five        | Enabled        |
    # | Sponsor_Organisation_Six         | Enabled        |
    # | Sponsor_Organisation_Seven       | Enabled        |
    # | Sponsor_Organisation_Eight       | Enabled        |
    # | Sponsor_Organisation_Nine        | Enabled        |
    # | Sponsor_Organisation_Ten         | Enabled        |
    # | Sponsor_Organisation_Eleven      | Enabled        |
    # | Sponsor_Organisation_Twelve      | Enabled        |
    # | Sponsor_Organisation_Thirteen    | Enabled        |
    # | Sponsor_Organisation_Fourteen    | Enabled        |
    # | Sponsor_Organisation_Fifteen     | Enabled        |
    # | Sponsor_Organisation_Sixteen     | Enabled        |
    # | Sponsor_Organisation_Seventeen   | Enabled        |
    # | Sponsor_Organisation_Eighteen    | Enabled        |
    # | Sponsor_Organisation_Nineteen    | Enabled        |
    # | Sponsor_Organisation_Twenty      | Enabled        |
    # | Sponsor_Organisation_TwentyOne   | Enabled        |
    # | Sponsor_Organisation_TwentyTwo   | Enabled        |
    # | Sponsor_Organisation_TwentyThree | Enabled        |
    # | Sponsor_Organisation_TwentyFour  | Enabled        |

    @verifyManageSponsorOrgsPageBackButtonFlow @rsp-5229
    Scenario: Verify the user can navigate from 'Manage sponsor organisations' page by clicking 'Back' button
        And I click the 'Back' link on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'System_Administration_Page'

    @CancelFromCheckSetupSponsorOrg @rsp-5229 @rsp-5230
    Scenario Outline: Verify the user can cancel from check and set up a sponsor organisation profile page and navigate back to setup a new sponsor organisation page
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page for '<Setup_New_Sponsor_Organisation>'
        When I click the 'Cancel' button on the 'Check_Setup_Sponsor_Organisation_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        Examples:
            | Setup_New_Sponsor_Organisation  | Status_Enabled |
            | Sponsor_Organisation_TwentyFive | Enabled        |

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
        Then the system displays review bodies matching the search criteria
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
        Then the system displays review bodies matching the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query           |
            | Existing_QA_Data_One   |
            | Existing_QA_Data_Two   |
            | Existing_QA_Data_Three |

    @EndToEndFlow @rsp-5229 @rsp-5230
    Scenario Outline: Verify the user can add a sponsor organisation from manage sponsor organisation page
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page for '<Setup_New_Sponsor_Organisation>'
        When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        Then I can see the sponsor organisation added successful message on manage sponsor organisation page
        And I capture the page screenshot
        And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
        And I capture the page screenshot
        When I enter 'name of the newly added sponsor organisation' into the search field
        And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
        And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
        And I capture the page screenshot
        Then I click the view edit link of the newly added sponsor organisation
        And I capture the page screenshot
        And I can see the sponsor organisation profile page
        # validate review body profile page with the created review body
        And I now see the review body profile page with the created '<Add_Review_Body>'
        And I capture the page screenshot
        # disable review body
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        # find the disabled review body in the list with 'disabled' status
        When I enter 'name of the new review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I can see the 'newly created review body' should be present in the list with '<Status_Disabled>' status in the manage review bodies page
        Then I click the view edit link
        And I capture the page screenshot
        # audit history
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the audit history for the review body 'disabled' event for '<Add_Review_Body>' with '<Audit_History>'
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        # user list page of the review body
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        And I can see no users in the review body with a message to add users to the review body
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message in the user list page of the review body

        Examples:
            | Setup_New_Sponsor_Organisation    | Audit_History       | Status_Enabled | Status_Disabled |
            | Sponsor_Organisation_Chesterfield | Disable_Review_Body | Enabled        | Disabled        |



    #   When I click the 'Cancel' button on the 'Check_Setup_Sponsor_Organisation_Page'

    #

    # sponsor org search- JS enabled and disabled scenarios to be added later-search results, no results found and blank search scenarios

    # Validate sponsor organisation search- when JavaScript is enabled

    # Scenario 1:- User types less than minimum 3 characters
    # Scenario 2:- User types 3 or more characters
    # Scenario 3:- User searches for a sponsor organisation which doesn't exists-This sponsor organisation does not exist
    # Scenario 4:- User searches for a sponsor organisation which has already been set up and exists in the system,-A sponsor organisation with this name already exists
    # Scenario 4:- User types leading and trailing spaces with minimum 3 characters
    # Scenario 5:- User types special characters
    # Scenario 6:- User types numeric characters
    # Scenario 7:- User types a combination of alphanumeric and special characters

    # Validate sponsor organisation search- when JavaScript is disabled

    # no results found scenario to be added later for manage sponsor orgs page

    # disable sponsor org and enable sponsor org scenarios to be added later

    # sort on click of column headers to be added later (default sort is alphabetical order of org name - ascending and on click of org name header - descending and ascending)
    # search- sceanrios to be added later (search with org name, search with part of org name, search with case variations of org name, search with leading and trailing spaces of org name, search with special characters in org name, search with numeric characters in org name)

    @RegressionTestVerifyEnableAndEditReviewBodyAuditHistory @KNOWN-ISSUE-RSP-5003 @KNOWN-DEFECT-RSP-5004
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Disabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        # enable review body
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with '<Status_Enabled>' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        # edit review body
        When I click the change link against '<Field_Name_One>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time for 'Audit_History_Review_Body_Page'
        # validate edited data in review body profile page
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_One>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Two>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Three>'
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for field '<Field_Name_Four>'
        And I capture the page screenshot
        # audit history
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        # audit history sorting
        And I can see the default sort should be the most recent entry first based on date and time
        And I can see the audit history for all the fields edited event with '<Audit_History>'

        Examples:
            | Add_Review_Body          | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Edit_Review_Body           | Audit_History               | Status_Enabled | Status_Disabled |
            | Valid_Data_In_All_Fields | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_Edit_All_Fields | Edit_Review_Body_All_Fields | Enabled        | Disabled        |

    @RegressionTestVerifyBackAndChangeLinkNavigationManageReviewBodies
    Scenario Outline: Verify the user can navigate by clicking 'Back' link and 'Change' link from review body profile page and edit review body page and audit history page
        Verify the user can view the user list page of any selected review body and it is sorted by default in the alphabetical order of the 'First Name'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name_Two>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        And I click the '<Navigation_Link>' link on the 'Edit_Review_Body_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        When I click the change link against '<Field_Name_Three>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        And I click the '<Navigation_Link>' link on the 'Edit_Review_Body_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        When I click the change link against '<Field_Name_Four>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        And I click the '<Navigation_Link>' link on the 'Edit_Review_Body_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I click the '<Navigation_Link>' link on the 'Review_Body_Audit_History_Page'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the '<Navigation_Link>' link on the 'Review_Body_Profile_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I click the '<Navigation_Link>' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'System_Administration_Page'
        Then I capture the page screenshot
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        When I enter 'name of the previously used review body' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I can see the 'previously used review body' should be present in the list with '<Status_Enabled>' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the user list page of the review body
        And I capture the page screenshot
        And I can see the user list of the selected review body is sorted by default in the alphabetical order of the 'First Name'

        Examples:
            | Field_Name_Two | Field_Name_Three | Field_Name_Four | Navigation_Link | Status_Enabled | Status_Disabled |
            | Country        | Email_Address    | Description     | Back            | Enabled        | Disabled        |

    @RegressionTestVerifyBackAndChangeLinksCreateAndCheckCreateReviewBody
    Scenario Outline: Verify the user can navigate via the change links and back links
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        And I click the 'Back' link on the 'Create_Review_Body_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the change link against '<Field_Name_One>' on the check review body page
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the change link against '<Field_Name_Two>' on the check review body page
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the change link against '<Field_Name_Three>' on the check review body page
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the change link against '<Field_Name_Four>' on the check review body page
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the 'Back' link on the 'Check_Create_Review_Body_Page'
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I fill the new review body page using '<Add_Another_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Another_Review_Body>'
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I can see the review body for '<Add_Another_Review_Body>' is present in the list with '<Status_Enabled>' status
        And I capture the page screenshot

        Examples:
            | Add_Review_Body          | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Add_Another_Review_Body          | Status_Enabled | Status_Disabled |
            | Valid_Data_In_All_Fields | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_In_All_Fields_Another | Enabled        | Disabled        |


    @RegressionTestVerifyValidReviewBodyCharacterLimits
    Scenario Outline: Field validation passes with minimum and maximum characters in organisation name and description
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                              |
            | Organisation_Name_Field_Min_Data             |
            | Organisation_Name_Field_Max_Data             |
            | Organisation_Name_Field_between_Min_Max_Data |
            | Description_Field_Min_Data                   |
            | Description_Field_Max_Data                   |
            | Description_Field_between_Min_Max_Data       |

    @RegressionTestVerifyValidationErrors
    Scenario Outline: When min/max character field validation fails correct error messages display
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_Review_Body_Page'
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                                      | Field_And_Summary_Error_Message                              |
            | Missing_Data_Organisation_Name_Field                 | Mandatory_Field_Organisation_Name_Error                      |
            | Missing_Data_Country_Field                           | Mandatory_Field_Country_Error                                |
            | Missing_Data_Email_Address_Field                     | Mandatory_Field_Email_Address_Error                          |
            | Missing_Data_All_Fields                              | All_Mandatory_Field_Errors                                   |
            | Missing_Data_All_Mandatory_Fields                    | All_Mandatory_Field_Errors                                   |
            | Invalid_Data_Organisation_Name_Field                 | Max_Chars_Organisation_Name_Error                            |
            | Invalid_Data_Description_Field                       | Max_Description_Words_Error                                  |
            | Incorrect_Format_Invalid_Character_Limit_Email_Field | Incorrect_Format_Invalid_Character_Limit_Email_Address_Error |

    @RegressionTestUserListReviewBodyNoResultsFoundRemoveUser
    Scenario Outline: Verify the user can search and remove existing user of the selected review body and navigate to manage users page when no results found in the search for removed user
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the user list page of the review body
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message in the user list page of the review body
        When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Users_Page'
        And I search and click on view edit link for the removed user from the review body in the manage user page
        Then I can see the user profile page of the removed user from the review body
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |


    @RegressionTestUserListReviewBodyManageUsersLink
    Scenario Outline: Verify the user can search and remove existing user of the selected review body and repeat the process with remove another user from the review body link
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the user list page of the review body
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message in the user list page of the review body
        When I click the 'Manage_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Users_Page'
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |

    @RegressionTestUserListReviewBodyBackToReviewBodyUserListAfterRemoveUser
    Scenario Outline: Verify the user can search and remove the user from the selected review body and navigate to review body user list page when no results found for the removed user
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
        And I capture the page screenshot
        And I enter an input into the search field to search for the removed user of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays no results found message in the user list page of the review body
        When I click the 'Back_To_Users' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |


    @RegressionTestUserListReviewBodyBackToManageReviewBodiesRemoveUser
    Scenario Outline: Verify the user can search and remove the existing user from the selected review body and navigate to manage review bodies page from the confirmation page
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
        And I capture the page screenshot
        And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |

    @RegressionTestUserListReviewBodyBackToReviewBodyUserListCheckRemoveUser
    Scenario Outline: Verify the user can navigate to user list page of the review body from check and remove user profile page using back link
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        When I enter the 'Email_Address' of the 'last' user shown on the current review body users list, into the search field
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
        Then I can see the user list page of the review body
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |

    @RegressionTestUserListReviewBodyRemoveUserNoSearch
    Scenario Outline: Verify the user can navigate to user list page of the review body and remove any user from the review body without using search
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is '<Status_Enabled>'
        And I capture the page screenshot
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the review body
        And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
        When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
        And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
        And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
        And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
        Then I can see the user list page of the review body
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        When I click the 'Remove' link on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then I can see the check and remove user profile page
        And I click the 'Back' link on the 'Check_Remove_User_Profile_Page'
        Then I can see the user list page of the review body
        Examples:
            | Status_Enabled | Status_Disabled |
            | Enabled        | Disabled        |