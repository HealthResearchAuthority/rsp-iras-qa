import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as fse from 'fs-extra';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';

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
  readonly role_dropdown: Locator;
  readonly committee_dropdown: Locator;
  readonly country_checkbox_label: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_checkbox_label: Locator;
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
    this.title_text = this.page.getByLabel('Title', { exact: true });
    this.first_name_text = this.page.getByLabel('First name', { exact: true });
    this.last_name_text = this.page.getByLabel('Last name', { exact: true });
    this.email_address_text = this.page.getByLabel('Email address', { exact: true });
    this.telephone_text = this.page.getByLabel('Telephone', { exact: true });
    this.organisation_text = this.page.getByLabel('Organisation', { exact: true });
    this.job_title_text = this.page.getByLabel('Job title', { exact: true });
    this.role_dropdown = this.page.getByLabel('Role', { exact: true });
    this.committee_dropdown = this.page.getByLabel('Committee', { exact: true });
    this.country_checkbox_label = this.page.locator('[class="govuk-label"][for="Country"] b');
    this.country_checkbox = this.page.locator('[name="Country"][type="checkbox"]');
    this.access_required_checkbox_label = this.page.locator('[class="govuk-label"][for="AccessRequired"] b');
    this.access_required_checkbox = this.page.locator('[name="AccessRequired"][type="checkbox"]');
    this.review_body_dropdown = this.page.getByLabel('Review body', { exact: true });
    this.continue_button = this.page.locator('.govuk-button[type="submit"]');
    this.selected_dropdown = this.page.locator('select option[selected=selected]');
    this.back_button = this.page.getByText('Back');
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
        const data = await fse.readJson(filePath);
        data.Create_User_Profile.email_address_unique = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating unique email to testdata json file:`);
      }
    })();
  }

  async selectRoleDropdownAndGetValue(dataset: JSON, key: string) {
    const dropdown = this.role_dropdown;
    await dropdown.scrollIntoViewIfNeeded();
    await dropdown.selectOption({ value: dataset[key] });
    const selectedValue = await dropdown.inputValue();
    return selectedValue;
  }
}
