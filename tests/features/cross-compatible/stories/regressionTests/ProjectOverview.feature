@RegressionProjectOverview @ApplicantUser
Feature: Create Amendment - Project Overview - Regression Tests

    @RegressionProjectOverviewTabs @rsp-4876 @rsp-5047 @rsp-5048 @rsp-5049 @rsp-5050 @KNOWN-DEFECT-RSP-5322
    Scenario Outline: Validate the expected data is available and displayed on the project overview page
        And I navigate to the project overview page of the '<Project_Name>' project
        And I capture the page screenshot
        And I can see the 'existing' project details on project overview page for '<Project_Name>'
        And I can see the project status for '<Project_Name>' displayed on the project overview page
        When I click the 'Project_Details' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I validate the 'existing' data for '<Project_Name>' is displayed in the project details tab of project overview page
        When I click the 'Project_Team' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I validate the 'existing' data for '<Project_Name>' is displayed in the project team tab of project overview page
        When I click the 'Research_Locations' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I validate the data for '<Project_Name>' is displayed in the research locations tab of project overview page
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I can see the 'Post_Approval_Tab' ui labels on the project overview page
        Examples:
            | Project_Name               |
            | Kilmarnock_Cancer_Research |
            | Swansea_ACL_Trials         |