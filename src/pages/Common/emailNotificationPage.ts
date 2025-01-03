import { Page } from '@playwright/test';
import * as emailNotificationTestData from '../../resources/test_data/common/email_notification_data.json';

//Declare Page Objects
export default class EmailNotificationPage {
  readonly page: Page;
  readonly emailNotificationTestData: typeof emailNotificationTestData;
  emailDomainName: string;
  readonly userNameMicrosoftTextBox: string;
  readonly passwordMicrosoftTextBox: string;
  readonly submitMicrosoftButton: string;
  readonly emailSubjectMicrosoftListLabel: string;
  readonly emailMarkAsReadMicrosoftButton: string;
  readonly emailFromHeaderMicrosoftLabel: string;
  readonly emailSubjectHeaderMicrosoftLabel: string;
  readonly emailBodyMicrosoftLabel: string;
  emailPage: Page;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.emailNotificationTestData = emailNotificationTestData;

    //Locators
    this.userNameMicrosoftTextBox = 'input[type="email"]';
    this.passwordMicrosoftTextBox = 'input[type="password"]';
    this.submitMicrosoftButton = 'input[type="submit"]';
    this.emailSubjectMicrosoftListLabel = '//div[contains(@aria-label,"Unread")]/descendant::span[text()="%s"]';
    this.emailMarkAsReadMicrosoftButton = '//span[text()="Read / Unread"]';
    this.emailFromHeaderMicrosoftLabel = '//span[contains(@aria-label,"From")]/descendant::span';
    this.emailSubjectHeaderMicrosoftLabel = 'div[id="ConversationReadingPaneContainer"] div[role="heading"] span';
    this.emailBodyMicrosoftLabel = 'div[aria-label="Message body"]';
  }
}
