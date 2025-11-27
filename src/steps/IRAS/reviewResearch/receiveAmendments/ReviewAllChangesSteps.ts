import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { getAuthState } from '../../../../utils/UtilFunctions';
import { Locator } from '@playwright/test';
import * as fs from 'node:fs';

const { Given, When, Then } = createBdd(test);

Given(
  'I navigate to the review all changes page of the {string} modification',
  async ({ reviewAllChangesPage }, modificationName: string) => {
    await reviewAllChangesPage.gotoReviewAllChangesPage(modificationName);
    await reviewAllChangesPage.assertOnReviewAllChangesPage();
  }
);

When(
  'I navigate to the review all changes page of the {string} modification as a {string}',
  async ({ reviewAllChangesPage }, modificationName: string, user: string) => {
    const authStatePath = getAuthState(user);
    const authState = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
    await reviewAllChangesPage.page.context().addCookies(authState.cookies);
    await reviewAllChangesPage.gotoReviewAllChangesPage(modificationName);
    await reviewAllChangesPage.assertOnReviewAllChangesPage();
  }
);

Then('I can see the review all changes modifications page', async ({ reviewAllChangesPage }) => {
  await reviewAllChangesPage.assertOnReviewAllChangesPage();
});

Then(
  'I can see the {string} ui labels on the review all changes page',
  async ({ reviewAllChangesPage }, datasetName: string) => {
    const dataset = reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = reviewAllChangesPage[key];
        await expect(locator).toBeVisible();
      }
    }
  }
);
