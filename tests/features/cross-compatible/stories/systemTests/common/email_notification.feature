Feature: A Demo feature to show how we can validate email notifications

  @rsp-2094
  Scenario Outline: Validate email notification - outlook
    And I login to the '<Email_Credentials>' email application
    And I validate the '<Contents>' in email notification

    Examples:
      | Email_Credentials | Contents     |
      | Microsoft_HRA     | Mail_Content |
