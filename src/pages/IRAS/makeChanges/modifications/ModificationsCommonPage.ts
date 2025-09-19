import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPagePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ModificationsCommonPage {
  readonly page: Page;
  readonly modificationsCommonPagePageTestData: typeof modificationsCommonPagePageTestData;
  readonly pageHeading: Locator;
  readonly pageComponentLabel: Locator;
  readonly iras_id_label: Locator;
  readonly short_project_title_label: Locator;
  readonly modification_id_label: Locator;
  private rankingForChanges: Record<string, { modificationType: string; category: string; reviewType: string }[]> = {};
  private overallRankingForChanges: { modificationType: string; category: string; reviewType: string } = {
    modificationType: '',
    category: '',
    reviewType: '',
  };

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsCommonPagePageTestData = modificationsCommonPagePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.iras_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.iras_id_label)
      .locator('..')
      .locator('[class$="value"]');
    this.short_project_title_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.short_project_title_label)
      .locator('..')
      .locator('[class$="value"]');
    this.modification_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.modification_id_label)
      .locator('..')
      .locator('[class$="value"]');
  }

  //Page Methods
  async assertOnModificationsPage(dataset: any) {
    const pageHeader = dataset['page_header'];
    const pageComponentLabel = dataset['page_component_label'];
    await expect(this.pageHeading.getByText(pageHeader)).toBeVisible();
    await expect(this.page.getByText(pageComponentLabel)).toBeVisible();
  }

  async createChangeModification(changeName: string, dataset: any) {
    switch (true) {
      case changeName.toLowerCase().includes('planned_end_date'): {
        await new PlannedEndDateChangePage(this.page).fillPlannedProjectEndDateModificationsPage(dataset);
        await new AffectedOrganisationSelectionPage(this.page).fillAffectedOrganisation(dataset);
        await new AffectedOrganisationQuestionsPage(this.page).fillAffectedOrganisationQuestions(dataset);
        await new CommonItemsPage(this.page).clickButton('Modifications_Page', 'Save_Continue');
        break;
      }
      default:
        throw new Error(`${changeName} is not a valid option`);
    }
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
    const modificationType = (
      {
        substantial: this.modificationsCommonPagePageTestData.Label_Texts.modification_type_substantial,
        modification_of_important_detail:
          this.modificationsCommonPagePageTestData.Label_Texts.modification_type_modification_of_important_detail,
        minor_modification: this.modificationsCommonPagePageTestData.Label_Texts.modification_type_minor_modification,
      } as const
    )[
      Object.keys(this.modificationsCommonPagePageTestData.Ranking_Modification_Type).find((key) =>
        this.modificationsCommonPagePageTestData.Ranking_Modification_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )!
    ];
    const category = (
      {
        'n/a': this.modificationsCommonPagePageTestData.Label_Texts.category_n_a,
        c: this.modificationsCommonPagePageTestData.Label_Texts.category_c,
      } as const
    )[
      Object.keys(this.modificationsCommonPagePageTestData.Ranking_Category).find((key) =>
        this.modificationsCommonPagePageTestData.Ranking_Category[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )!
    ];
    const reviewType = (
      {
        Review_Required: this.modificationsCommonPagePageTestData.Label_Texts.review_type_review_required,
        No_Review_Required: this.modificationsCommonPagePageTestData.Label_Texts.review_type_no_review_required,
      } as const
    )[
      Object.keys(this.modificationsCommonPagePageTestData.Ranking_Review_Type).find((key) =>
        this.modificationsCommonPagePageTestData.Ranking_Review_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )!
    ];
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async calculateAndStoreRankingForChangesForApplicability(changeName: string, dataset: any) {
    const modificationType = (
      {
        substantial: this.modificationsCommonPagePageTestData.Label_Texts.modification_type_substantial,
        modification_of_important_detail:
          this.modificationsCommonPagePageTestData.Label_Texts.modification_type_modification_of_important_detail,
        minor_modification: this.modificationsCommonPagePageTestData.Label_Texts.modification_type_minor_modification,
      } as const
    )[
      Object.keys(this.modificationsCommonPagePageTestData.Ranking_Modification_Type).find((key) =>
        this.modificationsCommonPagePageTestData.Ranking_Modification_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )!
    ];
    const category =
      dataset.which_organisation_change_affect_checkbox.some((item: string) =>
        item.toLowerCase().includes('non-nhs/hsc')
      ) && dataset.which_organisation_change_affect_checkbox.length === 1
        ? this.modificationsCommonPagePageTestData.Label_Texts.category_n_a
        : dataset.which_organisation_change_affect_checkbox.some((item: string) =>
              item.toLowerCase().includes('nhs')
            ) && dataset.will_nhs_hsc_organisations_require_additional_resources_question_radio.toLowerCase() === 'no'
          ? this.modificationsCommonPagePageTestData.Label_Texts.category_c
          : dataset.which_organisation_change_affect_checkbox.some((item: string) =>
                item.toLowerCase().includes('nhs')
              ) &&
              dataset.will_nhs_hsc_organisations_require_additional_resources_question_radio.toLowerCase() === 'yes' &&
              dataset.will_some_or_all_organisations_be_affected_question_radio.toLowerCase() === 'some'
            ? this.modificationsCommonPagePageTestData.Label_Texts.category_b
            : dataset.which_organisation_change_affect_checkbox.some((item: string) =>
                  item.toLowerCase().includes('nhs')
                ) &&
                dataset.will_nhs_hsc_organisations_require_additional_resources_question_radio.toLowerCase() ===
                  'yes' &&
                dataset.will_some_or_all_organisations_be_affected_question_radio.toLowerCase() === 'all'
              ? this.modificationsCommonPagePageTestData.Label_Texts.category_a
              : undefined;
    const reviewType = (
      {
        Review_Required: this.modificationsCommonPagePageTestData.Label_Texts.review_type_review_required,
        No_Review_Required: this.modificationsCommonPagePageTestData.Label_Texts.review_type_no_review_required,
      } as const
    )[
      Object.keys(this.modificationsCommonPagePageTestData.Ranking_Review_Type).find((key) =>
        this.modificationsCommonPagePageTestData.Ranking_Review_Type[key].some((item: string) =>
          changeName.toLowerCase().includes(item.toLowerCase())
        )
      )!
    ];
    this.setrankingForChanges(changeName, modificationType, category, reviewType);
  }

  async calculateAndStoreOverallRanking() {
    const values = Object.values(await this.getrankingForChanges()).flatMap((v) => (Array.isArray(v) ? v : [v]));
    const reviewType = values.some(
      (r) => r.reviewType === this.modificationsCommonPagePageTestData.Label_Texts.review_type_review_required
    )
      ? this.modificationsCommonPagePageTestData.Label_Texts.review_type_review_required
      : this.modificationsCommonPagePageTestData.Label_Texts.review_type_no_review_required;
    const modificationType = values.some(
      (r) => r.modificationType === this.modificationsCommonPagePageTestData.Label_Texts.modification_type_substantial
    )
      ? this.modificationsCommonPagePageTestData.Label_Texts.modification_type_substantial
      : values.some(
            (r) =>
              r.modificationType ===
              this.modificationsCommonPagePageTestData.Label_Texts.modification_type_modification_of_important_detail
          )
        ? this.modificationsCommonPagePageTestData.Label_Texts.modification_type_modification_of_important_detail
        : this.modificationsCommonPagePageTestData.Label_Texts.modification_type_minor_modification;
    const categoryOrder = [
      this.modificationsCommonPagePageTestData.Label_Texts.category_a,
      this.modificationsCommonPagePageTestData.Label_Texts.category_b,
      this.modificationsCommonPagePageTestData.Label_Texts.category_c,
      this.modificationsCommonPagePageTestData.Label_Texts.category_n_a,
    ];
    const category = categoryOrder.find((c) => values.some((r) => r.category === c))!;
    this.setOverallRanking(modificationType, category, reviewType);
  }
}
