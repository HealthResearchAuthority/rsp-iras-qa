@PostApprovalPage @ApplicantUser @SystemTest @jsEnabled
Feature: Post Approval Page

    Background:
        Given I have navigated to the my research projects page
        And I can see the my research projects page
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        When I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        Then I can see the project identifiers page
        Then I fill the project identifiers page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        And I fill the chief investigator page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
        And I fill the research locations page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        Then I can see the project overview page
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot

    @rsp-4893 @ValidateNonReviewableModificationStatusesInDraftAndApproved
    Scenario Outline: Validate modification status transition from in draft to approved for non reviewable modification
        And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
        And I can see the select area of change page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        And I create '<Changes>' for the created modification
        When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
        Then I can see the project overview page
        And I capture the page screenshot
        Then I can see the modification progress saved successful message on project overview page
        Then I can see the modification status as 'Modification_Status_Indraft' on the post approval page
        And I click on the modification id hyperlink in the post approval tab
        And I can see the modifications details page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
        Then I can see the add sponsor reference page
        Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
        Then I can see the review all changes modifications page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
        Then I click the 'Submit_To_Regulator' button on the 'Modification_Sent_To_Sponsor_Page'
        Then I can see the project overview page
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I can see the modification status as 'Modification_Status_Approved' on the post approval page
        And I click on the modification id hyperlink in the post approval tab
        Then I can see the review all changes modifications page
        And I validate the status 'Modification_Status_Approved' is displayed on modifications page
        And I capture the page screenshot

        Examples:
            | Changes                    |
            | Change_To_Planned_End_Date |

    @rsp-4977 @ValidateSubmissionDatePostApprovalPage
    Scenario Outline: Validate submitted date and status field values for non reviewable modifications
        And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
        And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
        Then I validate submitted date field value for 'Modification_Status_Indraft' modifications and confirm 'In draft' status
        And I capture the page screenshot
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        Then I validate submitted date field value for 'Modification_Status_Approved' modifications and confirm 'Approved' status
        And I capture the page screenshot

    @rsp-4887 @VerifyValidSearchPostApproval
    #Vijay's modifications
    Scenario Outline: Verify the user is able to search the modifications with a valid search criteria
        And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I capture the page screenshot
        #And I can see the 'created' project details on project overview page for 'Valid_Data_All_Fields'#not required
        # check if you need 'I validate the project information labels using' step to set modification id
        #And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on the post approval page#not required
        And I enter '<Search_Queries>' into the search field for post approval page
        And I click the 'Search' button on the 'Search_Modifications_Page'
        Then I can now see the table of modifications contains the expected search results for '<Search_Queries>'
        And I capture the page screenshot

        Examples:
            | Search_Queries                     |
            | Full_Modification_ID               |
            | Partial_Modification_ID            |
            | Partial_Modification_ID_With_Slash |

    @rsp-4887 @VerifyNoResultsFoundInvalidSearchOnlyPostApproval
    Scenario: Verify the user can see no matching results found message on clicking search button with invalid modification id
        And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
        When I fill the search input for searching 'modifications in post approval' with '<Search_Input>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Post_Approval_Page'
        Then the no search results found message is displayed
        And I capture the page screenshot

        Examples:
            | Search_Input                         |
            | Non_Existant_Data                    |
            | Special_Characters_Data              |
            | Leading_White_Space_Modification_ID  |
            | Trailing_White_Space_Modification_ID |

    @rsp-4887 @ApplyFiltersAndSearchPostApproval
    Scenario Outline: Verify the user is able to filter modifications using a combination of advanced filters and search criteria
        And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I capture the page screenshot
        And I enter '<Search_Queries>' into the search field for post approval page
        And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
        And I capture the page screenshot
        And I enter values in the '<Advanced_Filters>' of the post approval page
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
        And I can see the results matching the search '<Search_Queries>' and filter criteria '<Advanced_Filters>' for post approval page
        And I capture the page screenshot

        Examples:
            | Search_Queries                     | Advanced_Filters                                    |
            | Partial_Modification_ID_With_Slash | Advanced_Filter_Status_Only                         |
            | Partial_Modification_ID            | Advanced_Filter_All_Fields                          |
            | Empty_Search_Data                  | Advanced_Filter_Submitted_Date_Field_Only           |
            | Empty_Search_Data                  | Advanced_Filter_Modification_Type_Only              |
            | Empty_Search_Data                  | Advanced_Filter_Submitted_From_Date_Field_Only      |
            | Empty_Search_Data                  | Advanced_Filter_Submitted_To_Future_Date_Field_Only |


    @rsp-4887 @DateSubmittedErrorValidationPostApproval
    Scenario Outline: Verify that correct validation is in place for the date submitted filter
        # When I navigate to the project overview page of the 'Test_Project' project
        # When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I create 'Multiple_Modifications_In_Draft' and click on save for later on the select area of change page
        # And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        # And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        # And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        # And I create 'Change_To_Planned_End_Date' modification with 'Sponsor_reference_Details' and click on 'Submit_To_Regulator'
        And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
        And I capture the page screenshot
        When I enter values in the '<Advanced_Filters>' of the post approval page
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
        And I capture the page screenshot
        And I validate '<Field_And_Summary_Error_Message>' displayed on 'Post_Approval_Page' in advanced filters

        Examples:
            | Advanced_Filters                  | Field_And_Summary_Error_Message                       |
            | Invalid_Date_Range_To_Before_From | Post_Approval_Invalid_Date_Range_To_Before_From_Error |
            | Invalid_Date_From                 | Post_Approval_Invalid_Date_From_Error                 |
            | Invalid_Date_To                   | Post_Approval_Invalid_Date_To_Error                   |


    @rsp-4887 @ValidateClearAllFiltersPostApproval
    Scenario: Validate clear all filters removes all active filters in the post approval page
        And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
        When I enter values in the '<Advanced_Filters>' of the post approval page
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
        And I capture the page screenshot
        And I click the 'Clear_All_Filters' link on the 'Post_Approval_Page'
        And I capture the page screenshot
        And I 'cannot' see active filters displayed

        Examples:
            | Advanced_Filters                          |
            | Advanced_Filter_All_Fields                |
            | Advanced_Filter_Submitted_Date_Field_Only |
            | Advanced_Filter_Status_Only               |

    @rsp-4887 @RemoveAllActiveFiltersOneByOne
    Scenario Outline: Verify the user can remove all the selected filters one by one
        And I click the 'Advanced_Filters' button on the 'Post_Approval_Page'
        When I enter values in the '<Advanced_Filters>' of the post approval page
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Post_Approval_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Post_Approval_Page'
        And I capture the page screenshot
        And 'I remove the selected filters from' active filters '<Advanced_Filters_Remove>' in the 'Post_Approval_Page'
        And I capture the page screenshot
        And I 'cannot' see active filters displayed

        Examples:
            | Advanced_Filters                          | Advanced_Filters_Remove                   |
            | Advanced_Filter_All_Fields                | Advanced_Filter_All_Fields                |
            | Advanced_Filter_Submitted_Date_Field_Only | Advanced_Filter_Submitted_Date_Field_Only |
