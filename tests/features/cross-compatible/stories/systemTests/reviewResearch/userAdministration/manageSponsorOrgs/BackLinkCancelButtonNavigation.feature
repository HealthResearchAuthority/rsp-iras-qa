@SysAdminUser @SystemTest @UserAdministration @ManageSponsorOrgs @BackStage
Feature: User Administration: Manage Sponsor Organisations

    Background:
        Given I have navigated to the 'System_Administration_Page'
        And I capture the page screenshot
        And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot

    @verifyManageSponsorOrgsPageBackButtonFlow @rsp-5229
    Scenario: Verify the user can navigate from 'Manage sponsor organisations' page by clicking 'Back' button
        And I click the 'Back' link on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'System_Administration_Page'

    @verifySetupNewSponsorOrgPageBackButtonFlow @rsp-5230
    Scenario: Verify the user can navigate from 'Set up a new sponsor organisation' page by clicking 'Back' button
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        And I click the 'Back' link on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Then I can see the 'Manage_Sponsor_Organisations_Page'

    @VerifyBackButtonFlowFromCheckSetupSponsorOrg @rsp-5231
    Scenario Outline: Verify the user can go back from check and set up a sponsor organisation profile page and navigate back to setup a new sponsor organisation page
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation '<Setup_New_Sponsor_Organisation>' and  retrive country
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
        When I click the 'Back' link on the 'Check_Setup_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        Examples:
            | Setup_New_Sponsor_Organisation   | Status_Enabled | RTS_API_Data         | RTS_Request                         |
            | Sponsor_Organisation_ThirtyThree | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |

    @CancelFromCheckSetupSponsorOrg @rsp-5231
    Scenario Outline: Verify the user can cancel from check and set up a sponsor organisation profile page and navigate back to setup a new sponsor organisation page
        When I authorise the rts api using '<RTS_API_Data>'
        Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation '<Setup_New_Sponsor_Organisation>' and  retrive country
        And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
        And I capture the page screenshot
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
        And I capture the page screenshot
        And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
        And I capture the page screenshot
        And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
        When I click the 'Cancel' button on the 'Check_Setup_Sponsor_Organisation_Page'
        And I capture the page screenshot
        Then I can see the 'Setup_New_Sponsor_Organisation_Page'
        Examples:
            | Setup_New_Sponsor_Organisation   | Status_Enabled | RTS_API_Data         | RTS_Request                         |
            | Sponsor_Organisation_ThirtyThree | Enabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS |