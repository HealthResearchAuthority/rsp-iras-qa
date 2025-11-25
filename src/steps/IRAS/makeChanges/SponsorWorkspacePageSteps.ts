import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the sponsor workspace page', async ({ sponsorWorkspacePage }) => {
  await sponsorWorkspacePage.assertOnSponsorWorkspacePage();
});

Then(
  'I can see the ui labels in sponsor workspace page',
  async ({ sponsorWorkspacePage, checkSetupSponsorOrganisationPage }) => {
    const authorisationsBodyLabel =
      sponsorWorkspacePage.sponsorWorkspacePageTestData.Label_Texts.sponsor_workspace_label.replace(
        '{{sponsor_organisation_name}}',
        await checkSetupSponsorOrganisationPage.getOrgName()
      );
    await expect(sponsorWorkspacePage.mainPageContent.getByText(authorisationsBodyLabel)).toBeVisible();
  }
);

Then(
  'I can see the list of modifications received for sponsor approval is sorted by {string} order of the {string}',
  async ({ commonItemsPage, sponsorWorkspacePage }, sortDirection: string, sortField: string) => {
    const searchColumnIndex = await sponsorWorkspacePage.getColumnIndex(sortField);
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, searchColumnIndex);
    let sortedModsList: string[];
    const direction = sortDirection.toLowerCase();
    const field = sortField.toLowerCase();
    if (field === 'modification id') {
      sortedModsList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else {
      const compareFn = (a: string, b: string) =>
        direction === 'ascending'
          ? a.localeCompare(b, 'en', { sensitivity: 'base' })
          : b.localeCompare(a, 'en', { sensitivity: 'base' });

      sortedModsList = [...actualList].toSorted(compareFn);
    }

    expect.soft(actualList).toEqual(sortedModsList);
  }
);
