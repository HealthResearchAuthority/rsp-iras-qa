import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the Manage review bodies list page', async ({ manageReviewBodiesPage }) => {
  await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
});

Then(
  'I can see the list is sorted by default in the alphabetical order of {string}',
  async ({ manageReviewBodiesPage }, fieldName: string) => {
    //Update RE-USE Tiji method
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(fieldName);
  }
);

Then(
  'I can see the review body for {string} is present in the list',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName()
    );
    const createdReviewBodyCountry = createdReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
    });
    expect(createdReviewBodyRow).toHaveCount(1);
    await expect(createdReviewBodyCountry).toBeVisible();
  }
);
Then(
  'I can see the status of the review body is {string}',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, status: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName()
    );
    if (status.toLowerCase() == ' disabled') {
      expect(createdReviewBodyRow.locator('td strong')).toHaveText(dataset.disabled_status);
    } else {
      expect(createdReviewBodyRow.locator('td strong')).toHaveText(dataset.enabled_status);
    }
  }
);
