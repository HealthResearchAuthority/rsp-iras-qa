# ASK ABOUT THESE OK TO DELETE??

# @UserAdministration  @ManageReviewBodies @adminUser @SystemTest
# Feature: HRAPROG-393- User Administration: Manage Review Bodies

#     Background:
#         When I click the 'Manage review bodies' link on the 'Home_Page'
#         Then I can see the 'Manage review Bodies' page
#         When I click the 'Add a new review body record' link on the 'Manage review Bodies page'
#         Then I can see the 'Add_new_review_body_Page'

#     @rsp-2570
#     Scenario Outline: Verify the user is able to create a new review body with valid data        
#         # When I fill the project information section on the project details page with '<Project_Information>'
#         When I fill the new review body page using '<Add_Review_Body>'
#         And I click the 'Complete' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Check and Create review body' page
#         And I click the 'Create Profile' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Create_review_body_confirmation' page
#         When I click the 'Back to Manage review bodies' link on the 'Create_review_body_confirmation page'
#         Then I can see the 'Manage review Bodies' page
#         Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
#         And I can see the newly created 'review body' should be present in the list
#         And I can see the status of the newly created 'review body' is 'active'

#         Examples:
#         | Add_Review_Body                      |
#         | Valid_Data_In_All_Fields             | 
#         | Valid_Data_In_All_Mandatory_Fields   | 
    
#     @rsp-2570
#     Scenario Outline: Verify the user is able to create a new review body with real data        
#         # When I fill the project information section on the project details page with '<Project_Information>'
#         When I fill the new review body page using '<Add_Review_Body>'
#         And I click the 'Complete' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Check and Create review body' page
#         And I click the 'Create Profile' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Create_review_body_confirmation' page
#         When I click the 'Back to Manage review bodies' link on the 'Create_review_body_confirmation page'
#         Then I can see the 'Manage review Bodies' page
#         Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
#         And I can see the newly created 'review body' should be present in the list
#         And I can see the status of the newly created 'review body' is 'active'

#         Examples:
#         | Add_Review_Body |
#         | Review_Body_HCRW_Data |
#         | Review_Body_HSCNI_Data|
        

#     @rsp-2570
#     Scenario Outline: Verify the user is able to create a new review body and repeat the journey by clicking 'Add another review body'link from the Confirmation message screen   
#         # When I fill the project information section on the project details page with '<Project_Information>'
#         When I fill the new review body page using '<Add_Review_Body>'
#         And I click the 'Complete' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Check and Create review body' page
#         And I click the 'Create Profile' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Create_review_body_confirmation' page
#         When I click the 'Add another review body' link on the 'Create_review_body_confirmation page'
#         Then I can see the 'Add_new_review_body_Page'
#         When I fill the new review body page using '<Add_Another_Review_Body>'
#         And I click the 'Complete' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Check and Create review body' page
#         And I click the 'Create Profile' button on the 'Add_new_review_body_Page'
#         Then I can see the 'Create_review_body_confirmation' page
#         When I click the 'Back to Manage review bodies' link on the 'Create_review_body_confirmation page'
#         Then I can see the 'Manage review Bodies' page
#         Then I can see the list is sorted by default in the alphabetical order of 'Organisation Name'
#         And I can see the newly created 'review body' should be present in the list
#         And I can see the status of the newly created 'review body' is 'active'
        
#         Examples:
#         | Add_Review_Body                      |Add_Another_Review_Body |                     
#         | Valid_Data_In_All_Fields             | Valid_Data_In_All_Fields|  
#         | Valid_Data_In_All_Mandatory_Fields   |  Valid_Data_In_All_Mandatory_Fields |     

#     # Scenario Outline: Field Validation
#         # When I fill the new review body section on the add a new review body page with '<Reviewbody_organisation_profile_data>'
#         # Then I click 'Continue' button
#         # Error message-Upon clicking Continue button if field validation fails

#         # Field validation(Error message)-mandatory/optional, min/max ,datatype: 

#         # Organisation Name- Varchar/ Text- 250 characters- Mandatory

#         # Country-Checkbox -England/Northern Ireland/Scotland/Wales-Mandatory

#         # Email address-Varchar/ Text-Mandatory-@ validation/Allow apostrophes

#         # Description-Varchar/ Text-250 words-Optional 
#         # Examples:
#         #     | Reviewbody_organisation_profile_data |Error_Message|
#         #     | Valid_Data_In_All_Fields             | An Error Occured|
#         #     | Valid_Data_In_All_Mandatory_Fields   | An Error Occured|

#     # Scenario Outline: Navigation of Back button    
#         # Navigation of Back button in ‘Add a new review body’ page >> ‘Manage review bodies’ list page
#         # Navigation of Back button in ‘Check and create review body’ page >> ‘Add a new review body’ page

#     # Scenario Outline: Navigation on clicking ‘Change’ button in Review body details (against all the fields) 
#         # Navigation of clicking ‘Change’ button in Review body details (against all the fields) >> ‘Add a new review body’ page
#         # modify information in the create body >>enetered info
       


   