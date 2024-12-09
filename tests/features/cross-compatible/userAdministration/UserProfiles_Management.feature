@UserAdministration @UserProfiles
Feature: As an Authenticated User I have to view user profile,edit user profile,check user profile notification and then edit user profile

    # More Info: Drafted sceanrios based on https://lucid.app/lucidspark/ceb048e1-d00a-4f46-9356-54c0933e999d/edit?invitationId=inv_774c8339-0191-48d5-800f-5dafda9765ff&page=0_0#
    # Also,referred https://healthresearchauthority.sharepoint.com/:x:/r/sites/Future-IRAS/_layouts/15/doc2.aspx?sourcedoc=%7B67502FEC-814A-44FA-9744-75BC7CD616C7%7D&file=User%20roles%20and%20permissions%20DRAFT%20v0.3.xlsx&action=default&mobileredirect=true


    Scenario Outline: I am able to edit non-IDG standard profile information
        When I have logged in to the application as an authenticated '<user>' user
        Then I navigate to View profile page menu option
        And I click on View profile page
        And edit 'non-IDG' standard profile information
        And I save changes
        And I can view updated profile information
        Examples:
            | User                    |
            | Committee member        |
            | Approvals staff (UK)    |
            | Approvals administrator |
            | Researcher              |

    Scenario Outline: I am able to edit IDG standard profile information
        When I have logged in to the application as an authenticated '<user>' user
        Then I navigate to View profile page menu option
        And I click on View profile page
        And I visit IDG profile on external IDG web page
        And I make changes to IDG profile information
        And I save changes
        And I return to future IRAS
        And I can view updated profile information
        Examples:
            | User                    |
            | Committee member        |
            | Approvals staff (UK)    |
            | Approvals administrator |
            | Researcher              |

    Scenario Outline: I am able to View user profile,edit user profile,check user profile notification and then edit user profile
        Edit membership information
        Receive notification membership information needs updating and then Edit membership information
        Edit pharmacy Reviewer information
        Receive notification pharmacy Reviewer information needs updating and then Edit pharmacy Reviewer information
        When I check user profile notification '<Notification>'
        Then I have logged in to the application as an authenticated '<user>' user
        And I navigate to View profile page menu option
        And I click on View profile page
        And I edit '<role>' information
        And I save '<role>' information
        Then I can view updated profile page for '<role>'
        Examples:
            | User              | Notification | role              |
            | Committee member  | No           | membership        |
            | Committee member  | Yes          | membership        |
            | Pharmacy Reviewer | No           | Pharmacy Reviewer |
            | Pharmacy Reviewer | Yes          | Pharmacy Reviewer |




























