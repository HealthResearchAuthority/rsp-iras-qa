@UserAdministration @ManageReviewBodies @adminUser @SystemTest @AuditHistoryReviewBody @rsp-2927
Feature: User Administration: Manage Review Bodies - View audit history for review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @VerifyAuditHistoryCreateReviewBody
    Scenario Outline: Verify the user can view the audit history after creating a review body
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
        And I capture the current time
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the newly created review body
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the selected review body for '<Add_Review_Body>'
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body 'created' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body                    | Validation_Text | Audit_History      |
            | Valid_Data_In_All_Fields           | header_Texts    | Create_Review_Body |
            | Valid_Data_In_All_Mandatory_Fields | header_Texts    | Create_Review_Body |

    @VerifyAuditHistoryDisableReviewBody
    Scenario Outline: Verify the user can view the audit history after disabling a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I click the view edit link for the 'disabled' review body
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body 'disabled' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Add_Review_Body          | Validation_Text | Audit_History       |
            | Valid_Data_In_All_Fields | header_Texts    | Disable_Review_Body |

    @VerifyAuditHistoryEnableReviewBody
    Scenario Outline: Verify the user can view the audit history after enabling a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'disabled'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        Then I click the view edit link for the 'enabled' review body
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for the review body 'enabled' event for '<Add_Review_Body>' with '<Audit_History>'

        Examples:
            | Validation_Text | Audit_History      |
            | header_Texts    | Enable_Review_Body |

    @VerifyAuditHistoryEditReviewBodyOrgName
    Scenario Outline: Verify the user can view the audit history after editing organization name of a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for organisation name field
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for 'Organisation_Name' edited event with '<Audit_History>'

        Examples:
            | Field_Name        | Edit_Review_Body                     | Validation_Text | Audit_History                      |
            | Organisation_Name | Valid_Data_Organisation_Name_Another | header_Texts    | Edit_Review_Body_Organisation_Name |

    @VerifyAuditHistoryEditReviewBodyCountry
    Scenario Outline: Verify the user can view the audit history after editing country of a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for country field
        And I now see the review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for 'Country' edited event with '<Audit_History>'

        Examples:
            | Field_Name | Edit_Review_Body           | Validation_Text | Audit_History            |
            | Country    | Valid_Data_Country_Another | header_Texts    | Edit_Review_Body_Country |

    @VerifyAuditHistoryEditReviewBodyEmail
    Scenario Outline: Verify the user can view the audit history after editing email address of a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for email address field
        And I now see the review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for 'Email_Address' edited event with '<Audit_History>'

        Examples:
            | Field_Name    | Edit_Review_Body         | Validation_Text | Audit_History                  |
            | Email_Address | Valid_Data_Email_Another | header_Texts    | Edit_Review_Body_Email_Address |

    @VerifyAuditHistoryEditReviewBodyDescription
    Scenario Outline: Verify the user can view the audit history after editing description of a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>' for field '<Field_Name>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for description field
        And I can see the review body profile page heading
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for 'Description' edited event with '<Audit_History>'

        Examples:
            | Field_Name  | Edit_Review_Body               | Validation_Text | Audit_History                |
            | Description | Valid_Data_Description_Another | header_Texts    | Edit_Review_Body_Description |

    @VerifyAuditHistoryEditReviewBodyAllFields
    Scenario Outline: Verify the user can view the audit history after editing all the fields of a review body
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name_One>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        And I capture the current time
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for organisation name field
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for country field
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for email address field
        Then I now see the review body profile page with the updated '<Edit_Review_Body>' for description field
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the '<Validation_Text>' ui labels on the audit history page of the review body
        And I can see the audit history for all the fields edited event with '<Audit_History>'

        Examples:
            | Field_Name_One    | Field_Name_Two | Field_Name_Three | Field_Name_Four | Edit_Review_Body           | Validation_Text | Audit_History               |
            | Organisation_Name | Country        | Email_Address    | Description     | Valid_Data_Edit_All_Fields | header_Texts    | Edit_Review_Body_All_Fields |


    @VerifyAuditHistoryDefaultSort
    Scenario: Verify the default sort of the audit history should be the most recent entry first based on date and time
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'Disable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        Then I click the view edit link for the 'disabled' review body
        And I can see the review body profile page
        And I click the 'Enable_Review_Body' button on the 'Review_Body_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        Then I click the view edit link for the 'enabled' review body
        And I can see the review body profile page
        And I click the change link against 'Organisation_Name' on the review body profile page
        And I can see the edit review body page
        Then I now see the review body profile page with the updated 'Valid_Data_Organisation_Name_Another' for organisation name field
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        Then I now see the review body profile page with the updated 'Valid_Data_Organisation_Name_Another' for organisation name field
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I can see the default sort should be the most recent entry first based on date and time

    @VerifyAuditHistoryBackLinkNavigation
    Scenario: Verify the user can navigate from audit History page of the review body by clicking 'Back' link
        And I select a 'QA Automation' Review Body to View and Edit which is 'active'
        And I can see the review body profile page
        And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
        Then I can see the audit history page of the review body
        And I capture the page screenshot
        And I click the 'Back' link on the 'Review_Body_Audit_History_Page'
        And I capture the page screenshot
        And I can see the review body profile page


# Points to note:
# Validate date time format.>>will change later
# Validate audit history for each review body when the the system admin user email is updated.- Suitable for manual validation
# Out of scope now >>need to cover later when the feature is developed[User added to review body/User removed from review body]
# User added to review body- [User email address] was added to [Organisation name]
# User removed from review body-[User email address] was removed from [Organisation name]