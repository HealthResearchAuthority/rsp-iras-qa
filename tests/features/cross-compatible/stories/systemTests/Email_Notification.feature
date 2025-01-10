Feature: A Demo feature to show how we can validate email notifications

  @rsp-2094
  Scenario Outline: Validate email notification - outlook
    And I login to the '<Domain>' email application with '<Email_Credentials>' credentials
    And I validate the '<Content>' on the '<Domain>' email

    Examples:
      | Domain    | Email_Credentials | Content      |
      | Microsoft | HRA               | Mail_Content |
