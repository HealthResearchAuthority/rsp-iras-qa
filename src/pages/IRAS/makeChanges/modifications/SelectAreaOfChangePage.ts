import { expect, Locator, Page } from '@playwright/test';
import * as selectAreaOfChangePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/select_area_of_change_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import config from '../../../../../playwright.config';

//Declare Page Objects
export default class ModificationsSelectAreaOfChangePage {
  readonly page: Page;
  readonly selectAreaOfChangePageTestData: typeof selectAreaOfChangePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly modification_id_text_row: Locator;
  readonly modification_id_text: Locator;
  readonly remove_this_change_link: Locator;
  readonly area_of_change_dropdown: Locator;
  readonly specific_change_dropdown: Locator;
  readonly areaOfChangeLabel: Locator;
  private _modification_id: string;
  readonly area_of_change_dropdown_all_options: Locator;
  readonly specific_change_dropdown_all_options: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.selectAreaOfChangePageTestData = selectAreaOfChangePageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: selectAreaOfChangePageTestData.Select_Area_Of_Change_Page.heading,
    });
    this.iras_id_row = this.page.getByText(selectAreaOfChangePageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');

    this.short_project_title_text_row = this.page.getByText(
      selectAreaOfChangePageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.modification_id_text_row = this.page.getByText(
      selectAreaOfChangePageTestData.Label_Texts.modification_id_label
    );
    this.modification_id_text = this.modification_id_text_row.locator('..').locator('.govuk-summary-list__value');
    this.area_of_change_dropdown = this.page.getByTestId('AreaOfChangeId');
    this.area_of_change_dropdown_all_options = this.area_of_change_dropdown.locator('select option');

    this.specific_change_dropdown = this.page.getByTestId('SpecificChangeId');
    this.specific_change_dropdown_all_options = this.specific_change_dropdown.locator('option');

    this.remove_this_change_link = this.page.getByRole('link', {
      name: this.linkTextData.Participating_Organisations_Page.Remove_This_Change,
      exact: true,
    });
  }

  //Page Methods
  async assertOnSelectAreaOfChangePage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async setModificationId(modificationId: string) {
    this._modification_id = modificationId;
  }

  async getModificationId() {
    return this._modification_id;
  }

  async selectAreaOfChangeInModificationsPage(dataset: any, $tags: any) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (!Object.hasOwn(dataset, key)) continue;
      if (key === 'area_of_change_dropdown') {
        await commonItemsPage.fillUIComponent(dataset, key, this);
        if (
          $tags.includes('@jsDisabled') ||
          (!$tags.includes('@jsEnabled') && !config.projects?.[1].use?.javaScriptEnabled)
        ) {
          await commonItemsPage.clickButton('Select_Area_Of_Change_Page', 'Apply_Selection');
        }
      } else if (key === 'specific_change_dropdown') {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    const saveAndContinueButton = commonItemsPage.buttonTextData['Select_Area_Of_Change_Page']['Save_Continue'];
    await commonItemsPage.govUkButton
      .getByText(saveAndContinueButton, { exact: true })
      .or(commonItemsPage.genericButton.getByText(saveAndContinueButton, { exact: true }))
      .first()
      .click();
  }

  async selectAreaOfChangeAndSaveLater(dataset: any) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'area_of_change_dropdown' || key === 'specific_change_dropdown') {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    const saveForLaterButton = commonItemsPage.buttonTextData['Select_Area_Of_Change_Page']['Save_For_Later'];
    await commonItemsPage.govUkButton
      .getByText(saveForLaterButton, { exact: true })
      .or(commonItemsPage.genericButton.getByText(saveForLaterButton, { exact: true }))
      .first()
      .click();
  }
}
