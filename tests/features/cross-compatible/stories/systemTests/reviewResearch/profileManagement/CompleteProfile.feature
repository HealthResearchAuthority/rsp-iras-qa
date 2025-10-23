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
# And I can see the profile details for my '<User>' account
# Click Save Continue button
# See Check page - bug
# Delete profile from DB after

# Add common page + data for commmon profle page items - make changes box + headings + readonly data
