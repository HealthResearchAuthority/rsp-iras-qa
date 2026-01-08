import { Locator, Page } from '@playwright/test';
import * as addUserPermissionSponsorOrgPageTestData from '../../../resources/test_data/iras/reviewResearch/add_user_permission_sponsor_organisation_page_data.json';
import * as commonTestData from '../../../resources/test_data/common/common_data.json';
// import CommonItemsPage from '../../../Common/CommonItemsPage';
// import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
// import { connect } from '../../../../utils/DbConfig';

//Declare Page Objects
export default class AddUserPermissionSponsorOrgPage {
  readonly page: Page;
  readonly addUserPermissionSponsorOrgPageTestData: typeof addUserPermissionSponsorOrgPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly email_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addUserPermissionSponsorOrgPageTestData = addUserPermissionSponsorOrgPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent.locator('div.govuk-caption-l');
    this.page_heading = this.mainPageContent.getByRole('heading', { level: 1 });
    // this.email_text = this.mainPageContent.getByRole('textbox', {
    //   name: mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_search_box_label,
    // });
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnAddUserPermissionSponsorOrganisationPage(): Promise<void> {
    // const pageUrl = this.page.url();
    // expect
    //   .soft(pageUrl)
    //   .toContain(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.add_user_partial_url);
    // await expect
    //   .soft(this.page_caption)
    //   .toHaveText(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.page_caption);
    // await expect
    //   .soft(
    //     this.mainPageContent.getByRole('heading', {
    //       name:
    //         this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.heading_prefix_label +
    //         sponsor_organisation,
    //     })
    //   )
    //   .toBeVisible();
    // await expect
    //   .soft(
    //     this.mainPageContent.getByLabel(
    //       this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_text_box_prefix_hint_text +
    //         sponsor_organisation
    //     )
    //   )
    //   .toBeVisible();
    // await expect.soft(this.email_text).toBeVisible();
  }

  // SQL STATEMENTS //
}
