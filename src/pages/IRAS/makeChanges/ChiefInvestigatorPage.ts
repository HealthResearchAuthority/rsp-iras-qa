import { expect, Locator, Page } from '@playwright/test';
import * as chiefInvestigatorPageTestData from '../../../resources/test_data/iras/make_changes/chief_investigator_page_data.json';
import * as buttonTextData from '../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class ChiefInvestigatorPage {
  readonly page: Page;
  readonly chiefInvestigatorPageTestData: typeof chiefInvestigatorPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly chief_investigator_header_label: Locator;
  readonly chief_investigator_first_name_label: Locator;
  readonly chief_investigator_last_name_label: Locator;
  readonly chief_investigator_email_label: Locator;
  readonly chief_investigator_first_name_text: Locator;
  readonly chief_investigator_last_name_text: Locator;
  readonly chief_investigator_email_text: Locator;
  readonly chief_investigator_email_text_summary_error_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.chiefInvestigatorPageTestData = chiefInvestigatorPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.chief_investigator_header_label = this.page.getByText(
      this.chiefInvestigatorPageTestData.Chief_Investigator_Page.chief_investigator_header_label
    );
    this.chief_investigator_first_name_label = this.page.locator('[aria-describedby="first-name-hint"]');
    this.chief_investigator_last_name_label = this.page.locator('[aria-describedby="last-name-hint"]');
    this.chief_investigator_email_label = this.page.locator('[aria-describedby="email-hint"]');
    this.chief_investigator_first_name_text = this.page.getByTestId('IQA0401_Text');
    this.chief_investigator_last_name_text = this.page.getByTestId('IQA0402_Text');
    this.chief_investigator_email_text = this.page.getByTestId('IQA0403_Text');
  }

  //Page Methods
  async assertOnChiefInvestigatorPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.chiefInvestigatorPageTestData.Chief_Investigator_Page.heading);
  }
}
