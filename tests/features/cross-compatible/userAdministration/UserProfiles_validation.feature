@UserAdministration @UserProfiles
Feature: As an Authenticated Admin User I have to validate different user profiles and their attributes

    # More Info: Drafted scenarios based on https://lucid.app/lucidspark/ceb048e1-d00a-4f46-9356-54c0933e999d/edit?invitationId=inv_774c8339-0191-48d5-800f-5dafda9765ff&page=0_0#
    # Also,referred https://healthresearchauthority.sharepoint.com/:x:/r/sites/Future-IRAS/_layouts/15/doc2.aspx?sourcedoc=%7B67502FEC-814A-44FA-9744-75BC7CD616C7%7D&file=User%20roles%20and%20permissions%20DRAFT%20v0.3.xlsx&action=default&mobileredirect=true

    Background:
        Given I have logged in to the application as an authenticated 'admin' user
        Then I have navigated to the user administration page


    Scenario Outline: I am able to create user accounts with Standard public user profile
        When I create an user account with 'User_Account_Profile'
        And I fill all the attribute values with '<User_Profile_Data>'
        Then the user profile information is populated for '<User_Profile_info>'
        Examples:
            | User_Account_Profile         | User_Profile_Data                       | User_Profile_info                 |
            | Standard public user profile | Standard_Public_User_Profile_Attributes | Standard_Public_User_Profile_info |

    Scenario Outline: I am able to assign different user roles to the user accounts with Standard public user profile
        Assign Approvals user role to the user account with Standard public user profile
        Assign Pharmacy reviewer user role to the user account with Standard public user profile
        Assign Radiation reviewer user role to the user account with Standard public user profile
        When I create an user account with 'User_Account_Profile'
        And I fill all the attribute values with '<User_Profile_Data>'
        Then the user profile information is populated for '<User_Profile_info>'
        And I assign '<User_role_assign>' to the user with '<User_Profile_Data_assigned>'
        Then the user profile information is populated for '<User_Profile_info_assigned>'
        Examples:
            | User_Account_Profile         | User_Profile_Data                       | User_Profile_info                 | User_role_assign   | User_Profile_Data_assigned                   | User_Profile_info_assigned           |
            | Standard public user profile | Standard_Public_User_Profile_Attributes | Standard_Public_User_Profile_info | Approvals          | Approvals/Operations_user_profile_Attributes | Approvals_User_Profile_info          |
            | Standard public user profile | Standard_Public_User_Profile_Attributes | Standard_Public_User_Profile_info | Phamacy_reviewer   | Phamacy_reviewer_user_profile_Attributes     | Phamacy_reviewer_User_Profile_info   |
            | Standard public user profile | Standard_Public_User_Profile_Attributes | Standard_Public_User_Profile_info | Radiation_reviewer | Radiation_reviewer_user_profile_Attributes   | Radiation_reviewer_User_Profile_info |
    # add valid and invalid data scenarios here>>>
    Scenario Outline: I am able to assign MODREC reviewer user role to the user account with Member user profile
        Assign Member reviewer user role to the user account with Standard public user profile
        Assign MODREC reviewer user role to the user account with Member user profile
        When I create an user account with 'User_Account_Profile'
        And I fill all the attribute values with '<User_Profile_Data>'
        Then the user profile information is populated for '<User_Profile_info>'
        And I assign '<User_role_assign>' to the user with '<User_Profile_Data_assigned>'
        Then the user profile information is populated for '<User_Profile_info_assigned>'
        And I selected '<Security_Clearance_Flag>'
        Then I can see 'MODREC reviewer user role' assigned to the user account
        Examples:
            | User_Account_Profile         | User_Profile_Data                       | User_Profile_info                 | User_role_assign | User_Profile_Data_assigned              | User_Profile_info_assigned        | Security_Clearance_Flag |
            | Standard public user profile | Standard_Public_User_Profile_Attributes | Standard_Public_User_Profile_info | Member_reviewer  | Member_reviewer_user_profile_Attributes | Member_reviewer_User_Profile_info | Yes                     |




























