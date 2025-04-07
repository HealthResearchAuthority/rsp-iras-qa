import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/check_create_review_body_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class CheckCreateReviewBodyPage {
  readonly page: Page;
  readonly checkCreateReviewBodyPageData: typeof checkCreateReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly selectedBreadCrumbs: Locator;
  readonly backButton: Locator;
  readonly page_heading: Locator;
  readonly sub_heading: Locator;
  readonly guidance_text: Locator;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly organisation_name_row: Locator;
  readonly organisation_name_value: Locator;
  readonly organisation_name_change_link: Locator;
  readonly country_row: Locator;
  readonly country_value: Locator;
  readonly country_change_link: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly email_address_change_link: Locator;
  readonly description_row: Locator;
  readonly description_value: Locator;
  readonly description_change_link: Locator;
  readonly create_profile_btn: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateReviewBodyPageData = checkCreateReviewBodyPageData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.selectedBreadCrumbs = this.page.getByTestId('title'); // update
    this.backButton = this.page.getByTestId('title'); // update
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.heading, { exact: true });
    this.sub_heading = this.page
      .getByRole('heading')
      .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.sub_heading, { exact: true });
    this.guidance_text = this.page
      .getByRole('heading')
      .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.guidance_text, { exact: true });
    this.row_value_locator = this.page.locator('input');
    this.row_change_link_locator = this.page
      .getByRole('button')
      .getByText(this.linkTextData.Check_Create_Review_Body_Page.Change, { exact: true });
    this.organisation_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.organisation_name_label, {
          exact: true,
        }),
    });
    this.organisation_name_value = this.organisation_name_row.locator('td', { has: this.row_value_locator });
    this.organisation_name_change_link = this.organisation_name_row.locator(this.row_change_link_locator);
    this.country_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.country_label, {
          exact: true,
        }),
    });
    this.country_value = this.country_row.locator('td', { has: this.row_value_locator });
    this.country_change_link = this.country_row.locator(this.row_change_link_locator);
    this.email_address_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.email_address_label, {
          exact: true,
        }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.email_address_change_link = this.email_address_row.locator(this.row_change_link_locator);
    this.description_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.description_label, {
          exact: true,
        }),
    });
    this.description_value = this.description_row.locator('td', { has: this.row_value_locator });
    this.description_change_link = this.description_row.locator(this.row_change_link_locator);
    this.create_profile_btn = this.page
      .getByRole('button')
      .getByText(this.buttonTextData.Check_Create_User_Profile_Page.Create_Profile, { exact: true });
  }

  //Page Methods
  async goto() {
    await this.page.goto('reviewbody/confirm-changes');
  }

  async assertOnCheckCreateReviewbodyPage() {
    //update
    await expect(this.page_heading).toBeVisible();
    await expect(this.guidance_text).toBeVisible(); //bug - missing full stop in display text
    await expect(this.sub_heading).toBeVisible();
  }
}
