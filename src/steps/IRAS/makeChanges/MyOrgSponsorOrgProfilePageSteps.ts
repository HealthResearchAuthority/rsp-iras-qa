import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

let shortProjectTitle: string;
let irasId: string;
let dateCreated: string;
let status: string;

Then(
  'I can see the sponsor organisation profile page from my organisations for {string}',
  async ({ myOrgSponsorOrgProfilePage, checkSetupSponsorOrganisationPage }, user: string) => {
    const expSponOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(expSponOrgName, user);
  }
);

Then(
  'I validate the sponsor organisation data displayed in profile tab',
  async ({ myOrgSponsorOrgProfilePage, rtsPage }) => {
    const expSponOrg = rtsPage.rtsResponseListRecord[0].name;
    const expCountry = rtsPage.rtsResponseListRecord[0].country;
    const expRawAddress = (rtsPage.rtsResponseListRecord as unknown as { address: { text?: string }[] }[])[0]
      ?.address?.[0]?.text;
    const expAddress = expRawAddress?.replace(/,/g, ' ').replace(/\s+/g, ' ').trim();

    const rawLastUpdated = rtsPage.rtsResponseListRecord[0].lastUpdated;
    const dateObj = new Date(rawLastUpdated);
    const day = String(dateObj.getDate()).padStart(2, '0');
    const monthShort = dateObj.toLocaleString('en-GB', { month: 'short' });
    const year = dateObj.getFullYear();
    const hours = String(dateObj.getHours()).padStart(2, '0');
    const minutes = String(dateObj.getMinutes()).padStart(2, '0');
    const expLastUpdated = `${day} ${monthShort} ${year} at ${hours}:${minutes}`;

    await myOrgSponsorOrgProfilePage.validateProfileTabData(expSponOrg, expCountry, expAddress, expLastUpdated);
  }
);

Then('I click on the short project title for sponsor organisation', async ({ myOrgSponsorOrgProfilePage }) => {
  const shortProjectTitleLabel = await myOrgSponsorOrgProfilePage.projects_table
    .locator('tbody tr td:nth-child(1)')
    .first()
    .innerText();
  await myOrgSponsorOrgProfilePage.page.getByText(shortProjectTitleLabel, { exact: true }).click();
});

Then('I keep note of the project data displayed in the table', async ({ myOrgSponsorOrgProfilePage }) => {
  const firstRowData = await myOrgSponsorOrgProfilePage.projects_table
    .locator('tbody tr')
    .first()
    .locator('td')
    .allInnerTexts();
  [shortProjectTitle, irasId, dateCreated, status] = firstRowData;
});

Then('I can see the project data displaying in the table', async ({ myOrgSponsorOrgProfilePage }) => {
  const actualDataRecord = await myOrgSponsorOrgProfilePage.projects_table
    .locator('tbody tr')
    .first()
    .locator('td')
    .allInnerTexts();
  const [actualShortProjectTitle, actualIrasId, actualDateCreated, actualStatus] = actualDataRecord;
  expect.soft(actualShortProjectTitle).toBe(shortProjectTitle);
  expect.soft(actualIrasId).toBe(irasId);
  expect.soft(actualDateCreated).toBe(dateCreated);
  expect.soft(actualStatus).toBe(status);
});

Then(
  'I can see the project records are sorted by {string} order of {string}',
  async ({ myResearchProjectsPage, commonItemsPage }, sortDirection: string, sortField: string) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'short project title':
        columnIndex = 0;
        break;
      case 'iras id':
        columnIndex = 1;
        break;
      case 'date created':
        columnIndex = 2;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    let actualList: any;
    if (sortDirection.toLowerCase() == 'ascending' && sortField.toLowerCase() == 'short project title') {
      actualList = await commonItemsPage.getActualListValuesWithoutTrim(commonItemsPage.tableBodyRows, columnIndex);
    } else {
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    }
    if (sortField.toLowerCase() == 'iras id') {
      sortedList = await myResearchProjectsPage.sortIrasIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date created') {
      sortedList = await commonItemsPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'short project title') {
      const compareFn = (a: string, b: string) =>
        sortDirection.toLowerCase() === 'ascending'
          ? a.localeCompare(b, undefined, { sensitivity: 'base', ignorePunctuation: false })
          : b.localeCompare(a, undefined, { sensitivity: 'base', ignorePunctuation: false });
      sortedList = [...actualList].toSorted(compareFn);
    }
    if (sortedList.map((date) => date.includes('Sept'))) {
      //Only for September month its returning Sept instead Sep. Hence this temporary fix
      const updatedSortedList = sortedList.map((date) => date.replace('Sept', 'Sep'));
      expect.soft(actualList).toEqual(updatedSortedList);
    } else {
      expect.soft(actualList).toEqual(sortedList);
    }
  }
);
