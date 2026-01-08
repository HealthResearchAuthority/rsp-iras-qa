import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsPageTestData from '../../../resources/test_data/iras/make_changes/my_organisations_page_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class MyOrganisationsPage {
  readonly page: Page;
  readonly myOrganisationsPageTestData: typeof myOrganisationsPageTestData;
  readonly myOrganisationsPage: typeof MyOrganisationsPage;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly organisations_table: Locator;
  readonly row_view_link_locator: Locator;
  readonly row_manage_link_locator: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrganisationsPageTestData = myOrganisationsPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.myOrganisationsPageTestData.My_Organisations_Page.pageHeading);
    this.organisations_table = this.page.getByTestId('myOrganisationsTable');
    const textsldk = this.linkTextData.My_Organisations_Page.View;
    console.log(textsldk);
    this.row_view_link_locator = this.page.getByRole('cell').getByText(this.linkTextData.My_Organisations_Page.View);
    this.row_manage_link_locator = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.My_Organisations_Page.Manage);
  }

  //Page Methods
  async assertOnMyOrganisationsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }
}
