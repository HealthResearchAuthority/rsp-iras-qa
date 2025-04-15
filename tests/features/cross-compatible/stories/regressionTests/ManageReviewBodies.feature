@RegressionManageReviewBodies @adminUser @Regression
Feature: User Administration: Manage Review Bodies

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @RegressionTestVerifyCreateAndDisableReviewBodyAuditHistory
    Scenario Outline: Verify the user can view the audit history after disabling a newly created review body
        # create review body from manage review body page
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I capture the page screenshot
        Then I can see the check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        And I capture the page screenshot
        # navigate to add review body page from confirmation page by clicking 'add another review body' link
        When I click the 'Add_Another_Review_Body' link on the 'Create_Review_Body_Confirmation_Page'
        And I capture the page screenshot
        Then I can see the 'Create_Review_Body_Page'
        # back link navigation from add a review body page
        And I click the 'Back' link on the 'Create_Review_Body_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Review_Bodies_Page'
        # alphabetical sorting in manage review body page
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I capture the page screenshot
        # find the newly created review body in the list with 'active' status
        Then I can see the review body for '<Add_Review_Body>' is present in the list
        And I capture the page screenshot
        And I can see the status of the review body is 'ACTIVE'
        Then I click the view edit link for the newly created review body
        And I capture the page screenshot
        And I can see the review body profile page
        # validate review body profile page with the created review body
        And I now see the review body profile page with the created '<Add_Review_Body>'
        And I capture the page screenshot
        # disable review body
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the 'disabled' review body
        And I capture the page screenshot
        # audit history
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' labels on the audit history page of the review body
        And I can see the audit history for the review body 'disabled' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body          | Validation_Text           | Audit_History       |
            | Valid_Data_In_All_Fields | Review_Body_Audit_History | Disable_Review_Body |

    @RegressionTestVerifyEnableAndEditReviewBodyAuditHistory
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'disabled'
        And I can see the review body profile page
        And I capture the page screenshot
        # enable review body
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the 'enabled' review body
        And I can see the review body profile page
        And I capture the page screenshot
        # edit review body
        When I click the change link against '<Field_Name_One>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
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
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        # audit history sorting
        And I can see the default sort should be the most recent entry first based on date and time
        And I can see the audit history for all the fields edited event with '<Audit_History>'

        Examples:
            | Add_Review_Body          | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Edit_Review_Body           | Validation_Text | Audit_History               |
            | Valid_Data_In_All_Fields | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_Edit_All_Fields | header_Texts    | Edit_Review_Body_All_Fields |

    @RegressionTestVerifyBackAndChangeLinkNavigationManageReviewBodies
    Scenario Outline: Verify the user can navigate by clicking 'Back' link and 'Change' link from review body profile page and edit review body page and audit history page
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
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

        Examples:
            | Field_Name_Two | Field_Name_Three | Field_Name_Four | Navigation_Link |
            | Country        | Email_Address    | Description     | Back            |

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
        And I click the 'Back' button on the 'Check_Create_Review_Body_Page'
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
        Then I can see the review body for '<Add_Another_Review_Body>' is present in the list
        And I capture the page screenshot
        And I can see the status of the review body is '<Status>'

        Examples:
            | Add_Review_Body          | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Add_Another_Review_Body          | Status  |
            | Valid_Data_In_All_Fields | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_In_All_Fields_Another | enabled |


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
        Then I can see the '<Error>' validation message for '<Field_Name>' on the Add new review body page
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                      | Error           | Field_Name              |
            | Missing_Data_Organisation_Name_Field | Mandatory_Field | Organisation_Name_Error |
            | Missing_Data_Country_Field           | Select_Country  | Country_Error           |
            | Missing_Data_Email_Address_Field     | Mandatory_Field | Email_Address_Error     |
            | Missing_Data_All_Fields              | Mandatory_Field | All_Mandatory_Fields    |
            | Missing_Data_All_Mandatory_Fields    | Mandatory_Field | All_Mandatory_Fields    |
            | Invalid_Data_Organisation_Name_Field | Max_Org_Chars   | Organisation_Name_Error |
            | Invalid_Data_Description_Field       | Max_Words       | Description_Error       |
            | Invalid_Character_Limit              | Max_Email_Chars | Email_Address_Error     |
            | Incorrect_Email_Format               | Email_Format    | Email_Address_Error     |
            | Invalid_Email_Data_Double_Dot        | Email_Format    | Email_Address_Error     |
