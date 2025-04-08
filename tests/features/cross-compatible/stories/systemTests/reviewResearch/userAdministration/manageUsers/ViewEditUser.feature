# @UserAdministration  @EditViewUsers @adminUser @SystemTest
# Feature: HRAPROG-393- User Administration: Manage user profiles

#     @rsp-2830-view-user_operations
#     Scenario Outline: View User profile details for the user with role as Operations
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for '<View_User_Profile>' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         And I click the 'Back' button on the 'User_Profile_Page'
#         Then I can see the Manage users list page
#         And I click the 'Back' button on the 'Manage_Users_Page'
#         Then I have navigated to the 'Home_Page'

#         Examples:
#             | View_User_Profile             | Status   |
#             | Active_User_Role_Operations   | ACTIVE   |
#             | Disabled_User_Role_Operations | DISABLED |

#     @rsp-2830-view-user_reviewer
#     Scenario Outline: View User profile details for the user with role as reviewer
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for '<View_User_Profile>' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         And I click the 'Back' button on the 'User_Profile_Page'
#         Then I can see the Manage users list page
#         And I click the 'Back' button on the 'Manage_Users_Page'
#         Then I have navigated to the 'Home_Page'

#         Examples:
#             | View_User_Profile           | Status   |
#             | Active_User_Role_Reviewer   | ACTIVE   |
#             | Disabled_User_Role_Reviewer | DISABLED |







#     @rsp-2828-edit-user_demo
#     Scenario Outline: Successful user profile update with all fields for the user with role as Operations
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Before_Edit_User_Valid_Data' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         When I click the '<Edit_User_Valid_Data>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page
#         And I update user profile '<Edit_User_Profile_Fields>' on 'Edit_User_Profile_Page'
#         And I click the 'Save' button on the 'Edit_User_Profile_Page'
#         And I can see the view user profile details page for '<Status>' user
#         Then I can see the user profile '<Edit_User_Valid_Data>' is updated in user profile page
#         Examples:
#             | Edit_User_Valid_Data | User_Role  | Status |
#             | title_text           | Operations | ACTIVE |
#     # | first_name_text          | Operations | ACTIVE |
#     # | last_name_text           | Operations | ACTIVE |
#     # | email_address_text       | Operations | ACTIVE |
#     # | telephone_text           | Operations | ACTIVE |
#     # | organisation_text        | Operations | ACTIVE |
#     # | job_title_text           | Operations | ACTIVE |
#     # | role_dropdown            | Operations | ACTIVE |
#     # | country_checkbox         | Operations | ACTIVE |
#     # | access_required_checkbox | Operations | ACTIVE |



#     @rsp-2828-edit-user
#     Scenario Outline: Successful user profile update with all fields for the user with role as reviewer
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Valid_Data_In_All_Fields_Role_Operations' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page
#         When I click the '<Edit_User_Profile_Fields>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page

#         Examples:
#             | Edit_User_Valid_Data | User_Role  | Status |
#             | Title                | Operations | ACTIVE |
#             | First name           | Operations | ACTIVE |
#             | Last name            | Operations | ACTIVE |
#             | Email address        | Operations | ACTIVE |
#             | Telephone            | Operations | ACTIVE |
#             | Organisation         | Operations | ACTIVE |
#             | Job title            | Operations | ACTIVE |
#             | Role                 | Operations | ACTIVE |

#     @rsp-2828-edit-user
#     Scenario Outline: Successful user profile update with only mandatory fields for the user with role as reviewer
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Valid_Data_In_All_Fields_Role_Operations' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         When I click the '<Edit_User_Valid_Data>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page
#         And I clear optional fields in edit user profile page
#         And I update the mandatory fields '<Only_Mandatory_Fields>'
#         Examples:
#             | Only_Mandatory_Fields  | User_Role  | Status |
#             | Valid_Mandatory_Fields | Operations | ACTIVE |


#     @rsp-2828-edit-user
#     Scenario Outline:  Successful user profile update with only mandatory fields for the user with role as Operations
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Valid_Data_In_All_Fields_Role_Operations' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         When I click the '<Edit_User_Profile_Fields>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page

#         Examples:
#             | Edit_User_Profile_Fields | User_Role  | Status |
#             | Title                    | Operations | ACTIVE |
#             | First name               | Operations | ACTIVE |
#             | Last name                | Operations | ACTIVE |
#             | Email address            | Operations | ACTIVE |
#             | Telephone                | Operations | ACTIVE |
#             | Organisation             | Operations | ACTIVE |
#             | Job title                | Operations | ACTIVE |
#             | Role                     | Operations | ACTIVE |
#             | Committee                | Operations | ACTIVE |
#             | Country                  | Operations | ACTIVE |
#             | Review body              | Operations | ACTIVE |

#     @rsp-2828-edit-user
#     Scenario Outline:  Edit User profile email field validation with all valid email format
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Valid_Data_In_All_Fields_Role_Operations' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         When I click the '<Edit_User_Profile_Fields>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page

#         Examples:
#             | Edit_User_Profile_Fields | User_Role  | Status |
#             | Title                    | Operations | ACTIVE |


#     Scenario Outline:  Edit User profile field length validation
#         Given I have navigated to the 'Home_Page'
#         When I click the 'Manage_Users' link on the 'Home_Page'
#         Then I can see the Manage users list page
#         And I search and click on View_edit link for 'Valid_Data_In_All_Fields_Role_Operations' user with '<Status>' status from the manage user page
#         Then I can see the view user profile details page for '<Status>' user
#         When I click the '<Edit_User_Profile_Fields>' change link for '<User_Role>' on the user profile page
#         Then I can see the edit user profile page

#         Examples:
#             | Edit_User_Profile_Field | User_Profile_Data      | Max_Length_Error_Message | Status |
#             | Title                   | Excessive_Title_Length |                          |        |