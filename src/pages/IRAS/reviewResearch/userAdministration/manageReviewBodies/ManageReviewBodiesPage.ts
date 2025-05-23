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
  readonly orgListRows: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listRows: Locator;
  readonly listCell: Locator;
  readonly next_button: Locator;

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
    this.orgListRows = this.page.getByRole('table').getByRole('row');
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_guidance_text, {
        exact: true,
      });
    this.listRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.next_button = this.page.locator('.govuk-pagination__next a');
  }

  //Page Methods
  // async goto() {
  //   await this.page.goto('reviewbody/view');
  // }

  async goto(pageSize?: string) {
    if (typeof pageSize !== 'undefined') {
      await this.page.goto(`reviewbody/view?pageSize=${pageSize}`);
    } else {
      await this.page.goto('reviewbody/view');
    }
    await this.assertOnManageReviewBodiesPage();
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

  async findReviewBody(reviewBodyName: string, reviewBodyStatus: string) {
    const searchRecord = reviewBodyName + '|' + reviewBodyStatus;
    let foundRecord = false;
    let hasNextPage = true;
    while (hasNextPage && !foundRecord) {
      const rows = await this.listRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.listCell).allTextContents();
        const selectedColumns = [columns[0], columns[2]];
        const fullRowData = selectedColumns.map((col) => col.trim()).join('|');
        if (fullRowData === searchRecord) {
          foundRecord = true;
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage && !foundRecord) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }

  async findReviewBodyByStatus(reviewBodyName: string, reviewBodyStatus: string) {
    let foundRecord = false;
    let hasNextPage = true;
    while (hasNextPage && !foundRecord) {
      const rows = await this.listRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.listCell).allTextContents();
        if (columns[0].trim().includes(reviewBodyName) && columns[2].trim() === reviewBodyStatus) {
          foundRecord = true;
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage && !foundRecord) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }
}
