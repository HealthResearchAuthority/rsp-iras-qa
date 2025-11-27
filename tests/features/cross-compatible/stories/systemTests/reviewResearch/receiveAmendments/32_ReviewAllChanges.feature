@ReceiveAmendments @ReviewAllChanges @ApplicantUser @SystemTest @skip
Feature: Receive Amendments - Review All Changes

    # Missing tabs element so this test will need to be updated when RSP-5036 is deemed unblocked
    @ValidateNonReviewableModificationDetails @rsp-5036
    Scenario Outline: Validate the details of the non-reviewable modifications
        Given I navigate to the review all changes page of the '<Modification_Name>' modification as a '<User>'
        And I capture the page screenshot
        Then I validate that a modification summary is displayed on the review all changes page for '<Modification_Name>'
        And I validate that a modification ranking is displayed on the review all changes page for '<Modification_Name>'
        And I validate that a changes section is displayed on the review all changes page for '<Modification_Name>'
        And I validate that sponsor details are displayed on the review all changes page for '<Modification_Name>'

        Examples:
            | Modification_Name      | User                 |
            | Hibernian_Social_Study | System_Admin         |
            | Swansea_ACL_Trials     | Workflow_Coordinator |
            | Hibernian_Social_Study | Team_Manager         |
            | Swansea_ACL_Trials     | Studywide_Reviewer   |

    # Awaiting story to be delivered around role based access
    @pplicantsDeniedAccessToModifications @rsp-5036 @fail
    Scenario Outline: Validate the details of the non-reviewable modifications
        Given I navigate to the review all changes page of the 'Hibernian_Social_Study' modification
        And I capture the page screenshot
        Then I can see the 'Access_Denied_Page'