import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect } from '@playwright/test';

const { Then } = createBdd(test);

Then('I can see the choose a record type to search page', async ({ chooseARecordTypeToSearchPage }) => {
  await chooseARecordTypeToSearchPage.assertOnChooseARecordTypeToSearchPage();
});

Then(
  'I select the radio button for {string} in the choose a record type to search page',
  async ({ chooseARecordTypeToSearchPage }, radioButtonValue: string) => {
    let recordType: string;
    if (radioButtonValue === 'Modification_Record') {
      recordType =
        chooseARecordTypeToSearchPage.chooseARecordTypeToSearchPageTestData.Choose_A_Record_Type_To_Search_Page
          .modification_record_label;
    } else {
      recordType =
        chooseARecordTypeToSearchPage.chooseARecordTypeToSearchPageTestData.Choose_A_Record_Type_To_Search_Page
          .project_record_label;
    }
    const locatorVal = await chooseARecordTypeToSearchPage.selectRecordTypeToSearch(recordType);
    await expect.soft(locatorVal).toBeChecked();
  }
);
