import { expect, Locator, Page } from '@playwright/test';
import * as modificationsDetailsPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_details_data.json';

//Declare Page Objects
export default class ModificationsDetailsPage {
  readonly page: Page;
  readonly modificationsDetailsPageTestData: typeof modificationsDetailsPageTestData;
  readonly pageHeading: Locator;
  readonly removeModificationPageHeading: Locator;
  readonly removeModificationSuccessMessageText: Locator;
  readonly modificationUnfinishedErrorPageHeading: Locator;
  readonly modificationUnfinishedHintLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsDetailsPageTestData = modificationsDetailsPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: modificationsDetailsPageTestData.Modification_Details_Page.heading,
    });
    this.removeModificationPageHeading = this.page.getByRole('heading', {
      name: modificationsDetailsPageTestData.Remove_Modifications_Page.heading,
    });
    this.removeModificationSuccessMessageText = this.page.getByRole('heading', {
      name: modificationsDetailsPageTestData.Remove_Modifications_Page.remove_modification_success_message,
    });
    this.modificationUnfinishedErrorPageHeading = this.page.getByRole('heading', {
      name: modificationsDetailsPageTestData.Modification_Unfinished_Error_Page.heading,
    });
    this.modificationUnfinishedHintLabel = this.page.getByText(
      modificationsDetailsPageTestData.Modification_Unfinished_Error_Page.modification_unfinished_hint_label
    );
  }

  //Page Methods
  async assertOnModificationsDetailsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async assertOnRemoveModificationsPage() {
    expect.soft(this.removeModificationPageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect.soft(currentUrl).toContain('confirmremovechange?');
  }
  async assertOnModificationUnfinishedErrorPage() {
    await expect.soft(this.modificationUnfinishedErrorPageHeading).toBeVisible();
    await expect.soft(this.modificationUnfinishedHintLabel).toBeVisible();
  }
}
