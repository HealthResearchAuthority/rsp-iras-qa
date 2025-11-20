@authSetup
Feature: Authenticate Test Users once only, before test run

  Scenario Outline: Login & Authenticate Test Users
    Given I have navigated to the 'Login_Page'
    When I login to the application as the '<User>'
    Then I can see the '<Page>'
    And I will store the '<User>' authentication state
    Examples:
      | User                    | Page      |
      | System_Admin            | Home_Page |
      | Applicant_User          | Home_Page |
      | Studywide_Reviewer      | Home_Page |
      | Studywide_Reviewer_NI   | Home_Page |
      | Studywide_Reviewer_S    | Home_Page |
      | Studywide_Reviewer_W    | Home_Page |
      | Team_Manager            | Home_Page |
      | Team_Manager_NI         | Home_Page |
      | Team_Manager_S          | Home_Page |
      | Team_Manager_W          | Home_Page |
      | Workflow_Coordinator    | Home_Page |
      | Workflow_Coordinator_NI | Home_Page |
      | Workflow_Coordinator_S  | Home_Page |
      | Workflow_Coordinator_W  | Home_Page |
      | Sponsor_User            | Home_Page |