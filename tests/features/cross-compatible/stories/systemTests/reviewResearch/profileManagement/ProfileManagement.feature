@ProfileManagement  @RegressionProfileSettings @ApplicantUser @OneLoginUser @SystemTest
Feature: Profile Management: Provide users with the ability to create and update their profile on the system
    As a user
    I want to be able to complete and update my profile details
    So that my account is created and I can access the system
    and make updates to my profile when needed

    @regressionCompleteCheckAddProfile @OneLoginUser @rsp-5073 @rsp-5288 @KNOWN-DEFECT-RSP-6968
    Scenario: Users can complete and update their profile when logging into the system for the first time
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        When I login to the application as the 'One_Login_Account_User'
        Then I can see the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        And I can see a 'One_Login_Account' link on the 'Complete_Your_Profile_Page'
        And I can see the read only one login details for my 'One_Login_Account_User' account
        When I fill the complete profile page with 'One_Login_Account_User' details
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
        Then I can see the 'Check_Your_Profile_Page'
        And I capture the page screenshot
        And I can see a 'One_Login_Account' link on the 'Check_Your_Profile_Page'
        And I can see the read only one login details for my 'One_Login_Account_User' account
        And I can see the profile details for my 'One_Login_Account_User' account
        When I click the 'Add_Profile' button on the 'Check_Your_Profile_Page'
        Then I can see the 'Home_Page'
        And I capture the page screenshot
        And I can see the workspaces in my account home page for 'Applicant_User'
        And I can see the account 'created' notification
        When I have navigated to the audit history page for the 'One_Login_Account_User' user as 'System_Admin'
        And I capture the page screenshot
        Then I can see the users audit history with the expected events displayed
        When I click the 'Profile_Settings' link on the 'Banner'
        Then I can see the 'Profile_Settings_Page'
        And I can see a 'One_Login_Account' link on the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the read only one login details for my 'One_Login_Account_User' account
        And I can see the profile details for my 'One_Login_Account_User' account
        When I click the change link against 'Settings_Job_Title' on the profile settings page
        Then I can see the 'Edit_Your_Profile_Page'
        And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'
        When I fill the edit your profile page with 'One_Login_Account_User_Edit' details
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Your_Profile_Page'
        Then I can see the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the account 'updated' notification
        When I have navigated to the audit history page for the 'One_Login_Account_User' user as 'System_Admin'
        And I capture the page screenshot
        Then I can see the users audit history with the expected events displayed

    @regressionViewProfileSettingsPage @rsp-5290
    Scenario Outline: View the profile settings and edit settings pages for an authenticated, existing user-applicant
        Given I have navigated to the 'Home_Page' as '<User>'
        And I capture the page screenshot
        When I click the 'Profile_Settings' link on the 'Banner'
        Then I can see the 'Profile_Settings_Page'
        And I can see a 'One_Login_Account' link on the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the read only one login details for my '<User>' account
        And I can see the profile details for my '<User>' account
        When I click the change link against '<Field_Name>' on the profile settings page
        Then I can see the 'Edit_Your_Profile_Page'
        And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'

        Examples:
            | User           | Field_Name     |
            | Applicant_User | Settings_Title |

    @regressionViewProfileSettingsPage @rsp-5290 @KNOWN-DEFECT-RSP-5003
    Scenario Outline: View the profile settings and edit settings pages for an authenticated, existing user
        Given I have navigated to the 'Home_Page' as '<User>'
        And I capture the page screenshot
        When I click the 'Profile_Settings' link on the 'Banner'
        Then I can see the 'Profile_Settings_Page'
        And I can see a 'One_Login_Account' link on the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the read only one login details for my '<User>' account
        And I can see the profile details for my '<User>' account
        When I click the change link against '<Field_Name>' on the profile settings page
        Then I can see the 'Edit_Your_Profile_Page'
        And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'

        Examples:
            | User                   | Field_Name          |
            | Studywide_Reviewer_NI  | Settings_First_Name |
            | Workflow_Coordinator_W | Settings_Last_Name  |

    @regressionVerifyCheckProfileChangeLinks @OneLoginUser @rsp-5288
    Scenario Outline: Verify that the user can navigate to the complete profile page via the change links for all fields
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        When I login to the application as the 'One_Login_Account_User'
        Then I can see the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        When I fill the complete profile page with 'One_Login_Account_User' details
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
        Then I can see the 'Check_Your_Profile_Page'
        When I click the change link against '<Field_Name>' on the check your profile page
        Then I can see the 'Complete_Your_Profile_Page'

        Examples:
            | Field_Name         |
            | Check_Title        |
            | Check_First_Name   |
            | Check_Last_Name    |
            | Check_Job_Title    |
            | Check_Organisation |

    @regressionCompleteProfileValidation @OneLoginUser @rsp-5073 @OneLoginUser
    Scenario: Verify that the complete your profile page has the correct input validations in place
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        And I login to the application as the 'One_Login_Account_User'
        And I can see the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        And I fill the complete profile page with 'Invalid_User' details
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        Then I validate 'Missing_Mandatory_Fields_Error' displayed on 'Complete_Your_Profile_Page'

    @regressionEditProfileSettings @OneLoginUser @rsp-5106
    Scenario: Verify that the edit your profile page has the correct input validations in place
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        And I login to the application as the 'One_Login_Account_User'
        And I can see the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        And I fill the complete profile page with 'One_Login_Account_User' details
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
        And I can see the 'Check_Your_Profile_Page'
        And I capture the page screenshot
        And I click the 'Add_Profile' button on the 'Check_Your_Profile_Page'
        And I can see the 'Home_Page'
        And I capture the page screenshot
        When I have navigated to the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I click the change link against 'Settings_Organisation' on the profile settings page
        And I can see the 'Edit_Your_Profile_Page'
        When I fill the edit your profile page with 'Invalid_User_Edit' details
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Your_Profile_Page'
        And I capture the page screenshot
        Then I validate 'Missing_Mandatory_Fields_Error' displayed on 'Edit_Your_Profile_Page'