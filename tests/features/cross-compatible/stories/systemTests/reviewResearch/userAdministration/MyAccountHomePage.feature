@HomePage @SystemTest
Feature: My Account Home page

  @rsp-3421 @MyAccountHomepage @SysAdminUser @rsp-4424
  Scenario: Validate the my account home page when logged in as a system administrator and make sure the system administrator has access to approvals workpace
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    And I cannot see a 'My_research' link on the 'Home_Page'
    Then I capture the page screenshot
    When I click the 'System_Administration' link on the 'Home_Page'
    Then I can see the system administration home page
    When I click the 'Back' link on the 'System_Administration_Page'
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

  @rsp-4422 @MyAccountHomepage @StudyWideReviewer
  Scenario: Validate the My Account Home page of studywide reviewer user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    And I cannot see a 'My_research' link on the 'Home_Page'
    And I cannot see a 'CAG_members' link on the 'Home_Page'
    And I cannot see a 'CAT' link on the 'Home_Page'
    And I cannot see a 'REC_members' link on the 'Home_Page'
    And I cannot see a 'System_Administration' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance_reviewers' link on the 'Home_Page'
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

  @rsp-4423 @MyAccountHomepage @TeamManager
  Scenario: Validate the My Account Home page of team manager user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    And I cannot see a 'My_research' link on the 'Home_Page'
    And I cannot see a 'CAG_members' link on the 'Home_Page'
    And I cannot see a 'CAT' link on the 'Home_Page'
    And I cannot see a 'REC_members' link on the 'Home_Page'
    And I cannot see a 'System_Administration' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance_reviewers' link on the 'Home_Page'
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

  @rsp-4488 @MyAccountHomepage @WorkFlowCoordinator
  Scenario: Validate the My Account Home page of workflow coordinator user accessing the approvals page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    And I cannot see a 'My_research' link on the 'Home_Page'
    And I cannot see a 'Member_management' link on the 'Home_Page'
    And I cannot see a 'CAG_members' link on the 'Home_Page'
    And I cannot see a 'CAT' link on the 'Home_Page'
    And I cannot see a 'REC_members' link on the 'Home_Page'
    And I cannot see a 'System_Administration' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance' link on the 'Home_Page'
    And I cannot see a 'Technical_Assurance_reviewers' link on the 'Home_Page'
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

  @rsp-3821 @rsp-4486 @MyAccountHomepage @rsp-4424 @rsp-4422 @rsp-4423 @rsp-4488 @ApplicantUser
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

  @rsp-3821 @rsp-4486 @MyAccountHomepage @rsp-4424 @rsp-4423 @rsp-4422 @rsp-4488 @ApplicantUser
  Scenario Outline: Validate the access of user role using url navigation
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User                 | Page                                     |
      | System_Admin         | System_Administration_Page               |
      | System_Admin         | My_Research_Access_Denied_Page           |
      # | System_Admin         | Sponsor_Access_Denied_Page                      |
      | Applicant_User       | Approvals_Access_Denied_Page             |
      | Applicant_User       | System_Administration_Access_Denied_Page |
      | Studywide_Reviewer   | System_Administration_Access_Denied_Page |
      | Studywide_Reviewer   | My_Research_Access_Denied_Page           |
      #| Studywide_Reviewer   | Sponsor_Access_Denied_Page                      |
      #| Studywide_Reviewer   | Cag_Members_Access_Denied_Page                  |
      #| Studywide_Reviewer   | Cat_Access_Denied_Page                          |
      #| Studywide_Reviewer   | Reg_Members_Access_Denied_Page                  |
      #| Studywide_Reviewer   | Technical_Assurence_Access_Denied_Page          |
      #| Studywide_Reviewer   | Technical_Assurence_Reviewers_Access_Denied_Page|
      | Team_Manager         | System_Administration_Access_Denied_Page |
      | Team_Manager         | My_Research_Access_Denied_Page           |
      #| Team_Manager         | Sponsor_Access_Denied_Page                      |
      #| Team_Manager         | Cag_Members_Access_Denied_Page                  |
      #| Team_Manager         | Cat_Access_Denied_Page                          |
      #| Team_Manager         | Reg_Members_Access_Denied_Page                  |
      #| Team_Manager         | Technical_Assurence_Access_Denied_Page          |
      #| Team_Manager         | Technical_Assurence_Reviewers_Access_Denied_Page|
      | Workflow_Coordinator | System_Administration_Access_Denied_Page |
      | Workflow_Coordinator | My_Research_Access_Denied_Page           |
#| Workflow_Coordinator | Sponsor_Access_Denied_Page                      |
#| Workflow_Coordinator | Cag_Members_Access_Denied_Page                  |
#| Workflow_Coordinator | Cat_Access_Denied_Page                          |
#| Workflow_Coordinator | Reg_Members_Access_Denied_Page                  |
#| Workflow_Coordinator | Technical_Assurence_Access_Denied_Page          |
#| Workflow_Coordinator | Technical_Assurence_Reviewers_Access_Denied_Page|
#| Workflow_Coordinator | Member_Management_Access_Denied_Page            |