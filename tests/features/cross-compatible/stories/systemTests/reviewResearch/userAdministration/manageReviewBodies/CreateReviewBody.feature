@UserAdministration @ManageReviewBodies @adminUser @SystemTest @rsp-2570
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Admin' link on the 'Banner'
        And I can see the 'System_Administration_Page'
        And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
        And I can see the manage review bodies list page
        And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
        And I can see the Add a new review body page

    # Test blocked due text defect, marking as should fail
    @verifyCreateReviewBody @fail
    Scenario Outline: Verify the user is able to create a new review body with valid data
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'
        When I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Review_Body>'
        When I have navigated to the 'Manage_Review_Bodies_Page'
        And I can see the manage review bodies list page
        Then I can see the review body for '<Add_Review_Body>' is present in the list
        And I can see the status of the review body is '<Status>'

        Examples:
            | Add_Review_Body                    | Status  |
            | Valid_Data_In_All_Fields           | enabled |
            | Valid_Data_In_All_Mandatory_Fields | enabled |

    # Test blocked due to text defect, marking as should fail
    @verifyCreateReviewBodyRealData @fail
    Scenario Outline: Verify the user is able to create a new review body with real data
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the Check and create review body page for '<Add_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
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

    # Test blocked due to text defect, marking as should fail
    @verifyAddAnotherReviewBody @fail
    Scenario Outline: Verify the user is able to add another review body via the link on the Confirmation message screen
        And I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the Check and create review body page for '<Add_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        And I can see the create Review body confirmation page for '<Add_Review_Body>'
        When I click the 'Add_Another_Review_Body' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the Add a new review body page
        When I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        And I can see the Check and create review body page for '<Add_Another_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        And I can see the manage review bodies list page
        Then I can see the review body for '<Add_Another_Review_Body>' is present in the list
        And I can see the status of the review body is '<Status>'

        Examples:
            | Add_Review_Body                    | Add_Another_Review_Body                    | Status   |
            | Valid_Data_In_All_Fields           | Valid_Data_In_All_Fields_Another           | enabled  |
            | Valid_Data_In_All_Mandatory_Fields | Valid_Data_In_All_Mandatory_Fields_Another | disabled |

    @verifyAddNewReviewPageBackButtonFlow
    Scenario: Verify the user can navigate from 'Add a new review body' page by clicking 'Back' link
        And I click the 'Back' link on the 'Create_Review_Body_Page'
        Then I can see the manage review bodies list page

    # Test blocked due to back button defect, marking as should fail
    @verifyCheckReviewPageBackButtonFlow @fail
    Scenario Outline: Verify the user can navigate from the check and confirm review body pages using the back options
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'
        And I click the 'Back' button on the 'Check_Create_Review_Body_Page'
        Then I can see the Add new review body page for '<Add_Review_Body>'
        And I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>'
        And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>'
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'
        Then I can see the manage review bodies list page

        Examples:
            | Add_Review_Body          | Add_Another_Review_Body          |
            | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields_Another |

    # Test blocked due to text defect, marking as should fail
    @verifyChangeLinks @fail
    Scenario Outline: Verify the user can navigate from the check review body page via the change links for all fields
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'
        When I click the 'Change' link against '<Field_Name>' on the 'Check_Create_Review_Body_Page'
        Then I can see the Add new review body page for '<Add_Review_Body>'

        Examples:
            | Add_Review_Body          | Field_Name        |
            | Valid_Data_In_All_Fields | Organisation_Name |
            | Valid_Data_In_All_Fields | Country           |
            | Valid_Data_In_All_Fields | Email_Address     |
            | Valid_Data_In_All_Fields | Description       |

    # Test blocked due to text defect, marking as should fail
    @verifyValidReviewBodyCharacterLimits @fail
    Scenario Outline: Field validation passes with minimum and maximum characters in organisation name and description
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Review_Body>'

        Examples:
            | Add_Review_Body                              |
            | Organisation_Name_Field_Min_Data             |
            | Organisation_Name_Field_Max_Data             |
            | Organisation_Name_Field_between_Min_Max_Data |
            | Description_Field_Min_Data                   |
            | Description_Field_Max_Data                   |
            | Description_Field_between_Min_Max_Data       |

    @verifyValidationErrors
    Scenario Outline: When min/max character field validation fails correct error messages display
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the '<Error>' validation message for '<Field_Name>'

        Examples:
            | Add_Review_Body                      | Error           | Field_Name              |
            | Missing_Data_Organisation_Name_Field | Mandatory_Field | Organisation_Name_Error |
            | Missing_Data_Country_Field           | Select_Country  | Country_Error           |
            | Missing_Data_Email_Address_Field     | Mandatory_Field | Email_Address_Error     |
            | Missing_Data_All_Fields              | Mandatory_Field | All_Mandatory_Fields    |
            | Missing_Data_All_Mandatory_Fields    | Mandatory_Field | All_Mandatory_Fields    |
            | Invalid_Data_Organisation_Name_Field | Max_Org_Chars   | Organisation_Name_Error |
            | Invalid_Data_Description_Field       | Max_Words       | Description_Error       |

    @verifyEmailValidationErrors
    Scenario Outline: Verify that email field validation prevents innvalid email formats
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Continue' button on the 'Create_Review_Body_Page'
        Then I can see the '<Error>' validation message for '<Field_Name>'

        Examples:
            | Add_Review_Body                                     | Error           | Field_Name          |
            | Invalid_Character_Limit                             | Max_Email_Chars | Email_Address_Error |
            | Incorrect_Email_Format                              | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Start_With_Dot                  | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Double_Dot                       | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Space                            | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Wrong_AT                        | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Less_Greater_Symbols             | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Colon                            | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Semi_Colon                       | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Comma                            | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Start_With_Hyphen               | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Hyphen_Before_Domain            | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Double_Dot_Domain                | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Exclamation_Domain               | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Unicode                         | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Single_Quote_Before_AT          | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Domain_Exceed_Max                | Email_Format    | Email_Address_Error |
            # | Invalid_Email_Data_Local_Part_Max                  | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Consecutive_Dot_Domain           | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Consecutive_Dot_SubDomain        | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Consecutive_Dot_Domain_SubDomain | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Emoji                            | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_TLD                              | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Missing_AT                       | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Reserved_Domain                  | Email_Format    | Email_Address_Error |
            | Invalid_Email_Data_Punycode                         | Email_Format    | Email_Address_Error |





