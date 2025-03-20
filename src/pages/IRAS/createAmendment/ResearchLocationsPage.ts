import { expect, Locator, Page } from '@playwright/test';
import * as researchLocationsPageTestData from '../../../resources/test_data/iras/make_changes/research_locations_data.json';

//Declare Page Objects
export default class ResearchLocationsPage {
  readonly page: Page;
  readonly researchLocationsPageTestData: typeof researchLocationsPageTestData;
  readonly pageHeading: Locator;
  readonly nations_participating_checkbox: Locator;
  readonly is_nhs_hsc_organisation_radio: Locator;
  readonly lead_nation_radio: Locator;
  readonly nations_participating_label: Locator;
  readonly is_nhs_hsc_organisation_label: Locator;
  readonly lead_nation_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.researchLocationsPageTestData = researchLocationsPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.nations_participating_checkbox = this.page.getByTestId(/^IQA0032/);
    this.is_nhs_hsc_organisation_radio = this.page.getByTestId(/^IQA0004/);
    this.lead_nation_radio = this.page.getByTestId(/^IQA0005/);
    this.nations_participating_label = this.page.locator('div[id="Questions[0].Answers"] legend');
    this.is_nhs_hsc_organisation_label = this.page.locator('Questions[1].SelectedOption');
    this.lead_nation_label = this.page.locator('Questions[2].SelectedOption');
  }

  async assertOnResearchLocationsPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.researchLocationsPageTestData.Research_Locations_Page.heading);
  }
}
