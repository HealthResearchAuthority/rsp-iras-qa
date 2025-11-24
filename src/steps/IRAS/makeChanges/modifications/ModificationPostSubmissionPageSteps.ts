import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';

const { Then } = createBdd(test);

Then('I can see the modification post submission page', async ({ modificationPostSubmissionPage }) => {
  await modificationPostSubmissionPage.assertOnModificationPostSubmissionPage();
});

Then(
  'I can see the {string} ui labels on the modification post submission page',
  async ({ modificationPostSubmissionPage }, datasetName: string) => {
    const dataset =
      modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
        .documents_tab[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = modificationPostSubmissionPage[key];
        await expect(locator).toBeVisible();
      }
    }
  }
);

Then(
  'I can validate the {string} ui labels on the modification history page',
  async ({ modificationPostSubmissionPage }, datasetName: string) => {
    const dataset =
      modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
        .history_tab[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = modificationPostSubmissionPage[key];
        await expect(locator).toBeVisible();
      }
    }
  }
);

Then(
  'I can see the audit history for the {string} event with date and user details',
  async ({ modificationPostSubmissionPage, commonItemsPage }, eventName: string) => {
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await modificationPostSubmissionPage.getUpdatedTime();
    const rowIndex = Number.parseInt(
      modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
        .history_user_email.first_row_index,
      10
    );
    if (eventName === 'ModificationSentToSponsor') {
      const timeValues: any = auditLog.get('timeValues');
      const eventValues: any = auditLog.get('eventValues');
      const adminEmailValues: any = auditLog.get('adminEmailValues');
      expect.soft(timeValues[rowIndex]).toBe(timeExpected);
      expect
        .soft(eventValues[rowIndex])
        .toBe(
          modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
            .Modification_Send_To_sponsor.event_description_text
        );
      expect
        .soft(adminEmailValues[rowIndex])
        .toBe(
          modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
            .history_user_email.applicant_user_email_text
        );
    } else if (eventName === 'ModificationCreated') {
      const rowIndex = Number.parseInt(
        modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
          .history_user_email.second_row_index,
        10
      );
      const timeValues: any = auditLog.get('timeValues');
      const eventValues: any = auditLog.get('eventValues');
      const adminEmailValues: any = auditLog.get('adminEmailValues');
      expect.soft(timeValues[rowIndex]).toBe(timeExpected);
      expect
        .soft(eventValues[rowIndex])
        .toBe(
          modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
            .Create_Modification.event_description_text
        );
      expect
        .soft(adminEmailValues[rowIndex])
        .toBe(
          modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
            .history_user_email.applicant_user_email_text
        );
    }
  }
);
