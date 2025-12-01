import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull, getAuthState } from '../../../../utils/UtilFunctions';
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
  'I validate that a modification summary is displayed on the review all changes page for {string}',
  async ({ reviewAllChangesPage }, modificationName) => {
    const dataset = reviewAllChangesPage.reviewAllChangesPageTestData.Modification_Details[modificationName].Summary;
    const expectedIrasId = dataset.iras_id;
    const actualIrasId = confirmStringNotNull(await reviewAllChangesPage.iras_id.textContent());
    const expectedShortProjectTitle = dataset.short_project_title;
    const actualShortProjectTitle = confirmStringNotNull(
      (await reviewAllChangesPage.short_project_title.textContent())?.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"')
    );
    const expectedModificationId = dataset.modification_id;
    const actualModificationId = confirmStringNotNull(await reviewAllChangesPage.modification_id.textContent());
    const expectedStatus = dataset.status;
    const actualStatus = confirmStringNotNull(await reviewAllChangesPage.status.textContent());
    expect(actualIrasId).toBe(expectedIrasId);
    expect(actualShortProjectTitle).toBe(expectedShortProjectTitle);
    expect(actualModificationId).toBe(expectedModificationId);
    expect(actualStatus).toBe(expectedStatus);
  }
);

Then(
  'I validate that a modification ranking is displayed on the review all changes page for {string}',
  async ({ reviewAllChangesPage }, modificationName) => {
    const dataset = reviewAllChangesPage.reviewAllChangesPageTestData.Modification_Details[modificationName].Ranking;
    await expect(reviewAllChangesPage.modification_ranking_heading).toBeVisible();
    const expectedModificationType = dataset.ranking_modification_type;
    const actualModificationType = confirmStringNotNull(
      await reviewAllChangesPage.ranking_modification_type.textContent()
    );
    const expectedRankingCategory = dataset.ranking_category;
    const actualRankingCategory = confirmStringNotNull(await reviewAllChangesPage.ranking_category.textContent());
    const expectedReviewType = dataset.ranking_review_type;
    const actualReviewType = confirmStringNotNull(await reviewAllChangesPage.ranking_review_type.textContent());
    expect(actualModificationType).toBe(expectedModificationType);
    expect(actualRankingCategory).toBe(expectedRankingCategory);
    expect(actualReviewType).toBe(expectedReviewType);
  }
);

Then(
  'I validate that a changes section is displayed on the review all changes page for {string}',
  async ({ reviewAllChangesPage }, modificationName: string) => {
    const dataset = reviewAllChangesPage.reviewAllChangesPageTestData.Modification_Details[modificationName].Changes;
    const expectedNoOfChanges: number = dataset.length;

    await expect(reviewAllChangesPage.changes_heading).toBeVisible();
    expect(expectedNoOfChanges).toBeGreaterThan(0);

    for (let index = 0; index < expectedNoOfChanges; index++) {
      const baseOneChangeIndex = index + 1;
      expect(reviewAllChangesPage.changes_section_card_heading.nth(index)).toHaveText(
        `${reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.changes_card_heading} ${baseOneChangeIndex} - ${dataset[index].change_title}`
      );
      const expectedEndDate = dataset[index].planned_end_date;
      const actualEndDate = confirmStringNotNull(await reviewAllChangesPage.planned_end_date.nth(index).textContent());
      const expectedWhichOrg = dataset[index].which_org_type_affected;
      const actualWhichOrg = confirmStringNotNull(
        await reviewAllChangesPage.which_org_type_affected.nth(index).textContent()
      );
      const expectedWhereOrg = dataset[index].where_org_affected;
      const actualWhereOrg = confirmStringNotNull(
        await reviewAllChangesPage.where_org_affected.nth(index).textContent()
      );
      const expectedWillOrg = dataset[index].will_org_affected;
      const actualWillOrg = confirmStringNotNull(await reviewAllChangesPage.will_org_affected.nth(index).textContent());
      const expectedWillRequire = dataset[index].will_require_resources;
      const actualWillRequire = confirmStringNotNull(
        await reviewAllChangesPage.will_require_resources.nth(index).textContent()
      );
      const expectedModType = dataset[index].changes_modification_type;
      const actualModType = confirmStringNotNull(
        await reviewAllChangesPage.changes_modification_type.nth(index).textContent()
      );
      const expectedCategory = dataset[index].changes_category;
      const actualCategory = confirmStringNotNull(await reviewAllChangesPage.changes_category.nth(index).textContent());
      const expectedRevType = dataset[index].changes_review_type;
      const actualRevType = confirmStringNotNull(
        await reviewAllChangesPage.changes_review_type.nth(index).textContent()
      );

      expect(actualEndDate).toBe(expectedEndDate);
      expect(actualWhichOrg).toBe(expectedWhichOrg);
      expect(actualWhereOrg).toBe(expectedWhereOrg);
      expect(actualWillOrg).toBe(expectedWillOrg);
      expect(actualWillRequire).toBe(expectedWillRequire);
      expect(actualModType).toBe(expectedModType);
      expect(actualCategory).toBe(expectedCategory);
      expect(actualRevType).toBe(expectedRevType);
    }
    // Mod Ranking has been updated can complete 5036, investigate team 1 ticket which has been delivered
  }
);

Then(
  'I validate that sponsor details are displayed on the review all changes page for {string}',
  async ({ reviewAllChangesPage }, modificationName: string) => {
    const dataset = reviewAllChangesPage.reviewAllChangesPageTestData.Modification_Details[modificationName].Sponsor;
    await expect(reviewAllChangesPage.sponsor_details_heading).toBeVisible();
    const expectedSponsorRef = dataset.sponsor_reference;
    const actualSponsorRef = confirmStringNotNull(await reviewAllChangesPage.sponsor_reference.textContent());
    const expectedSponsorDate = dataset.sponsor_date;
    const actualSponsorDate = confirmStringNotNull(await reviewAllChangesPage.sponsor_date.textContent());
    const expectedSumaryChanges = dataset.sponsor_summary_of_changes;
    const actualSumaryChanges = confirmStringNotNull(
      await reviewAllChangesPage.sponsor_summary_of_changes.textContent()
    );
    expect(actualSponsorRef).toBe(expectedSponsorRef);
    expect(actualSponsorDate).toBe(expectedSponsorDate);
    expect(actualSumaryChanges).toBe(expectedSumaryChanges);
  }
);

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
