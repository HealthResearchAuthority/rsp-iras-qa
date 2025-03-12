@UserAdministration  @ManageReviewBodies
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    # Background:
    #     Given I have navigated to the 'Login_Page'
    #     When I login to the application as the 'Admin_User'
    #     Then I can see the 'System_Administration_Home_Page'
    #     And I will store the 'Admin_User' authentication state
        

    Scenario Outline: User logged in as System Administrator
        Given I have navigated to the 'Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'System administration Home_Page'
        And I will store the '<User>' authentication state
        Examples:
        | User       |
        | Admin_User |

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

    Scenario Outline: Create a new review body
        When I click the 'Add a new review body record' link on the 'Manage review Bodies page'
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



