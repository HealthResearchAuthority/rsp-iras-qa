import { expect, Locator, Page } from '@playwright/test';
import * as mySponsorOrgAddUserPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_add_user_page_data.json';
import * as commonTestData from '../../../../resources/test_data/common/common_data.json';

//Declare Page Objects
export default class MyOrganisationsAddUserPage {
  readonly page: Page;
  readonly mySponsorOrgAddUserPageTestData: typeof mySponsorOrgAddUserPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly email_address_text: Locator;
  readonly non_registered_user_error_heading: Locator;
  readonly banner: Locator;
  readonly banner_heading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.mySponsorOrgAddUserPageTestData = mySponsorOrgAddUserPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent.locator('div.govuk-caption-l');
    this.page_heading = this.mainPageContent.getByRole('heading', { level: 1 });
    this.email_address_text = this.mainPageContent.getByRole('textbox', {
      name: mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_search_box_label,
    });
    this.non_registered_user_error_heading = this.page
      .getByRole('heading')
      .getByText(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.non_registered_user_error_heading);
    this.banner = this.page.getByRole('alert');
    this.banner_heading = this.banner.getByRole('heading', {
      level: 2,
      name: mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation.User_Exists_Message
        .banner_heading,
    });
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnMySponsorOrgAddUsersPage(sponsor_organisation: string): Promise<void> {
    await expect
      .soft(this.page_caption)
      .toHaveText(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.page_caption);
    await expect
      .soft(
        this.mainPageContent.getByRole('heading', {
          name:
            this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.heading_prefix_label +
            sponsor_organisation,
        })
      )
      .toBeVisible();
    await expect
      .soft(
        this.mainPageContent.getByText(
          this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_text_box_prefix_hint_text +
            sponsor_organisation
        )
      )
      .toBeVisible();
    await expect.soft(this.email_address_text).toBeVisible();
  }

  async assertOnNonRegisteredUserErrorPage(error_message: string): Promise<void> {
    if (error_message === 'Non_Registered_User_Error') {
      await expect.soft(this.non_registered_user_error_heading).toBeVisible();
    } else {
      throw new Error(`Error message "${error_message}" is not recognized.`);
    }
  }
}
