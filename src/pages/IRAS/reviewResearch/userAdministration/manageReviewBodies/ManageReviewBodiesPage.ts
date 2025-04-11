import { expect, Locator, Page } from '@playwright/test';
import * as manageReviewBodiesPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/manage_review_body_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class ManageReviewBodiesPage {
  readonly page: Page;
  readonly manageReviewBodiesPageData: typeof manageReviewBodiesPageData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly addNewReviewBodyRecordLink: Locator;
  readonly mainPageContent: Locator;
  readonly review_bodies_list_rows: Locator;
  readonly organisation_name_from_list: Locator;
  readonly status_from_list: Locator;
  readonly actionsLink: Locator;
  readonly statusCell: Locator;
  readonly reviewBodyListRows: Locator;
  readonly reviewBodyListCell: Locator;
  readonly organisation_name_from_list_label: string;
  readonly country_name_from_list_label: string;
  readonly status_from_list_label: string;
  readonly next_button: Locator;
  readonly hidden_next_button: Locator;
  readonly orgListRows: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageReviewBodiesPageData = manageReviewBodiesPageData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.heading);
    this.mainPageContent = this.page.getByTestId('main-content');
    this.addNewReviewBodyRecordLink = this.mainPageContent.getByText(
      this.linkTextData.Manage_Review_Bodies_Page.Add_New_Review_Body_Record,
      {
        exact: true,
      }
    );
    this.review_bodies_list_rows = this.page.locator('table tbody tr');
    this.organisation_name_from_list = this.page.locator('td:nth-child(1)');
    this.status_from_list = this.page.locator('td:nth-child(3)');
    this.actionsLink = this.page
      .getByRole('link')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.actions_link, { exact: true });
    this.statusCell = this.page.getByRole('cell').locator('strong');
    this.reviewBodyListRows = this.page.getByRole('table').getByRole('row');
    this.reviewBodyListCell = this.page.locator('.govuk-table__cell');
    this.organisation_name_from_list_label = 'td:nth-child(1)';
    this.country_name_from_list_label = 'td:nth-child(2)';
    this.status_from_list_label = 'td:nth-child(3)';
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
    this.orgListRows = this.page.getByRole('table').getByRole('row');
  }

  //Page Methods
  async goto() {
    await this.page.goto('reviewbody/view');
  }

  async assertOnManageReviewBodiesPage() {
    await expect(this.pageHeading).toBeVisible();
    expect(await this.page.title()).toBe(this.manageReviewBodiesPageData.Manage_Review_Body_Page.title);
  }

  async searchAndClickReviewBodyProfile(reviewBodyName: string, reviewBodyStatus: string) {
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.review_bodies_list_rows.count();
      for (let i = rowCount - 1; i > 0; i--) {
        const organisationNameText = await this.review_bodies_list_rows
          .nth(i)
          .locator(this.organisation_name_from_list)
          .textContent();
        const organisationStatusText = await this.review_bodies_list_rows
          .nth(i)
          .locator(this.status_from_list)
          .textContent();
        if (organisationNameText?.trim() === reviewBodyName && organisationStatusText?.trim() === reviewBodyStatus) {
          await this.review_bodies_list_rows.nth(i).getByText('View/Edit').click();
          dataFound = true;
          break;
        }
      }
      // This code need to be updated when pagination enabled in manage review bodies page
      if (!dataFound) {
        throw new Error('Review body, Data not found');
      }
    }
  }

  async getRowByOrgName(orgName: string, exactMatch: boolean) {
    return this.mainPageContent.locator('tr', {
      has: this.page.locator('td').getByText(`${orgName}`, { exact: exactMatch }),
    });
  }

  async searchAndClickReviewBody(orgName: string, countryNames: string, reviewBodyStatus: string) {
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.reviewBodyListRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.reviewBodyListRows.nth(i).getByRole('cell');
        const orgNameValue = confirmStringNotNull(await columns.nth(0).textContent());
        const countryNamesValue = confirmStringNotNull(await columns.nth(1).textContent());
        const reviewBodyStatusValue = confirmStringNotNull(await columns.nth(2).textContent());
        if (
          confirmStringNotNull(orgNameValue) === orgName &&
          confirmStringNotNull(countryNamesValue) === countryNames.replaceAll(',', ', ') &&
          confirmStringNotNull(reviewBodyStatusValue) === reviewBodyStatus
        ) {
          await this.reviewBodyListRows.nth(i).getByText('View/Edit').click();
          dataFound = true;
          break;
        }
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else if ((await this.hidden_next_button.count()) > 0) {
        throw new Error('Reached the last page, data not found.');
      }
    }
  }

  async getOrgNamesListFromUI() {
    const orgNames: string[] = [];
    const rowCount = await this.orgListRows.count();
    for (let i = 1; i < rowCount; i++) {
      const columns = this.orgListRows.nth(i).getByRole('cell');
      const orgValue = confirmStringNotNull(await columns.first().textContent());
      orgNames.push(orgValue);
    }
    return orgNames;
  }
}
