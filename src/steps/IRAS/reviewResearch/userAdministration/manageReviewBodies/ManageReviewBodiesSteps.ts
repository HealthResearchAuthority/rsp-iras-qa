import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
// import * as fse from 'fs-extra';
import path from 'path';
import * as fse from 'fs-extra';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

const { When, Then } = createBdd(test);

Then('I can see the manage review bodies list page', async ({ manageReviewBodiesPage }) => {
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
  'I can see the newly created {string} should be present in the list',
  async ({ manageReviewBodiesPage }, reviewBody: string) => {
    //update
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(reviewBody);
  }
);
Then(
  'I can see the status of the newly created {string} is {string}',
  async ({ manageReviewBodiesPage }, reviewBody: string, isActive: string) => {
    //update
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(reviewBody);
    console.log(isActive);
  }
);

When(
  'I search and click on view edit link of the newly created review body for {string} with {string} status from the manage review bodies page',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, userStatus: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const countryNames: string = dataset.country_checkbox.toString();
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const orgName = data.Create_Review_Body.organisation_name_unique;
    await manageReviewBodiesPage.searchAndClickReviewBody(orgName, countryNames, userStatus);
  }
);
