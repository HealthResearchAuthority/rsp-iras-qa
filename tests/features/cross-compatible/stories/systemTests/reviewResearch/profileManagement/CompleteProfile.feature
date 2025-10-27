@ProfileManagement @CompleteProfile @ApplicantUser @SystemTest
Feature: Profile Management: Provide new users with the ability to create their profile on the system
    As a user
    I want to be able to complete my profile details
    So that my account is created and I can access the system

    Background:
        Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
        When I login to the application as the 'One_Login_Account_User'

    @rsp-5073 @completeProfilePage @only
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
        And I can see the account created notification
# navigate to audit history as sys admin - fetch id from data
# Given I have navigated to the 'Audit_History_User_Page' for the 'One_Login_Account_User' as 'System_Admin'
# Then I can see the audit history page of the selected review body for 'One_Login_Account_User'
# And I capture the page screenshot
# And I can see the audit history for the review body 'created' event for 'One_Login_Account_User' with 'Create_Review_Body'
# navigate to audit history as sys admin - fetch id from data
# And I can see the audit history for the newly created '<Add_User_Profile>' user with roles assigned
# Delete profile from DB after- 4808 merged - do beforeHook Delete too

# Add access tests for complete, check and Edit pages - only need to run compplete and check for this evidence below
# Get test run evidence, manually delete from DB if necessary and go through IR process
# Add common page + data for commmon profle page items - make changes box + headings + readonly data
# Add One Login cred to library and reference in DevOps Yaml


# @rsp-5290 @verifyCheckProfileChangeLinks @ApplicantUser
# Scenario Outline: Verify the user can navigate to the edit profile page via the change links for all fields
#     Given I have navigated to the 'Profile_Settings_Page'
#     And I capture the page screenshot
#     When I click the change link against '<Field_Name>' on the profile settings page
#     Then I can see the 'Edit_Your_Profile_Page'
#     And I can see a 'One_Login_Account' link on the 'Edit_Your_Profile_Page'

#     Examples:
#         | Field_Name   |
#         | Title        |
#         | First_Name   |
#         | Last_Name    |
#         | Job_Title    |
#         | Organisation |