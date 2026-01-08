import { expect, Locator, Page } from '@playwright/test';
import * as addUserRoleSponsorOrgPageTestData from '../../../resources/test_data/iras/reviewResearch/add_user_role_sponsor_organisation_page_data.json';
import * as commonTestData from '../../../resources/test_data/common/common_data.json';
// import CommonItemsPage from '../../../Common/CommonItemsPage';
// import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
// import { connect } from '../../../../utils/DbConfig';

//Declare Page Objects
export default class AddUserRoleSponsorOrgPage {
  readonly page: Page;
  readonly addUserRoleSponsorOrgPageTestData: typeof addUserRoleSponsorOrgPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly email_text: Locator;
  readonly role_label: Locator;
  readonly org_admin_hint_text: Locator;
  readonly sponsor_hint_text: Locator;
  readonly role_fieldset: Locator;
  readonly role_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addUserRoleSponsorOrgPageTestData = addUserRoleSponsorOrgPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent.locator('div.govuk-caption-l');
    this.page_heading = this.mainPageContent.getByRole('heading', {
      name: addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.page_heading,
    });
    this.org_admin_hint_text = this.mainPageContent.getByTestId('orgAdmin-item-hint');
    this.sponsor_hint_text = this.mainPageContent.getByTestId('sponsor-item-hint');
    this.role_label = this.mainPageContent
      .getByRole('paragraph')
      .getByText(this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.role_label, { exact: true });
    this.role_fieldset = this.mainPageContent.locator('.govuk-form-group', {
      hasText: this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.role_label,
    });
    this.role_radio = this.role_fieldset.getByRole('radio');
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnAddUserRoleSponsorOrganisationPage(): Promise<void> {
    const pageUrl = this.page.url();
    //fd-rsp-applications-automationtest-uks-e7f6hkg3c5edhxex.a03.azurefd.net/sponsororganisations/adduserrole?userId=6104c5ae-6541-487d-a822-9d00269b4a7c&rtsId=90388
    //fd-rsp-applications-automationtest-uks-e7f6hkg3c5edhxex.a03.azurefd.net/sponsorworkspace/myorganisationusersadduserrole?rtsId=90388&userId=d0460f87-24ca-48b2-9763-201bf8c50793
    if (
      pageUrl.includes(addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_sponsor_workspace_partial_url)
    ) {
      expect
        .soft(pageUrl)
        .toContain(
          this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_sponsor_workspace_partial_url
        );
      await expect
        .soft(this.page_caption)
        .toHaveText(
          this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_sponsor_workspace_page_caption
        );
    } else if (
      pageUrl.includes(
        addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_system_admin_workspace_partial_url
      )
    ) {
      expect
        .soft(pageUrl)
        .toContain(
          this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_system_admin_workspace_partial_url
        );
      await expect
        .soft(this.page_caption)
        .toHaveText(
          this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_system_admin_workspace_page_caption
        );
    }
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.role_label).toBeVisible();
    await expect.soft(this.org_admin_hint_text).toBeVisible();
    await expect.soft(this.sponsor_hint_text).toBeVisible();
  }

  // SQL STATEMENTS //
}
