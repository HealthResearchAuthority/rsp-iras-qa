@UserAdministration  @ManageUsers
Feature: HRAPROG-394- User Administration: Manage Users

    Scenario Outline: Login & Authenticate Admin User in UserAdministration Page
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        Examples:
            | User       |
            | Admin_User |

    Scenario Outline: Non-Admin User can't login into user administration page
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can not see the 'UserAdministration_Page'
        Examples:
            | User           |
            | Non-Admin_User |

    Scenario Outline: View list of users
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on view list of users
        And I can see list of users by '<filter_by>'
        Examples:
            | User       | filter_by |
            | Admin_User | UserList  |

    Scenario Outline: User Search
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on view list of users
        And I can search users by '<Search_keyword>'
        And I can see the search results
        And the results are sorted in '' order
        Examples:
            | User       | Search_keyword |
            | Admin_User | user_data      |

    Scenario Outline: Create a new user
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on 'Add new user' button
        And I fill user profile information using '<User_Profile_Data>'
        And I click on 'Save' button
        Then I can see the 'confirmation' message
        And I navigate to list of users page
        And I can see the new user is present

        Examples:
            | User       | User_Profile_Data |
            | Admin_User | Standard_User     |

    Scenario Outline: View user profile
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on view list of users
        And I can search users by '<Search_keyword>'
        And I can see the search results
        And I navigate to View user profile page
        And I can see the user profile information using '<User_Profile_Data>'

        Examples:
            | User       | Search_keyword | User_Profile_Data |
            | Admin_User | user_data      | Standard_User     |

    Scenario Outline: Edit user profile
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on view list of users
        And I can search users by '<Search_keyword>'
        And I can see the search results
        And I click on the '<Username>'
        And I navigate to View user profile page
        And I can see the user profile information using '<User_Profile_Data>'
        And I can edit the user profile information using '<User_Profile_Data_edit>'
        And I click on 'Save' button
        Then I can see the '<Confirmation>' message
        And I navigate to list of users page
        And I can see the edited user is present

        Examples:
            | User       | Search_keyword | User_Profile_Data | User_Profile_Data_edit | Confirmation      |
            | Admin_User | user_data      | Standard_User     | Standard_User_edit     | Edit_user_profile |

    Scenario Outline: Deactivate User
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on view list of users
        And I can search users by '<Search_keyword>'
        And I can see the search results
        And I click on the '<Username>'
        And I navigate to View user profile page
        And I can see the user profile information using '<User_Profile_Data>'
        And I click on 'Deactivate' button
        Then I can see the '<Confirmation>' message
        And I navigate to list of users page
        And I can not find the deactivated user is present

        Examples:
            | User       | Search_keyword | User_Profile_Data | Confirmation    |
            | Admin_User | user_data      | Standard_User     | Deactivate_user |

    Scenario Outline: View user's audit log
        Given I have navigated to the 'UserAdministration_Login_Page'
        When I login to the application as the '<User>'
        Then I can see the 'UserAdministration_Page'
        And I click on 'Manage Users'
        And I click on 'View user's audit log'
        And I can see user's audit log '<audit_log>'


        Examples:
            | User       | audit_log      |
            | Admin_User | audit_log_user |



