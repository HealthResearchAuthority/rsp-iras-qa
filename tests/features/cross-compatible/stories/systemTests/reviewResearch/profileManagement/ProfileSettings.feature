@ProfileManagement @ProfileSettings @ApplicantUser @SystemTest @STSysAdmin
Feature: Profile Management: Provide signed-in users with access to their profile management functions
    As a user
    I want to access a Profile and Settings page
    So that I can review my account information and make updates to my profile when needed

    @rsp-5290 @viewProfileSettingsPage
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
            | Applicant_User         |
            | Studywide_Reviewer_NI  |
            | Workflow_Coordinator_W |

    @rsp-5290 @verifyProfileSettingsChangeLinks @ApplicantUser
    Scenario Outline: Verify the user can navigate to the edit profile page via the change links for all fields
        Given I have navigated to the 'Profile_Settings_Page'
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the profile settings page
        Then I can see the 'Edit_Your_Profile_Page'
        And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'

        Examples:
            | Field_Name   |
            | Title        |
            | First_Name   |
            | Last_Name    |
            | Job_Title    |
            | Organisation |
