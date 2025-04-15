# Test Case Design - ACs for Automation:

# Login

# Landing page- System administration Home page

# Navigate to Manage users list page by clicking 'Manage users' hyperlink

# Prerequisite Test Data setup - By following Create a new user record journey

# Navigate to User profile page on clicking View/Edit link (under Actions column)

# Navigated to Audit history page' on clicking View this users audit history link

# Scenario: Verify that create user record history is

# Scenario: Verify that  all changes made to the user profile is displayed in Audit history page

# Validate that a single entry should be generated automatically for each modification that has occurred

# The default sort should be the most recent entry first based on date and time

# Each entry should include the following details:

# Date and time – DD Month YYYY (e.g. 05 Jan 2025) HH:MM (GMT 24 hour) when the modification occurred

# Description – this is the description of the change

# User – the user who made the change

#  Scenario: Verify that new user creation is displayed in audit history page

# Scenario: Verify that user enabled is displayed in audit history page 

# Scenario: Verify that user disabled is displayed in audit history page

 

# Out of scope

# [Email address] was assigned [Role name] role

# [Email address] was unassigned [Role name] role

@UserAdministration @ManageUsers @adminUser @SystemTest @AuditHistoryUser @rsp-2927
Feature: User Administration: Manage Users - View audit history for users

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'Manage_Users' link on the 'Banner'
        And I can see the 'Manage_Users_Page'

    @VerifyAuditHistoryCreateUser @only
    Scenario Outline: Verify the user can view the audit history after creating a new user
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        Then I can see the add a new user profile page
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot