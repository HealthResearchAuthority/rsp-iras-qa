@UserAdministration  @ManageReviewBodies @adminUser @SystemTest
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    Background:
        When I click the 'Manage_Review_Bodies' link on the 'Home_Page'        
        Then I can see the Manage review bodies list page 
        When I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'        
        Then I can see the Add a new review body page 

    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body with valid data     
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page'        
        Then I can see the Check and create review body page for '<Add_Review_Body>' 
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page'        
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' 
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Manage review bodies list page 
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
        | Add_Review_Body                      |
        | Valid_Data_In_All_Fields             | 
        | Valid_Data_In_All_Mandatory_Fields   | 
    
    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body with real data      
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Review_Body>'       
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' 
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' 
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Manage review bodies list page 
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
        | Add_Review_Body |
        | Review_Body_HCRW_Data |
        | Review_Body_HSCNI_Data|
        

    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body and repeat the journey by clicking 'add another review body' link from the Confirmation message screen   
       When I fill the new review body page using '<Add_Review_Body>'
       And I click the 'Complete' button on the 'Create_Review_Body_Page' 
       Then I can see the Check and create review body page for '<Add_Review_Body>'        
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' 
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' 
        When I click the 'Add_Another_Review_Body' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Add a new review body page 
        When I fill the new review body page using '<Add_Another_Review_Body>' 
        And I click the 'Complete' button on the 'Create_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>'        
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' 
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>' 
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Manage review bodies list page 
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'
        
        Examples:
        | Add_Review_Body                      |Add_Another_Review_Body |                     
        | Valid_Data_In_All_Fields             | Valid_Data_In_All_Fields_Another|  
        | Valid_Data_In_All_Mandatory_Fields   |  Valid_Data_In_All_Mandatory_Fields_Another | 

    @rsp-2570
    Scenario: Verify the user can navigate from 'Add a new review body' page by clicking 'Back' button 
        And I click the 'Back' button on the 'Create_Review_Body_Page' 
        Then I can see the Manage review bodies list page 

    @rsp-2570
    Scenario Outline: Verify the user can navigate from 'Check and create review body' page by clicking 'Back' button
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Review_Body>' 
        And I click the 'Back' button on the 'Check_Create_Review_Body_Page'        
        Then I can see the Add new review body page for '<Add_Review_Body>' 
        And I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>' 
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' 
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>' 
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Manage review bodies list page 

        Examples:
        | Add_Review_Body                      |Add_Another_Review_Body |
        | Valid_Data_In_All_Fields             | Valid_Data_In_All_Fields_Another|  

    @rsp-2570
    Scenario Outline: Verify the user can navigate from 'Check and create review body' page by clicking 'Change' button against all the fields
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Review_Body>' 
        When I click the 'Change' link against '<Field_Name>' on the 'Check_Create_Review_Body_Page' 
        Then I can see the Add new review body page for '<Add_Review_Body>' 
        And I fill the new review body page using '<Add_Another_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>' 
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' 
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>' 
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page'        
        Then I can see the Manage review bodies list page 
        
        Examples:
        | Add_Review_Body                      |Field_Name          | Add_Another_Review_Body         |
        | Valid_Data_In_All_Fields             |Organisation_Name   | Valid_Data_In_All_Fields_Another|
        | Valid_Data_In_All_Fields             |Country             | Valid_Data_In_All_Fields_Another|
        | Valid_Data_In_All_Fields             |Email_Address       | Valid_Data_In_All_Fields_Another|    
        | Valid_Data_In_All_Fields             |Description         | Valid_Data_In_All_Fields_Another|  
    
    @rsp-2570
    Scenario Outline: Field Validation with minimum and maximum characters in Organisation Name and Description
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the Check and create review body page for '<Add_Review_Body>'     
        
        Examples:
        | Add_Review_Body                                   |     
        | Organisation_Name_Field_Min_Data                  | 
        | Organisation_Name_Field_Max_Data                  |  
        | Organisation_Name_Field_between_Min_Max_Data      | 
        | Description_Field_Min_Data                        |  
        | Description_Field_Max_Data                        |   
        | Description_Field_between_Min_Max_Data            |   

    @rsp-2570
    Scenario Outline: Field Validation and Error Message Validation
        When I fill the new review body page using '<Add_Review_Body>'
        And I click the 'Complete' button on the 'Create_Review_Body_Page' 
        Then I can see the error message against '<Field_Name>'      
        
        Examples:
        | Add_Review_Body                       |Field_Name          |
        | Missing_Data_All_Fields               |All_Mandatory       |
        | Missing_Data_All_Mandatory_Fields     |All_Mandatory       |
        | Missing_Data_Organisation_Name_Field  |Organisation_Name   |
        | Missing_Data_Country_Field            |Country             |
        | Missing_Data_Email_Address_Field      |Email_Address       | 
        | Invalid_Data_Organisation_Name_Field  |Organisation_Name   |  
        | Invalid_Data_Email_Address_Field      |Email_Address       | 
        | Invalid_Data_Description_Field        |Description         |  
       

    

        # Field validation(Error message)-mandatory/optional, min/max ,datatype: 

        # Organisation Name- Varchar/ Text- 250 characters- Mandatory

        # Country-Checkbox -England/Northern Ireland/Scotland/Wales-Mandatory

        # Email address-Varchar/ Text-Mandatory-@ validation/Allow apostrophes

        # Description-Varchar/ Text-250 words-Optional 
        

  
       


   