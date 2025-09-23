import { expect, Locator, Page } from '@playwright/test';
import * as reviewYourDocumentInfomationModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/review_Your_Document_Information_modifications_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class AddDocumentDetailsModificationsPage {
  readonly page: Page;
  readonly reviewYourDocumentInfomationModificationsPageTestData: typeof reviewYourDocumentInfomationModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly list_row: Locator;
  readonly document_name: Locator;
  readonly document_name_row: Locator;
  readonly document_name_text: Locator;
  readonly document_type: Locator;
  readonly document_type_row: Locator;
  readonly document_type_dropdown: Locator;
  readonly document_type_change_link: Locator;
  readonly document_version: Locator;
  readonly sponsor_document_version_row: Locator;
  readonly sponsor_document_version_text: Locator;
  readonly sponsor_document_version_change_link: Locator;
  readonly sponsor_document_date: Locator;
  readonly sponsor_document_date_row: Locator;
  readonly sponsor_document_date_text: Locator;
  readonly sponsor_document_date_change_link: Locator;
  readonly document_previously_approved: Locator;
  readonly document_previously_approved_row: Locator;
  readonly document_previously_approved_radio: Locator;
  readonly document_previously_approved_change_link: Locator;
  readonly document_information: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewYourDocumentInfomationModificationsPageTestData = reviewYourDocumentInfomationModificationsPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.list_row = this.page.locator('.govuk-summary-list__row');
    this.document_name_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.document_name_label
      ),
    });
    this.document_name_text = this.document_name_row.getByRole('definition').locator('text=file');
    this.document_type_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.document_type_label
      ),
    });
    this.document_type_dropdown = this.document_type_row.getByRole('definition').first();
    this.document_type_change_link = this.document_type_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.sponsor_document_version_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information
          .document_version_label
      ),
    });
    this.sponsor_document_version_text = this.sponsor_document_version_row.getByRole('definition').first();
    this.sponsor_document_version_change_link = this.sponsor_document_version_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.sponsor_document_date_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.document_date_label
      ),
    });
    this.sponsor_document_date_text = this.sponsor_document_date_row.getByRole('definition').first();
    this.sponsor_document_date_change_link = this.sponsor_document_date_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.document_previously_approved_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information
          .previously_approved_label
      ),
    });
    this.document_previously_approved_radio = this.document_previously_approved_row.getByRole('definition').first();
    this.document_previously_approved_change_link = this.document_previously_approved_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.document_information = this.page.locator('[class*="govuk-summary-list govuk"]');
  }

  //Page Methods
  async assertOnReviewYourDocumentsInformationModificationsPage() {
    const expectedPageHeading =
      this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.heading;
    await expect.soft(this.pageHeading.getByText(expectedPageHeading, { exact: true })).toBeVisible();

    const expectedPageTitle =
      this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.page_title;
    expect.soft(await this.page.title()).toBe(expectedPageTitle);

    const expectedHintLabelHeading =
      this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.hint_label_heading;
    await expect.soft(this.pageHeading.getByText(expectedHintLabelHeading, { exact: true })).toBeVisible();

    const expectedHintLabelText =
      this.reviewYourDocumentInfomationModificationsPageTestData.Review_Your_Document_Information.hint_label_text;
    await expect.soft(this.pageLabels.getByText(expectedHintLabelText, { exact: true })).toBeVisible();
  }

  async getSponsorDocumentDate() {
    const sponsorDocumentDate = confirmStringNotNull(await this.sponsor_document_date_text.textContent());
    return sponsorDocumentDate;
  }

  async getNumberOfDocuments() {
    const allDocumentsInformation = this.document_information;
    const noOfDocuments = await allDocumentsInformation.count();
    return noOfDocuments;
  }

  async clickChangeLink(changeLink: string) {
    switch (changeLink.trim().toLowerCase()) {
      case 'document_type':
        await this.document_type_change_link.click();
        break;
      case 'document_version':
        await this.sponsor_document_version_change_link.click();
        break;
      case 'document_date':
        await this.sponsor_document_date_change_link.click();
        break;
      case 'previously_approved':
        await this.document_previously_approved_change_link.click();
        break;
      default:
        throw new Error(`${changeLink} is not a valid option`);
    }
  }
}
