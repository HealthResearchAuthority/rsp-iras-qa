@HomePage @SystemTest
Feature: My Account Home page

  @rsp-3421 @MyAccountHomepage @SysAdminUser @rsp-4424 
  Scenario Outline: Validate the My Account Home page of system administrator user accessing the system administration page and approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the 'System_Administration' link on the 'Home_Page'
    Then I can see the system administration home page
    When I click the '<Navigation_Link>' link on the 'System_Administration_Page'
    Then I can see the my account home page
    When I click the 'Approvals' link on the 'Home_Page'
    Then I can see the approvals home page
    And  I click the 'Search' link on the 'Approvals_Page'
    Then I can see the 'Search_Modifications_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Search_Modifications_Page'
    Then I can see the approvals home page
    And I click the 'Modifications_Tasklist' link on the 'Approvals_Page'
    Then I can see the 'Modifications_Tasklist_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Modifications_Tasklist_Page'
    Then I can see the approvals home page
    When I click the 'Back' link on the 'Approvals_Page'
    Then I can see the 'Home_Page'
    Examples:
      | Validation_Text               | Navigation_Link |
      | Label_Texts_System_Admin_Role | Back            |

  @rsp-4422 @MyAccountHomepage @StudyWideReviewer 
  Scenario Outline: Validate the My Account Home page of studywide reviewer user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the 'Approvals' link on the 'Home_Page'
    Then I can see the approvals home page
    And  I click the 'Search' link on the 'Approvals_Page'
    Then I can see the 'Search_Modifications_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Search_Modifications_Page'
    Then I can see the approvals home page
    When I click the 'Back' link on the 'Approvals_Page'
    Then I can see the 'Home_Page'
    Examples:
      | Validation_Text                     | Navigation_Link |
      | Label_Texts_Studywide_Reviewer_Role | Back            |
  
  @rsp-4423 @MyAccountHomepage @TeamManager 
  Scenario Outline: Validate the My Account Home page of team manager user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the 'Approvals' link on the 'Home_Page'
    Then I can see the approvals home page
    And  I click the 'Search' link on the 'Approvals_Page'
    Then I can see the 'Search_Modifications_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Search_Modifications_Page'
    Then I can see the approvals home page
    When I click the 'Back' link on the 'Approvals_Page'
    Then I can see the 'Home_Page'
    Examples:
      | Validation_Text                     | Navigation_Link |
      | Label_Texts_Team_Manager_Role       | Back            |

  @rsp-4488 @MyAccountHomepage @WorkFlowCoordinator @Run
  Scenario Outline: Validate the My Account Home page of workflow coordinator user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the 'Approvals' link on the 'Home_Page'
    Then I can see the approvals home page
    And  I click the 'Search' link on the 'Approvals_Page'
    Then I can see the 'Search_Modifications_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Search_Modifications_Page'
    Then I can see the approvals home page
    And I click the 'Modifications_Tasklist' link on the 'Approvals_Page'
    Then I can see the 'Modifications_Tasklist_Page'
    Then I capture the page screenshot
    When I click the 'Back' link on the 'Modifications_Tasklist_Page'
    Then I can see the approvals home page
    When I click the 'Back' link on the 'Approvals_Page'
    Then I can see the 'Home_Page'
    Examples:
      | Validation_Text                       | Navigation_Link |
      | Label_Texts_Workflow_Coordinator_Role | Back            | 
 
  @rsp-3421 @rsp-4486 @MyAccountHomepage @ApplicantUser
  Scenario Outline: Validate the My Account Home page of front stage user
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_First>' link on the 'Home_Page'
    Then I can see the 'My_Research_Page'
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'My_Research_Page'
    Then I can see the my account home page
    Then I capture the page screenshot

    Examples:
      | Validation_Text                 | Navigation_Link_First | Navigation_Link |
      | Label_Texts_Applicant_User_Role | My_research           | Back            |

  @rsp-3821 @rsp-4486 @MyAccountHomepage @NoAuth @rsp-4424 @rsp-4422 @rsp-4423 @rsp-4488
  Scenario Outline: Validate the workspaces in my account home page for different user roles
    Given I have navigated to the 'Home_Page' as '<User>'
    Then I capture the page screenshot
    Then I can see the workspaces in my account home page for '<User>'
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Validation_Text                       |
      | System_Admin         | Label_Texts_System_Admin_Role         |
      | Applicant_User       | Label_Texts_Applicant_User_Role       |
      | Studywide_Reviewer   | Label_Texts_Studywide_Reviewer_Role   |
      | Team_Manager         | Label_Texts_Team_Manager_Role         |
      | Workflow_Coordinator | Label_Texts_Workflow_Coordinator_Role |

  @rsp-3821 @rsp-4486 @MyAccountHomepage @NoAuth @rsp-4424 @rsp-4423 @rsp-4422 @rsp4488
  Scenario Outline: Validate the access of user role using url navigation using url navigation
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Page                                     |
      | System_Admin         | System_Administration_Page               |
      | Applicant_User       | Approvals_Access_Denied_Page             |
      | Applicant_User       | System_Administration_Access_Denied_Page |
      | Studywide_Reviewer   | System_Administration_Access_Denied_Page |
      | Team_Manager         | System_Administration_Access_Denied_Page |
      | Workflow_Coordinator | System_Administration_Access_Denied_Page |
      
  @rsp-3821 @MyAccountHomepage @NoAuth @rsp-4424 @rsp-4423 @rsp-4422 @rsp4488
  Scenario Outline: Validate the access of system administration page and other user role using url navigation
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Page                                     |
      | System_Admin         | System_Administration_Page               |
      | Studywide_Reviewer   | System_Administration_Access_Denied_Page |
      | Team_Manager         | System_Administration_Access_Denied_Page |
      | Workflow_Coordinator | System_Administration_Access_Denied_Page |
      | Applicant_User       | System_Administration_Access_Denied_Page |
  
  @rsp-4424 @NoAuth
  Scenario Outline: Validate restricted access to myresearch and sponsor pages using url navigation for system admin role
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Page                                     |
      | System_Admin         | My_Research_Access_Denied_Page           |
    # | System_Admin         | Sponsor_Access_Denied_Page               |
      
  @rsp-4422 @NoAuth
  Scenario Outline: Validate restricted access for studywide reviewer role using url navigation 
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Page                                            |
      | Studywide_Reviewer   | My_Research_Access_Denied_Page                  |
      | Studywide_Reviewer   | System_Administration_Access_Denied_Page        |
     #| Studywide_Reviewer   | Sponsor_Access_Denied_Page                      |
     #| Studywide_Reviewer   | Cag_Members_Access_Denied_Page                  |
     #| Studywide_Reviewer   | Cat_Access_Denied_Page                          |
     #| Studywide_Reviewer   | Reg_Members_Access_Denied_Page                  | 
     #| Studywide_Reviewer   | Technical_Assurence_Access_Denied_Page          | 
     #| Studywide_Reviewer   | Technical_Assurence_Reviewers_Access_Denied_Page| 

  @rsp-4423 @NoAuth
  Scenario Outline: Validate restricted access for team manager role using url navigation 
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User           | Page                                            |
      | team_manager   | My_Research_Access_Denied_Page                  |
      | team_manager   | System_Administration_Access_Denied_Page        |
     #| team_manager   | Sponsor_Access_Denied_Page                      |
     #| team_manager   | Cag_Members_Access_Denied_Page                  |
     #| team_manager   | Cat_Access_Denied_Page                          |
     #| team_manager   | Reg_Members_Access_Denied_Page                  | 
     #| team_manager   | Technical_Assurence_Access_Denied_Page          | 
     #| team_manager   | Technical_Assurence_Reviewers_Access_Denied_Page| 

  @rsp-4488 @NoAuth
  Scenario Outline: Validate restricted access for workflow coordinator role using url navigation 
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                   | Page                                            |
      | Workflow_Coordinator   | My_Research_Access_Denied_Page                  |
      | Workflow_Coordinator   | System_Administration_Access_Denied_Page        |
     #| Workflow_Coordinator   | Sponsor_Access_Denied_Page                      |
     #| Workflow_Coordinator   | Cag_Members_Access_Denied_Page                  |
     #| Workflow_Coordinator   | Cat_Access_Denied_Page                          |
     #| Workflow_Coordinator   | Reg_Members_Access_Denied_Page                  | 
     #| Workflow_Coordinator   | Technical_Assurence_Access_Denied_Page          | 
     #| Workflow_Coordinator   | Technical_Assurence_Reviewers_Access_Denied_Page| 
     #| Workflow_Coordinator   | Member_Management_Access_Denied_Page            | 


