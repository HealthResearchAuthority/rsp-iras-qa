import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the review body for {string} is present in the list with {string} status',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, status: string) => {
    const reviewBodyStatus = await manageReviewBodiesPage.getReviewBodyStatus(status);
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const createdReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    const createdReviewBodyCountry = createdReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(createdReviewBodyRow).toHaveCount(1);
    await expect(createdReviewBodyCountry).toBeVisible();
    await manageReviewBodiesPage.setReviewBodyRow(createdReviewBodyRow);
  }
);
