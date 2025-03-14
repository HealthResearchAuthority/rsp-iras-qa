@UserAdministration  @ManageReviewBodies
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    Scenario Outline: Create a new review body with valid data
        When I click the 'Manage review bodies' link on the 'Home_Page'
        Then I can see the 'Manage review Bodies' page
        When I click the 'Add a new review body record' link on the 'Manage review Bodies page'
        Then I can see the 'Add_new_review_body_Page' 
        # When I fill the project information section on the project details page with '<Project_Information>'
        When I fill the new review body section on the add a new review body page with '<Reviewbody_organisation_profile_data>'
        And I click the 'Complete' button on the 'Add_new_review_body_Page'
        Then I can see the 'Check and Create review body' page
        And I click the 'Create Profile' button on the 'Add_new_review_body_Page'
        Then I can see the 'Create_review_body_confirmation' page
        When I click the 'Back to Manage review bodies' link on the 'Create_review_body_confirmation page'
        Then I can see the 'Manage review Bodies' page
        # newly created review body should be present in the list >>Alphabetical order of ‘Organisation Name’
        # newly created review body- ‘active’ status 
        Examples:
        | Reviewbody_organisation_profile_data |
        | Valid_Data_In_All_Fields             | 
        | Valid_Data_In_All_Mandatory_Fields   |     



# Navigation of Back button in ‘Add a new review body’ page >> ‘Manage review bodies’ list page
        # And I fill the all the mandatory fields and click on 'Complete' button
        #     - Organisation Name -text box, mandatory
        #     - Country – check box, mandatory
        #     - Email address – text, mandatory
        Then I can see the 'Check and Create review body' page and click on 'Create Profile' button
        And I can see the confirmation message 'Review body has been successfully added'

        And I click on 'Add new review body' button
        And I fill review body organisation profile information using '<reviewbody_organisation_profile_data>'
        And I click on 'Save' button
        Then I can see the 'confirmation' message
        And I navigate to list of review bodies page
        And I can see the new review body is present

        Examples:
            | reviewbody_organisation_profile_data |
            | reviewbody                           |
    
    Scenario Outline: View list of review bodies
        When I click the 'Manage review bodies' link on the 'System_Administration_Home_Page'
        Then I can see the 'Manage review Bodies' page
        And I click on view list of review bodies
        And I can see list of review bodies by '<filter_by>'
        Examples:
            | filter_by  |
            | reviewbody |

   