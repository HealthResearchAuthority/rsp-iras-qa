@UserAdministration  @ManageUsers @adminUser @SystemTest
Feature: HRAPROG-394- User Administration: Manage Users

    Background:
        # Given I have navigated to the 'Home_Page'
        Given I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'       
        Then I can see the Manage users list page        
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'       
        Then I can see the Add a new user profile page 
      
    @rsp-2827 @rsp-2827-create-user
    Scenario Outline: Verify the user is able to create a new user profile with valid data
        Then I can see the '<Validation_Text>' ui labels on the add a new user profile page for '<Role_Dropdown>'   
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page
        Then I can see previously saved values for '<Add_User_Profile>' displayed on the check and create user profile page      
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'        
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'        
        # "Back to Manage Users" in app, "Back to Manage users" in figma >>clarification needed ...>>>Back to manage users
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'       
        Then I can see the Manage users list page       
        And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with 'ACTIVE' status in the manage user page
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'              
        Then I can see the Manage users list page
        And I can see the list is sorted by default in the alphabetical order of the 'First Name'    
        
        Examples:
        | Add_User_Profile                                      |Validation_Text                    | Role_Dropdown|
        | Valid_Data_In_All_Fields_Role_Operations              | Label_Texts_Role_Operations       |Role_Operations|
        # | Valid_Data_In_All_Fields_Role_Reviewer                |Label_Texts_Role_Not_Operations    |Role_Not_Operations|
        # | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer      | Label_Texts_Role_Not_Operations   |Role_Not_Operations|
        # | Valid_Data_In_All_Mandatory_Fields_Role_Operations    | Label_Texts_Role_Operations       |  Role_Operations| 

        

    @rsp-2827
    Scenario Outline: Verify the user is able to create a new user profile and repeat the journey by clicking 'add another user' link from the Confirmation message screen   
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_User_Profile>'      
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'        
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        # "Back to Manage Users" in app, "Back to Manage users" in figma >>clarification needed ...>>>Back to manage users
        When I click the 'Add_another_user' link on the 'Create_User_Profile_Confirmation_Page' 
        Then I can see the Add a new user profile page       
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_Another_User_Profile>'      
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'        
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'       
        Then I can see the Manage users list page        
        And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with 'ACTIVE' status in the manage user page        
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'       
        Then I can see the Manage users list page
        And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with 'ACTIVE' status in the manage user page
         And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'       
        Then I can see the Manage users list page
        And I can see the list is sorted by default in the alphabetical order of the 'First Name' 
        
        Examples:
        | Add_User_Profile                                      |Add_Another_User_Profile                                           |                     
        | Valid_Data_In_All_Fields_Role_Operations              | Valid_Data_In_All_Fields_Role_Operations_Another                  |  
        | Valid_Data_In_All_Fields_Role_Reviewer                | Valid_Data_In_All_Fields_Role_Reviewer_Another                    |
        | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer      | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another          |
        | Valid_Data_In_All_Mandatory_Fields_Role_Operations    | Valid_Data_In_All_Mandatory_Fields_Role_Operations                |

    @rsp-2827
    Scenario: Verify the user can navigate from 'Add a new user profile' page by clicking 'Back' button 
        And I click the 'Back' button on the 'Create_User_Profile_Page'
        Then I can see the Manage users list page 

    @rsp-2827
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Back' button
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_User_Profile>' 
        And I click the 'Back' button on the 'Check_Create_User_Profile_Page' 
        Then I can see the Add user profile page for '<Add_User_Profile>'   
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_Another_User_Profile>'      
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'        
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'       
        Then I can see the Manage users list page               
        And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with 'ACTIVE' status in the manage user page        
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'       
        Then I can see the Manage users list page        
        And I can see the list is sorted by default in the alphabetical order of the 'First Name'         

        Examples:
        | Add_User_Profile                                      |Add_Another_User_Profile                                           |
        | Valid_Data_In_All_Fields_Role_Operations              | Valid_Data_In_All_Fields_Role_Operations_Another                  |  
        | Valid_Data_In_All_Fields_Role_Reviewer                | Valid_Data_In_All_Fields_Role_Reviewer_Another                    |
        | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer      | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another          |
        | Valid_Data_In_All_Mandatory_Fields_Role_Operations    | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another        |

    @rsp-2827
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Change' button against all the fields
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_User_Profile>' 
        When I click the 'Change' link against '<Field_Name>' on the 'Check_Create_User_Profile_Page'
        Then I can see the Add user profile page for '<Add_User_Profile>'
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the Check and create user profile page for '<Add_Another_User_Profile>'      
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'        
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'       
        Then I can see the Manage users list page            
        And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with 'ACTIVE' status in the manage user page        
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Home_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'       
        Then I can see the Manage users list page        
        And I can see the list is sorted by default in the alphabetical order of the 'First Name'
        
        Examples:
        | Add_User_Profile                                     |Field_Name          | Add_Another_User_Profile                         |
        | Valid_Data_In_All_Fields_Role_Operations             |Title               | Valid_Data_In_All_Fields_Role_Operations_Another |
        | Valid_Data_In_All_Fields_Role_Operations             |First name          | Valid_Data_In_All_Fields_Role_Operations_Another |
        | Valid_Data_In_All_Fields_Role_Operations             |Last name           | Valid_Data_In_All_Fields_Role_Operations_Another |    
        | Valid_Data_In_All_Fields_Role_Operations             |Email address       | Valid_Data_In_All_Fields_Role_Operations_Another |  
        | Valid_Data_In_All_Fields_Role_Operations             |Telephone           | Valid_Data_In_All_Fields_Role_Operations_Another |  
        | Valid_Data_In_All_Fields_Role_Operations             |Organisation        | Valid_Data_In_All_Fields_Role_Operations_Another |  
        | Valid_Data_In_All_Fields_Role_Operations             |Job title           | Valid_Data_In_All_Fields_Role_Operations_Another |
        | Valid_Data_In_All_Fields_Role_Operations             |Role                | Valid_Data_In_All_Fields_Role_Operations_Another |
        | Valid_Data_In_All_Fields_Role_Reviewer               |Title               | Valid_Data_In_All_Fields_Role_Reviewer_Another   |
        | Valid_Data_In_All_Fields_Role_Reviewer               |First name          | Valid_Data_In_All_Fields_Role_Reviewer_Another   |
        | Valid_Data_In_All_Fields_Role_Reviewer               |Last name           | Valid_Data_In_All_Fields_Role_Reviewer_Another   |    
        | Valid_Data_In_All_Fields_Role_Reviewer               |Email address       | Valid_Data_In_All_Fields_Role_Reviewer_Another   |  
        | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer     |Telephone           | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |  
        | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer     |Organisation        | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |  
        | Valid_Data_In_All_Mandatory_Fields_Role_Operations   |Job title           | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another |
        | Valid_Data_In_All_Mandatory_Fields_Role_Operations   |Role                | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another |
    
    @rsp-2827-pending
    Scenario Outline: Field Validation with minimum and maximum characters in Organisation Name and Description
        When I fill the new review body page using '<Add_Review_Body>'  #done
        And I click the 'Complete' button on the 'Create_Review_Body_Page' #done
        Then I can see the Check and create review body page for '<Add_Review_Body>' #done     
        
        Examples:
        | Add_User_Profile                                   |     
        | Organisation_Name_Field_Min_Data                  | 
        | Organisation_Name_Field_Max_Data                  |  
        | Organisation_Name_Field_between_Min_Max_Data      | 
        | Description_Field_Min_Data                        |  
        | Description_Field_Max_Data                        |   
        | Description_Field_between_Min_Max_Data            |   

    @rsp-2827-pending
    Scenario Outline: Field Validation and Error Message Validation
        When I fill the new review body page using '<Add_Review_Body>'  #done
        And I click the 'Complete' button on the 'Create_Review_Body_Page' #done
        Then I can see the error message against '<Field_Name>'      
        
        Examples:
        | Add_User_Profile                       |Field_Name          |
        | Missing_Data_All_Fields                |All_Mandatory       |
        | Missing_Data_All_Mandatory_Fields      |All_Mandatory       |
        | Missing_Data_Organisation_Name_Field   |Organisation_Name   |
        | Missing_Data_Country_Field             |Country             |
        | Missing_Data_Email_Address_Field       |Email_Address       | 
        | Invalid_Data_Organisation_Name_Field   |Organisation_Name   |  
        | Invalid_Data_Email_Address_Field       |Email_Address       | 
        | Invalid_Data_Description_Field         |Description         |  
       

    

        # Field validation(Error message)-mandatory/optional, min/max ,datatype: 

        # Title-Varchar/ Text-250 characters-Optional

        # First name-Varchar/ Text-250 characters-Mandatory

        # Last name-Varchar/ Text-250 characters-Mandatory

        # Email address-Varchar/ Text-Mandatory-@ validation/Allow all special characters

        # Telephone-Integer/ Numerical-11-Optional

        # Organisation-Varchar/ Text-250 characters-Optional

        # Job title-Varchar/ Text-250 characters-Optional

        # Role -Drop down-Operations-Optional-System user roles

        # Committee-Drop down-Optional-If the role operations is selected the user is presented with this field

        # Country-Checkbox-England/Northern Ireland/Scotland/Wales -Mandatory-If the role operations is selected the user is presented with this field

        # Access required-Checkbox-Study wide review/Research Ethics Committee/CAG/Technical Assurance-Mandatory-If the role operations is selected the user is presented with this field

        # Review body-Drop down-Optional-If the role operations is selected the user is presented with this field-Created review bodies will appear in the drop down

       
        

  
       


   