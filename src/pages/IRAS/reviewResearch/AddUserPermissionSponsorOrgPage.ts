import { expect, Locator, Page } from '@playwright/test';
import * as addUserPermissionSponsorOrgPageTestData from '../../../resources/test_data/iras/reviewResearch/add_user_permission_sponsor_organisation_page_data.json';
import * as commonTestData from '../../../resources/test_data/common/common_data.json';

//Declare Page Objects
export default class AddUserPermissionSponsorOrgPage {
  readonly page: Page;
  readonly addUserPermissionSponsorOrgPageTestData: typeof addUserPermissionSponsorOrgPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly permissions_label: Locator;
  readonly permission_hint_text: Locator;
  readonly permission_fieldset: Locator;
  readonly authoriser_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addUserPermissionSponsorOrgPageTestData = addUserPermissionSponsorOrgPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent
      .locator('div.govuk-caption-l')
      .or(this.mainPageContent.locator('div.govuk-label'));
    this.page_heading = this.mainPageContent.getByRole('heading', {
      name: addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page.page_heading,
    });
    this.permission_hint_text = this.mainPageContent.getByTestId('permissions-hint');
    this.permissions_label = this.mainPageContent
      .getByRole('paragraph')
      .getByText(this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page.permissions_label, {
        exact: true,
      });
    this.permission_fieldset = this.mainPageContent.locator('.govuk-form-group', {
      hasText: this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page.permissions_label,
    });
    this.authoriser_checkbox = this.permission_fieldset.getByRole('checkbox');
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnAddUserPermissionSponsorOrganisationPage(): Promise<void> {
    const pageUrl = this.page.url();
    if (
      pageUrl.includes(
        addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
          .add_user_permission_sponsor_workspace_partial_url
      )
    ) {
      expect
        .soft(pageUrl)
        .toContain(
          this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
            .add_user_permission_sponsor_workspace_partial_url
        );
      await expect
        .soft(this.page_caption)
        .toHaveText(
          this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
            .add_user_permission_sponsor_workspace_page_caption
        );
    } else if (
      pageUrl.includes(
        addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
          .add_user_permission_system_admin_workspace_partial_url
      )
    ) {
      expect
        .soft(pageUrl)
        .toContain(
          this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
            .add_user_permission_system_admin_workspace_partial_url
        );
      await expect
        .soft(this.page_caption)
        .toHaveText(
          this.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page
            .add_user_permission_system_admin_workspace_page_caption
        );
    }
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.permissions_label).toBeVisible();
    await expect.soft(this.permission_hint_text).toBeVisible();
  }
}
