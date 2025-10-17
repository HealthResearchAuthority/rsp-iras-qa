@PostApprovalPage @ApplicantUser @SystemTest @jsEnabled
Feature: Project Overview

    Background:
        Given I have navigated to the my research projects page
        And I can see the my research projects page
        And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
        When I click the 'Start' button on the 'Create_Project_Record_Page'
        And I fill the unique iras id in project details iras page
        When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
        Then I can see the project identifiers page
        Then I fill the project identifiers page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
        And I fill the project details title page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
        And I fill the chief investigator page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
        And I fill the research locations page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue' button on the 'Research_Locations_Page'
        And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
        Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
        Then I can see the project overview page
        #Modification creation
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
    #loop this for 5 times
    #And I create 'Multiple_Modifications' and click on save for later on the select area of change page
    # create 5 modifications for approved status

    # Examples:
    #     | Modifications          |
    #     | Multiple_Modifications |

    # @ValidateModificationStatusInDraftSaveForLater
    # Scenario Outline: Validate indraft modifications
    #     And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    #     And I can see the select area of change page
    #     And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
    #     And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    #     When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    #     # Then I can see the participating organisation page
    #     # And I click the 'Save_For_Later' button on the 'Participating_Organisations_Page'
    #     Then I can see the project overview page
    #     Then I can see the modification status as 'Modification_Status_Indraft_Blank_Submitted_Date' on the post approval page

    #     Examples:
    #         | Area_Of_Change             | Specific_Change                                            |
    #         | Participating_Organisation | Addition_Of_Sites_Option                                   |
    #         | Participating_Organisation | Early_Closure_Withdrawal_Of_Sites_Option                   |
    #         | Participating_Organisation | Addition_Of_Participant_Identification_Centres_Option      |
    #         | Participating_Organisation | Early_Closure_Of_Participant_Identification_Centres_Option |

    @rsp-4893 @ValidateNonReviewableModificationStatusesInDraftAndApproved @abc
    Scenario Outline: Validate modification status transition from in draft to approved for non reviewable modification
        And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
        And I can see the select area of change page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        And I create '<Changes>' for the created modification
        When I click the 'Save_For_Later' button on the 'Modification_Details_Page'
        Then I can see the project overview page
        And I capture the page screenshot
        Then I can see the modification progress saved successful message on project overview page
        Then I can see the modification status as 'Modification_Status_Indraft_Blank_Submitted_Date' on the post approval page
        And I click on the modification id hyperlink in the post approval tab
        And I can see the modifications details page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
        Then I can see the add sponsor reference page
        Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
        When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
        Then I can see the review all changes page
        And I validate the project information labels using 'Valid_Data_All_Fields' dataset displayed on modifications page
        Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
        Then I click the 'Submit_To_Regulator' button on the 'Modification_Sent_To_Sponsor_Page'
        Then I can see the project overview page
        When I click the 'Post_Approval' link on the 'Project_Overview_Page'
        And I capture the page screenshot
        Then I can see the modification status as 'Modification_Status_Approved' on the post approval page
        And I click on the modification id hyperlink in the post approval tab
        Then I can see the review all changes page
        And I validate the status 'Modification_Status_Approved' is displayed on modifications page
        And I capture the page screenshot

        Examples:
            | Changes                    |
            | Change_To_Planned_End_Date |