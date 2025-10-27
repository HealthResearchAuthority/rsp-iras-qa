import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import { confirmStringNotNull, convertDate } from '../../../../utils/UtilFunctions';

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
  readonly changes_free_text: Locator;
  readonly modification_type: Locator;
  readonly category: Locator;
  readonly review_type: Locator;
  readonly changes_modification_type: Locator;
  readonly changes_free_text_summary_error: Locator;
  readonly overall_modification_ranking_sub_heading: Locator;
  readonly changes_sub_heading: Locator;
  readonly ranking_sub_heading: Locator;
  readonly allChangeCards: Locator;
  readonly keyLocatorString: string;
  readonly valueLocatorString: string;
  readonly allModificationTypeKeys: Locator;
  readonly allModificationTypeValues: Locator;
  readonly allCategoryValues: Locator;
  readonly allReviewTypeValues: Locator;

  private rankingForChanges: Record<
    string,
    { expectedModificationType: string; expectedCategory: string; expectedReviewType: string }[]
  > = {};
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
    this.keyLocatorString = 'dt.govuk-summary-list__key';
    this.valueLocatorString = '~ dd.govuk-summary-list__value';
    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.overall_modification_ranking_sub_heading = this.pageHeading.getByText(
      modificationsCommonPageTestData.Label_Texts.overall_modification_ranking_label
    );
    this.ranking_sub_heading = this.pageHeading
      .getByText(modificationsCommonPageTestData.Label_Texts.ranking_label)
      .first();
    this.changes_sub_heading = this.pageHeading.getByText(modificationsCommonPageTestData.Label_Texts.changes_label);
    this.allChangeCards = this.page.locator('.govuk-summary-card');
    this.allModificationTypeKeys = this.page.locator('dt.govuk-summary-list__key').filter({
      hasText: this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.modification_type_label,
    });
    this.allModificationTypeValues = this.page
      .locator('dt.govuk-summary-list__key', {
        hasText: this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.modification_type_label,
      })
      .locator('~ dd.govuk-summary-list__value');

    this.allCategoryValues = this.page
      .locator('dt.govuk-summary-list__key', {
        hasText: this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.category_label,
      })
      .locator('~ dd.govuk-summary-list__value');
    this.allReviewTypeValues = this.page
      .locator('dt.govuk-summary-list__key', {
        hasText: this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.review_type_label,
      })
      .locator('~ dd.govuk-summary-list__value');

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
    this.changes_free_text = this.page
      .getByText(this.modificationsCommonPageTestData.Label_Texts.changes_free_textbox_label)
      .locator('..')
      .locator('textarea');

    this.modification_type = this.page
      .getByText(this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.modification_type_label)
      .locator('..')
      .locator('[class$="value"]');

    this.category = this.page
      .getByText(this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.category_label)
      .locator('..')
      .locator('[class$="value"]');

    this.review_type = this.page
      .getByText(this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.review_type_label)
      .locator('..')
      .locator('[class$="value"]');

    this.changes_modification_type = this.page
      .locator('.govuk-summary-card__content', {
        hasText: this.modificationsCommonPageTestData.Modification_Ranking_Label_Texts.modification_type_label,
      })
      .locator('[class$="value"]');
    this.changes_free_text_summary_error = this.page.locator('.govuk-error-summary__list');
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
  async validatePageHeading(pageHeadingText: any) {
    await expect(this.pageHeading.getByText(pageHeadingText)).toBeVisible();
  }

  async createChangeModification(
    {
      projectIdentificationSelectChangePage,
      projectIdentificationSelectReferenceToChangePage,
      projectIdentificationEnterReferenceNumbersPage,
    },
    changeName: string,
    dataset: any
  ) {
    const keys = Object.keys(dataset);
    if (dataset.specific_change_dropdown === 'Change to planned end date') {
      await new PlannedEndDateChangePage(this.page).fillPlannedProjectEndDateModificationsPage(dataset, 'create');
    } else if (
      this.modificationsCommonPageTestData.Modifications_To_Add_Free_Text.includes(dataset.specific_change_dropdown)
    ) {
      await this.fillFreeTextChangePage(
        {
          commonItemsPage: new CommonItemsPage(this.page),
        },
        dataset
      );
    } else if (
      this.modificationsCommonPageTestData.Modifications_To_Add_Administrative_Details.includes(
        dataset.specific_change_dropdown
      )
    ) {
      await projectIdentificationSelectChangePage.fillProjectIdentificationSelectChangePage(dataset);
      await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
      if (keys.includes('project_reference_numbers_radio')) {
        await projectIdentificationSelectReferenceToChangePage.fillProjectIdentificationSelectReferenceToChangePage(
          dataset
        );
        await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
      }
      await projectIdentificationEnterReferenceNumbersPage.fillProjectIdentificationEnterReferenceNumbersPage(dataset);
      await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
    }
    if (this.modificationsCommonPageTestData.Applicability_Changes.includes(dataset.specific_change_dropdown)) {
      await this.fillApplicabilityPages(dataset);
    }
    await this.validateRankingForIndividualChange(changeName);
    await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
  }

  async fillApplicabilityPages(dataset: any) {
    await new AffectedOrganisationSelectionPage(this.page).fillAffectedOrganisation(dataset, 'create');
    await new AffectedOrganisationQuestionsPage(this.page).fillAffectedOrganisationQuestions(dataset, 'create');
  }

  async fillFreeTextChangePage({ commonItemsPage }, dataset: any) {
    await this.validatePageHeading(dataset.specific_change_dropdown);
    for (const key in dataset) {
      if (key === 'changes_free_text') {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
  }

  async validateRankingForIndividualChange(changeName: string) {
    const actualModificationType = confirmStringNotNull(await this.modification_type.textContent());
    const actualCategory = confirmStringNotNull(await this.category.textContent());
    const actualReviewType = confirmStringNotNull(await this.review_type.textContent());
    const ranking = await this.getrankingForChanges();
    const changeRankings = ranking[changeName];
    if (changeRankings && changeRankings.length > 0) {
      const { expectedModificationType, expectedCategory, expectedReviewType } = changeRankings[0];
      expect.soft(actualModificationType).toBe(expectedModificationType);
      expect.soft(actualCategory).toBe(expectedCategory);
      expect.soft(actualReviewType).toBe(expectedReviewType);
    } else {
      throw new Error(`No ranking data found for changeName: ${changeName}`);
    }
  }

  async validateIndividualAndOverallRanking() {
    const changeCards = this.allChangeCards;
    const ranking = await this.getrankingForChanges();
    const changeNames = Object.keys(ranking);
    const actualValuesArray: Array<{ modificationType: string; category: string; reviewType: string }> = [];
    const relevantCards = [];
    const totalCards = await changeCards.count();
    for (let cardIndex = 0; cardIndex < totalCards; cardIndex++) {
      const card = changeCards.nth(cardIndex);
      const hasModificationType = await card.locator(this.allModificationTypeKeys).count();
      if (hasModificationType > 0) {
        relevantCards.push(card);
      }
    }

    for (const card of relevantCards) {
      const actualModificationType = confirmStringNotNull(
        await card.locator(this.allModificationTypeValues).textContent()
      );
      const actualCategory = confirmStringNotNull(await card.locator(this.allCategoryValues).textContent());
      const actualReviewType = confirmStringNotNull(await card.locator(this.allReviewTypeValues).textContent());
      actualValuesArray.push({
        modificationType: actualModificationType,
        category: actualCategory,
        reviewType: actualReviewType,
      });
    }
    const reversedChangeNames = changeNames.toReversed();
    const overallExpected = this.overallRankingForChanges;
    const overAllActual = actualValuesArray[0];
    expect.soft(overAllActual.modificationType).toBe(overallExpected.modificationType);
    expect.soft(overAllActual.category).toBe(overallExpected.category);
    expect.soft(overAllActual.reviewType).toBe(overallExpected.reviewType);
    for (let arrayIndex = 0, fieldIndex = 1; arrayIndex < actualValuesArray.length - 1; arrayIndex++, fieldIndex++) {
      const changeName = reversedChangeNames[arrayIndex];
      const changeRankings = ranking[changeName];
      if (changeRankings && changeRankings.length > 0) {
        const { expectedModificationType, expectedCategory, expectedReviewType } = changeRankings[0];
        expect.soft(actualValuesArray[fieldIndex].modificationType).toBe(expectedModificationType);
        expect.soft(actualValuesArray[fieldIndex].category).toBe(expectedCategory);
        expect.soft(actualValuesArray[fieldIndex].reviewType).toBe(expectedReviewType);
      } else {
        throw new Error(`No ranking data found for changeName: ${changeName}`);
      }
    }
  }

  async validateAllFieldsOnModificationDetailsPage(datasetName: string) {
    const changeCards = this.allChangeCards;
    const changeDataset = this.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changeDataset);
    const actualValuesArray: Array<{
      specificChangeValue: string;
      areaOfChangeSubHeading: string;
      individualChangeStatus: string;
    }> = [];
    const relevantCards = [];
    const totalCards = await changeCards.count();
    const reversedChangeNames = changeNames.toReversed();
    expect.soft(this.overall_modification_ranking_sub_heading).toBeVisible();
    expect.soft(this.ranking_sub_heading).toBeVisible();
    expect.soft(this.changes_sub_heading).toBeVisible();

    for (let cardIndex = 1; cardIndex < totalCards; cardIndex++) {
      const card = changeCards.nth(cardIndex);
      relevantCards.push(card);
    }
    let changeIndex = 0;
    for (const card of relevantCards) {
      const actualSpecificChangeValue = confirmStringNotNull(
        await card
          .locator(this.keyLocatorString, {
            hasText: changeDataset[reversedChangeNames[changeIndex]]['specific_change_dropdown'],
          })
          .locator(this.valueLocatorString)
          .textContent()
      ).trim();
      const actualAreaOfChangeSubHeading = confirmStringNotNull(
        await card
          .getByText(
            `Change ${changeIndex + 1} - ${changeDataset[reversedChangeNames[changeIndex]]['area_of_change_dropdown']}`
          )
          .textContent()
      )
        .trim()
        .split('\n')[0];
      const actualChangeStatus = confirmStringNotNull(await card.locator('h2 strong').textContent()).trim();

      actualValuesArray.push({
        specificChangeValue: actualSpecificChangeValue,
        areaOfChangeSubHeading: actualAreaOfChangeSubHeading,
        individualChangeStatus: actualChangeStatus,
      });
      changeIndex = changeIndex + 1;
    }
    for (let arrayIndex = 0, fieldIndex = 0; arrayIndex < actualValuesArray.length; arrayIndex++, fieldIndex++) {
      const changeName = reversedChangeNames[arrayIndex];
      for (const key of Object.keys(changeDataset[changeName])) {
        const expectedChangeStatus = changeDataset[changeName]['change_status'];
        expect.soft(actualValuesArray[fieldIndex].individualChangeStatus).toBe(expectedChangeStatus);
        if (key.toLocaleLowerCase().includes('free_text')) {
          const expectedAreaOfChangeSubHeading = `Change ${fieldIndex + 1} - ${changeDataset[reversedChangeNames[fieldIndex]]['area_of_change_dropdown']}`;
          expect.soft(actualValuesArray[fieldIndex].areaOfChangeSubHeading).toBe(expectedAreaOfChangeSubHeading);
          expect
            .soft(actualValuesArray[fieldIndex].individualChangeStatus)
            .toBe(modificationsCommonPageTestData.Label_Texts.change_ready_for_submission_status_label);
          expect
            .soft(actualValuesArray[fieldIndex].specificChangeValue)
            .toBe(changeDataset[changeName]['changes_free_text']);
        } else if (key.toLocaleLowerCase().includes('end_year')) {
          const expectedNewPlannedEndDate = await convertDate(
            changeDataset[changeName]['planned_project_end_day_text'],
            changeDataset[changeName]['planned_project_end_month_dropdown'],
            changeDataset[changeName]['planned_project_end_year_text']
          );
          const expectedAreaOfChangeSubHeading = `Change ${arrayIndex + 1} - ${changeDataset[changeName]['area_of_change_dropdown']}`;
          expect.soft(actualValuesArray[fieldIndex].areaOfChangeSubHeading).toBe(expectedAreaOfChangeSubHeading);
          expect
            .soft(actualValuesArray[fieldIndex].individualChangeStatus)
            .toBe(modificationsCommonPageTestData.Label_Texts.change_ready_for_submission_status_label);
          expect.soft(actualValuesArray[fieldIndex].specificChangeValue).toBe(expectedNewPlannedEndDate);
        }
      }
    }
  }

  async setrankingForChanges(
    changeName: string,
    expectedModificationType: string,
    expectedCategory: string,
    expectedReviewType: string
  ) {
    if (!this.rankingForChanges[changeName]) {
      this.rankingForChanges[changeName] = [];
    }
    this.rankingForChanges[changeName].push({ expectedModificationType, expectedCategory, expectedReviewType });
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

  async calculateAndStoreRankingForChangesForNonApplicability(
    changeName: string,
    changeDataset: any,
    researchLocationDataset: any
  ) {
    const modificationType = await this.getModificationType(changeDataset);
    const category = await this.getModificationCategoryForNonApplicability(changeDataset, researchLocationDataset);
    const reviewType = await this.getModificationReviewType(changeDataset);
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async calculateAndStoreRankingForChangesForApplicability(changeName: string, dataset: any) {
    const modificationType = await this.getModificationType(dataset);
    const category = await this.getModificationCategoryForApplicability(dataset);
    const reviewType = await this.getModificationReviewType(dataset);
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async getModificationType(dataset: any): Promise<string> {
    let modificationType: string;
    if (
      modificationsCommonPageTestData.Ranking_Modification_Type.Minor_Modifications.includes(
        dataset.specific_change_dropdown
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification;
    } else if (
      modificationsCommonPageTestData.Ranking_Modification_Type.Modification_Of_Important_Detail.includes(
        dataset.specific_change_dropdown
      )
    ) {
      modificationType =
        this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail;
    } else if (
      modificationsCommonPageTestData.Ranking_Modification_Type.Non_Notifiable_Modifications.includes(
        dataset.specific_change_dropdown
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_non_notifiable;
    }
    return modificationType;
  }

  async getModificationCategoryForApplicability(dataset: any): Promise<string> {
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
    return category;
  }

  async getModificationCategoryForNonApplicability(changeDataset, researchLocationDataset: any): Promise<string> {
    let category: string | undefined;
    if (modificationsCommonPageTestData.Non_Applicability_Changes.includes(changeDataset.specific_change_dropdown)) {
      if (researchLocationDataset['is_nhs_hsc_organisation_radio'] === 'Yes') {
        category = this.modificationsCommonPageTestData.Label_Texts.category_c;
      } else if (researchLocationDataset['is_nhs_hsc_organisation_radio'] === 'No') {
        category = this.modificationsCommonPageTestData.Label_Texts.category_n_a;
      }
    }
    return category;
  }

  async getModificationReviewType(dataset: any): Promise<string> {
    let reviewType: string;
    if (
      modificationsCommonPageTestData.Ranking_Review_Type.Review_Required_Changes.includes(
        dataset.specific_change_dropdown
      )
    ) {
      reviewType = this.modificationsCommonPageTestData.Label_Texts.review_type_review_required;
    } else if (
      modificationsCommonPageTestData.Ranking_Review_Type.Non_Reviewable_Changes.includes(
        dataset.specific_change_dropdown
      )
    ) {
      reviewType = this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required;
    }
    return reviewType;
  }

  async calculateAndStoreOverallRanking() {
    const values = Object.values(await this.getrankingForChanges()).flatMap((v) => (Array.isArray(v) ? v : [v]));
    const reviewType = values.some(
      (r) => r.expectedReviewType === this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
    )
      ? this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
      : this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required;
    let modificationType: string;
    if (
      values.some(
        (r) =>
          r.expectedModificationType === this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial;
    } else if (
      values.some(
        (r) =>
          r.expectedModificationType ===
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
    const category = categoryOrder.find((c) => values.some((r) => r.expectedCategory === c));
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
    const modificationInfo: Record<string, string> = {};

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
    return { cardData, modificationInfo };
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
}
