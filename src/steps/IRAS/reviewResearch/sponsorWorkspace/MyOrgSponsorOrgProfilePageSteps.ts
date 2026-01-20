import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

let shortProjectTitle: string;
let irasId: string;
let dateCreated: string;
let status: string;

Then(
  'I can see the sponsor organisation profile page from my organisations for {string}',
  async ({ myOrgSponsorOrgProfilePage, checkSetupSponsorOrganisationPage }, user: string) => {
    const expSponOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(expSponOrgName);
    await expect.soft(myOrgSponsorOrgProfilePage.profile_tabnav).toBeVisible();
    await myOrgSponsorOrgProfilePage.assertSponsorOrgProfilePageTabs(user);
  }
);

Then(
  'I validate the sponsor organisation data displayed in profile tab with rts data',
  async ({ myOrgSponsorOrgProfilePage, rtsPage }) => {
    const [expSponOrg, expCountry, expAddress, expLastUpdated] =
      await myOrgSponsorOrgProfilePage.getRtsSponsorOrgProfileData(rtsPage);
    const [actualLabels, expectedLabels, actualValues, expectedValues] =
      await myOrgSponsorOrgProfilePage.validateProfileTabData(expSponOrg, expCountry, expAddress, expLastUpdated);
    expect.soft(actualLabels).toEqual(expectedLabels);
    expect.soft(actualValues).toEqual(expectedValues);
  }
);

Then('I keep note of the project data displayed in the table', async ({ myOrgSponsorOrgProfilePage }) => {
  const firstRowData = await myOrgSponsorOrgProfilePage.firstRow_Locator.allInnerTexts();
  [shortProjectTitle, irasId, dateCreated, status] = firstRowData;
});

Then('I can see the project data displaying in the table', async ({ myOrgSponsorOrgProfilePage }) => {
  const actualDataRecord = await myOrgSponsorOrgProfilePage.firstRow_Locator.allInnerTexts();
  const [actualShortProjectTitle, actualIrasId, actualDateCreated, actualStatus] = actualDataRecord;
  expect.soft(actualShortProjectTitle).toBe(shortProjectTitle);
  expect.soft(actualIrasId).toBe(irasId);
  expect.soft(actualDateCreated).toBe(dateCreated);
  expect.soft(actualStatus).toBe(status);
});

Then(
  'I can see the project records are sorted by {string} order of {string}',
  async (
    { myResearchProjectsPage, commonItemsPage, myOrgSponsorOrgProfilePage },
    sortDirection: string,
    sortField: string
  ) => {
    const [actualList, sortedList] = await myOrgSponsorOrgProfilePage.getSortedProjectRecords(
      sortDirection,
      sortField,
      commonItemsPage,
      myResearchProjectsPage
    );
    expect.soft(actualList).toEqual(sortedList);
  }
);
