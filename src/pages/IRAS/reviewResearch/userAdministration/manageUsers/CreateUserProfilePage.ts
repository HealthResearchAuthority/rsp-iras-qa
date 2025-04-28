import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as fse from 'fs-extra';
import { confirmStringNotNull, removeUnwantedWhitespace, returnDataFromJSON } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class CreateUserProfilePage {
  readonly page: Page;
  readonly createUserProfilePageTestData: typeof createUserProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly title_text: Locator;
  readonly first_name_text: Locator;
  readonly last_name_text: Locator;
  readonly email_address_text: Locator;
  readonly telephone_text: Locator;
  readonly organisation_text: Locator;
  readonly job_title_text: Locator;
  readonly role_label: Locator;
  readonly role_fieldset: Locator;
  readonly role_checkbox: Locator;
  readonly committee_dropdown: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_fieldset: Locator;
  readonly access_required_checkbox: Locator;
  readonly review_body_dropdown: Locator;
  readonly continue_button: Locator;
  readonly selected_dropdown: Locator;
  readonly back_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfilePageTestData = createUserProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.createUserProfilePageTestData.Create_User_Profile_Page.page_heading);
    this.title_text = this.page.getByLabel(this.createUserProfilePageTestData.Create_User_Profile_Page.title_label, {
      exact: true,
    });
    this.first_name_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.first_name_label,
      {
        exact: true,
      }
    );
    this.last_name_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.last_name_label,
      {
        exact: true,
      }
    );
    this.email_address_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.email_address_label,
      {
        exact: true,
      }
    );
    this.telephone_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.telephone_label,
      {
        exact: true,
      }
    );
    this.organisation_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.organisation_label,
      {
        exact: true,
      }
    );
    this.job_title_text = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.job_title_label,
      {
        exact: true,
      }
    );
    this.role_label = this.page
      .locator('label b')
      .getByText(this.createUserProfilePageTestData.Create_User_Profile_Page.role_label, { exact: true });
    this.role_fieldset = this.page.locator('.govuk-form-group', { has: this.role_label });
    this.role_checkbox = this.role_fieldset.getByRole('checkbox');
    this.committee_dropdown = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.committee_label,
      { exact: true }
    );
    this.country_fieldset = this.page.getByRole('group', {
      name: this.createUserProfilePageTestData.Create_User_Profile_Page.country_label,
      exact: true,
    });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.access_required_fieldset = this.page.getByRole('group', {
      name: this.createUserProfilePageTestData.Create_User_Profile_Page.access_required_label,
      exact: true,
    });
    this.access_required_checkbox = this.access_required_fieldset.getByRole('checkbox');
    this.review_body_dropdown = this.page.getByLabel(
      this.createUserProfilePageTestData.Create_User_Profile_Page.review_body_label,
      {
        exact: true,
      }
    );
    this.continue_button = this.page
      .getByRole('button')
      .getByText(this.createUserProfilePageTestData.Create_User_Profile_Page.continue_button);
    this.selected_dropdown = this.page.locator('select option[selected=selected]');
    this.back_button = this.page
      .getByRole('link')
      .getByText(this.createUserProfilePageTestData.Create_User_Profile_Page.back_button);
  }

  async assertOnCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async getSelectedValuesCreateUser<PageObject>(
    dataset: JSON,
    key: string,
    page: PageObject
  ): Promise<string | boolean> {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'tel') {
      return await removeUnwantedWhitespace(confirmStringNotNull(await locator.getAttribute('value')));
    } else if (typeAttribute === 'radio') {
      return await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        if (!(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked())) {
          return false;
        } else {
          return true;
        }
      }
    } else if (typeAttribute === 'email') {
      if (key === 'email_address_text') {
        return await removeUnwantedWhitespace(confirmStringNotNull(await locator.getAttribute('value')));
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        return await removeUnwantedWhitespace(confirmStringNotNull(await locator.inputValue()));
      }
    }
    return 'No input element found';
  }

  async updateUniqueEmailTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON();
        data.Create_User_Profile.email_address_unique = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating unique email to testdata json file:`);
      }
    })();
  }
}
