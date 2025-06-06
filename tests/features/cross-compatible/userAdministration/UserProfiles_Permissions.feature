@UserProfiles
Feature: As an Authenticated User I have to validate permissions,system or project level roles,applicable services and applicable personna group for various user roles

    # More Info: Drafted scenarios based on https://lucid.app/lucidspark/ceb048e1-d00a-4f46-9356-54c0933e999d/edit?invitationId=inv_774c8339-0191-48d5-800f-5dafda9765ff&page=0_0#
    # Also,referred https://healthresearchauthority.sharepoint.com/:x:/r/sites/Future-IRAS/_layouts/15/doc2.aspx?sourcedoc=%7B67502FEC-814A-44FA-9744-75BC7CD616C7%7D&file=User%20roles%20and%20permissions%20DRAFT%20v0.3.xlsx&action=default&mobileredirect=true


    Scenario Outline: I am able to validate permissions of various user profiles
        When I have logged in to the application with '<User_Profile>'
        Then I can validate permissions '<Permissions>'
        Examples:
            | User_Profile                       | Permissions                                 |
            | Standard user profile              | Standard_public_user_profile_permissions    |
            | Approvals/ Operations user profile | Approvals_user_profile_permissions          |
            | Pharmacy reviewer user profile     | Pharmacy_reviewer_user_profile_permissions  |
            | Radiation reviewer user profile    | Radiation_reviewer_user_profile_permissions |
            | Member user profile                | Member_reviewer_user_profile_permissions    |

    Scenario Outline: I am able to validate system or project level roles of various user profiles
        When I have logged in to the application with '<User_Profile>'
        Then I can validate roles '<Roles>'
        Examples:
            | User_Profile                       | Roles                                 |
            | Standard user profile              | Standard_public_user_profile_roles    |
            | Approvals/ Operations user profile | Approvals_user_profile_roles          |
            | Pharmacy reviewer user profile     | Pharmacy_reviewer_user_profile_roles  |
            | Radiation reviewer user profile    | Radiation_reviewer_user_profile_roles |
            | Member user profile                | Member_reviewer_user_profile_roles    |

    Scenario Outline: I am able to validate applicable services of various user profiles
        When I have logged in to the application with '<User_Profile>'
        Then I can validate applicable services for the user roles '<Applicable_services>'
        Examples:
            | User_Profile                       | Applicable_services                                 |
            | Standard user profile              | Standard_public_user_profile_Applicable_services    |
            | Approvals/ Operations user profile | Approvals_user_profile_Applicable_services          |
            | Pharmacy reviewer user profile     | Pharmacy_reviewer_user_profile_Applicable_services  |
            | Radiation reviewer user profile    | Radiation_reviewer_user_profile_Applicable_services |
            | Member user profile                | Member_reviewer_user_profile_Applicable_services    |


    Scenario Outline: I am able to validate applicable personna group for the user roles
        Validate applicable personna group for the user roles
        When I have logged in to the application with '<User_Profile>'
        Then I can validate applicable personna group '<Persona_Group>'
        Examples:
            | User_Profile                       | Persona_Group                           |
            | Standard user profile              | Standard_public_user_profile_persona    |
            | Approvals/ Operations user profile | Approvals_user_profile_persona          |
            | Pharmacy reviewer user profile     | Pharmacy_Reviewer_user_profile_persona  |
            | Radiation reviewer user profile    | Radiation_Reviewer_user_profile_persona |
            | Member user profile                | Member_Reviewer_user_profile_persona    |

