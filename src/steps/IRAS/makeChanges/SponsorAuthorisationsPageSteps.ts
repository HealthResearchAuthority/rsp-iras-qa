import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the sponsor authorisations page', async ({ sponsorAuthorisationsPage }) => {
  await sponsorAuthorisationsPage.assertOnSponsorAuthorisationsPageTestData();
});

Then(
  'I can see the searched modification to be present in the list with {string} status in the sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage, commonItemsPage }, status: string) => {
    const modificationStatusForSponsor = await sponsorAuthorisationsPage.getModificationStatusForSponsor(status);
    const modificationID = await modificationsCommonPage.getModificationID();
    const foundRecords = await sponsorAuthorisationsPage.findmodification(
      commonItemsPage,
      modificationID,
      modificationStatusForSponsor
    );
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
  }
);

Then(
  'I click on the searched modification id from sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage }) => {
    const modificationID = await modificationsCommonPage.getModificationID();
    await sponsorAuthorisationsPage.page.getByText(modificationID, { exact: true }).click();
  }
);
