import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);

Then('I can see the manage review bodies list page', async ({ manageReviewBodiesPage }) => {
  await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
});

Then(
  'I can see the review body for {string} is present in the list',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName(),
      true
    );
    const createdReviewBodyCountry = createdReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(createdReviewBodyRow).toHaveCount(1);
    await expect(createdReviewBodyCountry).toBeVisible();
  }
);

Then(
  'I can see the updated review body is present in the list with {string}',
  async ({ manageReviewBodiesPage, editReviewBodyPage }, datasetName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const updatedReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await editReviewBodyPage.getUniqueOrgName(),
      true
    );
    const updatedReviewBodyCountry = updatedReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(updatedReviewBodyRow).toHaveCount(1);
    await expect(updatedReviewBodyCountry).toBeVisible();
  }
);

Then(
  'I can see the status of the review body is {string}',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, status: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName(),
      true
    );
    if (status.toLowerCase() == ' disabled') {
      expect(createdReviewBodyRow.locator(manageReviewBodiesPage.statusCell)).toHaveText(dataset.disabled_status);
    } else {
      expect(createdReviewBodyRow.locator(manageReviewBodiesPage.statusCell)).toHaveText(dataset.enabled_status);
    }
  }
);

Then(
  'I select a {string} Review Body to View and Edit which is {string}',
  async ({ manageReviewBodiesPage }, orgNamePrefix: string, status: string) => {
    let statusText: string;
    if (status.toLowerCase() == 'active') {
      statusText = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enabled_status;
    } else {
      statusText = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.disabled_status;
    }
    const autoReviewBodyRows = await manageReviewBodiesPage.getRowByOrgName(orgNamePrefix, false);
    const selectedReviewBodyRow = autoReviewBodyRows
      .filter({
        has: manageReviewBodiesPage.statusCell.getByText(statusText),
      })
      .first();
    await selectedReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

When(
  'I search and click on view edit link of the newly created review body for {string} with {string} status from the manage review bodies page',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, userStatus: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const countryNames: string = dataset.country_checkbox.toString();
    const organisationName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.searchAndClickReviewBody(organisationName, countryNames, userStatus);
  }
);

When(
  'I search and click on view edit link of the disabled review body with {string} status from the manage review bodies page',
  async ({ manageReviewBodiesPage, reviewBodyProfilePage }, userStatus: string) => {
    const organisationName = await reviewBodyProfilePage.getOrgName();
    const countryNames: string[] = await reviewBodyProfilePage.getCountries();
    const countriesString: string = countryNames.join(', ');
    await manageReviewBodiesPage.searchAndClickReviewBody(organisationName, countriesString, userStatus);
  }
);

When(
  'I search and click on view edit link of the enabled review body with {string} status from the manage review bodies page',
  async ({ manageReviewBodiesPage, reviewBodyProfilePage }, userStatus: string) => {
    const organisationName = await reviewBodyProfilePage.getOrgName();
    const countryNames: string[] = await reviewBodyProfilePage.getCountries();
    const countriesString: string = countryNames.join(', ');
    await manageReviewBodiesPage.searchAndClickReviewBody(organisationName, countriesString, userStatus);
  }
);
