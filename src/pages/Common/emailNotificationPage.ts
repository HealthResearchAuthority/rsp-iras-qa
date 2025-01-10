import { Page } from '@playwright/test';
import * as emailNotificationTestData from '../../resources/test_data/common/email_notification_data.json';

//Declare Page Objects
export default class EmailNotificationPage {
  emailPage: Page;
  readonly emailNotificationTestData: typeof emailNotificationTestData;
  readonly userNameMicrosoftTextBox: string;
  readonly passwordMicrosoftTextBox: string;
  readonly submitMicrosoftButton: string;
  readonly filterMailButton: string;
  readonly unreadMenuFromfilterButton: string;
  readonly emailSubjectMicrosoftListLabel: string;
  readonly emailMarkAsReadMicrosoftButton: string;
  readonly emailFromHeaderMicrosoftLabel: string;
  readonly emailSubjectHeaderMicrosoftLabel: string;
  readonly emailBodyMicrosoftLabel: string;

  //Initialize Page Objects
  constructor(emailPage: Page) {
    this.emailPage = emailPage;
    this.emailNotificationTestData = emailNotificationTestData;

    //Locators
    this.userNameMicrosoftTextBox = 'input[type="email"]';
    this.passwordMicrosoftTextBox = 'input[type="password"]';
    this.submitMicrosoftButton = 'input[type="submit"]';
    this.filterMailButton = 'button[id="mailListFilterMenu"]';
    this.unreadMenuFromfilterButton = 'span[class="UagSo"]';
    this.emailSubjectMicrosoftListLabel = 'span';
    this.emailMarkAsReadMicrosoftButton = 'span';
    this.emailFromHeaderMicrosoftLabel = 'span[class="OZZZK"]';
    this.emailSubjectHeaderMicrosoftLabel = 'span[class="JdFsz"]';
    this.emailBodyMicrosoftLabel = 'div[aria-label="Message body"]';
  }
}
