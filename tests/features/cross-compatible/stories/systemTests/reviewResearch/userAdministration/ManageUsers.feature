@UserAdministration  @ManageReviewBodies @adminUser @SystemTest
Feature: HRAPROG-393- User Administration: Manage Review Bodies

    Background:
        When I click the 'Manage_Review_Bodies' link on the 'Home_Page' #done
        Then I can see the 'Manage_Review_Bodies_Page' #done
        When I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page' #done
        Then I can see the 'Add_New_Review_Body_Page' #done

    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body with valid data     
        When I fill the new review body page using '<Add_Review_Body>'  #done
        And I click the 'Complete' button on the 'Add_New_Review_Body_Page' #done
        # Then I can see the 'Check_And_Create_Review_Body_Page' page #or the below one is only reqd
        Then I can see the Check and create review body page for '<Add_Review_Body>' #done
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' #done
        # Then I can see the 'Create_Review_Body_Confirmation_Page' #or the below one is only reqd
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' #done
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page' #done
        Then I can see the 'Manage_Review_Bodies_Page' #done
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
        | Add_Review_Body                      |
        | Valid_Data_In_All_Fields             | 
        | Valid_Data_In_All_Mandatory_Fields   | 
    
    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body with real data      
        When I fill the new review body page using '<Add_Review_Body>'  #done
        And I click the 'Complete' button on the 'Add_New_Review_Body_Page' #done
        Then I can see the Check and create review body page for '<Add_Review_Body>' #done       
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' #done
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' #done
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page' #done
        Then I can see the 'Manage_Review_Bodies_Page' page #done
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'

        Examples:
        | Add_Review_Body |
        | Review_Body_HCRW_Data |
        | Review_Body_HSCNI_Data|
        

    @rsp-2570
    Scenario Outline: Verify the user is able to create a new review body and repeat the journey by clicking 'Add another review body'link from the Confirmation message screen   
       When I fill the new review body page using '<Add_Review_Body>'  #done
       And I click the 'Complete' button on the 'Add_New_Review_Body_Page' #done
       Then I can see the Check and create review body page for '<Add_Review_Body>' #done        
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' #done
        Then I can see the create Review body confirmation page for '<Add_Review_Body>' #done
        When I click the 'Add_Another_Review_Body' link on the 'Create_Review_Body_Confirmation_Page' #done
        Then I can see the 'Add_New_Review_Body_Page' #done
        When I fill the new review body page using '<Add_Another_Review_Body>' #done
        And I click the 'Complete' button on the 'Add_New_Review_Body_Page'
        Then I can see the Check and create review body page for '<Add_Another_Review_Body>' #done        
        And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' #done
        Then I can see the create Review body confirmation page for '<Add_Another_Review_Body>' #done
        When I click the 'Back_To_Manage_Review_Bodies' link on the 'Create_Review_Body_Confirmation_Page' #done
        Then I can see the 'Manage_Review_Bodies_Page' page #done
        Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
        And I can see the newly created 'review body' should be present in the list
        And I can see the status of the newly created 'review body' is 'active'
        
        Examples:
        | Add_Review_Body                      |Add_Another_Review_Body |                     
        | Valid_Data_In_All_Fields             | Valid_Data_In_All_Fields_Another|  
        | Valid_Data_In_All_Mandatory_Fields   |  Valid_Data_In_All_Mandatory_Fields_Another |     

    # Scenario Outline: Field Validation
        # When I fill the new review body section on the add a new review body page with '<Reviewbody_organisation_profile_data>'
        # Then I click 'Continue' button
        # Error message-Upon clicking Continue button if field validation fails

        # Field validation(Error message)-mandatory/optional, min/max ,datatype: 

        # Organisation Name- Varchar/ Text- 250 characters- Mandatory

        # Country-Checkbox -England/Northern Ireland/Scotland/Wales-Mandatory

        # Email address-Varchar/ Text-Mandatory-@ validation/Allow apostrophes

        # Description-Varchar/ Text-250 words-Optional 
        # Examples:
        #     | Reviewbody_organisation_profile_data |Error_Message|
        #     | Valid_Data_In_All_Fields             | An Error Occured|
        #     | Valid_Data_In_All_Mandatory_Fields   | An Error Occured|

    # Scenario Outline: Navigation of Back button    
        # Navigation of Back button in ‘Add a new review body’ page >> ‘Manage review bodies’ list page
        # Navigation of Back button in ‘Check and create review body’ page >> ‘Add a new review body’ page
        

    # Scenario Outline: Navigation on clicking ‘Change’ button in Review body details (against all the fields) 
        # Navigation of clicking ‘Change’ button in Review body details (against all the fields) >> ‘Add a new review body’ page
        # modify information in the create body >>entered info is updated
       


   