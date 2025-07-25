@UserAdministration @ManageReviewBodies @CreateReviewBody @SysAdminUser @SystemTest @rsp-2570
Feature: User Administration: Manage Review Bodies - Create review body

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        Then I can see the 'Create_Review_Body_Page'

    @verifyCreateReviewBody @rsp-3887
    Scenario Outline: Verify the user is able to create a new review body with valid data
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
        Then I can see the review body for '<Add_Review_Body>' is present in the list with '<Status>' status
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                    | Status  |
            | Valid_Data_In_All_Fields           | enabled |
            | Valid_Data_In_All_Mandatory_Fields | enabled |

    @verifyCreateReviewBodyRealData
    Scenario Outline: Verify the user is able to create a new review body with real data
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        And I capture the page screenshot
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'

        Examples:
            | Add_Review_Body         |
            | Review_Body_HCRW_Data   |
            | Review_Body_HSCNI_Data  |
            | Review_Body_RandD_Data  |
            | Review_Body_HRA_Data    |
            | Review_Body_NIPS_Data   |
            | Review_Body_HFEA_Data   |
            | Review_Body_HMPPS_Data  |
            | Review_Body_MODREC_Data |
            | Review_Body_HTA_Data    |
            | Review_Body_SPS_Data    |
            | Review_Body_MHRA_Data   |
            | Review_Body_CAG_Data    |
            | Review_Body_ARSAC_Data  |
            | Review_Body_NRS_Data    |

    @verifyAddAnotherReviewBody
    Scenario Outline: Verify the user is able to add another review body via the link on the Confirmation message screen
        And I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the check and create review body page for '<Add_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        And I can see the create Review body confirmation page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the 'Add_Another_Review_Body' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Create_Review_Body_Page'
        And I capture the page screenshot
        When I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the check and create review body page for '<Add_Another_Review_Body>'
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the 'Manage_Review_Bodies_Page'
        Then I can see the review body for '<Add_Another_Review_Body>' is present in the list with '<Status>' status
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                    | Add_Another_Review_Body                    | Status  |
            | Valid_Data_In_All_Fields           | Valid_Data_In_All_Fields_Another           | enabled |
            | Valid_Data_In_All_Mandatory_Fields | Valid_Data_In_All_Mandatory_Fields_Another | enabled |

    @verifyAddNewReviewPageBackButtonFlow
    Scenario: Verify the user can navigate from 'Add a new review body' page by clicking 'Back' link
        And I capture the page screenshot
        And I click the 'Back' link on the 'Create_Review_Body_Page'
        Then I can see the 'Manage_Review_Bodies_Page'

    @verifyCheckReviewPageBackButtonFlow
    Scenario Outline: Verify the user can navigate from the check and confirm review body pages using the back options
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Back' link on the 'Check_Create_Review_Body_Page'
        Then I can see the Add new review body page for '<Add_Review_Body>'
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

        Examples:
            | Add_Review_Body          | Add_Another_Review_Body          |
            | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields_Another |

    @verifyChangeLinks
    Scenario Outline: Verify the user can navigate from the check review body page via the change links for all fields
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the check and create review body page for '<Add_Review_Body>'
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the check review body page
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I capture the page screenshot

        Examples:
            | Add_Review_Body          | Field_Name        |
            | Valid_Data_In_All_Fields | Organisation_Name |
            | Valid_Data_In_All_Fields | Country           |
            | Valid_Data_In_All_Fields | Email_Address     |
            | Valid_Data_In_All_Fields | Description       |

    @verifyValidReviewBodyCharacterLimits
    Scenario Outline: Field validation passes with minimum and maximum characters in organisation name and description
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

    @verifyValidationErrors @rsp-3123
    Scenario Outline: When input field validation fails on the create review body page, correct error messaging displays to the user
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

    @verifyEmailValidationErrors @rsp-3123 @skip
    Scenario Outline: Verify that email field validation prevents invalid email formats
        When I fill the new review body page using '<Add_Review_Body>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_Review_Body_Page'
        And I capture the page screenshot

        Examples:
            | Add_Review_Body                                     | Field_And_Summary_Error_Message |
            | Invalid_Character_Limit                             | Max_Chars_Email_Address_Error   |
            | Incorrect_Email_Format                              | Email_Format_Error              |
            | Invalid_Email_Data_Start_With_Dot                   | Email_Format_Error              |
            | Invalid_Email_Data_Double_Dot                       | Email_Format_Error              |
            | Invalid_Email_Data_Space                            | Email_Format_Error              |
            | Invalid_Email_Data_Wrong_AT                         | Email_Format_Error              |
            | Invalid_Email_Data_Less_Greater_Symbols             | Email_Format_Error              |
            | Invalid_Email_Data_Colon                            | Email_Format_Error              |
            | Invalid_Email_Data_Semi_Colon                       | Email_Format_Error              |
            | Invalid_Email_Data_Comma                            | Email_Format_Error              |
            | Invalid_Email_Data_Start_With_Hyphen                | Email_Format_Error              |
            | Invalid_Email_Data_Hyphen_Before_Domain             | Email_Format_Error              |
            | Invalid_Email_Data_Double_Dot_Domain                | Email_Format_Error              |
            | Invalid_Email_Data_Exclamation_Domain               | Email_Format_Error              |
            | Invalid_Email_Data_Unicode                          | Email_Format_Error              |
            | Invalid_Email_Data_Single_Quote_Before_AT           | Email_Format_Error              |
            | Invalid_Email_Data_Domain_Exceed_Max                | Email_Format_Error              |
            | Invalid_Email_Data_Local_Part_Max                   | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_Domain           | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_SubDomain        | Email_Format_Error              |
            | Invalid_Email_Data_Consecutive_Dot_Domain_SubDomain | Email_Format_Error              |
            | Invalid_Email_Data_Emoji                            | Email_Format_Error              |
            | Invalid_Email_Data_TLD                              | Email_Format_Error              |
            | Invalid_Email_Data_Missing_AT                       | Email_Format_Error              |
            | Invalid_Email_Data_Reserved_Domain                  | Email_Format_Error              |
            | Invalid_Email_Data_Punycode                         | Email_Format_Error              |