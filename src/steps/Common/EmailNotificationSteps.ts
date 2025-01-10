import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { chromium, expect } from '@playwright/test';
const { Then } = createBdd(test);
import { getDecryptedValue } from '../../utils/UtilFunctions';

Then(
  'I login to the {string} email application with {string} credentials',
  async ({ emailNotificationPage }, domainName: string, datasetName: string) => {
    const datasetParent = emailNotificationPage.emailNotificationTestData[domainName];
    const dataset = datasetParent[datasetName];
    const browser = await chromium.launch();
    const context = await browser.newContext({ javaScriptEnabled: true });
    emailNotificationPage.emailPage = await context.newPage();
    await emailNotificationPage.emailPage.goto(dataset.url);
    if (domainName.toLowerCase() === 'microsoft') {
      await emailNotificationPage.emailPage
        .locator(emailNotificationPage.userNameMicrosoftTextBox)
        .fill(dataset.username);
      await emailNotificationPage.emailPage.locator(emailNotificationPage.submitMicrosoftButton).click();
      await emailNotificationPage.emailPage
        .locator(emailNotificationPage.passwordMicrosoftTextBox)
        .fill(getDecryptedValue(eval(dataset.password)));
      await emailNotificationPage.emailPage.locator(emailNotificationPage.submitMicrosoftButton).click();
      await emailNotificationPage.emailPage.locator(emailNotificationPage.submitMicrosoftButton).click();
    }
  }
);

Then(
  'I validate the {string} on the {string} email',
  async ({ emailNotificationPage }, datasetName: string, domainName: string) => {
    const dataset = emailNotificationPage.emailNotificationTestData[datasetName];
    const fromAddressExpected = dataset.from;
    const emailSubjectExpected = dataset.subject;
    const emailBodyExpected = dataset.body;
    if (domainName.toLowerCase() === 'microsoft') {
      await emailNotificationPage.emailPage.locator(emailNotificationPage.filterMailButton).click();
      await emailNotificationPage.emailPage
        .locator(emailNotificationPage.unreadMenuFromfilterButton)
        .getByText('Unread')
        .click();
      await emailNotificationPage.emailPage
        .locator(emailNotificationPage.emailSubjectMicrosoftListLabel)
        .getByText(dataset.subject)
        .first()
        .click({ timeout: dataset.mail_timeout });
      await expect(
        emailNotificationPage.emailPage.locator(emailNotificationPage.emailFromHeaderMicrosoftLabel).first()
      ).toContainText(fromAddressExpected);
      await expect(
        emailNotificationPage.emailPage.locator(emailNotificationPage.emailSubjectHeaderMicrosoftLabel).first()
      ).toContainText(emailSubjectExpected);
      expect(
        await emailNotificationPage.emailPage
          .locator(emailNotificationPage.emailBodyMicrosoftLabel)
          .first()
          .textContent()
      ).toContain(emailBodyExpected);
      await emailNotificationPage.emailPage.locator(emailNotificationPage.emailMarkAsReadMicrosoftButton).click();
    }
  }
);
