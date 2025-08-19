import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageTestData: typeof userProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  private _userid: string;
  private _title: string;
  private _new_title: string;
  private _first_name: string;
  private _new_first_name: string;
  private _last_name: string;
  private _new_last_name: string;
  private _email_address: string;
  private _new_email_address: string;
  private _telephone: string;
  private _new_telephone: string;
  private _organisation: string;
  private _new_organisation: string;
  private _job_title: string;
  private _new_job_title: string;
  private _countries: string[];
  private _new_countries: string[];
  // private _access_required: string[];
  private _review_body: string[];
  // private _new_access_required: string[];
  private _role: string[];
  readonly selected_bread_crumbs: Locator;
  readonly page_heading: Locator;
  readonly first_change_link: Locator;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly title_change_link: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly job_title_change_link: Locator;
  readonly role_row: Locator;
  readonly role_value: Locator;
  readonly role_change_link: Locator;
  // readonly committee_row: Locator;
  // readonly committee_value: Locator;
  // readonly committee_change_link: Locator;
  readonly country_row: Locator;
  readonly country_value: Locator;
  readonly country_change_link: Locator;
  // readonly access_required_row: Locator;
  // readonly access_required_value: Locator;
  // readonly access_required_change_link: Locator;
  readonly review_body_row: Locator;
  readonly review_body_value: Locator;
  readonly review_body_change_link: Locator;
  readonly audit_row: Locator;
  readonly audit_link: Locator;
  readonly last_updated_row: Locator;
  readonly last_updated_value: Locator;
  readonly disable_header_label: Locator;
  readonly disable_hint_label: Locator;
  readonly enable_header_label: Locator;
  readonly enable_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageTestData = userProfilePageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;
    this._userid = '';
    this._title = '';
    this._new_title = '';
    this._first_name = '';
    this._new_first_name = '';
    this._last_name = '';
    this._new_last_name = '';
    this._email_address = '';
    this._new_email_address = '';
    this._telephone = '';
    this._new_telephone = '';
    this._organisation = '';
    this._new_organisation = '';
    this._job_title = '';
    this._new_job_title = '';
    this._countries = [];
    this._new_countries = [];
    // this._access_required = [];
    this._review_body = [];
    // this._new_access_required = [];
    this._role = [];
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userProfilePageTestData.User_Profile_Page.page_heading_prefix, { exact: false });

    this.row_value_locator = this.page.locator('input');
    this.row_change_link_locator = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.User_Profile_Page.Change, { exact: true });
    this.title_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.title_label, {
        exact: true,
      }),
    });
    this.title_value = this.title_row.locator('td', { has: this.row_value_locator });
    this.title_change_link = this.title_row.locator(this.row_change_link_locator);
    this.first_name_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.first_name_label, {
        exact: true,
      }),
    });
    this.first_name_value = this.first_name_row.locator('td', { has: this.row_value_locator });
    this.first_name_change_link = this.first_name_row.locator(this.row_change_link_locator);
    this.last_name_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.last_name_label, {
        exact: true,
      }),
    });
    this.last_name_value = this.last_name_row.locator('td', { has: this.row_value_locator });
    this.last_name_change_link = this.last_name_row.locator(this.row_change_link_locator);
    this.email_address_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.email_address_label, {
        exact: true,
      }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.email_address_change_link = this.email_address_row.locator(this.row_change_link_locator);
    this.telephone_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.telephone_label, {
        exact: true,
      }),
    });
    this.telephone_value = this.telephone_row.locator('td', { has: this.row_value_locator });
    this.telephone_change_link = this.telephone_row.locator(this.row_change_link_locator);
    this.organisation_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.organisation_label, {
        exact: true,
      }),
    });
    this.organisation_value = this.organisation_row.locator('td', { has: this.row_value_locator });
    this.organisation_change_link = this.organisation_row.locator(this.row_change_link_locator);
    this.job_title_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.job_title_label, {
        exact: true,
      }),
    });
    this.job_title_value = this.job_title_row.locator('td', { has: this.row_value_locator });
    this.job_title_change_link = this.job_title_row.locator(this.row_change_link_locator);
    this.role_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.role_label, {
        exact: true,
      }),
    });
    this.role_value = this.role_row.locator('td', { has: this.row_value_locator });
    this.role_change_link = this.role_row.locator(this.row_change_link_locator);
    // this.committee_row = this.page.locator('tr', {
    //   has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.committee_label, {
    //     exact: true,
    //   }),
    // });
    // this.committee_value = this.committee_row.locator('td', { has: this.row_value_locator });
    // this.committee_change_link = this.committee_row.locator(this.row_change_link_locator);
    this.country_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.country_label, {
        exact: true,
      }),
    });
    this.country_value = this.country_row.locator('td', { has: this.row_value_locator });
    this.country_change_link = this.country_row.locator(this.row_change_link_locator);
    // this.access_required_row = this.page.locator('tr', {
    //   has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.access_required_label, {
    //     exact: true,
    //   }),
    // });
    // this.access_required_value = this.access_required_row.locator('td', { has: this.row_value_locator });
    // this.access_required_change_link = this.access_required_row.locator(this.row_change_link_locator);
    this.review_body_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.review_body_label, {
        exact: true,
      }),
    });
    this.review_body_value = this.review_body_row.locator('td', { has: this.row_value_locator });
    this.review_body_change_link = this.review_body_row.locator(this.row_change_link_locator);
    this.audit_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.audit_label, {
        exact: true,
      }),
    });
    this.audit_link = this.audit_row.locator(this.row_change_link_locator);
    this.last_updated_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.last_updated_label, {
        exact: true,
      }),
    });
    this.last_updated_value = this.last_updated_row.locator('td').nth(1);
    this.disable_header_label = this.enable_header_label = this.page.locator('h2[class="govuk-heading-m"]');
    this.disable_hint_label = this.enable_hint_label = this.page.locator('div[class="govuk-hint"]');
  }

  async assertOnUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async goto(userId: string) {
    await this.page.goto(`admin/users/viewuser?userId=${userId}`);
  }

  async clickOnChangeUserProfileDetails(editUserFieldName: string, userRole: string) {
    switch (editUserFieldName) {
      case 'title_text':
        // All android specific if conditions need to be removed after the defect fix RSP-4099
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.title_change_link.focus();
          await this.title_change_link.press('Enter');
        } else {
          await this.title_change_link.click();
        }
        break;
      case 'first_name_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.first_name_change_link.focus();
          await this.first_name_change_link.press('Enter');
        } else {
          await this.first_name_change_link.click();
        }
        break;
      case 'last_name_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.last_name_change_link.focus();
          await this.last_name_change_link.press('Enter');
        } else {
          await this.last_name_change_link.click();
        }
        break;
      case 'email_address_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.email_address_change_link.focus();
          await this.email_address_change_link.press('Enter');
        } else {
          await this.email_address_change_link.click();
        }
        break;
      case 'telephone_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.telephone_change_link.focus();
          await this.telephone_change_link.press('Enter');
        } else {
          await this.telephone_change_link.click();
        }
        break;
      case 'organisation_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.organisation_change_link.focus();
          await this.organisation_change_link.press('Enter');
        } else {
          await this.organisation_change_link.click();
        }
        break;
      case 'job_title_text':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.job_title_change_link.focus();
          await this.job_title_change_link.press('Enter');
        } else {
          await this.job_title_change_link.click();
        }
        break;
      case 'role_checkbox':
        if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
          await this.role_change_link.focus();
          await this.role_change_link.press('Enter');
        } else {
          await this.role_change_link.click();
        }
        break;
      // case 'access_required_checkbox':
      //   if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
      //     await this.access_required_change_link.focus();
      //     await this.access_required_change_link.press('Enter');
      //   } else {
      //     await this.access_required_change_link.click();
      //   }
      //   break;
      // case 'committee':
      //   if (userRole.trim().toLocaleLowerCase() != 'operations') {
      //     break;
      //   } else {
      //     await this.committee_change_link.click();
      //     break;
      //   }
      case 'country_checkbox':
        if (userRole.trim().toLocaleLowerCase() != 'operations') {
          break;
        } else {
          if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
            await this.country_change_link.focus();
            await this.country_change_link.press('Enter');
          } else {
            await this.country_change_link.click();
          }
          break;
        }
      case 'review_body':
        if (userRole.trim().toLocaleLowerCase() != 'operations') {
          break;
        } else {
          await this.review_body_change_link.click();
          break;
        }
      default:
        throw new Error(`${editUserFieldName} is not a valid field to edit user profile`);
    }
  }

  // async clickOnChangeButton(fieldKey: string) {
  //   const locatorName = fieldKey.toLowerCase() + '_change_link';
  //   // This if condition need to be removed for android after the defect fix RSP-4099
  //   if (process.env.OS_TYPE?.toLowerCase() == 'android' && process.env.PLATFORM?.toLowerCase() == 'mobile') {
  //     await this[locatorName].focus();
  //     await this[locatorName].press('Enter');
  //   } else {
  //     await this[locatorName].click();
  //   }
  // }

  async getUserProfileValue(editUserFieldName: string) {
    switch (editUserFieldName) {
      case 'title_text':
        return confirmStringNotNull(await this.title_value.textContent()).trim();
      case 'first_name_text':
        return confirmStringNotNull(await this.first_name_value.textContent()).trim();
      case 'last_name_text':
        return confirmStringNotNull(await this.last_name_value.textContent()).trim();
      case 'email_address_text':
        return confirmStringNotNull(await this.email_address_value.textContent()).trim();
      case 'telephone_text':
        return confirmStringNotNull(await this.telephone_value.textContent()).trim();
      case 'organisation_text':
        return confirmStringNotNull(await this.organisation_value.textContent()).trim();
      case 'job_title_text':
        return confirmStringNotNull(await this.job_title_value.textContent()).trim();
      case 'role_checkbox':
        return confirmStringNotNull(await this.role_value.textContent()).trim();
      case 'country_checkbox':
        return confirmStringNotNull(await this.country_value.textContent()).trim();
      default:
        throw new Error(`${editUserFieldName} is not a valid user profile field`);
    }
  }

  //Getters & Setters for Private Variables

  async getUserId(): Promise<string> {
    return this._userid;
  }

  async setUserId(value: string): Promise<void> {
    this._userid = value;
  }

  async getTitle(): Promise<string> {
    return this._title;
  }

  async setTitle(value: string): Promise<void> {
    this._title = value;
  }

  async getNewTitle(): Promise<string> {
    return this._new_title;
  }

  async setNewTitle(value: string): Promise<void> {
    this._new_title = value;
  }

  async getFirstName(): Promise<string> {
    return this._first_name;
  }

  async setFirstName(value: string): Promise<void> {
    this._first_name = value;
  }

  async getNewFirstName(): Promise<string> {
    return this._new_first_name;
  }

  async setNewFirstName(value: string): Promise<void> {
    this._new_first_name = value;
  }

  async getLastName(): Promise<string> {
    return this._last_name;
  }

  async setLastName(value: string): Promise<void> {
    this._last_name = value;
  }

  async getNewLastName(): Promise<string> {
    return this._new_last_name;
  }

  async setNewLastName(value: string): Promise<void> {
    this._new_last_name = value;
  }

  async getEmail(): Promise<string> {
    return this._email_address;
  }

  async setEmail(value: string): Promise<void> {
    this._email_address = value;
  }

  async getNewEmail(): Promise<string> {
    return this._new_email_address;
  }

  async setNewEmail(value: string): Promise<void> {
    this._new_email_address = value;
  }

  async getTelephone(): Promise<string> {
    return this._telephone;
  }

  async setTelephone(value: string): Promise<void> {
    this._telephone = value;
  }

  async getNewTelephone(): Promise<string> {
    return this._new_telephone;
  }

  async setNewTelephone(value: string): Promise<void> {
    this._new_telephone = value;
  }

  async getOrganisation(): Promise<string> {
    return this._organisation;
  }

  async setOrganisation(value: string): Promise<void> {
    this._organisation = value;
  }

  async getNewOrganisation(): Promise<string> {
    return this._new_organisation;
  }

  async setNewOrganisation(value: string): Promise<void> {
    this._new_organisation = value;
  }

  async getJobTitle(): Promise<string> {
    return this._job_title;
  }

  async setJobTitle(value: string): Promise<void> {
    this._job_title = value;
  }

  async getNewJobTitle(): Promise<string> {
    return this._new_job_title;
  }

  async setNewJobTitle(value: string): Promise<void> {
    this._new_job_title = value;
  }

  async getCountries(): Promise<string[]> {
    return this._countries;
  }

  async setCountries(value: string[]): Promise<void> {
    this._countries = value;
  }

  async getNewCountries(): Promise<string[]> {
    return this._new_countries;
  }

  async setNewCountries(value: string[]): Promise<void> {
    this._new_countries = value;
  }

  // async getAccessRequired(): Promise<string[]> {
  //   return this._access_required;
  // }

  // async setAccessRequired(value: string[]): Promise<void> {
  //   this._access_required = value;
  // }
  async getReviewBody(): Promise<string[]> {
    return this._review_body;
  }
  async setReviewBody(value: string[]): Promise<void> {
    this._review_body = value;
  }

  // async getNewAccessRequired(): Promise<string[]> {
  //   return this._new_access_required;
  // }

  // async setNewAccessRequired(value: string[]): Promise<void> {
  //   this._new_access_required = value;
  // }

  async getRole(): Promise<string[]> {
    return this._role;
  }

  async setRole(value: string[]): Promise<void> {
    this._role = value;
  }
}
