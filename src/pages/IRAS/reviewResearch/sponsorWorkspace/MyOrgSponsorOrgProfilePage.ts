import { expect, Locator, Page } from '@playwright/test';
import * as myOrgSponsorOrgProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_org_sponsor_org_profile_page_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import RtsPage from '../../../Common/RtsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import MyResearchProjectsPage from '../../makeChanges/MyResearchProjectsPage';

//Declare Page Objects
export default class MyOrgSponsorOrgProfilePage {
  readonly page: Page;
  readonly myOrgSponsorOrgProfilePageTestData: typeof myOrgSponsorOrgProfilePageTestData;
  readonly myOrgSponsorOrgProfilePage: typeof MyOrgSponsorOrgProfilePage;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly pageLabel: Locator;
  readonly tabLinks: Locator;
  readonly table: Locator;
  readonly tableRows: Locator;
  readonly projects_table: Locator;
  readonly profile_tabnav: Locator;
  readonly irasid_Locator: Locator;
  readonly firstRow_Locator: Locator;
  readonly shortProjectTitle_Locator: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrgSponsorOrgProfilePageTestData = myOrgSponsorOrgProfilePageTestData;
    this.linkTextData = linkTextData;
    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabel = this.page
      .locator('.govuk-caption-l')
      .getByText(this.myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.pageLabel);
    this.tabLinks = this.page.locator('.govuk-service-navigation__link');
    this.table = this.page.locator('.govuk-summary-list');
    this.tableRows = this.page.locator('.govuk-summary-list__row');
    this.projects_table = this.page.locator('#modificationsTable');
    this.profile_tabnav = this.page.locator('.govuk-service-navigation__item--active').getByText('Profile');
    this.irasid_Locator = this.projects_table.locator('tbody tr td:nth-child(2)');
    this.firstRow_Locator = this.projects_table.locator('tbody tr').first().locator('td');
    this.shortProjectTitle_Locator = this.projects_table.locator('tbody tr td:nth-child(1)').first();
  }

  //Page Methods
  async assertOnMyOrgSponsorOrgProfilePage(user: string) {
    const commonTabs = [
      myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.Profile_Link,
      myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.Projects_Link,
      myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.Users_Link,
    ];
    const auditTab = myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.Audit_Link;
    const expectedTabs = user === 'Sponsor_User' ? commonTabs : [...commonTabs, auditTab];
    for (const tab of expectedTabs) {
      const tabLink = this.page.getByRole('link', { name: tab, exact: true });
      await expect.soft(tabLink).toBeVisible();
    }
    if (user === 'Sponsor_User') {
      const auditLink = this.page.getByRole('link', { name: auditTab, exact: true });
      await expect.soft(auditLink).toHaveCount(0);
    }
  }

  async getRtsSponsorOrgProfileData(rtsPage: RtsPage) {
    const expSponOrg = rtsPage.rtsResponseListRecord[0].name;
    const expCountry = rtsPage.rtsResponseListRecord[0].country;
    const expRawAddress = (rtsPage.rtsResponseListRecord as unknown as { address: { text?: string }[] }[])[0]
      ?.address?.[0]?.text;
    const expAddress = expRawAddress?.replaceAll(',', ' ').replaceAll(/\s+/g, ' ').trim();
    const rawLastUpdated = rtsPage.rtsResponseListRecord[0].lastUpdated;
    const dateObj = new Date(rawLastUpdated);
    const day = String(dateObj.getDate()).padStart(2, '0');
    const monthShort = dateObj.toLocaleString('en-GB', { month: 'short' });
    const year = dateObj.getFullYear();
    const hours = String(dateObj.getHours()).padStart(2, '0');
    const minutes = String(dateObj.getMinutes()).padStart(2, '0');
    const expLastUpdated = `${day} ${monthShort} ${year} at ${hours}:${minutes}`;

    return [expSponOrg, expCountry, expAddress, expLastUpdated];
  }

  async validateProfileTabData(expSponOrg, expCountry, expAddress, expLastUpdated) {
    const expectedLabels = ['Organisation name', 'Country', 'Address', 'Last updated'];
    const expectedValues = [expSponOrg, expCountry, expAddress, expLastUpdated];
    const rowsCount = await this.tableRows.count();
    expect.soft(rowsCount).toBe(expectedLabels.length);
    expect.soft(rowsCount).toBe(expectedValues.length);
    const actualLabels: string[] = [];
    const actualValues: string[] = [];
    for (let row = 0; row < rowsCount; row++) {
      const rowLocator = this.tableRows.nth(row);
      const labelPosition = rowLocator.locator('dt').first();
      const valuePosition = rowLocator.locator('dd').first();
      const label = (await labelPosition.textContent()) ?? '';
      const value = (await valuePosition.textContent()) ?? '';
      actualLabels.push(label.trim());
      actualValues.push(value.trim());
    }

    return [actualLabels, expectedLabels, actualValues, expectedValues];
  }

  async getSortedProjectRecords(
    sortDirection: string,
    sortField: string,
    commonItemsPage: CommonItemsPage,
    myResearchProjectsPage: MyResearchProjectsPage
  ) {
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
      sortedList = sortedList.map((date) => date.replace('Sept', 'Sep'));
    }
    return [actualList, sortedList];
  }
}
