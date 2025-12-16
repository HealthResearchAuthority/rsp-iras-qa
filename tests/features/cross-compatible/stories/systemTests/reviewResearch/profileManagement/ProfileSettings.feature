@ProfileManagement @ProfileSettings @ApplicantUser @SystemTest
Feature: Profile Management: Provide signed-in users with access to their profile management functions
    As a user
    I want to access a Profile and Settings page
    So that I can review my account information and make updates to my profile when needed

    @viewProfileSettingsPage @rsp-5290
    Scenario Outline: View profile settings for an authenticated, existing user-applicant
        Given I have navigated to the 'Home_Page' as '<User>'
        And I capture the page screenshot
        When I click the 'Profile_Settings' link on the 'Banner'
        Then I can see the 'Profile_Settings_Page'
        And I can see a 'One_Login_Account' link on the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the read only one login details for my '<User>' account
        And I can see the profile details for my '<User>' account

        Examples:
            | User           |
            | Applicant_User |

    @viewProfileSettingsPage @rsp-5290 @KNOWN-DEFECT-RSP-5003
    Scenario Outline: View profile settings for an authenticated, existing user
        Given I have navigated to the 'Home_Page' as '<User>'
        And I capture the page screenshot
        When I click the 'Profile_Settings' link on the 'Banner'
        Then I can see the 'Profile_Settings_Page'
        And I can see a 'One_Login_Account' link on the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the read only one login details for my '<User>' account
        And I can see the profile details for my '<User>' account

        Examples:
            | User                   |
            | Studywide_Reviewer_NI  |
            | Workflow_Coordinator_W |

    @verifyProfileSettingsChangeLinks @rsp-5290
    Scenario Outline: Verify the user can navigate to the edit profile page via the change links for all fields
        Given I have navigated to the 'Profile_Settings_Page'
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the profile settings page
        Then I can see the 'Edit_Your_Profile_Page'
        And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'

        Examples:
            | Field_Name            |
            | Settings_Title        |
            | Settings_First_Name   |
            | Settings_Last_Name    |
            | Settings_Job_Title    |
            | Settings_Organisation |

    @editProfileSettings @rsp-5106 @OneLoginUser @KNOWN-DEFECT-RSP-5329
    Scenario: Users can update their profile directly via profile settings
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
        And I click the change link against 'Settings_First_Name' on the profile settings page
        And I can see the 'Edit_Your_Profile_Page'
        When I fill the edit your profile page with 'One_Login_Account_User_Edit' details
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Your_Profile_Page'
        Then I can see the 'Profile_Settings_Page'
        And I capture the page screenshot
        And I can see the account 'updated' notification
        When I have navigated to the audit history page for the 'One_Login_Account_User' user as 'System_Admin'
        And I capture the page screenshot
        Then I can see the users audit history with the expected events displayed

    @editProfileSettings @rsp-5106 @OneLoginUser
    Scenario: The edit your profile page has the correct input validations in place
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
        And I click the change link against 'Settings_Last_Name' on the profile settings page
        And I can see the 'Edit_Your_Profile_Page'
        When I fill the edit your profile page with 'Invalid_User_Edit' details
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_Your_Profile_Page'
        And I capture the page screenshot
        Then I validate 'Missing_Mandatory_Fields_Error' displayed on 'Edit_Your_Profile_Page'