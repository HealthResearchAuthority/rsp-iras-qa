@ProfileManagement @CompleteProfile @ApplicantUser @OneLoginUser @SystemTest @Smoke
Feature: Profile Management: Provide new users with the ability to create their profile on the system
    As a user
    I want to be able to complete my profile details
    So that my account is created and I can access the system

    Background:
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        When I login to the application as the 'One_Login_Account_User'

    @completeCheckAddProfile @rsp-5073 @rsp-5288 @fail @KNOWN-DEFECT-RSP-5329
    Scenario: New users are directed to complete their profile when logging into the system for the first time
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

    @verifyCheckProfileChangeLinks @rsp-5288
    Scenario Outline: Verify the user can navigate to the complete profile page via the change links for all fields
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

    @completeProfileValidation @rsp-5073 @OneLoginUser
    Scenario: The complete your profile page has the correct input validations in place
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        And I login to the application as the 'One_Login_Account_User'
        And I can see the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        And I fill the complete profile page with 'Invalid_User' details
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
        And I capture the page screenshot
        Then I validate 'Missing_Mandatory_Fields_Error' displayed on 'Complete_Your_Profile_Page'