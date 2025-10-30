@RegressionManageSponsorOrganisations @SysAdminUser @Regression @UserAdministration @BackStage
Feature: User Administration: Manage sponsor organisations

        Background:
                Given I have navigated to the 'System_Administration_Page'
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                Then I can see the 'Manage_Sponsor_Organisations_Page'

        @RegressionTestVerifyLastUpdatedAfterSetupDisableEnableSponsorOrgAndUser
        Scenario Outline: Verify that the user is able to perform: add a sponsor organisation, enable or disable a sponsor organisation, assign a user to a selected sponsor organisation, enable or disable a user within the sponsor organisation, and confirm that the 'Last Updated' field on the sponsor organisation profile page reflects these changes accurately
                When I authorise the rts api using '<RTS_API_Data>'
                Then I make a request to the rts api using '<RTS_Request>' dataset for sponsor organisation '<Setup_New_Sponsor_Organisation>' and  retrive country
                ## set up a new sponsor organisation
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                Then I can see the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I can see the check and set up a sponsor organisation profile page with details matching the rts response received
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                And I capture the page screenshot
                And I can see the list is sorted by default in the alphabetical order of the 'Organisation Name'
                And I capture the page screenshot
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                # validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                ## disable a sponsor organisation
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Disable_Sponsor_Organisation_Labels>' labels displayed in disable sponsor organisation confirmation page using the organisation name
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation disabled successful message on manage sponsor organisation page
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Disabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                # validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                ## enable a sponsor organisation
                Then I can see the '<Enable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Enable_Sponsor_Organisation_Labels>' labels displayed in enable sponsor organisation confirmation page using the organisation name
                And I capture the page screenshot
                When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see a 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation enabled successful message on manage sponsor organisation page
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                #### user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                And I can see no users in the 'sponsor organisation' with a message to add users to the 'sponsor organisation'
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                Then the no search results found message is displayed
                And I capture the page screenshot
                ## add user to sponsor organisation
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And the check and add user to sponsor organisation page displays the expected user details
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user added successful message on sponsor organisation user list page
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                ## disable user in the user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'View_Edit_User_Profile_Page'
                And I can see the view and edit user profile page of the sponsor organisation
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Disable_User_In_Sponsor_Organisation_Labels>' labels displayed in disable user in sponsor organisation confirmation page using the user name
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user in the selected sponsor organisation disabled successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                ## enable user in the user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'View_Edit_User_Profile_Page'
                And I can see the view and edit user profile page of the sponsor organisation
                Then I can see the '<Enable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Enable_User_In_Sponsor_Organisation_Labels>' labels displayed in enable user in sponsor organisation confirmation page using the user name
                And I capture the page screenshot
                When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see a 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user in the selected sponsor organisation enabled successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                ## add a teardown step to selete this sponsor org from the database

                Examples:
                        | Setup_New_Sponsor_Organisation | Status_Enabled | Status_Disabled | RTS_API_Data         | RTS_Request                         | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Navigation_Link |
                        | Sponsor_Organisation_FortyTwo  | Enabled        | Disabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Back            |


        @EndToEndFlow @RegressionTestVerifyLastUpdatedAfterDisableEnableExistingSponsorOrgAndUser
        Scenario Outline: Verify that the user is able to perform: select an existing sponsor organisation, enable or disable the selected sponsor organisation, assign a user to the selected sponsor organisation, enable or disable a user within the sponsor organisation, and confirm that the 'Last Updated' field on the sponsor organisation profile page reflects these changes accurately
                ## search and select an existing sponsor organisation
                When I enter 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'previously added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                ## disable a sponsor organisation
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Disable_Sponsor_Organisation_Labels>' labels displayed in disable sponsor organisation confirmation page using the organisation name
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation disabled successful message on manage sponsor organisation page
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                When I enter 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' should be present in the list with '<Status_Disabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'previously added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                # validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Existing_Sponsor_Organisation>'
                And I capture the page screenshot
                ## enable a sponsor organisation
                Then I can see the '<Enable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Enable_Sponsor_Organisation_Labels>' labels displayed in enable sponsor organisation confirmation page using the organisation name
                And I capture the page screenshot
                When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see a 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation enabled successful message on manage sponsor organisation page
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                When I enter 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'CHESTERFIELD ROYAL HOSPITAL NHS FOUNDATION TRUST' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'previously added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Existing_Sponsor_Organisation>'
                And I capture the page screenshot
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'sponsor organisation' profile page
                And I capture the page screenshot
                #### user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                ## add user to sponsor organisation
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And the check and add user to sponsor organisation page displays the expected user details
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user added successful message on sponsor organisation user list page
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Existing_Sponsor_Organisation>'
                And I capture the page screenshot
                ## disable user in the user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'View_Edit_User_Profile_Page'
                And I can see the view and edit user profile page of the sponsor organisation
                Then I can see the '<Disable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Disable_User_In_Sponsor_Organisation_Labels>' labels displayed in disable user in sponsor organisation confirmation page using the user name
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user in the selected sponsor organisation disabled successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Existing_Sponsor_Organisation>'
                And I capture the page screenshot
                ## enable user in the user list page of the sponsor organisation
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I enter 'QA Automation' into the search field
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                Then I can see the 'View_Edit_User_Profile_Page'
                And I can see the view and edit user profile page of the sponsor organisation
                Then I can see the '<Enable_Label_Texts>' ui labels on the 'user in sponsor organisation' profile page
                And I capture the page screenshot
                When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                Then I can see a 'Confirm' button on the 'Confirmation_Page'
                And I validate '<Enable_User_In_Sponsor_Organisation_Labels>' labels displayed in enable user in sponsor organisation confirmation page using the user name
                And I capture the page screenshot
                When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
                And I capture the page screenshot
                Then I can see a 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Confirm' button on the 'Confirmation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user in the selected sponsor organisation enabled successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                When I click the 'Back_To_Sponsor_Organisation_Profile' link on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                And I now see the sponsor organisation profile page with the selected '<Existing_Sponsor_Organisation>'
                And I capture the page screenshot
                ## add a teardown step to selete this sponsor org from the database

                Examples:
                        | Existing_Sponsor_Organisation     | Status_Enabled | Status_Disabled | RTS_API_Data         | RTS_Request                         | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Navigation_Link |
                        | Existing_Sponsor_Organisation_One | Enabled        | Disabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Back            |



