import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsIRASPageTestData from '../../../resources/test_data/iras/make_changes/project_details_iras_data.json';
import * as fse from 'fs-extra';
//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly projectDetailsIRASPageTestData: typeof projectDetailsIRASPageTestData;
  readonly pageHeading: Locator;
  readonly iras_textbox_label: Locator;
  readonly iras_id_text: Locator;
  readonly iras_id_text_summary_error_label: Locator;
  readonly iras_textbox_hint: Locator;
  private _unique_iras_id: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsIRASPageTestData = projectDetailsIRASPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.iras_textbox_label = this.page.getByText(this.projectDetailsIRASPageTestData.Label_Texts.iras_textbox_label, {
      exact: true,
    });
    this.iras_textbox_hint = this.page.getByText(this.projectDetailsIRASPageTestData.Label_Texts.iras_textbox_hint, {
      exact: true,
    });
    this.iras_id_text = this.page.getByTestId('IrasId');
    this.iras_id_text_summary_error_label = this.page.locator('.govuk-error-summary__list [href^="#IrasId"]');
  }

  //Page Methods
  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.heading);
  }

  async setUniqueIrasId(value: string): Promise<void> {
    this._unique_iras_id = value;
  }

  async getUniqueIrasId(): Promise<string> {
    return this._unique_iras_id;
  }

  async updateUniqueIrasIdTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await fse.readJson(filePath);
        data.Invalid_IRAS_ID_Duplicate.iras_id_text = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating unique iras id to testdata json file:`);
      }
    })();
  }
}
