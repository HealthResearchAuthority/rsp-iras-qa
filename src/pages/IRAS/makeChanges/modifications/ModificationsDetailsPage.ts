import { expect, Locator, Page } from '@playwright/test';
import * as modificationsDetailsPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_details_data.json';
import * as modificationPostSubmissionPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_post_submission_page_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import ModificationPostSubmissionPage from './ModificationPostSubmissionPage';

//Declare Page Objects
export default class ModificationsDetailsPage {
  readonly page: Page;
  readonly modificationsDetailsPageTestData: typeof modificationsDetailsPageTestData;
  readonly modificationPostSubmissionPageTestData: typeof ModificationPostSubmissionPage;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly removeModificationPageHeading: Locator;
  readonly removeModificationSuccessMessageText: Locator;
  readonly modificationUnfinishedErrorPageHeading: Locator;
  readonly modificationUnfinishedHintLabel: Locator;
  readonly supporting_documents_label: Locator;
  readonly supporting_documents_sub_label: Locator;
  readonly add_summary_heading_label: Locator;
  readonly add_summary_sub_label: Locator;
  readonly deleteModificationLink: Locator;
  readonly remove_link: Locator;
  readonly change_link: Locator;
  readonly tab_links_container: Locator;
  readonly sponsor_details_link: Locator;
  readonly modification_details_link: Locator;
  readonly documents_link: Locator;
  readonly history_link: Locator;
  readonly next_steps_heading: Locator;
  readonly next_steps_guidance: Locator;
  readonly next_steps_button: Locator;
  readonly review_comment_heading: Locator;
  readonly review_comment_show: Locator;
  readonly review_comment_hide: Locator;
  readonly review_comment_guidance: Locator;
  readonly review_comment_box: Locator;
  readonly review_outcome_heading: Locator;
  readonly review_outcome_guidance: Locator;
  readonly approved_outcome_option: Locator;
  readonly not_approved_outcome_option: Locator;
  readonly not_approved_comment_heading: Locator;
  readonly not_approved_comment_guidance: Locator;
  readonly not_approved_comment_box: Locator;
  readonly save_continue_button: Locator;
  readonly comments_tab_label: Locator;
  readonly comment_heading_label: Locator;
  readonly comment_card: Locator;
  readonly comment_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsDetailsPageTestData = modificationsDetailsPageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

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
    this.supporting_documents_label = this.page.getByText(
      modificationsDetailsPageTestData.Modification_Details_Label_Texts.supporting_documents_label
    );
    this.supporting_documents_sub_label = this.page.getByText(
      modificationsDetailsPageTestData.Modification_Details_Label_Texts.supporting_documents_sub_label
    );
    this.add_summary_heading_label = this.page.getByText(
      modificationsDetailsPageTestData.Modification_Details_Label_Texts.add_summary_heading_label
    );
    this.add_summary_sub_label = this.page.getByText(
      modificationsDetailsPageTestData.Modification_Details_Label_Texts.add_summary_sub_label
    );
    this.deleteModificationLink = this.page
      .getByRole('link')
      .getByText(this.linkTextData.Modification_Details_Page.Delete_Modification);
    this.remove_link = this.page.getByRole('link').getByText(this.linkTextData.Modification_Details_Page.Remove);
    this.change_link = this.page.getByRole('link').getByText(this.linkTextData.Modification_Details_Page.Change);
    this.tab_links_container = this.page.getByTestId('main-content').locator('.govuk-service-navigation__list');
    this.sponsor_details_link = this.tab_links_container
      .getByRole('listitem')
      .getByText(this.linkTextData.Modification_Details_Page.Sponsor_Details);
    this.modification_details_link = this.tab_links_container
      .getByRole('listitem')
      .getByText(this.linkTextData.Modification_Details_Page.Modification_Details);
    this.documents_link = this.tab_links_container
      .getByRole('listitem')
      .getByText(this.linkTextData.Modification_Details_Page.Documents);
    this.history_link = this.tab_links_container
      .getByRole('listitem')
      .getByText(this.linkTextData.Modification_Details_Page.History);
    this.next_steps_heading = this.page
      .locator('.govuk-heading-m')
      .getByText(this.modificationsDetailsPageTestData.Modification_Details_Page.next_steps);
    this.next_steps_guidance = this.page.getByText(
      this.modificationsDetailsPageTestData.Modification_Details_Page.next_steps_guidance
    );
    this.next_steps_button = this.page
      .getByRole('link')
      .getByText(this.linkTextData.Modification_Details_Page.Continue);
    this.review_comment_heading = this.page
      .getByRole('heading')
      .getByText(this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.review_comment_heading);
    this.review_comment_show = this.page
      .locator('span[class="govuk-accordion__section-toggle-text"]')
      .getByText(this.modificationsDetailsPageTestData.Modification_Details_Page.review_comment_show);
    this.review_comment_hide = this.page
      .locator('span[class="govuk-accordion__section-toggle-text"]')
      .getByText(this.modificationsDetailsPageTestData.Modification_Details_Page.review_comment_hide);
    this.review_comment_guidance = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.review_comment_guidance);
    this.review_comment_box = this.page.getByTestId('Comment');
    this.review_outcome_heading = this.page
      .getByRole('heading')
      .getByText(this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.review_outcome_heading);
    this.review_outcome_guidance = this.page.getByText(
      this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.review_outcome_guidance
    );
    this.approved_outcome_option = this.page.locator(
      `input[value='${this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.approved_outcome_option}']`
    );
    this.not_approved_outcome_option = this.page.locator(
      `input[value='${this.modificationsDetailsPageTestData.Modification_Review_Outcome_Section.not_approved_outcome_option}']`
    );
    this.not_approved_comment_heading = this.page
      .getByRole('heading')
      .getByText(this.modificationsDetailsPageTestData.Modification_Not_Approved_Section.not_approved_comment_heading);
    this.not_approved_comment_guidance = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsDetailsPageTestData.Modification_Not_Approved_Section.not_approved_comment_guidance);
    this.not_approved_comment_box = this.page.getByTestId('ReasonNotApproved');
    this.save_continue_button = this.page
      .getByRole('button')
      .getByText(this.buttonTextData.Modification_Details_Page.Save_And_Continue);
    this.comments_tab_label = this.page.getByRole('link', {
      name: modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.comments_tab,
      exact: true,
    });
    this.comment_heading_label = this.page.getByRole('heading', {
      level: 2,
      name: modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.comment_label,
    });
    this.comment_card = this.page.locator(
      '.govuk-summary-card:has(h2.govuk-summary-card__title:has-text("' +
        modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.comment_label +
        '"))'
    );
    this.comment_text = this.comment_card.locator('.govuk-summary-card__content');
  }

  //Page Methods
  async assertOnModificationsDetailsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async assertOnRemoveModificationsPage() {
    await expect.soft(this.removeModificationPageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect.soft(currentUrl).toContain('confirmremovechange?');
  }
  async assertOnModificationUnfinishedErrorPage() {
    await expect.soft(this.modificationUnfinishedErrorPageHeading).toBeVisible();
    await expect.soft(this.modificationUnfinishedHintLabel).toBeVisible();
  }
}
