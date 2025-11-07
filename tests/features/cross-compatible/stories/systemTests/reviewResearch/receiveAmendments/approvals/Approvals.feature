@Approvals @SystemTest
Feature: My Account Home page - Approvals

    Background:
        Given I have navigated to the 'Home_Page'
        Given I can see project guidance text on the home_page
        Then I can see the my account home page
        And I can see a 'Approvals' link on the 'Home_Page'
        Then I capture the page screenshot
        When I click the 'Approvals' link on the 'Home_Page'
        Then I can see the approvals home page
        Then I capture the page screenshot

    @ApprovalsPage @SysAdminUser
    Scenario: Validate the approvals page when logged in as a system administrator and make sure the system administrator has access to the pages under approvals workspace
        And I can see a '<Sub_Heading>' link on the 'Approvals_Page'
        And I click the '<Sub_Heading>' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the '<Page>'
        When I click the 'Approvals' link in the breadcrumbs on the 'Search_Modifications_Page'
        Then I can see the approvals home page
        When I click the 'My_Account' link in the breadcrumbs on the 'Approvals_Page'
        When I click the 'Back' link on the 'Approvals_Page'
        Then I can see the 'Home_Page'
        Examples:
            | Sub_Heading            | Page                                |
            | Search_Records         | Choose_A_Record_Type_To_Search_Page |
            | Modifications_Tasklist | Modifications_Tasklist_Page         |
            | My_Tasklist            | My_Modifications_Tasklist_Page      |
            | Team_Manager_Dashboard | Team_Manager_Dashboard_Page         |

    @ApprovalsPage @StudyWideReviewer
    Scenario: Validate the approvals page when logged in as a study-wide reviewer and make sure the study-wide reviewer has access to the pages under approvals workspace
        And I cannot see a 'Modifications_Tasklist' link on the 'Approvals_Page'
        And I cannot see a 'Team_Manager_Dashboard' link on the 'Approvals_Page'
        And I can see a '<Sub_Heading>' link on the 'Approvals_Page'
        And I click the '<Sub_Heading>' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the '<Page>'
        When I click the 'Approvals' link in the breadcrumbs on the 'Search_Modifications_Page'
        Then I can see the approvals home page
        When I click the 'My_Account' link in the breadcrumbs on the 'Approvals_Page'
        When I click the 'Back' link on the 'Approvals_Page'
        Then I can see the 'Home_Page'
        Examples:
            | Sub_Heading    | Page                                |
            | Search_Records | Choose_A_Record_Type_To_Search_Page |
            | My_Tasklist    | My_Modifications_Tasklist_Page      |

    @ApprovalsPage @WorkFlowCoordinator
    Scenario: Validate the approvals page when logged in as a workflow coordinator and make sure the workflow coordinator has access to the pages under approvals workspace
        And I cannot see a 'My_Tasklist' link on the 'Approvals_Page'
        And I cannot see a 'Team_Manager_Dashboard' link on the 'Approvals_Page'
        And I can see a '<Sub_Heading>' link on the 'Approvals_Page'
        And I click the '<Sub_Heading>' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the '<Page>'
        When I click the 'Approvals' link in the breadcrumbs on the 'Search_Modifications_Page'
        Then I can see the approvals home page
        When I click the 'My_Account' link in the breadcrumbs on the 'Approvals_Page'
        When I click the 'Back' link on the 'Approvals_Page'
        Then I can see the 'Home_Page'
        Examples:
            | Sub_Heading            | Page                                |
            | Search_Records         | Choose_A_Record_Type_To_Search_Page |
            | Modifications_Tasklist | Modifications_Tasklist_Page         |

    @ApprovalsPage @TeamManager
    Scenario: Validate the approvals page when logged in as a team manager and make sure the team manager has access to the pages under approvals workspace
        And I cannot see a 'My_Tasklist' link on the 'Approvals_Page'
        And I cannot see a 'Modifications_Tasklist' link on the 'Approvals_Page'
        And I can see a '<Sub_Heading>' link on the 'Approvals_Page'
        And I click the '<Sub_Heading>' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the '<Page>'
        When I click the 'Approvals' link in the breadcrumbs on the 'Search_Modifications_Page'
        Then I can see the approvals home page
        When I click the 'My_Account' link in the breadcrumbs on the 'Approvals_Page'
        When I click the 'Back' link on the 'Approvals_Page'
        Then I can see the 'Home_Page'
        Examples:
            | Sub_Heading            | Page                                |
            | Search_Records         | Choose_A_Record_Type_To_Search_Page |
            | Team_Manager_Dashboard | Team_Manager_Dashboard_Page         |

    @NoRecordTypeSelectedError @TeamManager
    Scenario: Validate the display of validation error when no option is selected
        And I click the 'Search_Records' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the 'Choose_A_Record_Type_To_Search_Page'
        And I click the 'Next' button on the 'Choose_A_Record_Type_To_Search_Page'
        And I capture the page screenshot
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Choose_A_Record_Type_To_Search_Page'
        Examples:
            | Field_And_Summary_Error_Message |
            | No_Record_Type_Selected_Error   |