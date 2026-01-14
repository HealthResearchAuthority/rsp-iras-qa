import { expect, Locator, Page } from '@playwright/test';
import * as myOrgSponsorOrgProfilePageTestData from '../../../resources/test_data/iras/make_changes/my_org_sponsor_org_profile_page_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

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
  }

  //Page Methods
  async assertOnMyOrgSponsorOrgProfilePage(expSponOrgName, user) {
    await expect(this.pageLabel).toBeVisible();
    await expect.soft(this.pageHeading.getByText(expSponOrgName)).toBeVisible();
    await expect.soft(this.page.locator('.govuk-service-navigation__item--active').getByText('Profile')).toBeVisible();
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
    expect.soft(actualLabels).toEqual(expectedLabels);
    expect.soft(actualValues).toEqual(expectedValues);
  }

  async sortDateSubmittedList(datesSubmitted: string[], sortDirection: string): Promise<string[]> {
    const listAsDates: Date[] = [];
    const sortedListAsStrings: string[] = [];
    const formattedDatesSubmitted = datesSubmitted.map((dates) => {
      const [day, month, year] = dates.split(' ');
      return [day, month, year];
    });

    for (const entry of formattedDatesSubmitted.entries()) {
      const usFormattedEntry = entry[1].toReversed();
      const dateEntryString = `${usFormattedEntry[0]} ${usFormattedEntry[1]} ${usFormattedEntry[2]}`;
      const dateFormattedEntry = new Date(dateEntryString);
      listAsDates.push(dateFormattedEntry);
    }

    if (sortDirection.toLowerCase() == 'descending') {
      listAsDates.sort((a, b) => b.getTime() - a.getTime());
    } else {
      listAsDates.sort((a, b) => a.getTime() - b.getTime());
    }

    for (const date of listAsDates) {
      sortedListAsStrings.push(
        date.toLocaleString('en-GB', { day: '2-digit', month: 'long', year: 'numeric' }).replace('Sept', 'Sep')
      );
    }
    return sortedListAsStrings;
  }
}
