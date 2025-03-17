import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateReviewBodyPageData from '../../../../resources/test_data/iras/reviewResearch/manageReviewBodies/pages/check_create_review_body_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CheckCreateReviewBodyPage {
  readonly page: Page;
  readonly checkCreateReviewBodyPageData: typeof checkCreateReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly selectedBreadCrumbs: Locator;
  readonly backButton: Locator;
  readonly pageHeading: Locator;
  readonly subHeading: Locator;
  readonly organisationNameLbl: Locator;
  readonly organisationNameVal: Locator;
  readonly organisationNameChangeLink: Locator;
  readonly countryLbl: Locator;
  readonly countryVal: Locator;
  readonly countryChangeLink: Locator;
  readonly emailAddressLbl: Locator;
  readonly emailAddressVal: Locator;
  readonly emailAddressChangeLink: Locator;
  readonly descriptionLbl: Locator;
  readonly descriptionVal: Locator;
  readonly descriptionChangeLink: Locator;
  readonly createProfileBtn: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateReviewBodyPageData = checkCreateReviewBodyPageData;

    //Locators
    this.selectedBreadCrumbs = this.page.getByTestId('title'); // update
    this.backButton = this.page.getByTestId('title'); // update
    this.pageHeading = this.page.getByTestId('title'); // update
    this.subHeading = this.page.getByTestId('title'); // update
    this.organisationNameLbl = this.page.getByTestId('Name').locator('label'); // update
    this.organisationNameVal = this.page.getByTestId('Name').locator('label'); // update
    this.organisationNameChangeLink = this.page.getByTestId('Name').locator('label'); // update
    this.countryLbl = this.page.getByTestId('app-name'); // update#
    this.countryVal = this.page.getByTestId('app-name'); // update
    this.countryChangeLink = this.page.getByTestId('Name').locator('label'); // update
    this.emailAddressLbl = this.page.getByTestId('app-description'); // update
    this.emailAddressVal = this.page.getByTestId('app-description'); // update
    this.emailAddressChangeLink = this.page.getByTestId('Name').locator('label'); // update
    this.descriptionLbl = this.page.getByTestId('app-description'); // update
    this.descriptionVal = this.page.getByTestId('app-description'); // update
    this.descriptionChangeLink = this.page.getByTestId('Name').locator('label'); // update
    this.createProfileBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Check_Create_Review_Body_Page.Create_Profile, { exact: true }));
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); //update
  }

  async assertOnCheckCreateReviewbodyPage() {
    //update
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.heading);
    await expect(this.subHeading).toBeVisible();
    await expect(this.subHeading).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.sub_heading
    );
    await expect(this.organisationNameLbl).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.organisation_name_label
    );
    await expect(this.organisationNameChangeLink).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.organisation_name_change_link
    );
    await expect(this.countryLbl).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.country_label
    );
    await expect(this.countryChangeLink).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.country_change_link
    );
    await expect(this.emailAddressLbl).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.email_address_label
    );
    await expect(this.emailAddressChangeLink).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.email_address_change_link
    );
    await expect(this.descriptionLbl).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.description_label
    );
    await expect(this.descriptionChangeLink).toHaveText(
      this.checkCreateReviewBodyPageData.Check_Create_Review_Body_Page.description_change_link
    );
  }
}
