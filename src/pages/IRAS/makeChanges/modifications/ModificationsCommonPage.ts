import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

//Declare Page Objects
export default class ModificationsCommonPage {
  readonly page: Page;
  readonly modificationsCommonPageTestData: typeof modificationsCommonPageTestData;
  private _modification_id: string;
  readonly pageHeading: Locator;
  readonly pageComponentLabel: Locator;
  readonly iras_id_value: Locator;
  readonly short_project_title_value: Locator;
  readonly modification_id_value: Locator;
  readonly status_value: Locator;
  readonly tableRows: Locator;
  readonly modification_id_link: Locator;

  private rankingForChanges: Record<string, { modificationType: string; category: string; reviewType: string }[]> = {};
  private overallRankingForChanges: { modificationType: string; category: string; reviewType: string } = {
    modificationType: '',
    category: '',
    reviewType: '',
  };

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsCommonPageTestData = modificationsCommonPageTestData;
    this._modification_id = '';

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.iras_id_value = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.iras_id_label)
      .locator('..')
      .locator('[class$="value"]');
    this.short_project_title_value = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.short_project_title_label)
      .locator('..')
      .locator('[class$="value"]');
    this.modification_id_value = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.modification_id_label)
      .locator('..')
      .locator('[class$="value"]');
    this.status_value = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.status_label)
      .locator('..')
      .locator('[class$="value"]');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.modification_id_link = this.tableRows.nth(1).getByRole('cell').nth(0);
  }

  //Getters & Setters for Private Variables
  async setModificationID(value: string): Promise<void> {
    this._modification_id = value;
  }

  async getModificationID(): Promise<string> {
    return this._modification_id;
  }

  //Page Methods
  async assertOnModificationsPage(dataset: any) {
    const pageHeader = dataset['page_header'];
    const pageComponentLabel = dataset['page_component_label'];
    await expect(this.pageHeading.getByText(pageHeader)).toBeVisible();
    await expect(this.page.getByText(pageComponentLabel)).toBeVisible();
  }

  async createChangeModification(changeName: string, dataset: any) {
    if (changeName.toLowerCase().includes('planned_end_date')) {
      await new PlannedEndDateChangePage(this.page).fillPlannedProjectEndDateModificationsPage(dataset, 'create');
      await new AffectedOrganisationSelectionPage(this.page).fillAffectedOrganisation(dataset, 'create');
      await new AffectedOrganisationQuestionsPage(this.page).fillAffectedOrganisationQuestions(dataset, 'create');
      await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
      return;
    }
    // else if (changeName.toLowerCase().includes('project_documents'))
    throw new Error(`${changeName} is not a valid option`);
  }

  async setrankingForChanges(changeName: string, modificationType: string, category: string, reviewType: string) {
    if (!this.rankingForChanges[changeName]) {
      this.rankingForChanges[changeName] = [];
    }
    this.rankingForChanges[changeName].push({ modificationType, category, reviewType });
  }

  async getrankingForChanges() {
    return this.rankingForChanges;
  }

  async setOverallRanking(modificationType: string, category: string, reviewType: string) {
    this.overallRankingForChanges = { modificationType, category, reviewType };
  }

  async getOverallRankingForChanges() {
    return this.overallRankingForChanges;
  }

  async calculateAndStoreRankingForChangesForNonApplicability(changeName: string) {
    const modificationType = {
      substantial: this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial,
      modification_of_important_detail:
        this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail,
      minor_modification: this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification,
    }[
      Object.keys(this.modificationsCommonPageTestData.Ranking_Modification_Type).find((key) =>
        this.modificationsCommonPageTestData.Ranking_Modification_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )
    ];
    const category = {
      'n/a': this.modificationsCommonPageTestData.Label_Texts.category_n_a,
      c: this.modificationsCommonPageTestData.Label_Texts.category_c,
    }[
      Object.keys(this.modificationsCommonPageTestData.Ranking_Category).find((key) =>
        this.modificationsCommonPageTestData.Ranking_Category[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )
    ];
    const reviewType = {
      Review_Required: this.modificationsCommonPageTestData.Label_Texts.review_type_review_required,
      No_Review_Required: this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required,
    }[
      Object.keys(this.modificationsCommonPageTestData.Ranking_Review_Type).find((key) =>
        this.modificationsCommonPageTestData.Ranking_Review_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )
    ];
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async calculateAndStoreRankingForChangesForApplicability(changeName: string, dataset: any) {
    const modificationType = {
      substantial: this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial,
      modification_of_important_detail:
        this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail,
      minor_modification: this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification,
    }[
      Object.keys(this.modificationsCommonPageTestData.Ranking_Modification_Type).find((key) =>
        this.modificationsCommonPageTestData.Ranking_Modification_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )
    ];
    let category: string | undefined;
    const affectsNonNhsOnly =
      dataset.which_organisation_change_affect_checkbox.some((item: string) => item.toLowerCase() === 'non-nhs/hsc') &&
      dataset.which_organisation_change_affect_checkbox.length === 1;
    const affectsNhs = dataset.which_organisation_change_affect_checkbox.some(
      (item: string) => item.toLowerCase() === 'nhs/hsc'
    );
    const requiresResources =
      dataset.will_nhs_hsc_organisations_require_additional_resources_question_radio.toLowerCase();
    const affectedOrgs = dataset.will_some_or_all_organisations_be_affected_question_radio.toLowerCase();
    if (affectsNonNhsOnly) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_n_a;
    } else if (affectsNhs && requiresResources === 'no') {
      category = this.modificationsCommonPageTestData.Label_Texts.category_c;
    } else if (affectsNhs && requiresResources === 'yes' && affectedOrgs === 'some') {
      category = this.modificationsCommonPageTestData.Label_Texts.category_b;
    } else if (affectsNhs && requiresResources === 'yes' && affectedOrgs === 'all') {
      category = this.modificationsCommonPageTestData.Label_Texts.category_a;
    } else {
      category = undefined;
    }
    const reviewType = {
      Review_Required: this.modificationsCommonPageTestData.Label_Texts.review_type_review_required,
      No_Review_Required: this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required,
    }[
      Object.keys(this.modificationsCommonPageTestData.Ranking_Review_Type).find((key) =>
        this.modificationsCommonPageTestData.Ranking_Review_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )
    ];
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async calculateAndStoreOverallRanking() {
    const values = Object.values(await this.getrankingForChanges()).flatMap((v) => (Array.isArray(v) ? v : [v]));
    const reviewType = values.some(
      (r) => r.reviewType === this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
    )
      ? this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
      : this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required;
    let modificationType: string;
    if (
      values.some(
        (r) => r.modificationType === this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial;
    } else if (
      values.some(
        (r) =>
          r.modificationType ===
          this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail
      )
    ) {
      modificationType =
        this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail;
    } else {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification;
    }
    const categoryOrder = [
      this.modificationsCommonPageTestData.Label_Texts.category_a,
      this.modificationsCommonPageTestData.Label_Texts.category_b,
      this.modificationsCommonPageTestData.Label_Texts.category_c,
      this.modificationsCommonPageTestData.Label_Texts.category_n_a,
    ];
    const category = categoryOrder.find((c) => values.some((r) => r.category === c));
    this.setOverallRanking(modificationType, category, reviewType);
  }

  async getMappedSummaryCardDataForRankingCategoryChanges(cardTitle: string, CardHeading: string) {
    await this.page.waitForLoadState('domcontentloaded');
    const cardLocator = this.page
      .getByRole('heading', {
        name: CardHeading,
      })
      .locator('..')
      .locator('.govuk-summary-card')
      .filter({
        has: this.page.locator('.govuk-summary-card__title', { hasText: cardTitle }),
      });

    // Ensure page is loaded
    await this.page.waitForLoadState('domcontentloaded');
    // Wait for card to appear
    await expect(cardLocator).toBeVisible({ timeout: 5000 });
    // Wait for the card to be visible
    await cardLocator.waitFor({ state: 'visible' });

    const rows = cardLocator.locator('.govuk-summary-list__row');
    await expect.soft(rows.first()).toBeVisible();
    const rowCount = await rows.count();

    const specificChangeValue = await rows.nth(0).locator('.govuk-summary-list__key').innerText();

    const cardData: Record<string, any> = {};
    const modificationInfo: Record<string, string> = {}; //  Separate record for individual change ranking and category
    if (cardTitle.includes('Change')) {
      const cardTitleValue = await cardLocator.locator('.govuk-summary-card__title').textContent();
      const areaOfChangeValue = cardTitleValue?.split('-')[1].trim();
      cardData['area_of_change_dropdown'] = areaOfChangeValue;
      cardData['specific_change_dropdown'] = specificChangeValue;
    }

    for (let i = 0; i < rowCount; i++) {
      await this.page.waitForLoadState('domcontentloaded');
      const row = rows.nth(i);
      const key = await row.locator('.govuk-summary-list__key').innerText();
      const value = await row.locator('.govuk-summary-list__value').innerText();
      const cleanedKey = key.trim();
      const cleanedValue = value.trim().replaceAll(/\s+/g, ' ');

      switch (cleanedKey) {
        case 'Change to planned end date': {
          const [day, month, year] = cleanedValue.split(' ');
          cardData['planned_project_end_day_text'] = day;
          cardData['planned_project_end_month_dropdown'] = month;
          cardData['planned_project_end_year_text'] = year;
          break;
        }
        case 'Which organisation types does this change affect?': {
          cardData['which_organisation_change_affect_checkbox'] = cleanedValue
            .split(/,|&lt;br\/&gt;/)
            .map((v) => v.trim());
          break;
        }
        case 'Where are the participating NHS/HSC organisations that will be affected by this change?': {
          cardData['where_organisation_change_affect_nhs_question_checkbox'] = cleanedValue
            .split(/&lt;br\/&gt;/)
            .map((v) => v.trim());
          break;
        }
        case 'Where are the participating non-NHS/HSC organisations that will be affected by this change?': {
          cardData['where_organisation_change_affect_non_nhs_question_checkbox'] = cleanedValue
            .split(/&lt;br\/&gt;/)
            .map((v) => v.trim());
          break;
        }
        case 'Will some or all of the participating organisations be affected?': {
          cardData['will_some_or_all_organisations_be_affected_question_radio'] = cleanedValue;
          break;
        }
        case 'Will participating NHS/HSC organisations require additional resources to implement this change?': {
          cardData['will_nhs_hsc_organisations_require_additional_resources_question_radio'] = cleanedValue;
          break;
        }
        case 'Sponsor modification reference': {
          cardData['sponsor_modification_reference_textbox'] = cleanedValue;
          break;
        }
        case 'Sponsor modification date': {
          const [day, month, year] = cleanedValue.split(' ');
          cardData['sponsor_modification_date_day_textbox'] = day;
          cardData['sponsor_modification_date_month_textbox'] = month;
          cardData['sponsor_modification_date_year_textbox'] = year;
          break;
        }
        case 'Sponsor modification summary': {
          cardData['sponsor_summary_textbox'] = cleanedValue;
          break;
        }
        case 'Modification type': {
          modificationInfo['modification_type'] = cleanedValue;
          break;
        }
        case 'Category': {
          modificationInfo['category'] = cleanedValue;
          break;
        }
        case 'Review type': {
          modificationInfo['review_type'] = cleanedValue;
          break;
        }
        default: {
          cardData[cleanedKey.toLowerCase().replaceAll(' ', '_')] = cleanedValue;
        }
      }
    }

    return { cardData, modificationInfo }; //  Return both separately
  }

  async getModificationPostApprovalPage(): Promise<Map<string, string[]>> {
    const modificationIdValue: string[] = [];
    const submittedDateValue: string[] = [];
    const statusValue: string[] = [];
    for (let i = 1; i < 2; i++) {
      const columns = this.tableRows.nth(i).getByRole('cell');
      const modificationId = confirmStringNotNull(await columns.nth(0).textContent());
      modificationIdValue.push(modificationId);
      const submittedDate = confirmStringNotNull(await columns.nth(4).textContent());
      submittedDateValue.push(submittedDate);
      const status = confirmStringNotNull(await columns.nth(5).textContent());
      statusValue.push(status);
    }
    const modificationMap = new Map([
      ['modificationIdValue', modificationIdValue],
      ['submittedDateValue', submittedDateValue],
      ['statusValue', statusValue],
    ]);
    return modificationMap;
  }
  async getFormattedDate(): Promise<string> {
    const today = new Date();
    const options: Intl.DateTimeFormatOptions = {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    };
    const formattedDate = today.toLocaleDateString('en-GB', options);
    return formattedDate;
  }
}
