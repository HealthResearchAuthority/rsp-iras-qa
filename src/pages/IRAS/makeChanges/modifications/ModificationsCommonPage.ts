import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import { confirmStringNotNull, convertDate, validateDateRange } from '../../../../utils/UtilFunctions';
import ContactDetailsModificationPage from './ContactDetailsModificationPage';
import ProjectPersonnelChangeChiefInvestigatorPage from './ProjectPersonnelChangeChiefInvestigatorPage';
import ProjectPersonnelChangePrincipalInvestigatorPage from './ProjectPersonnelChangePrincipalInvestigatorPage';

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
  readonly overall_modification_summary_heading: Locator;
  readonly changes_sub_heading: Locator;
  readonly ranking_sub_heading: Locator;
  readonly allChangeCards: Locator;
  readonly keyLocator: Locator;
  readonly valueLocator: Locator;
  readonly allModificationTypeKeys: Locator;
  readonly allModificationTypeValues: Locator;
  readonly allCategoryValues: Locator;
  readonly allReviewTypeValues: Locator;
  readonly modificationStatusLabel: Locator;
  readonly modificationRows: Locator;
  readonly listCell: Locator;
  readonly documentRows: Locator;
  readonly documentTypeCell: Locator;
  readonly documentNameCell: Locator;
  readonly fileNameCell: Locator;
  readonly documentVersionCell: Locator;
  readonly documentDateCell: Locator;
  readonly documentStatusCell: Locator;
  readonly dateCreatedValue: Locator;
  readonly auditHistoryTables: Locator;
  readonly auditHistoryTableHeader: Locator;
  readonly auditHistoryTableBodyRows: Locator;
  readonly tableCell: Locator;
  readonly auditHistoryRecord: {
    modificationEventExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }[] = [];
  readonly auditHistoryRecordBackstageUser: {
    modificationEventExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }[] = [];
  readonly notification_heading_text: Locator;
  readonly notification_text: Locator;

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
    this.keyLocator = this.page.locator('dt.govuk-summary-list__key');
    this.valueLocator = this.page.locator('~ dd.govuk-summary-list__value');

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.modificationStatusLabel = this.page.locator('h2 strong');
    this.overall_modification_ranking_sub_heading = this.pageHeading.getByText(
      modificationsCommonPageTestData.Label_Texts.overall_modification_ranking_label
    );
    this.overall_modification_summary_heading = this.page.getByText(
      modificationsCommonPageTestData.Label_Texts.overall_modification_summary_label
    );
    this.ranking_sub_heading = this.pageHeading
      .getByText(modificationsCommonPageTestData.Label_Texts.ranking_label)
      .first();
    this.changes_sub_heading = this.pageHeading.getByText(modificationsCommonPageTestData.Label_Texts.changes_label);
    this.allChangeCards = this.page.locator('.govuk-summary-card:visible');
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
    this.modificationRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.documentRows = this.page.locator('#projectDocumentsTable tbody tr');
    this.documentTypeCell = this.page.locator('td:nth-child(1)');
    this.documentNameCell = this.page.locator('td:nth-child(2)');
    this.fileNameCell = this.page.locator('td:nth-child(3)');
    this.documentVersionCell = this.page.locator('td:nth-child(4)');
    this.documentDateCell = this.page.locator('td:nth-child(5)');
    this.documentStatusCell = this.page.locator('td:nth-child(6)');
    this.dateCreatedValue = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.dateCreated)
      .locator('..')
      .locator('[class$="value"]');
    this.auditHistoryTables = this.page.locator('table.govuk-table-users').filter({
      has: this.page.getByRole('columnheader', {
        name: modificationsCommonPageTestData.Label_Texts.Event_Description_Header_Label,
      }),
    });
    this.auditHistoryTableHeader = this.auditHistoryTables.locator('thead th');
    this.auditHistoryTableBodyRows = this.auditHistoryTables.locator('tbody tr');
    this.tableCell = this.page.locator('td');
    this.notification_heading_text = this.page.getByRole('heading', { level: 1 });
    this.notification_text = this.page.locator('p.govuk-body + p:visible');
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
    await expect(this.pageHeading.getByText(pageHeader).first()).toBeVisible();
    await expect(this.page.getByText(pageComponentLabel).first()).toBeVisible();
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
    const commonItemsPage = new CommonItemsPage(this.page);
    if (dataset.specific_change_dropdown === 'Change to planned end date') {
      await new PlannedEndDateChangePage(this.page).fillPlannedProjectEndDateModificationsPage(dataset, 'create');
    } else if (dataset.specific_change_dropdown === 'Contact details') {
      await new ContactDetailsModificationPage(this.page).fillContactDetailsModificationsPage(dataset, 'create');
    } else if (dataset.specific_change_dropdown === 'Change of Chief Investigator') {
      await new ProjectPersonnelChangeChiefInvestigatorPage(
        this.page
      ).fillPersonnelChangeChiefInvestigatorModificationsPage(dataset, 'create');
    } else if (dataset.specific_change_dropdown === 'Change of Principal Investigator') {
      await new ProjectPersonnelChangePrincipalInvestigatorPage(
        this.page
      ).fillPersonnelChangePrincipalInvestigatorModificationsPage(dataset, 'create');
    } else if (
      this.modificationsCommonPageTestData.Modifications_To_Add_Free_Text.includes(dataset.specific_change_dropdown)
    ) {
      await this.fillFreeTextChangePage(dataset);
    } else if (
      this.modificationsCommonPageTestData.Modifications_To_Add_Administrative_Details.includes(
        dataset.specific_change_dropdown
      )
    ) {
      await projectIdentificationSelectChangePage.fillProjectIdentificationSelectChangePage(dataset);
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
      if (keys.includes('project_reference_numbers_radio') || keys.includes('title_radio')) {
        await projectIdentificationSelectReferenceToChangePage.fillProjectIdentificationSelectReferenceToChangePage(
          dataset
        );
        await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
      }
      await projectIdentificationEnterReferenceNumbersPage.fillProjectIdentificationEnterReferenceNumbersPage(dataset);
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    }
    if (this.modificationsCommonPageTestData.Applicability_Changes.includes(dataset.specific_change_dropdown)) {
      await this.fillApplicabilityPages(dataset);
    }
    await this.validateRankingForIndividualChange(changeName);
    await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
  }

  async fillApplicabilityPages(dataset: any) {
    await new AffectedOrganisationSelectionPage(this.page).fillAffectedOrganisation(dataset, 'create');
    await new AffectedOrganisationQuestionsPage(this.page).fillAffectedOrganisationQuestions(dataset, 'create');
  }

  async fillFreeTextChangePage(dataset: any) {
    const commonItemsPage = new CommonItemsPage(this.page);
    await this.validatePageHeading(dataset.specific_change_dropdown);
    for (const key in dataset) {
      if (key === 'changes_free_text') {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
  }

  async validateRankingForIndividualChange(changeName: string) {
    const actualModificationType = confirmStringNotNull(await this.modification_type.textContent());
    const actualCategory = confirmStringNotNull(await this.category.textContent());
    const actualReviewType = confirmStringNotNull(await this.review_type.textContent());
    const ranking = await this.getrankingForChanges();
    const changeRankings = ranking[changeName];
    if (changeRankings && changeRankings.length > 0) {
      const { expectedModificationType, expectedCategory, expectedReviewType } = changeRankings[0];
      try {
        expect(actualModificationType).toBe(expectedModificationType);
        expect(actualCategory).toBe(expectedCategory);
        expect(actualReviewType).toBe(expectedReviewType);
      } catch (error) {
        console.log('Error in Change Name: ' + changeName + error);
        expect.soft(actualModificationType).toBe(expectedModificationType);
        expect.soft(actualCategory).toBe(expectedCategory);
        expect.soft(actualReviewType).toBe(expectedReviewType);
      }
    } else {
      throw new Error(`No ranking data found for changeName: ${changeName}`);
    }
  }

  async getIndividualRankingData() {
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

    return { actualValuesArray, ranking, changeNames };
  }

  async getActualFieldValuesOnModificationPage(
    changeCards: Locator,
    changeDataset: Record<string, any>,
    reversedChangeNames: string[]
  ): Promise<
    Array<{
      specificChangeValue: string;
      areaOfChangeSubHeading: string;
      individualChangeStatus: string;
    }>
  > {
    const actualValuesArray: Array<{
      specificChangeValue: string;
      areaOfChangeSubHeading: string;
      individualChangeStatus: string;
    }> = [];
    const totalCards = await changeCards.count();
    const relevantCards: Locator[] = [];
    // Collect all cards except the first one (index starts at 1)
    for (let cardIndex = 1; cardIndex < totalCards; cardIndex++) {
      relevantCards.push(changeCards.nth(cardIndex));
    }
    let changeIndex = 0;
    for (const card of relevantCards) {
      const actualSpecificChangeValueLocator = card
        .locator(this.keyLocator, {
          hasText: changeDataset[reversedChangeNames[changeIndex]]['specific_change_dropdown'],
        })
        .locator(this.valueLocator);
      await expect.soft(actualSpecificChangeValueLocator).toBeVisible();
      if (!(await actualSpecificChangeValueLocator.isVisible())) {
        continue;
      }
      const actualSpecificChangeValue = confirmStringNotNull(
        await actualSpecificChangeValueLocator.textContent()
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
      let actualChangeStatus = null;
      const locator = card.locator(this.modificationStatusLabel);
      if (await locator.isVisible()) {
        actualChangeStatus = (await locator.textContent()).trim();
      }
      actualValuesArray.push({
        specificChangeValue: actualSpecificChangeValue,
        areaOfChangeSubHeading: actualAreaOfChangeSubHeading,
        individualChangeStatus: actualChangeStatus,
      });
      changeIndex++;
    }
    return actualValuesArray;
  }

  async getExpectedValues(
    changeDataset: Record<string, any>,
    key: string,
    index: number
  ): Promise<{
    expectedAreaOfChangeSubHeading: string;
    expectedSpecificChangeValue: string | null;
    expectedChangeStatus: string;
  }> {
    const expectedChangeStatus = changeDataset['change_status'];
    const expectedAreaOfChangeSubHeading = `Change ${index + 1} - ${changeDataset['area_of_change_dropdown']}`;
    let expectedSpecificChangeValue: string | null = null;

    if (key.toLowerCase().includes('free_text')) {
      expectedSpecificChangeValue = changeDataset['changes_free_text'];
    } else if (key.toLowerCase().includes('end_year')) {
      expectedSpecificChangeValue = await convertDate(
        changeDataset['planned_project_end_day_text'],
        changeDataset['planned_project_end_month_dropdown'],
        changeDataset['planned_project_end_year_text']
      );
    } else if (changeDataset['specific_change_dropdown'] === 'Change of Principal Investigator') {
      expectedSpecificChangeValue = changeDataset['new_principal_investigator_first_name_text'];
    } else if (changeDataset['specific_change_dropdown'] === 'Change of Chief Investigator') {
      expectedSpecificChangeValue = changeDataset['new_chief_investigator_first_name_text'];
    } else if (changeDataset['specific_change_dropdown'] === 'Contact details') {
      expectedSpecificChangeValue = changeDataset['select_contact_details_to_change_radio'];
    } else if (
      changeDataset['specific_change_dropdown'] === 'Project identification' &&
      key.includes('project_reference_numbers_radio')
    ) {
      expectedSpecificChangeValue = changeDataset['project_reference_numbers_radio'];
    } else if (changeDataset['specific_change_dropdown'] === 'Project identification' && key.includes('title_radio')) {
      expectedSpecificChangeValue = changeDataset['title_radio'];
    } else {
      expectedSpecificChangeValue = changeDataset['specific_change_dropdown'];
    }
    return {
      expectedAreaOfChangeSubHeading,
      expectedSpecificChangeValue,
      expectedChangeStatus,
    };
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

  set addAuditHistoryRecordBackstageUser(record: {
    modificationEventExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }) {
    this.auditHistoryRecordBackstageUser.push(record);
  }

  get getAuditHistoryRecordBackstageUser() {
    return this.auditHistoryRecordBackstageUser;
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
    } else if (
      affectsNhs &&
      requiresResources === 'no' &&
      modificationsCommonPageTestData.Nhs_Resource_Implications.includes(dataset.specific_change_dropdown)
    ) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_c;
    } else if (
      affectsNhs &&
      modificationsCommonPageTestData.Ranking_Category.nhs_always_c.includes(dataset.specific_change_dropdown)
    ) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_c;
    } else if (
      affectsNhs &&
      modificationsCommonPageTestData.Ranking_Category.new_site.includes(dataset.specific_change_dropdown)
    ) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_new_site;
    } else if (
      affectsNhs &&
      modificationsCommonPageTestData.Ranking_Category.nhs_applicability_always_c.includes(
        dataset.specific_change_dropdown
      )
    ) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_c;
    } else if (affectsNhs && requiresResources === 'no' && affectedOrgs === 'some') {
      category = this.modificationsCommonPageTestData.Label_Texts.category_b;
    } else if (affectsNhs && requiresResources === 'no' && affectedOrgs === 'all') {
      category = this.modificationsCommonPageTestData.Label_Texts.category_a;
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
      if (
        modificationsCommonPageTestData.Ranking_Category.always_n_a.includes(changeDataset.specific_change_dropdown)
      ) {
        category = this.modificationsCommonPageTestData.Label_Texts.category_n_a;
      } else if (researchLocationDataset['is_nhs_hsc_organisation_radio'] === 'Yes') {
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
    const values = Object.values(await this.getrankingForChanges()).flatMap((value) =>
      Array.isArray(value) ? value : [value]
    );
    let category: null | string;
    let categoryOrder = [];
    const reviewType = values.some(
      (reviewTypeValue) =>
        reviewTypeValue.expectedReviewType ===
        this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
    )
      ? this.modificationsCommonPageTestData.Label_Texts.review_type_review_required
      : this.modificationsCommonPageTestData.Label_Texts.review_type_no_review_required;
    let modificationType: string;
    if (
      values.some(
        (modificationTypeValue) =>
          modificationTypeValue.expectedModificationType ===
          this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_substantial;
    } else if (
      values.some(
        (modificationTypeValue) =>
          modificationTypeValue.expectedModificationType ===
          this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail
      )
    ) {
      modificationType =
        this.modificationsCommonPageTestData.Label_Texts.modification_type_modification_of_important_detail;
    } else if (
      values.some(
        (modificationTypeValue) =>
          modificationTypeValue.expectedModificationType ===
          this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_minor_modification;
    } else if (
      values.some(
        (modificationTypeValue) =>
          modificationTypeValue.expectedModificationType ===
          this.modificationsCommonPageTestData.Label_Texts.modification_type_non_notifiable
      )
    ) {
      modificationType = this.modificationsCommonPageTestData.Label_Texts.modification_type_non_notifiable;
    }
    const categories = new Set(values.map((v) => v.expectedCategory));
    const hasCategoryA = categories.has(this.modificationsCommonPageTestData.Label_Texts.category_a);
    const hasCategoryB = categories.has(this.modificationsCommonPageTestData.Label_Texts.category_b);
    const hasCategoryC = categories.has(this.modificationsCommonPageTestData.Label_Texts.category_c);
    if (hasCategoryB && hasCategoryC && !hasCategoryA) {
      category = this.modificationsCommonPageTestData.Label_Texts.category_b_c;
    } else {
      categoryOrder = [
        this.modificationsCommonPageTestData.Label_Texts.category_a,
        this.modificationsCommonPageTestData.Label_Texts.category_b,
        this.modificationsCommonPageTestData.Label_Texts.category_c,
        this.modificationsCommonPageTestData.Label_Texts.category_new_site,
        this.modificationsCommonPageTestData.Label_Texts.category_n_a,
      ];
      category = categoryOrder.find((categoryValue) =>
        values.some((value) => value.expectedCategory === categoryValue)
      );
    }
    this.setOverallRanking(modificationType, category, reviewType);
  }

  async getMappedSummaryCardDataForRankingCategoryChanges(cardTitle: string, dataset: any) {
    await this.page.waitForLoadState('domcontentloaded');
    const keys = Object.keys(dataset);
    const specificChangeDataValue = dataset['specific_change_dropdown'];
    const cardLocator = this.page.getByRole('heading', { name: cardTitle, exact: true }).locator('..').locator('..');
    await this.page.waitForLoadState('domcontentloaded');
    const rows = cardLocator.locator('.govuk-summary-list__row');
    await expect.soft(rows.first()).toBeVisible();
    const rowCount = await rows.count();
    const specificChangeValue = await rows.nth(0).locator('.govuk-summary-list__key').innerText();
    const cardData: Record<string, any> = {};
    if (keys.includes('Project_Reference')) {
      cardData['Project_Reference'] = {};
    }
    const modificationInfo: Record<string, string> = {};
    if (cardTitle.includes('Change')) {
      const cardTitleValue = await cardLocator.locator('.govuk-summary-card__title').textContent();
      const areaOfChangeValue = cardTitleValue?.split('-')[1].trim();
      cardData['area_of_change_dropdown'] = areaOfChangeValue;
      cardData['specific_change_dropdown'] = specificChangeValue;
    } else if (cardTitle !== 'Sponsor details') {
      const areaOfChangeValueViewDetails = (
        await this.page.getByRole('heading', { name: cardTitle }).textContent()
      ).trim();
      const specificChangeValueViewDetails = await this.page
        .locator('.govuk-summary-list__key', { hasText: specificChangeDataValue })
        .locator('..')
        .locator('.govuk-summary-list__value')
        .textContent();
      cardData['area_of_change_dropdown'] = areaOfChangeValueViewDetails;
      cardData['specific_change_dropdown'] = specificChangeValueViewDetails.trim();
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
          cardData['which_organisation_change_affect_checkbox'] = cleanedValue.split('\n');
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .affected_nhs_hsc_locations_label: {
          cardData['where_organisation_change_affect_nhs_question_checkbox'] = cleanedValue.split('\n');
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .affected_non_nhs_hsc_locations_label: {
          cardData['where_organisation_change_affect_non_nhs_question_checkbox'] = cleanedValue.split('\n');
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
          cardData['sponsor_modification_date_month_dropdown'] = month;
          cardData['sponsor_modification_date_year_textbox'] = year;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Sponsor_Details_Label_Texts.sponsor_summary_label: {
          cardData['sponsor_summary_textbox'] = cleanedValue;
          break;
        }
        case dataset['specific_change_dropdown']: {
          if (
            modificationsCommonPageTestData.Modifications_To_Add_Free_Text.includes(dataset['specific_change_dropdown'])
          ) {
            cardData['changes_free_text'] = cleanedValue;
          } else if (
            dataset['specific_change_dropdown'] === 'Project identification' &&
            keys.includes('project_reference_numbers_radio')
          ) {
            cardData['project_reference_numbers_radio'] = cleanedValue;
          } else if (dataset['specific_change_dropdown'] === 'Project identification' && keys.includes('title_radio')) {
            cardData['title_radio'] = cleanedValue;
          } else if (dataset['specific_change_dropdown'] === 'Change of Principal Investigator') {
            cardData['new_principal_investigator_first_name_text'] = cleanedValue;
          } else if (dataset['specific_change_dropdown'] === 'Change of Chief Investigator') {
            cardData['new_chief_investigator_first_name_text'] = cleanedValue;
          } else if (keys.includes('select_contact_details_to_change_radio')) {
            cardData['select_contact_details_to_change_radio'] = cleanedValue;
          } else {
            dataset['specific_change_dropdown'] = cleanedValue;
          }
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .principal_investigator_last_name_label: {
          if (dataset.specific_change_dropdown === 'Change of Chief Investigator') {
            cardData['new_chief_investigator_last_name_text'] = cleanedValue;
          } else if (dataset.specific_change_dropdown === 'Change of Principal Investigator') {
            cardData['new_principal_investigator_last_name_text'] = cleanedValue;
          }
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .project_reference_numbers_radio_label: {
          cardData['which_reference_do_you_need_to_change_checkboxes'] = cleanedValue.split('\n');
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.title_radio_label: {
          cardData['title_radio'] = cleanedValue.split('\n');
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .isrctn_reference_number_label: {
          cardData['Project_Reference']['isrctn_reference_number_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.nct_reference_number_label: {
          cardData['Project_Reference']['nct_reference_number_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.funder_name_label: {
          cardData['Project_Reference']['funder_name_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .funder_reference_number_label: {
          cardData['Project_Reference']['funder_reference_number_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .other_reference_number_label: {
          cardData['Project_Reference']['other_reference_number_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.what_other_is_label: {
          cardData['Project_Reference']['what_other_is_textbox'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .new_short_project_title_label: {
          cardData['Project_Reference']['new_short_project_title_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .new_full_project_title_label: {
          cardData['Project_Reference']['new_full_project_title_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .which_titles_do_you_need_to_change_label: {
          cardData['which_titles_do_you_need_to_change_checkboxes'] = cleanedValue.split('\n');
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.first_name_label: {
          cardData['new_chief_investigator_first_name_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .new_chief_investigator_email_label: {
          cardData['new_chief_investigator_email_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .new_principal_investigator_email_label: {
          cardData['new_principal_investigator_email_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.name_label: {
          cardData['name_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts
          .sponsor_contact_email_label: {
          cardData['sponsor_contact_email_text'] = cleanedValue;
          break;
        }
        case this.modificationsCommonPageTestData.Modification_Change_Question_Label_Texts.email_label: {
          cardData['email_text'] = cleanedValue;
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

  async getModificationRowNumberPostApprovalPage(rowNumber?: number): Promise<Map<string, string[]>> {
    const modificationIdValue: string[] = [];
    const submittedDateValue: string[] = [];
    const statusValue: string[] = [];
    const columnValue = this.tableRows.nth(rowNumber).getByRole('cell');
    const displayedModificationId = confirmStringNotNull(await columnValue.nth(0).textContent());
    modificationIdValue.push(displayedModificationId);
    const displayedSubmittedDate = confirmStringNotNull(await columnValue.nth(4).textContent());
    submittedDateValue.push(displayedSubmittedDate);
    const displayedStatus = confirmStringNotNull(await columnValue.nth(5).textContent());
    statusValue.push(displayedStatus);
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
    const modificationId = await this.getModificationRowNumberPostApprovalPage(rowNumber);
    const modificationIDActual = modificationId.get('modificationIdValue');
    if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
      const modificationIdExpected = searchCriteriaDataset['search_input_text'];
      expect(modificationIDActual.includes(modificationIdExpected));
    }
    const hasNextPage =
      (await commonItemsPage.pagination_next_link.isVisible()) &&
      !(await commonItemsPage.pagination_next_link.isDisabled());
    if (hasNextPage) {
      await commonItemsPage.next_button.click();
    }
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
    if (!filterDataset) return;
    const statusExpected = filterDataset['status_radio'];
    if (statusExpected) {
      const statusMatches = statusExpected.some((statusLabel: string) =>
        statusActual.toLowerCase().includes(statusLabel.toLowerCase())
      );
      expect.soft(statusMatches).toBeTruthy();
    }
    const modificationTypeExpected = filterDataset['modification_type_radio'];
    if (modificationTypeExpected) {
      const typeMatches = modificationTypeExpected.some((modificationTypeLabel: string) =>
        modificationTypeActual.toLowerCase().includes(modificationTypeLabel.toLowerCase())
      );
      expect.soft(typeMatches).toBeTruthy();
    }
    const hasFromDate =
      'date_submitted_from_day_text' in filterDataset &&
      'date_submitted_from_month_dropdown' in filterDataset &&
      'date_submitted_from_year_text' in filterDataset;
    const hasToDate =
      'date_submitted_to_day_text' in filterDataset &&
      'date_submitted_to_month_dropdown' in filterDataset &&
      'date_submitted_to_year_text' in filterDataset;

    if (hasFromDate && hasToDate && dateSubmittedActual != null) {
      const filterFromDate = `${filterDataset['date_submitted_from_day_text']} ${filterDataset['date_submitted_from_month_dropdown']} ${filterDataset['date_submitted_from_year_text']}`;
      const filterToDate = `${filterDataset['date_submitted_to_day_text']} ${filterDataset['date_submitted_to_month_dropdown']} ${filterDataset['date_submitted_to_year_text']}`;
      if (filterFromDate !== '' && filterToDate !== '') {
        await this.validateDateFilter(filterFromDate, filterToDate, dateSubmittedActual);
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

  async validateCardData(expectedData: any, actualData: any) {
    const compareArrays = (expected: any[], actual: any[]) => {
      if (expected.length !== actual.length) return false;
      return expected.every((val, index) => val === actual[index]);
    };
    for (const key of Object.keys(expectedData)) {
      if (key.includes('change_status')) {
        continue;
      }
      const expectedValue = expectedData[key];
      const actualValue = actualData[key];
      if (Array.isArray(expectedValue)) {
        const sortedExpected = [...expectedValue].sort((a, b) => expectedValue.indexOf(a) - expectedValue.indexOf(b));
        const sortedActual = [...(actualValue || [])].sort(
          (a, b) => expectedValue.indexOf(a) - expectedValue.indexOf(b)
        );
        expect.soft(compareArrays(sortedActual, sortedExpected)).toBe(true);
      } else {
        expect.soft(actualValue).toStrictEqual(expectedValue);
      }
    }
  }

  async getModificationStatus(status: string) {
    if (status.toLowerCase() == 'with sponsor') {
      return this.modificationsCommonPageTestData.Modification_Status_With_Sponsor.status;
    } else if (status.toLowerCase() == 'authorised') {
      return this.modificationsCommonPageTestData.Modification_Status_Authorised.status;
    } else if (status.toLowerCase() == 'not authorised') {
      return this.modificationsCommonPageTestData.Modification_Status_Not_Authorised.status;
    } else if (status.toLowerCase() == 'with review body') {
      return this.modificationsCommonPageTestData.Modification_Status_With_Review_Body.status;
    } else if (status.toLowerCase() == 'approved') {
      return this.modificationsCommonPageTestData.Modification_Status_Approved.status;
    } else if (status.toLowerCase() == 'not approved') {
      return this.modificationsCommonPageTestData.Modification_Status_Not_Approved.status;
    } else if (status.toLowerCase() == 'complete') {
      return this.modificationsCommonPageTestData.Document_Status_Complete.status;
    } else if (status.toLowerCase() == 'in draft') {
      return this.modificationsCommonPageTestData.Modification_Status_Indraft.status;
    }
  }

  set addAuditHistoryRecord(record: {
    modificationEventExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }) {
    this.auditHistoryRecord.push(record);
  }

  get getAuditHistoryRecord() {
    return this.auditHistoryRecord;
  }

  async getModificationRankingPostApprovalPage(): Promise<Map<string, string[]>> {
    const modificationTypeValue: string[] = [];
    const categoryValue: string[] = [];
    const reviewTypeValue: string[] = [];
    const columns = this.tableRows.nth(1).getByRole('cell');
    const modificationType = confirmStringNotNull(await columns.nth(1).textContent());
    modificationTypeValue.push(modificationType);

    const category = confirmStringNotNull(await columns.nth(3).textContent());
    categoryValue.push(category);

    const reviewType = confirmStringNotNull(await columns.nth(2).textContent());
    reviewTypeValue.push(reviewType);
    const modificationRankingMap = new Map([
      ['modificationType', modificationTypeValue],
      ['rankingCategory', categoryValue],
      ['reviewType', reviewTypeValue],
    ]);
    return modificationRankingMap;
  }
}
