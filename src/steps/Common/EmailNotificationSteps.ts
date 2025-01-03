import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { chromium, expect } from '@playwright/test';
const { Then } = createBdd(test);
import { getDecryptedValue } from '../../utils/UtilFunctions';

Then('I login to the {string} email application', async ({ emailNotificationPage, browser }, datasetName: string) => {
  emailNotificationPage.emailDomainName = datasetName.replace(/_.*/, '');
  const emailDataSetName = datasetName.replace(/[^_]*_/, '');
  const datasetParent = emailNotificationPage.emailNotificationTestData[emailNotificationPage.emailDomainName];
  const dataset = datasetParent[emailDataSetName];
  browser = await chromium.launch();
  emailNotificationPage.emailPage = await browser.newPage();
  await emailNotificationPage.emailPage.goto(dataset.url);
  if (emailNotificationPage.emailDomainName.toLowerCase() === 'microsoft') {
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
});

Then('I validate the {string} in email notification', async ({ emailNotificationPage }, datasetName: string) => {
  const dataset = emailNotificationPage.emailNotificationTestData[datasetName];
  const fromAddressExpected = dataset.from;
  const emailSubjectExpected = dataset.subject;
  const emailBodyExpected = dataset.body;
  if (emailNotificationPage.emailDomainName.toLowerCase() === 'microsoft') {
    const emailSubjectLocatorString = emailNotificationPage.emailSubjectMicrosoftListLabel.replace(
      '%s',
      dataset.subject
    );
    await emailNotificationPage.emailPage
      .locator(emailSubjectLocatorString)
      .first()
      .click({ timeout: dataset.mail_timeout });
    await emailNotificationPage.emailPage.click(emailNotificationPage.emailMarkAsReadMicrosoftButton);
    await expect(
      emailNotificationPage.emailPage.locator(emailNotificationPage.emailFromHeaderMicrosoftLabel).first()
    ).toContainText(fromAddressExpected);
    await expect(
      emailNotificationPage.emailPage.locator(emailNotificationPage.emailSubjectHeaderMicrosoftLabel).first()
    ).toContainText(emailSubjectExpected);
    expect(
      await emailNotificationPage.emailPage.locator(emailNotificationPage.emailBodyMicrosoftLabel).first().textContent()
    ).toContain(emailBodyExpected);
  }
});
