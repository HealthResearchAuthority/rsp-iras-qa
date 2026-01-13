import { expect, Locator, Page } from '@playwright/test';
import * as addUserRoleSponsorOrgPageTestData from '../../../resources/test_data/iras/reviewResearch/add_user_role_sponsor_organisation_page_data.json';
import * as commonTestData from '../../../resources/test_data/common/common_data.json';

//Declare Page Objects
export default class AddUserRoleSponsorOrgPage {
  readonly page: Page;
  readonly addUserRoleSponsorOrgPageTestData: typeof addUserRoleSponsorOrgPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly role_label: Locator;
  readonly org_admin_hint_text: Locator;
  readonly sponsor_hint_text: Locator;
  readonly role_fieldset: Locator;
  readonly role_radio: Locator;
  readonly add_user_role_sponsor_workspace_hint_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addUserRoleSponsorOrgPageTestData = addUserRoleSponsorOrgPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent
      .locator('div.govuk-caption-l')
      .or(this.mainPageContent.locator('div.govuk-label'));
    this.add_user_role_sponsor_workspace_hint_text = this.mainPageContent.locator('label.govuk-label', {
      hasText: this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_sponsor_workspace_hint_text,
    });
    this.page_heading = this.mainPageContent.getByRole('heading', {
      name: addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.page_heading,
    });
    this.org_admin_hint_text = this.mainPageContent.getByTestId('orgAdmin-item-hint').or(
      this.mainPageContent
        .getByRole('radio', {
          name: addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Org_Admin.role_radio,
        })
        .locator('..')
        .locator('.govuk-hint')
    );
    this.sponsor_hint_text = this.mainPageContent.getByTestId('sponsor-item-hint').or(
      this.mainPageContent
        .getByRole('radio', {
          name: addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor.role_radio,
        })
        .locator('..')
        .locator('.govuk-hint')
    );
    this.role_label = this.mainPageContent
      .getByRole('paragraph')
      .getByText(this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.role_label, { exact: true })
      .or(
        this.mainPageContent.locator('.govuk-fieldset .govuk-label', {
          hasText: this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.role_label,
        })
      );
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
      await expect
        .soft(this.add_user_role_sponsor_workspace_hint_text)
        .toHaveText(
          this.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.add_user_role_sponsor_workspace_hint_text
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
}
