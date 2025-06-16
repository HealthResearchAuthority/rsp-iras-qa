@UserAdministration @ManageReviewBodies @EditReviewBody @SysAdminUser @SystemTest @rsp-2572
Feature: User Administration: Manage Review Bodies - Edit review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'

    @accessReviewBodyProfile
    Scenario: Verify that view and edit link takes the user to the Review Body Profile Page
        Then I can see the review body profile page
        And I capture the page screenshot

    @verifyReviewBodyProfileLayout
    Scenario: Verify that the review body profile page has the expected layout
        When I can see the review body profile page
        And I capture the page screenshot
        Then I see that the 'Enabled' review body profile page has the expected layout

    @verifyReviewBodyChangeLinks
    Scenario Outline: Verify the user can navigate to the edit review profile page via the change links for all fields
        And I can see the review body profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the review body profile page
        Then I can see the edit review body page
        And I capture the page screenshot
        And the edit review body input fields are already populated with the existing data

        Examples:
            | Field_Name        |
            | Organisation_Name |
            | Country           |
            | Email_Address     |
            | Description       |

    @verifyEditSaveReviewBody @rsp-3887
    Scenario Outline: Verify the user can edit the review body and save their changes
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
        Then I can see the updated review body is present in the list with '<Edit_Review_Body>'

        Examples:
            | Edit_Review_Body                   | Field_Name        |
            | Valid_Data_In_All_Fields           | Organisation_Name |
            | Valid_Data_In_All_Mandatory_Fields | Description       |

    @verifyEditSaveReviewBodyRealData @skip
    Scenario Outline: Verify the user can edit the review body and save their changes with real data
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
        Then I can see the updated review body is present in the list with '<Edit_Review_Body>'

        Examples:
            | Edit_Review_Body        | Field_Name        |
            | Review_Body_HCRW_Data   | Organisation_Name |
            | Review_Body_HSCNI_Data  | Description       |
            | Review_Body_RandD_Data  | Country           |
            | Review_Body_HRA_Data    | Email_Address     |
            | Review_Body_NIPS_Data   | Description       |
            | Review_Body_HFEA_Data   | Organisation_Name |
            | Review_Body_HMPPS_Data  | Country           |
            | Review_Body_MODREC_Data | Email_Address     |
            | Review_Body_HTA_Data    | Organisation_Name |
            | Review_Body_SPS_Data    | Email_Address     |
            | Review_Body_MHRA_Data   | Organisation_Name |
            | Review_Body_CAG_Data    | Country           |
            | Review_Body_ARSAC_Data  | Description       |
            | Review_Body_NRS_Data    | Organisation_Name |

    @verifyEditReviewPageBackButtonFlow
    Scenario Outline: Verify the user can navigate from 'Edit review body' page to the 'Review body profile' via the 'Back' link
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Edit_Review_Body_Page'
        Then I can see the review body profile page

        Examples:
            | Field_Name        |
            | Organisation_Name |
            | Country           |
            | Email_Address     |
            | Description       |

    @verifyValidEditReviewBodyCharacterLimits
    Scenario Outline: Edit review body field validation passes with minimum and maximum characters in organisation name and description
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

        Examples:
            | Edit_Review_Body                             | Field_Name        |
            | Organisation_Name_Field_Min_Data             | Organisation_Name |
            | Organisation_Name_Field_Max_Data             | Country           |
            | Organisation_Name_Field_between_Min_Max_Data | Email_Address     |
            | Description_Field_Min_Data                   | Description       |
            | Description_Field_Max_Data                   | Organisation_Name |
            | Description_Field_between_Min_Max_Data       | Country           |

    @verifyEditReviewValidationErrors @rsp-3123
    Scenario Outline: When input field validation fails on the edit review body page, correct error messaging displays to the user
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_Review_Body_Page'
        And I capture the page screenshot

        Examples:
            | Edit_Review_Body                                     | Field_Name        | Field_And_Summary_Error_Message                              |
            | Missing_Data_Organisation_Name_Field                 | Organisation_Name | Mandatory_Field_Organisation_Name_Error                      |
            | Missing_Data_Country_Field                           | Country           | Mandatory_Field_Country_Error                                |
            | Missing_Data_Email_Address_Field                     | Email_Address     | Mandatory_Field_Email_Address_Error                          |
            | Missing_Data_All_Fields                              | Country           | All_Mandatory_Field_Errors                                   |
            | Missing_Data_All_Mandatory_Fields                    | Email_Address     | All_Mandatory_Field_Errors                                   |
            | Invalid_Data_Organisation_Name_Field                 | Organisation_Name | Max_Chars_Organisation_Name_Error                            |
            | Invalid_Data_Description_Field                       | Description       | Max_Description_Words_Error                                  |
            | Incorrect_Format_Invalid_Character_Limit_Email_Field | Email_Address     | Incorrect_Format_Invalid_Character_Limit_Email_Address_Error |

    @verifyEditReviewEmailValidationErrors @rsp-3123 @skip
    Scenario Outline: Verify that Edit review body email field validation prevents invalid email formats
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the review body profile page
        And I can see the edit review body page
        And I capture the page screenshot
        When I fill the edit review body page using '<Edit_Review_Body>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Review_Body_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_Review_Body_Page'
        And I capture the page screenshot

        Examples:
            | Edit_Review_Body                                    | Field_Name    | Field_And_Summary_Error_Message |
            | Invalid_Character_Limit                             | Email_Address | Max_Chars_Email_Address_Error   |
            | Incorrect_Email_Format                              | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Start_With_Dot                   | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Double_Dot                       | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Space                            | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Wrong_AT                         | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Less_Greater_Symbols             | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Colon                            | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Semi_Colon                       | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Comma                            | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Start_With_Hyphen                | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Hyphen_Before_Domain             | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Double_Dot_Domain                | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Exclamation_Domain               | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Unicode                          | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Single_Quote_Before_AT           | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Domain_Exceed_Max                | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Local_Part_Max                   | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_Domain           | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_SubDomain        | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_Domain_SubDomain | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Emoji                            | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_TLD                              | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Missing_AT                       | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Reserved_Domain                  | Email_Address | Email_Format_Error              |
            | Invalid_Email_Data_Punycode                         | Email_Address | Email_Format_Error              |