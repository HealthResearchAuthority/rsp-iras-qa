@UserAdministration  @ManageReviewBodies
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    # Background:
    #     Given I have navigated to the 'Login_Page'
    #     When I login to the application as the 'Admin_User'
    #     Then I can see the 'System_Administration_Home_Page'
    #     And I will store the 'Admin_User' authentication state 

#  Login

# Landing page- ‘System administration’ Home page >>out of scope (covered in separate user story in future sprint)

# Navigate to ‘Manage review bodies’ list page by clicking 'Manage review bodies' hyperlink

# Navigate to ‘Add a new review body’ page on clicking ‘Add a new review body record’ from ‘Manage review bodies’ list page

# Field validation(Error message)-mandatory/optional, min/max ,datatype: 

# Organisation Name 

# Country

# Email address

# Description

# Navigation of Back button in ‘Add a new review body’ page >> ‘Manage review bodies’ list page

# Continue button

# Error message-Upon clicking Continue button if field validation fails

# No errors & Navigation-Upon clicking Continue button if successful field validation

# Review changes before creating the review body >> ‘Check and create review body’ page

# Edit any field before creating the review body

# clicking ‘Change’ button in Review body details (against all the fields)

# clicking Back button in ‘Check and create review body’ page

# Create new review body journey-1

# Upon clicking Continue button after filling all the mandatory fields correctly(no errors)

# By clicking create profile from ‘Check and create review body’ page

# Confirmation message - successful creation of the review body

# Navigate to ‘Manage review bodies’ list page on clicking ‘Back to Manage review bodies’ from the Confirmation message screen

# newly created review body should be present in the list >>Alphabetical order of ‘Organisation Name’

# newly created review body- ‘active’ status 

# Create new review body journey-2

# Upon clicking Continue button after filling all the mandatory fields correctly(no errors)

# By clicking create profile from ‘Check and create review body’ page

# Confirmation message - successful creation of the review body

# Add a new review body and repeat the journey by clicking ‘Add another review body’ from the Confirmation message screen

# Navigate to ‘Manage review bodies’ list page on clicking ‘Back to Manage review bodies’ from the Confirmation message screen

# newly created review body should be present in the list  >>Alphabetical order of ‘Organisation Name’

# newly created review body- ‘active’ status -Green background/font colour

# Validate screens-Header/Title/fields/contents

#  ‘Add a new review body’ page

# ‘Check and create review body’ page

# Confirmation message screen

    Scenario Outline: Create a new review body with valid data
        When I click the 'Manage review bodies' link on the 'System_Administration_Home_Page'
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

    Scenario Outline: Review bodies Search
        And I click on view list of review bodies
        And I can search review bodies by '<Search_keyword>'
        And I can see the search results
        And the results are sorted in '' order
        Examples:
            | Search_keyword |
            | reviewbody     |

    Scenario Outline: View review body organisation profile
        And I click on view list of review bodies
        And I can search review bodies by '<Search_keyword>'
        And I can see the search results
        And I navigate to View review body organisation profile page
        And I can see the review body organisation profile information using '<reviewbody_organisation_profile_data>'

        Examples:
            | Search_keyword | reviewbody_organisation_profile_data |
            | reviewbody     | reviewbody                           |

    Scenario Outline: Edit review body organisation profile
        And I click on view list of review bodies
        And I can search review bodies by '<Search_keyword>'
        And I can see the search results
        And I click on the '<reviewbody>'
        And I navigate to View review body organisation profile page
        And I can see the user profile information using '<reviewbody_organisation_profile_data>'
        And I can edit the user profile information using '<reviewbody_organisation_profile_data_edit>'
        And I click on 'Save' button
        Then I can see the '<Confirmation>' message
        And I navigate to list of review bodies page
        And I can see the edited review body is present

        Examples:
            | Search_keyword | reviewbody_organisation_profile_data | reviewbody_organisation_profile_data_edit | Confirmation                    |
            | reviewbody     | reviewbody                           | reviewbody_edit                           | reviewbody_edit_profile_success |

    Scenario Outline: Deactivate review body
        And I click on view list of review bodies
        And I can search review bodies by '<Search_keyword>'
        And I can see the search results
        And I click on the '<Username>'
        And I navigate to View review body organisation profile page
        And I can see the review body organisation profile information using '<reviewbody_organisation_profile_data>'
        And I click on 'Deactivate' button
        Then I can see the '<Confirmation>' message
        And I navigate to list of review body page
        And I can not find the deactivated review body is present

        Examples:
            | Search_keyword | reviewbody_organisation_profile_data | Confirmation          |
            | reviewbody     | reviewbody                           | Deactivate_reviewbody |

    Scenario Outline: View review body's audit log
        And I click on 'View review body's audit log'
        And I can see review body's audit log '<audit_log>'


        Examples:
            | audit_log            |
            | audit_log_reviewbody |



