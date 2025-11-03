import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import { confirmStringNotNull, validateDateRange } from '../../../../utils/UtilFunctions';

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
  readonly modificationRows: Locator;
  readonly listCell: Locator;

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
    this.short_project_title_value = this.page.locator('div.govuk-inset-text p').nth(1);
    this.iras_id_value = this.page.locator('div.govuk-inset-text p').first();
    // this.iras_id_value = this.page
    //   .locator('[class$="key"]')
    //   .getByText(this.modificationsCommonPageTestData.Label_Texts.iras_id_label)
    //   .locator('..')
    //   .locator('[class$="value"]');
    // this.short_project_title_value = this.page
    //   .locator('[class$="key"]')
    //   .getByText(this.modificationsCommonPageTestData.Label_Texts.short_project_title_label)
    //   .locator('..')
    //   .locator('[class$="value"]');
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
    this.modificationRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
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
    let requiresResources: string | undefined;
    let affectedOrgs: string | undefined;
    const affectsNonNhsOnly =
      dataset.which_organisation_change_affect_checkbox.some((item: string) => item.toLowerCase() === 'non-nhs/hsc') &&
      dataset.which_organisation_change_affect_checkbox.length === 1;
    const affectsNhs = dataset.which_organisation_change_affect_checkbox.some(
      (item: string) => item.toLowerCase() === 'nhs/hsc'
    );
    if (affectsNhs) {
      requiresResources = dataset.will_nhs_hsc_organisations_require_additional_resources_question_radio.toLowerCase();
      affectedOrgs = dataset.will_some_or_all_organisations_be_affected_question_radio.toLowerCase();
    }
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
    await this.page.waitForLoadState('domcontentloaded');
    await expect(cardLocator).toBeVisible({ timeout: 5000 });
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

    for (let cardRowIndex = 0; cardRowIndex < rowCount; cardRowIndex++) {
      await this.page.waitForLoadState('domcontentloaded');
      const row = rows.nth(cardRowIndex);
      const key = await row.locator('.govuk-summary-list__key').innerText();
      const value = await row.locator('.govuk-summary-list__value').innerText();
      const cleanedKey = key.trim();
      const cleanedValue = confirmStringNotNull(value);

      switch (cleanedKey) {
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .planned_project_end_date_label: {
          const [day, month, year] = cleanedValue.split(' ');
          cardData['planned_project_end_day_text'] = day;
          cardData['planned_project_end_month_dropdown'] = month;
          cardData['planned_project_end_year_text'] = year;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .affected_organisation_types_label: {
          cardData['which_organisation_change_affect_checkbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .affected_nhs_hsc_locations_label: {
          cardData['where_organisation_change_affect_nhs_question_checkbox'] = cleanedValue;

          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .affected_non_nhs_hsc_locations_label: {
          cardData['where_organisation_change_affect_non_nhs_question_checkbox'] = cleanedValue;

          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .portion_of_nhs_hsc_organisations_affected_label: {
          cardData['will_some_or_all_organisations_be_affected_question_radio'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .additional_resource_implications_label: {
          cardData['will_nhs_hsc_organisations_require_additional_resources_question_radio'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Sponsor_Details_Label_Texts.sponsor_reference_label: {
          cardData['sponsor_modification_reference_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Sponsor_Details_Label_Texts.sponsor_date_label: {
          const [day, month, year] = cleanedValue.split(' ');
          cardData['sponsor_modification_date_day_textbox'] = day;
          cardData['sponsor_modification_date_month_textbox'] = month;
          cardData['sponsor_modification_date_year_textbox'] = year;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Sponsor_Details_Label_Texts.sponsor_summary_label: {
          cardData['sponsor_summary_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.modification_type_label: {
          modificationInfo['modification_type'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.category_label: {
          modificationInfo['category'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.review_type_label: {
          modificationInfo['review_type'] = cleanedValue;
          break;
        }
      }
    }
    return { cardData, modificationInfo }; //  Return both separately (change data and ranking info)
  }

  async getModificationPostApprovalPage(): Promise<Map<string, string[]>> {
    const modificationIdValue: string[] = [];
    const submittedDateValue: string[] = [];
    const statusValue: string[] = [];
    const columns = this.tableRows.nth(1).getByRole('cell');
    const modificationId = confirmStringNotNull(await columns.nth(0).textContent());
    modificationIdValue.push(modificationId);
    const submittedDate = confirmStringNotNull(await columns.nth(4).textContent());
    submittedDateValue.push(submittedDate);
    const status = confirmStringNotNull(await columns.nth(5).textContent());
    statusValue.push(status);
    const modificationMap = new Map([
      ['modificationIdValue', modificationIdValue],
      ['submittedDateValue', submittedDateValue],
      ['statusValue', statusValue],
    ]);
    return modificationMap;
  }

  async getModificationRowNumberPostApprovalPage(rowNumber?: number): Promise<Map<string, string[]>> {
    const modificationIdValue: string[] = [];
    const submittedDateValue: string[] = [];
    const statusValue: string[] = [];
    const columns = this.tableRows.nth(rowNumber).getByRole('cell');
    const modificationId = confirmStringNotNull(await columns.nth(0).textContent());
    modificationIdValue.push(modificationId);
    const submittedDate = confirmStringNotNull(await columns.nth(4).textContent());
    submittedDateValue.push(submittedDate);
    const status = confirmStringNotNull(await columns.nth(5).textContent());
    statusValue.push(status);
    const modificationMap = new Map([
      ['modificationIdValue', modificationIdValue],
      ['submittedDateValue', submittedDateValue],
      ['statusValue', statusValue],
    ]);
    return modificationMap;
  }

  async validateSearchResults(
    commonItemsPage: any,
    searchCriteriaDataset: any,
    validateSearch: boolean = true,
    rowNumber: number = 1
  ) {
    // Loop through Max_Pages_To_Validate (currently set to 2)
    //   for (let pageIndex = 1; pageIndex < modificationsCommonPageTestData.Max_Pages_To_Validate; pageIndex++) {
    //const rowCount = await commonItemsPage.tableRows.count();
    //for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
    //const rownumber = rowIndex;
    const modificationId = await this.getModificationRowNumberPostApprovalPage(rowNumber);
    const modificationIDActual = modificationId.get('modificationIdValue');
    // Validate modifciation search resuts
    if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
      const modificationIdExpected = searchCriteriaDataset['search_input_text'];
      expect(modificationIDActual.includes(modificationIdExpected));
    }
    //}
    const hasNextPage =
      (await commonItemsPage.pagination_next_link.isVisible()) &&
      !(await commonItemsPage.pagination_next_link.isDisabled());
    if (hasNextPage) {
      await commonItemsPage.next_button.click();
    }
    //  }
  }

  async getRowDataAdvancedFiltersSearch(row: any) {
    return {
      modificationId: confirmStringNotNull(await row.getByRole('cell').nth(0).textContent()),
      modificationType: confirmStringNotNull(await row.getByRole('cell').nth(1).textContent()),
      dateSubmitted: confirmStringNotNull(await row.getByRole('cell').nth(4).textContent()),
      status: confirmStringNotNull(await row.getByRole('cell').nth(5).textContent()),
    };
  }

  async validateResults(
    commonItemsPage: any,
    searchCriteriaDataset: any,
    filterDataset?: any,
    validateSearch: boolean = true
  ) {
    for (let pageIndex = 1; pageIndex < 2; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const { modificationType, dateSubmitted, status } = await this.getRowDataAdvancedFiltersSearch(row);
        if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
          this.validateSearchResults(commonItemsPage, searchCriteriaDataset, true, rowIndex);
        }
        this.validateFilters(modificationType, dateSubmitted, status, filterDataset);
      }
      const hasNextPage =
        (await commonItemsPage.pagination_next_link.isVisible()) &&
        !(await commonItemsPage.pagination_next_link.isDisabled());
      if (hasNextPage) {
        await commonItemsPage.pagination_next_link.click();
      }
    }
  }

  async validateFilters(
    modificationTypeActual: string,
    dateSubmittedActual: string,
    statusActual: string,
    filterDataset: any
  ) {
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key === 'status_radio') {
          const statusExpected = filterDataset[key];
          expect(
            statusExpected.some((statusLabel: string) => statusActual.toLowerCase().includes(statusLabel.toLowerCase()))
          ).toBeTruthy();
        }
        if (key === 'modification_type_radio') {
          const modificationTypeExpected = filterDataset[key];
          expect(
            modificationTypeExpected.some((modificationTypeLabel: string) =>
              modificationTypeActual.toLowerCase().includes(modificationTypeLabel.toLowerCase())
            )
          ).toBeTruthy();
        }
        if (
          key.includes('date_submitted_from_year_text') ||
          (key.includes('date_submitted_to_year_text') && dateSubmittedActual !== null)
        ) {
          const filterFromDate = `${filterDataset['date_submitted_from_day_text']} ${filterDataset['date_submitted_from_month_dropdown']} ${filterDataset['date_submitted_from_year_text']}`;
          const filterToDate = `${filterDataset['date_submitted_to_day_text']} ${filterDataset['date_submitted_to_month_dropdown']} ${filterDataset['date_submitted_to_year_text']}`;
          if (filterFromDate !== '' && filterToDate !== '') {
            await this.validateDateFilter(filterFromDate, filterToDate, dateSubmittedActual);
          }
        }
      }
    }
  }

  async validateDateFilter(filterFromDate: string, filterToDate: string, submittedDateActual: string) {
    const submittedDateActualOnlyDate = submittedDateActual.substring(0, 11);
    const isDateSubmittedInDateInValidRange = await validateDateRange(
      submittedDateActualOnlyDate,
      filterFromDate,
      filterToDate
    );
    expect(isDateSubmittedInDateInValidRange).toBe(true);
  }
}
