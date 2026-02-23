@RegressionManageSponsorOrganisations @SysAdminUser @UserAdministration @BackStage @ManageSponsorOrgs @SetupNewSponsorOrgGoLive
Feature: Manage sponsor organisations

        Background:
                Given I have navigated to the 'System_Administration_Page'
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                Then I can see the 'Manage_Sponsor_Organisations_Page'

        @RegressionTestVerifyLastUpdatedAfterSetupDisableEnableSponsorOrgAndUser @SetupNewSponsorOrg
        Scenario Outline: Verify that the user is able to perform: add a sponsor organisation, enable or disable a sponsor organisation, assign a user to a selected sponsor organisation, enable or disable a user within the sponsor organisation, and confirm that the 'Last Updated' field on the sponsor organisation profile page reflects these changes accurately
                ## set up a new sponsor organisation
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                Then I can see the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                When I select a sponsor organisation in the set up a new sponsor organisation page using '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
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
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
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
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
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
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
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
                When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
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
                Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
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
                Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected '<Setup_New_Sponsor_Organisation>'
                And I capture the page screenshot
                Examples:
                        | Setup_New_Sponsor_Organisation | Status_Enabled | Status_Disabled | RTS_API_Data         | RTS_Request                         | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Navigation_Link |
                        | Sponsor_Organisation_Unused    | Enabled        | Disabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Back            |


        @RegressionTestVerifyLastUpdatedAfterDisableEnableExistingSponsorOrgAndUser
        Scenario Outline: Verify that the user is able to perform: select an existing sponsor organisation, enable or disable the selected sponsor organisation, assign a user to the selected sponsor organisation, enable or disable a user within the sponsor organisation, and confirm that the 'Last Updated' field on the sponsor organisation profile page reflects these changes accurately
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                Then I click the view edit link of the 'newly added sponsor organisation'
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
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                Then the system displays 'sponsor organisations' matching the search criteria
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Disabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected 'Sponsor_Organisation_UniversityOfSouthampton'
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
                # And I now see the sponsor organisation profile page with the selected 'Sponsor_Organisation_UniversityOfSouthampton'
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
                When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected 'Sponsor_Organisation_UniversityOfSouthampton'
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
                Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                And I capture the page screenshot
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected 'Sponsor_Organisation_UniversityOfSouthampton'
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
                Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
                And I capture the page screenshot
                Then I can see the 'Sponsor_Org_User_List_Page'
                Then I can see the user list page of the 'sponsor organisation'
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Sponsor_Org_User_List_Page'
                And I can see the sponsor organisation profile page
                ## validate sponsor organisation profile page with the selected sponsor organisation and last updated date
                # And I now see the sponsor organisation profile page with the selected 'Sponsor_Organisation_UniversityOfSouthampton'
                And I capture the page screenshot

                Examples:
                        | Existing_Sponsor_Organisation     | Status_Enabled | Status_Disabled | RTS_API_Data         | RTS_Request                         | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Navigation_Link |
                        | Existing_Sponsor_Organisation_One | Enabled        | Disabled        | RTS_NIHR_FHIR_Config | RTS_Active_Sponsor_Organisation_NHS | Disable_Label_Texts | Disable_Sponsor_Organisation_Labels | Enable_Label_Texts | Enable_Sponsor_Organisation_Labels | Disable_User_In_Sponsor_Organisation_Labels | Enable_User_In_Sponsor_Organisation_Labels | Back            |

        @rsp-6803 @PreventAddingDisabledUsersToSponsorOrgs
        Scenario Outline: Verify the user can't add a disabled user to a sponsor organisation from manage sponsor organisation user list page
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'QA Automation' into the search field
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I enter the 'Email_Address' of the 'First' item in the list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then the system displays user records matching the search criteria
                And I capture the page screenshot
                And I capture the email address of the user in the system for later use
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                And I capture the page screenshot
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the 'sponsor organisation'
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                And I can see the search for user to add to sponsor organisation page
                And I capture the page screenshot
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I can see that the add users to 'sponsor organisation' search page contains 'Results'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                Then I validate '<Summary_Error_Message>' displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in 'My_Organisations_Users_Add_User_Page' for the selected sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton'
                And I capture the page screenshot
                Examples:
                        | Add_User_Profile                                  | Disable_Label_Texts | Disable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active | Advanced_Filters_Users_Disabled | Summary_Error_Message     |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Applicant | Disable_Label_Texts | Disable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Status_Active | Advanced_Filter_Status_Disabled | Disabled_User_Email_Error |

        @rsp-6803 @PreventAddingDisabledUsersToSponsorOrgs
        Scenario Outline: Verify the user can't add a disabled user to a sponsor organisation from sponsor workspace manage sponsor organisation user list page
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'QA Automation' into the search field
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I enter the 'Email_Address' of the 'First' item in the list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then the system displays user records matching the search criteria
                And I capture the page screenshot
                And I capture the email address of the user in the system for later use
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                And I capture the page screenshot
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the 'sponsor organisation'
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                And I can see the search for user to add to sponsor organisation page
                And I capture the page screenshot
                When I enter 'sponsor org admin email' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the add user role page
                When I fill the add user role page using 'Sponsor_Org_User_Role_Org_Admin'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                And I can see the add user permission page based on 'No_Permission_To_Select'
                When I fill the add user permission page using 'No_Permission_To_Select'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'No_Permission_To_Select'
                And I capture the page screenshot
                And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'University of Southampton' and 'No_Permission_To_Select'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                And I capture the page screenshot
                When I have navigated to the 'Home_Page' as 'Sponsor_Org_Admin_User'
                Then I click the 'Sponsor' link on the 'Home_Page'
                And I can see the sponsor workspace page
                Then I capture the page screenshot
                And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
                And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
                And I capture the page screenshot
                Then I can see the my organisations page
                And I can see the 'My_Organisations_Table' ui labels on the my organisations page
                And I can now see a table of results for my organisations
                When I enter 'University of Southampton' into the search field
                Then I click the 'Search' button on the 'My_Organisations_Page'
                And I capture the page screenshot
                And I click the 'Manage' link on the 'My_Organisations_Page'
                And I capture the page screenshot
                And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
                And I capture the page screenshot
                Then I click the 'Add_User' button on the 'My_Organisations_Users_Page'
                And I capture the page screenshot
                When I fill the add user page using 'Name_Of_Disabled_User_In_The_System'
                And I capture the page screenshot
                Then I click the 'Save_Continue' button on the 'My_Organisations_Users_Add_User_Page'
                And I capture the page screenshot
                Then I validate '<Summary_Error_Message>' displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in 'My_Organisations_Users_Add_User_Page' for the selected sponsor organisation 'Sponsor_Organisation_UniversityOfSouthampton'

                Examples:
                        | Add_User_Profile                                  | Disable_Label_Texts | Disable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active | Advanced_Filters_Users_Disabled | Summary_Error_Message     |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Applicant | Disable_Label_Texts | Disable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Status_Active | Advanced_Filter_Status_Disabled | Disabled_User_Email_Error |

        @rsp-6803 @AutoDisableSystemDisabledUsersInSponsorOrgs
        Scenario Outline: Verify the auto-disabling all active Sponsor org users when user is system-disabled in the system from manage sponsor organisation user list page
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'QAAutomation' into the search field
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I enter the 'Email_Address' of the 'First' item in the list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then the system displays user records matching the search criteria
                And I capture the page screenshot
                And I capture the email address of the user in the system for later use
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                And I capture the page screenshot
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                And I record the 'Sponsor_Organisation_Created' event for the user 'Blank_User_Details' to store the sponsor organisation audit history triggered by 'System_Admin'
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the 'sponsor organisation'
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                And I can see the search for user to add to sponsor organisation page
                And I capture the page screenshot
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I can see that the add users to 'sponsor organisation' search page contains 'Results'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                And I record the 'User_Added' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                And I record the 'User_Assigned_Sponsor' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                And I record the 'User_Assigned_Authoriser' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                Then I can see the user list page of the 'sponsor organisation'
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I click the view edit link against the user
                And I capture the page screenshot
                When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Disable' button on the 'Confirmation_Page'
                And I capture the page screenshot
                And I record the 'User_Disabled' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                And I capture the page screenshot
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the 'sponsor organisation'
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                And the system sets the users organisation membership status to 'Inactive'
                When I click the 'Sponsor_Organisation_Profile' link in the breadcrumbs on the 'Search_Add_User_Sponsor_Org_Page'
                And I click the 'View_This_Sponsor_Org_Audit_History' link on the 'Sponsor_Organisation_Profile_Page'
                Then I validate the audit history table for sponsor organisation
                Examples:
                        | Add_User_Profile                                  | Disable_Label_Texts | Disable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active | Advanced_Filters_Users_Disabled | Summary_Error_Message     |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Applicant | Disable_Label_Texts | Disable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Status_Active | Advanced_Filter_Status_Disabled | Disabled_User_Email_Error |

        @rsp-6803 @AutoDisableSystemDisabledUsersInSponsorOrgs
        Scenario Outline: Verify the auto-disabling all active Sponsor org users when user is system-disabled in the system from sponsor workspace manage sponsor organisation user list page
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'QAAutomation' into the search field
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
                And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                When I enter the 'Email_Address' of the 'First' item in the list, into the search field
                And I capture the page screenshot
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I capture the page screenshot
                Then the system displays user records matching the search criteria
                And I capture the page screenshot
                And I capture the email address of the user in the system for later use
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                And I capture the page screenshot
                And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
                And I capture the page screenshot
                Then I can see the 'Manage_Sponsor_Organisations_Page'
                And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
                When I select a sponsor organisation in the set up a new sponsor organisation page using 'Sponsor_Organisation_UniversityOfSouthampton'
                And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
                And I capture the page screenshot
                And I keep note of the organisation name for sponsor organisation setup
                When I click the 'Save_Profile' button on the 'Check_Setup_Sponsor_Organisation_Page'
                And I capture the page screenshot
                Then I can see the sponsor organisation added successful message on manage sponsor organisation page
                And I record the 'Sponsor_Organisation_Created' event for the user 'Blank_User_Details' to store the sponsor organisation audit history triggered by 'System_Admin'
                When I enter 'name of the newly added sponsor organisation' into the search field
                And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
                And I capture the page screenshot
                And I can see the 'newly added sponsor organisation' should be present in the list with '<Status_Enabled>' status in the manage sponsor organisation page
                And I capture the page screenshot
                Then I click the view edit link of the 'newly added sponsor organisation'
                And I capture the page screenshot
                And I can see the sponsor organisation profile page
                And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the user list page of the 'sponsor organisation'
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                And I can see the search for user to add to sponsor organisation page
                And I capture the page screenshot
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I can see that the add users to 'sponsor organisation' search page contains 'Results'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                When I fill the add user role page using 'Sponsor_Org_User_Role_Sponsor'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                When I fill the add user permission page using 'Sponsor_Authoriser_Yes'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'Sponsor_Authoriser_Yes'
                Then I can see the 'Check_Add_User_Sponsor_Org_Page'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the current time for 'Sponsor_Organisation_Profile_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                And I record the 'User_Added' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                And I record the 'User_Assigned_Sponsor' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                And I record the 'User_Assigned_Authoriser' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                Then I can see the user list page of the 'sponsor organisation'
                And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
                And I capture the page screenshot
                And I can see the search for user to add to sponsor organisation page
                And I capture the page screenshot
                When I enter 'sponsor org admin email' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the add user role page
                When I fill the add user role page using 'Sponsor_Org_User_Role_Org_Admin'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Role_Sponsor_Org_Page'
                And I capture the page screenshot
                And I can see the add user permission page based on 'No_Permission_To_Select'
                When I fill the add user permission page using 'No_Permission_To_Select'
                And I capture the page screenshot
                And I click the 'Save_Continue' button on the 'Add_User_Permission_Sponsor_Org_Page' based on 'No_Permission_To_Select'
                And I capture the page screenshot
                And the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation 'University of Southampton' and 'No_Permission_To_Select'
                And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                Then I can see the 'user added' successful message on sponsor organisation user list page
                And I capture the page screenshot
                Given I have navigated to the 'System_Administration_Page' as 'System_Admin'
                Then I can see the system administration home page
                When I click the 'Manage_Users' link on the 'System_Administration_Page'
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Manage_Users_Page'
                And I click the view edit link against the user
                And I capture the page screenshot
                When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
                And I capture the page screenshot
                When I click the 'Disable' button on the 'Confirmation_Page'
                And I capture the page screenshot
                And I record the 'User_Disabled' event for the user 'non_registered_user' to store the sponsor organisation audit history triggered by 'System_Admin'
                When I have navigated to the 'Home_Page' as 'Sponsor_Org_Admin_User'
                Then I click the 'Sponsor' link on the 'Home_Page'
                And I can see the sponsor workspace page
                Then I capture the page screenshot
                And I can see a 'My_Organisations' link on the 'Sponsor_Workspace_Page'
                And I click the 'My_Organisations' link on the 'Sponsor_Workspace_Page'
                And I capture the page screenshot
                Then I can see the my organisations page
                And I can see the 'My_Organisations_Table' ui labels on the my organisations page
                And I can now see a table of results for my organisations
                When I enter 'University of Southampton' into the search field
                Then I click the 'Search' button on the 'My_Organisations_Page'
                And I capture the page screenshot
                And I click the 'Manage' link on the 'My_Organisations_Page'
                And I capture the page screenshot
                And I click the 'Users' link on the 'My_Organisations_Sponsor_Org_Profile_Page'
                And I capture the page screenshot
                When I enter 'name of the user in the system' into the search field
                And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
                And I capture the page screenshot
                And the system sets the users organisation membership status to 'Inactive'
                When I click the 'Audit' link on the 'My_Organisations_Page'
                And I capture the page screenshot
                Then I validate the audit history table for sponsor organisation
                Examples:
                        | Add_User_Profile                                  | Disable_Label_Texts | Disable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active | Advanced_Filters_Users_Disabled | Summary_Error_Message     |
                        | Valid_Data_In_All_Mandatory_Fields_Role_Applicant | Disable_Label_Texts | Disable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Status_Active | Advanced_Filter_Status_Disabled | Disabled_User_Email_Error |



