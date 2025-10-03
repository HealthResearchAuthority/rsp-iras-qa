@ProjectOverview @ApplicantUser @SystemTest
Feature: Project Overview

    Background:
        Given I have navigated to the my research projects page
        And I can see the my research projects page

    @rsp-1864 @ProjectOverviewPage
    Scenario Outline: Verify user is able to click on the project link on my research page and able to navigate to project overview page
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        And I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        And I capture the page screenshot
        And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        Then I fill the key project roles page with 'Valid_Data_All_Fields'
        And I capture the page screenshot
        Then I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
        Then I fill the research locations page with '<Research_Project_Details>'
        And I capture the page screenshot
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        Then I can see the review your answers page
        And I capture the page screenshot
        When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        Then I can see the project overview page
        Given I have navigated to the 'Home_Page'
        And I can see the my account home page
        And I have navigated to the 'My_Research_Page'
        And I can see the 'My_Research_Page'
        And I can see the '<Validation_Text_Research>' ui labels on the my research project page
        And I capture the page screenshot
        And I click the '<Project_Details>' link on the my research page
        And I can see the project overview page
        And I capture the page screenshot
        And I can see the project details on project overview page for '<Project_Details>'
        And I can see the '<Validation_Text_Project>' ui labels on the project overview page
        And I validate the data displayed '<Project_Details>' in the project details tab of project overview page
        And I capture the page screenshot
        When I click the 'Key_Project_Roles' link on the 'Project_Overview_Page'
        And I can see the '<Key_Project_Roles_Details>' in the key project roles tab of project overview page
        And I capture the page screenshot
        Then I click the 'Research_Locations' link on the 'Project_Overview_Page'
        And I can see the '<Research_Locations_Details>' in the research locations tab of project overview page
        And I capture the page screenshot

        Examples:
            | Validation_Text_Research | Project_Details       | Research_Project_Details | Validation_Text_Project | Key_Project_Roles_Details | Research_Locations_Details               |
            | Label_Texts              | Valid_Data_All_Fields | Valid_Data_All_Fields    | Label_Texts             | Valid_Data_All_Fields     | Valid_Research_Locations_Details_Nhs     |
            | Label_Texts              | Valid_Data_All_Fields | Data_With_No_NHS_HSC     | Label_Texts             | Valid_Data_All_Fields     | Valid_Research_Locations_Details_Non_Nhs |

    @rsp-4876 @PostApprovalPage
    #The project and modifications were created manually and validations are for the specific project
    Scenario Outline: Validate the user is able to access the view the post approval details from the project overview page
        When I navigate to the project overview page of the 'Test_Project' project
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        And I can see the 'Label_Texts_Post_Approval' ui labels on the project overview page
        And I can see the status of modifications displayed is 'Modification_Status_Draft'

    @rsp-4876 @PostApprovalPageSort
    #The project and modifications were created manually and validations are for the specific project
    Scenario Outline: Validate the user is able to access the view the post approval details from the project overview page
        When I navigate to the project overview page of the 'Test_Project' project
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And the default page size should be 'twenty'
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Post_Approval_Page'
        Then I can see the modifications is sorted by 'ascending' order of the '<Sort_Field>'
        And I capture the page screenshot
        When I click the '<Sort_Button>' button on the 'Post_Approval_Page'
        Then I can see the modifications is sorted by 'descending' order of the '<Sort_Field>'
        And I capture the page screenshot

        Examples:
            | Sort_Button       | Sort_Field        |
            | Modification_Id   | modification id   |
            | Modification_Type | modification type |

    @rsp-4876 @PostApprovalPaginationFirstPage
    #The project and modifications were created manually and validations are for the specific project
    Scenario: Verify pagination in post approval page when user is on the first page
        When I navigate to the project overview page of the 'Test_Project' project
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Next' button will be 'available' to the user
        And the 'Previous' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Post_Approval_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Navigation_Method |
            | page number       |
            | next link         |

    @rsp-4876 @PostApprovalPaginationLastPage
    #The project and modifications were created manually and validations are for the specific project
    Scenario: Verify pagination in post approval page when user is on the last page
        When I navigate to the project overview page of the 'Test_Project' project
        And I capture the page screenshot
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        And the 'Previous' button will be 'available' to the user
        And the 'Next' button will be 'not available' to the user
        And I capture the page screenshot
        Then I sequentially navigate through each 'Post_Approval_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

        Examples:
            | Navigation_Method |
            | page number       |
            | previous link     |

