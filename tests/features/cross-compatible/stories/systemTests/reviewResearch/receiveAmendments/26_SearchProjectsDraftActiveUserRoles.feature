@ReceiveAmendments @SearchProjectRecordsSortFilter @SysAdminUser @SystemTest @rsp-5456 @TestApprovals @TestApprovalsSearch
Feature: Display project records on the Search Projects page status and roles

        @DraftStatusProjectSysAdmin @SearchProjectsTitleBackLinksNav
        Scenario: Verify that project records are displayed on the Search Projects page for System Administrators, when the status 'In draft'
                Verify back and short project title link navigation for search projects tasklist
                Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
                And I can see the my research projects page
                And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
                And I click the 'Start' button on the 'Create_Project_Record_Page'
                And I fill the unique iras id in project details iras page
                And I capture the page screenshot
                And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
                And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
                Then I can see the project identifiers page
                And I fill the project identifiers page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
                And I fill the project details title page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
                Then I fill the chief investigator page with 'Valid_Data_All_Fields'
                Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
                Then I fill the research locations page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Research_Locations_Page'
                Then I can see the review your answers page
                And I capture the page screenshot
                And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
                Then I can see the project status as 'Project_Status_Draft' on the project overview for unfinished project page
                And I capture the page screenshot
                And I capture the iras id of the recently added project with status as 'In draft'
                Given I have navigated to the 'Approvals_Page' as 'System_Admin'
                And I click the 'Search_Records' link on the 'Approvals_Page'
                And I capture the page screenshot
                And I can see the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                And I select the radio button for 'Project_Record' in the choose a record type to search page
                And I capture the page screenshot
                And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                Then I can see the 'Search_Projects_Page'
                And I fill the search input for searching 'project records' with 'Valid_Full_Iras_Id of recently added project' as the search query
                And I click the 'Search' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I can now see a table of search results for 'project records'
                And Each 'short project title' displayed on the 'Search_Projects_Page' is a link
                When I click a 'short project title' on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I can see the project overview page
                # When I click the 'Back' link on the 'Project_Overview_Page'
                # And I capture the page screenshot
                # Then I can see the 'Search_Projects_Page'
                # And I can now see a table of search results for 'project records'

        @ActiveStatusProjectSysAdminSWRWFCTeamManager
        Scenario Outline:Verify that project records are displayed on the Search Projects page for System Administrators, Team Managers, Workflow Coordinators, and Study-wide Reviewers when the status 'Active'
                Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
                And I can see the my research projects page
                And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
                And I click the 'Start' button on the 'Create_Project_Record_Page'
                And I fill the unique iras id in project details iras page
                And I capture the page screenshot
                And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
                And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
                Then I can see the project identifiers page
                And I fill the project identifiers page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
                And I fill the project details title page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
                Then I fill the chief investigator page with 'Valid_Data_All_Fields'
                Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
                Then I fill the research locations page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Research_Locations_Page'
                Then I can see the review your answers page
                And I capture the page screenshot
                When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
                Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
                Then I can see the project overview page
                And I capture the page screenshot
                And I capture the iras id of the recently added project with status as 'Active'
                Given I have navigated to the 'Approvals_Page' as '<User>'
                And I click the 'Search_Records' link on the 'Approvals_Page'
                And I capture the page screenshot
                And I can see the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                And I select the radio button for 'Project_Record' in the choose a record type to search page
                And I capture the page screenshot
                And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                Then I can see the 'Search_Projects_Page'
                And I fill the search input for searching 'project records' with 'Valid_Full_Iras_Id of recently added project' as the search query
                And I click the 'Search' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                And I can now see a table of search results for 'project records'
                And Each 'short project title' displayed on the 'Search_Projects_Page' is a link
                When I click a 'short project title' on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then I can see the project overview page
                # When I click the 'Back' link on the 'Project_Overview_Page'
                # And I capture the page screenshot
                # Then I can see the 'Search_Projects_Page'
                # And I can now see a table of search results for 'project records'

                Examples:
                        | User                 |
                        | System_Admin         |
                        | Studywide_Reviewer   |
                        | Team_Manager         |
                        | Workflow_Coordinator |

        @DraftStatusProjectSWRWFCTeamManager @PreProdIssue
        Scenario Outline: Verify that In draft project records are not displayed on the Search Projects page for TM, WFC, and SWR
                Given I have navigated to the 'My_Research_Page' as 'Applicant_User'
                And I can see the my research projects page
                And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
                And I click the 'Start' button on the 'Create_Project_Record_Page'
                And I fill the unique iras id in project details iras page
                And I capture the page screenshot
                And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
                And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
                Then I can see the project identifiers page
                And I fill the project identifiers page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
                And I fill the project details title page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
                Then I fill the chief investigator page with 'Valid_Data_All_Fields'
                Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
                Then I fill the research locations page with 'Valid_Data_All_Fields'
                When I click the 'Save_Continue' button on the 'Research_Locations_Page'
                Then I can see the review your answers page
                And I capture the page screenshot
                And I click the 'Save_For_Later' button on the 'Review_Your_Answers_Page'
                Then I can see the project status as 'Project_Status_Draft' on the project overview for unfinished project page
                And I capture the page screenshot
                And I capture the iras id of the recently added project with status as 'In draft'
                Given I have navigated to the 'Approvals_Page' as '<User>'
                And I click the 'Search_Records' link on the 'Approvals_Page'
                And I capture the page screenshot
                And I can see the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                And I select the radio button for 'Project_Record' in the choose a record type to search page
                And I capture the page screenshot
                And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
                And I capture the page screenshot
                Then I can see the 'Search_Projects_Page'
                And I fill the search input for searching 'project records' with 'Valid_Full_Iras_Id of recently added project' as the search query
                And I click the 'Search' button on the 'Search_Projects_Page'
                And I capture the page screenshot
                Then the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | User                 |
                        | Studywide_Reviewer   |
                        | Team_Manager         |
                        | Workflow_Coordinator |

