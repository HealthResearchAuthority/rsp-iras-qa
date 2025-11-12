import { expect, Locator, Page } from '@playwright/test';
import * as setupNewSponsorOrganisationPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/setup_new_sponsor_organisation_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import CommonItemsPage from '../../../../Common/CommonItemsPage';
import path from 'node:path';
import * as fse from 'fs-extra';
import { returnDataFromJSON } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/setup_new_sponsor_organisation_page_data.json';

//Declare Page Objects
export default class SetupNewSponsorOrganisationPage {
  readonly page: Page;
  readonly setupNewSponsorOrganisationPageTestData: typeof setupNewSponsorOrganisationPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _org_name: string;
  readonly pageHeading: Locator;
  readonly select_a_sponsor_organisation_label: Locator;
  readonly select_a_sponsor_organisation_hint_text: Locator;
  readonly sponsor_organisation_text: Locator;
  readonly sponsor_organisation_jsenabled_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.setupNewSponsorOrganisationPageTestData = setupNewSponsorOrganisationPageTestData;
    this.linkTextData = linkTextData;
    this._org_name = '';

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page.page_heading);
    this.select_a_sponsor_organisation_label = this.page.getByText(
      this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
        .select_a_sponsor_organisation_label
    );
  }

  //Getters & Setters for Private Variables
  async getUnusedOrgName(): Promise<string> {
    return this._org_name;
  }

  async setUnusedOrgName(value: string): Promise<void> {
    this._org_name = value;
  }

  //Page Methods

  async goto() {
    await this.page.goto('');
  }
  async assertOnSetupNewSponsorOrganisationsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page.title);
  }
  async selectSponsorOrgJsDisabled(dataset: JSON | Record<string, any>, key: string, commonItemsPage: CommonItemsPage) {
    await commonItemsPage.fillUIComponent(dataset, key, commonItemsPage);
    await commonItemsPage.govUkButton.getByText('Search').click();
    await this.page.waitForTimeout(2000);
    if (dataset[key] !== '') {
      await this.page.getByRole('radio').first().click();
    }
  }

  async saveUnusedSponsorOrgTosetupNewSponsorOrganisation(unusedSponsorOrgName: string) {
    await this.setUnusedOrgName(unusedSponsorOrgName);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateUnusedSponsorOrgNameTestDataJson(filePath, unusedSponsorOrgName);
  }

  async updateUnusedSponsorOrgNameTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        data.Setup_New_Sponsor_Organisation.Sponsor_Organisation_Unused.sponsor_organisation_text = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating unused sponsor organisation name to testdata json file:`);
      }
    })();
  }
}
