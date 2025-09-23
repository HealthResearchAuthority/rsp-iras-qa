import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';
import PlannedEndDateChangePage from './PlannedEndDateChangePage';
import AffectedOrganisationSelectionPage from './applicabilityScreens/AffectedOrganisationSelectionPage';
import AffectedOrganisationQuestionsPage from './applicabilityScreens/AffectedOrganisationQuestionsPage';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ModificationsCommonPage {
  readonly page: Page;
  readonly modificationsCommonPageTestData: typeof modificationsCommonPageTestData;
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
    this.modificationsCommonPageTestData = modificationsCommonPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.iras_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.iras_id_label)
      .locator('..')
      .locator('[class$="value"]');
    this.short_project_title_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.short_project_title_label)
      .locator('..')
      .locator('[class$="value"]');
    this.modification_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPageTestData.Label_Texts.modification_id_label)
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
    if (changeName.toLowerCase().includes('planned_end_date')) {
      await new PlannedEndDateChangePage(this.page).fillPlannedProjectEndDateModificationsPage(dataset);
      await new AffectedOrganisationSelectionPage(this.page).fillAffectedOrganisation(dataset);
      await new AffectedOrganisationQuestionsPage(this.page).fillAffectedOrganisationQuestions(dataset);
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
}
