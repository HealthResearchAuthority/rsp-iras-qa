import { expect, Locator, Page } from '@playwright/test';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import * as questionSetData from '../../resources/test_data/common/question_set_data.json';
import * as commonTestData from '../../resources/test_data/common/common_data.json';
import * as documentUploadTestData from '../../resources/test_data/common/document_upload_data.json';
import * as searchFilterResultsData from '../../resources/test_data/common/search_filter_results_data.json';
import * as searchModificationsPageTestData from '../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import * as setupNewSponsorOrganisationPageTestData from '../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/setup_new_sponsor_organisation_page_data.json';
import * as fs from 'node:fs';
import path from 'node:path';
import ProjectFilterPage from '../IRAS/questionSet/ProjectFilterPage';
import ProjectDetailsPage from '../IRAS/questionSet/ProjectDetailsPage';
import DevicesPage from '../IRAS/questionSet/DevicesPage';
import TissuePage from '../IRAS/questionSet/TissuePage';
import StudentPage from '../IRAS/questionSet/StudentPage';
import AdultsLackingCapacityPage from '../IRAS/questionSet/AdultsLackingCapacityPage';
import BookingPage from '../IRAS/questionSet/BookingPage';
import ChildrenPage from '../IRAS/questionSet/ChildrenPage';
import { PageObjectDataName } from '../../utils/CustomTypes';
import { confirmArrayNotNull, confirmStringNotNull, removeUnwantedWhitespace } from '../../utils/UtilFunctions';
import sharp from 'sharp';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly questionSetData: typeof questionSetData;
  readonly commonTestData: typeof commonTestData;
  readonly documentUploadTestData: typeof documentUploadTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly setupNewSponsorOrganisationPageTestData: typeof setupNewSponsorOrganisationPageTestData;
  private _search_key: string;
  private _no_of_results_before_search: number;
  private _no_of_results_after_search: number;
  private _short_project_title_filter: string;
  private _date_submitted_from_filter: string;
  private _date_submitted_to_filter: string;
  private _no_of_total_pages: number;
  readonly showAllSectionsAccordion: Locator;
  readonly genericButton: Locator;
  readonly govUkButton: Locator;
  readonly govUkCheckboxes: Locator;
  readonly govUkCheckboxItem: Locator;
  readonly govUkLink: Locator;
  readonly govUkFieldValidationError: Locator;
  readonly qSetProgressBar: Locator;
  readonly qSetProgressBarStage: Locator;
  readonly qSetProgressBarActiveStage: Locator;
  readonly qSetProgressBarStageLink: Locator;
  readonly qSetProgressBarActiveStageLink: Locator;
  readonly bannerNavBar: Locator;
  readonly bannerHome: Locator;
  readonly bannerReviewApplications: Locator;
  readonly bannerAdmin: Locator;
  readonly bannerManageUsers: Locator;
  readonly bannerQuestionSet: Locator;
  readonly bannerSystemAdmin: Locator;
  readonly bannerMyApplications: Locator;
  readonly alert_box: Locator;
  readonly alert_box_headings: Locator;
  readonly alert_box_list: Locator;
  readonly alert_box_list_items: Locator;
  readonly errorMessageFieldLabel: Locator;
  readonly errorMessageSummaryLabel: Locator;
  readonly topMenuBarLinks: Locator;
  readonly summaryErrorLinks: Locator;
  readonly tableRows: Locator;
  readonly tableBodyRows: Locator;
  readonly hidden_next_button: Locator;
  readonly next_button: Locator;
  readonly fieldGroup: Locator;
  readonly errorFieldGroup: Locator;
  readonly search_text: Locator;
  readonly pagination: Locator;
  readonly firstPage: Locator;
  readonly lastPage: Locator;
  readonly pagination_next_link: Locator;
  readonly previous_button: Locator;
  readonly currentPage: Locator;
  readonly pagination_results: Locator;
  readonly pagination_items: Locator;
  readonly pageLinks: Locator;
  readonly advanced_filter_chevron: Locator;
  readonly result_count: Locator;
  readonly iras_id_search_text: Locator;
  readonly no_matching_search_result_header_label: Locator;
  readonly no_matching_search_result_sub_header_label: Locator;
  readonly no_matching_search_result_body_one_label: Locator;
  readonly no_matching_search_result_body_two_label: Locator;
  readonly no_matching_search_result_body_three_label: Locator;
  readonly no_matching_search_result_body_four_label: Locator;
  readonly no_matching_search_result_count_label: Locator;
  readonly clear_all_filters_link: Locator;
  readonly no_results_bullet_points: Locator;
  readonly no_results_guidance_text: Locator;
  readonly no_results_heading: Locator;
  readonly apply_filters_button: Locator;
  readonly upload_files_input: Locator;
  readonly search_results_count: Locator;
  readonly advanced_filter_panel: Locator;
  readonly advanced_filter_headings: Locator;
  readonly date_from_filter_group: Locator;
  readonly date_from_label: Locator;
  readonly date_from_hint_label: Locator;
  readonly date_to_filter_group: Locator;
  readonly date_to_label: Locator;
  readonly date_to_hint_label: Locator;
  readonly active_filters_label: Locator;
  readonly active_filter_list: Locator;
  readonly active_filter_items: Locator;
  readonly search_no_results_container: Locator;
  readonly search_no_results_header: Locator;
  readonly search_no_results_guidance_text: Locator;
  readonly search_no_results_guidance_points: Locator;
  readonly active_filters_list_to_remove: Locator;
  readonly errorMessageFieldLabelList: Locator;
  readonly sponsor_organisation_fieldset: Locator;
  readonly sponsor_organisation_jsenabled_text: Locator;
  readonly sponsor_organisation_suggestion_list_labels: Locator;
  readonly sponsor_organisation_suggestion_listbox: Locator;
  readonly sponsor_organisation_text: Locator;
  readonly sponsor_organisation_jsdisabled_search_button: Locator;
  readonly sponsor_organisation_jsdisabled_search_results_radio_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;
    this.questionSetData = questionSetData;
    this.commonTestData = commonTestData;
    this.documentUploadTestData = documentUploadTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this.searchModificationsPageTestData = searchModificationsPageTestData;
    this.setupNewSponsorOrganisationPageTestData = setupNewSponsorOrganisationPageTestData;
    this._search_key = '';
    this._no_of_results_before_search = 0;
    this._no_of_results_after_search = 0;
    this._short_project_title_filter = '';
    this._date_submitted_from_filter = '';
    this._date_submitted_to_filter = '';
    this._no_of_total_pages = 0;

    //Locators
    this.showAllSectionsAccordion = page.locator('.govuk-accordion__show-all"');
    this.genericButton = this.page.getByRole('button');
    this.govUkButton = this.page.locator('.govuk-button');
    this.govUkCheckboxes = this.page.locator('.govuk-checkboxes');
    this.govUkCheckboxItem = this.govUkCheckboxes.locator('.govuk-checkboxes__item');
    this.govUkLink = this.page.getByRole('link');
    this.fieldGroup = this.page.locator('.govuk-form-group');
    this.errorFieldGroup = this.page.locator('.govuk-form-group--error');
    this.govUkFieldValidationError = this.page.locator('.govuk-error-message');
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('button');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('button');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.tableBodyRows = this.page.getByRole('table').locator('tbody').getByRole('row');
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
    this.search_text = this.page
      .getByTestId('SearchQuery')
      .or(this.page.getByTestId('Search.SearchQuery'))
      .or(this.page.getByTestId('Search_IrasId'))
      .or(this.page.getByTestId('Search.SearchNameTerm'))
      .first();
    //Banner
    this.bannerNavBar = this.page.getByLabel('Service information');
    this.bannerHome = this.bannerNavBar.getByText(this.linkTextData.Banner.Home, { exact: true });
    this.bannerReviewApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.Review_Applications, {
      exact: true,
    });
    this.bannerAdmin = this.bannerNavBar.getByText(this.linkTextData.Banner.Admin, { exact: true });
    this.bannerManageUsers = this.bannerNavBar.getByText(this.linkTextData.Banner.Manage_Users, { exact: true });
    this.bannerQuestionSet = this.bannerNavBar.getByText(this.linkTextData.Banner.Question_Set, { exact: true });
    this.bannerSystemAdmin = this.bannerNavBar.getByText(this.linkTextData.Banner.System_Admin, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.My_Applications, { exact: true });
    this.next_button = this.page
      .getByRole('link')
      .getByText(this.commonTestData.next_button, { exact: true })
      .or(this.page.getByRole('button', { name: this.commonTestData.next_button, exact: true }));
    this.pagination_next_link = this.page.locator('div[class="govuk-pagination__next"]').getByRole('link');
    this.errorMessageFieldLabel = this.page
      .locator('.field-validation-error')
      .or(this.page.locator('.govuk-error-message'))
      .first();
    this.errorMessageSummaryLabel = this.page
      .getByRole('heading')
      .getByText(this.commonTestData.error_message_summary_header, {
        exact: true,
      });
    this.summaryErrorLinks = this.errorMessageSummaryLabel.locator('..').getByRole('listitem').getByRole('link');
    this.topMenuBarLinks = this.page.getByTestId('navigation').getByRole('listitem').getByRole('link');
    this.pagination = page
      .getByRole('navigation', { name: 'Pagination' })
      .or(page.getByRole('button', { name: 'Pagination' }));
    this.firstPage = this.pagination
      .getByRole('link', { name: this.commonTestData.first_page, exact: true })
      .or(this.pagination.getByRole('button', { name: this.commonTestData.first_page, exact: true }));
    this.previous_button = this.pagination
      .getByRole('link')
      .getByText(this.commonTestData.previous_button, { exact: true })
      .or(this.page.getByRole('button', { name: this.commonTestData.previous_button, exact: true }));
    this.currentPage = this.pagination.locator('a[class$="current"]');
    this.pagination_results = this.page
      .getByRole('navigation', { name: 'Pagination' })
      .locator('..')
      .getByRole('paragraph');
    this.pagination_items = this.pagination.getByRole('listitem');
    this.pageLinks = this.pagination
      .locator('a[aria-label^="Page"]')
      .or(this.pagination.locator('button[aria-label^="Page"]'));
    //Validation Alert Box
    this.alert_box = this.page.getByRole('alert');
    this.alert_box_headings = this.alert_box.getByRole('heading');
    this.alert_box_list = this.alert_box.getByRole('list');
    this.alert_box_list_items = this.alert_box.getByRole('listitem');
    this.upload_files_input = this.page.locator('input[type="file"]');
    //Search Items
    this.advanced_filter_chevron = this.page.getByRole('button', {
      name: this.commonTestData.advanced_filter_label,
    });
    this.result_count = this.advanced_filter_chevron.getByText(this.commonTestData.result_count_heading);
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.commonTestData.no_results_heading, { exact: true });
    this.no_matching_search_result_header_label = this.page.getByRole('heading');
    this.no_matching_search_result_sub_header_label = this.page.getByRole('paragraph');
    this.no_matching_search_result_body_one_label =
      this.no_matching_search_result_body_two_label =
      this.no_matching_search_result_body_three_label =
      this.no_matching_search_result_body_four_label =
        this.page.getByRole('listitem');
    this.no_matching_search_result_count_label = this.page.getByRole('heading');
    this.clear_all_filters_link = this.page.getByRole('link', {
      name: this.commonTestData.clear_all_filters_label,
      exact: true,
    });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.commonTestData.no_results_guidance_text, {
        exact: true,
      });
    this.no_results_bullet_points = this.no_results_guidance_text.locator('..').getByRole('listitem');
    this.apply_filters_button = this.page
      .getByRole('button')
      .getByText(this.buttonTextData.Search_Modifications_Page.Apply_Filters, {
        exact: true,
      });
    this.upload_files_input = this.page.locator('input[type="file"]');
    this.search_results_count = this.page.locator('.search-filter-panel__count');
    this.advanced_filter_panel = this.page.getByTestId('filter-panel');
    this.advanced_filter_headings = this.advanced_filter_panel.getByRole('heading');
    this.date_from_filter_group = this.page.getByTestId('FromDate');
    this.date_from_label = this.date_from_filter_group.getByText(this.searchFilterResultsData.date_from_label);
    this.date_from_hint_label = this.date_from_filter_group.getByText(
      this.searchFilterResultsData.date_from_hint_label
    );
    this.date_to_filter_group = this.page.getByTestId('ToDate');
    this.date_to_label = this.date_to_filter_group.getByText(this.searchFilterResultsData.date_to_label);
    this.date_to_hint_label = this.date_to_filter_group.getByText(this.searchFilterResultsData.date_to_hint_label);
    this.active_filters_label = this.page.getByRole('heading').getByText(searchFilterResultsData.active_filters_label);
    this.active_filter_list = this.page.locator('.search-filter-summary').getByRole('list');
    this.active_filters_list_to_remove = this.page
      .getByRole('heading', {
        name: this.commonTestData.active_filters_label,
        exact: true,
      })
      .locator('..')
      .getByRole('list')
      .getByRole('listitem')
      .getByRole('link');
    this.active_filter_items = this.active_filter_list.getByRole('listitem').locator('span');
    this.clear_all_filters_link = this.page
      .getByRole('link')
      .getByText(searchFilterResultsData.clear_all_filters_label);
    this.search_no_results_container = this.page.locator('.search-filter-error-border');
    this.search_no_results_header = this.search_no_results_container
      .getByRole('heading')
      .getByText(searchFilterResultsData.search_no_results_header, { exact: true });
    this.search_no_results_guidance_text = this.search_no_results_container
      .getByRole('paragraph')
      .getByText(searchFilterResultsData.search_no_results_guidance_text, { exact: true });
    this.search_no_results_guidance_points = this.search_no_results_container.getByRole('list');
    this.errorMessageFieldLabelList = this.page
      .locator('.field-validation-error')
      .or(this.page.locator('.govuk-error-message'));
    this.sponsor_organisation_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_hint_text
      ),
    });
    this.sponsor_organisation_jsenabled_text = this.sponsor_organisation_fieldset.getByRole('combobox').or(
      this.page.getByRole('combobox', {
        name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
          .select_a_sponsor_organisation_hint_text,
      })
    );
    this.sponsor_organisation_suggestion_list_labels = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('option');
    this.sponsor_organisation_suggestion_listbox = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('listbox');
    this.sponsor_organisation_text = this.sponsor_organisation_fieldset.getByRole('textbox').or(
      this.page.getByRole('textbox', {
        name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
          .select_a_sponsor_organisation_hint_text,
      })
    );
    this.sponsor_organisation_jsdisabled_search_button = this.sponsor_organisation_fieldset.getByRole('button', {
      name: 'Search',
    });
    this.sponsor_organisation_jsdisabled_search_results_radio_button =
      this.sponsor_organisation_fieldset.getByRole('radio');
    // this.sponsor_organisation_jsenabled_text = this.page.getByRole('combobox', {
    //   name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
    //     .select_a_sponsor_organisation_hint_text,
    // });
    // this.sponsor_organisation_text = this.page.getByRole('textbox', {
    //   name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
    //     .select_a_sponsor_organisation_hint_text,
    // });
  }

  //Getters & Setters for Private Variables

  async getSearchKey(): Promise<string> {
    return this._search_key;
  }

  async setSearchKey(value: string): Promise<void> {
    this._search_key = value;
  }

  async getNoOfResultsBeforeSearch(): Promise<number> {
    return this._no_of_results_before_search;
  }

  async setNoOfResultsBeforeSearch(value: number): Promise<void> {
    this._no_of_results_before_search = value;
  }

  async getNoOfResultsAfterSearch(): Promise<number> {
    return this._no_of_results_after_search;
  }

  async setNoOfResultsAfterSearch(value: number): Promise<void> {
    this._no_of_results_after_search = value;
  }

  async getShortProjectTitleFilter(): Promise<string> {
    return this._short_project_title_filter;
  }

  async setShortProjectTitleFilter(value: string): Promise<void> {
    this._short_project_title_filter = value;
  }

  async getDateSubmittedFromFilter(): Promise<string> {
    return this._date_submitted_from_filter;
  }

  async setDateSubmittedFromFilter(value: string): Promise<void> {
    this._date_submitted_from_filter = value;
  }

  async getDateSubmittedToFilter(): Promise<string> {
    return this._date_submitted_to_filter;
  }

  async setDateSubmittedToFilter(value: string): Promise<void> {
    this._date_submitted_to_filter = value;
  }

  async getNumberofTotalPages(): Promise<number> {
    return this._no_of_total_pages;
  }

  async setNumberofTotalPages(value: number): Promise<void> {
    this._no_of_total_pages = value;
  }

  //Page Methods
  async storeAuthState(user: string) {
    const userPath = confirmStringNotNull(user.toLowerCase());
    await this.page.context().storageState({ path: `auth-storage-states/${userPath}.json` });
  }

  async isAccordionExpanded(accordion: Locator): Promise<string | null> {
    const isExpanded = await accordion.getAttribute('aria-expanded');
    return isExpanded;
  }

  async goBack() {
    await this.page.goBack();
  }

  async goForward() {
    await this.page.goForward();
  }

  async toggleAccordion(accordion: Locator) {
    await accordion.click();
  }

  async verifyDetailsExpanded(isExpanded: string, details: Locator) {
    if (isExpanded === 'open') {
      await expect(details).toHaveAttribute('open');
    } else if (isExpanded === 'closed') {
      await expect(details).not.toHaveAttribute('open');
    }
  }

  async uploadFiles(filePaths: string, chooseFilesElement: Locator, uploadButtonElement: Locator) {
    const filePathsSplitArray = filePaths.split('|');
    await chooseFilesElement.setInputFiles(filePathsSplitArray);
    await uploadButtonElement.click();
  }

  // To be Removed but Keeping as Placeholder for Mobile and Desktop Test Folders
  async samplePageAction(testType: string) {
    console.log(testType + ' test action');
  }

  async fillUIComponent<PageObject>(dataset: JSON | Record<string, any>, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).check();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).check();
      }
    } else if (confirmStringNotNull(await locator.getAttribute('class')).includes('govuk-select')) {
      await locator.selectOption({ label: dataset[key] });
    } else {
      await locator.fill(dataset[key]);
    }
  }

  async getFieldTypeErrorMessage<PageObject>(key: string, page: PageObject): Promise<string> {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    //Check if Textbox, Date or Radio Field else must be Checkbox
    if (typeAttribute === 'text' || typeAttribute === 'date') {
      return this.questionSetData.Validation.text_error_message;
    } else if (typeAttribute === 'radio' || typeAttribute == null) {
      return this.questionSetData.Validation.radio_error_message;
    } else {
      return this.questionSetData.Validation.checkbox_error_message;
    }
  }

  async getQsetPageObjectDataName(page: string): Promise<PageObjectDataName> {
    switch (page.toLowerCase()) {
      case 'project filter': {
        const pageObject = new ProjectFilterPage(this.page);
        const dataName = 'projectFilterPageTestData';
        return { pageObject, dataName };
      }
      case 'project details': {
        const pageObject = new ProjectDetailsPage(this.page);
        const dataName = 'projectDetailsPageTestData';
        return { pageObject, dataName };
      }
      case 'student': {
        const pageObject = new StudentPage(this.page);
        const dataName = 'studentPageTestData';
        return { pageObject, dataName };
      }
      case 'devices': {
        const pageObject = new DevicesPage(this.page);
        const dataName = 'devicesPageTestData';
        return { pageObject, dataName };
      }
      case 'tissue': {
        const pageObject = new TissuePage(this.page);
        const dataName = 'tissuePageTestData';
        return { pageObject, dataName };
      }
      case 'alc': {
        const pageObject = new AdultsLackingCapacityPage(this.page);
        const dataName = 'adultsLackingCapacityPageTestData';
        return { pageObject, dataName };
      }
      case 'children': {
        const pageObject = new ChildrenPage(this.page);
        const dataName = 'childrenPageTestData';
        return { pageObject, dataName };
      }
      case 'booking': {
        const pageObject = new BookingPage(this.page);
        const dataName = 'bookingPageTestData';
        return { pageObject, dataName };
      }
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }

  async getQsetPageValidationData(page: string, dataType: string, datasetName: string): Promise<Map<string, any>> {
    let inputDataset: any;
    switch (page.toLowerCase()) {
      case 'project filter':
        inputDataset = new ProjectFilterPage(this.page).projectFilterPageTestData[dataType][datasetName];
        break;
      case 'project details':
        inputDataset = new ProjectDetailsPage(this.page).projectDetailsPageTestData[dataType][datasetName];
        break;
      case 'student':
        inputDataset = new StudentPage(this.page).studentPageTestData[dataType][datasetName];
        break;
      case 'devices':
        inputDataset = new DevicesPage(this.page).devicesPageTestData[dataType][datasetName];
        break;
      case 'tissue':
        inputDataset = new TissuePage(this.page).tissuePageTestData[dataType][datasetName];
        break;
      case 'alc':
        inputDataset = new AdultsLackingCapacityPage(this.page).adultsLackingCapacityPageTestData[dataType][
          datasetName
        ];
        break;
      case 'children':
        inputDataset = new ChildrenPage(this.page).childrenPageTestData[dataType][datasetName];
        break;
      case 'booking':
        inputDataset = new BookingPage(this.page).bookingPageTestData[dataType][datasetName];
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
    const test = Object.entries(inputDataset);
    return new Map(test);
  }

  async writeExtractedDataFromMemoryToJSON(
    extractedValuesInMemory: JSON,
    testDataJSONPath: string,
    jsonParentNodesMap: Map<string, string>
  ) {
    const jsonRootParentNode: any = jsonParentNodesMap.get('jsonRootParentNode');
    const jsonParentNode: any = jsonParentNodesMap.get('jsonParentNode');
    const createNewJSONObject = () => {
      const newJSONObjectData = {
        [jsonRootParentNode]: {
          [jsonParentNode]: {},
        },
      };
      const firstNode = newJSONObjectData[jsonRootParentNode];
      firstNode[jsonParentNode] = extractedValuesInMemory;
      return newJSONObjectData;
    };
    const parentDirectory = path.resolve(testDataJSONPath, '..');
    const writeToJSONFile = (readJSONFile: JSON) => {
      if (!fs.existsSync(parentDirectory)) {
        fs.mkdirSync(parentDirectory, { recursive: true });
      }
      fs.writeFileSync(testDataJSONPath, JSON.stringify(readJSONFile, null, 2));
    };
    if (!fs.existsSync(testDataJSONPath) || fs.statSync(testDataJSONPath).size == 0) {
      if (!fs.existsSync(parentDirectory)) {
        fs.mkdirSync(parentDirectory, { recursive: true });
      }
      fs.writeFileSync(testDataJSONPath, JSON.stringify(createNewJSONObject(), null, 2));
    } else {
      const readJSONFile = await JSON.parse(fs.readFileSync(testDataJSONPath, 'utf8'));
      if (Object.hasOwn(readJSONFile, jsonRootParentNode)) {
        const rootParentNodeValues = readJSONFile[jsonRootParentNode];
        rootParentNodeValues[jsonParentNode] = extractedValuesInMemory;
        writeToJSONFile(readJSONFile);
      } else {
        const newJSONObjectChildData = {
          [jsonParentNode]: extractedValuesInMemory,
        };
        readJSONFile[jsonRootParentNode] = newJSONObjectChildData;
        writeToJSONFile(readJSONFile);
      }
    }
  }

  async selfHealLocator(locatorList: Locator[]): Promise<Locator> {
    let selfHealedLocator: Locator | null = null;
    for (const locator of locatorList) {
      try {
        await expect(locator).toBeAttached();
        selfHealedLocator = locator;
        break;
      } catch {
        // This catch block is defined empty so that even if the element is not present in the DOM, the loop will continue to check for the next element.
        // If no locators from the list are found valid then the below 'if' statement will throw the error to fail the test execution.
      }
    }
    if (!selfHealedLocator) {
      throw new Error(
        `Self Healing for locator has failed. Automation was not able to find a valid locator from the available list:[ ${locatorList.toString()} ]. Add a new valid locator to the list`
      );
    }
    return selfHealedLocator;
  }

  async captureScreenshot(page: Page, $step: any, $testInfo: any) {
    const screenshot = await page.screenshot({ path: 'screenshot.png', fullPage: true });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }

  async captureComponentScreenshot(locator: Locator, $step: any, $testInfo: any) {
    const screenshot = await locator.screenshot({ path: 'screenshot.png' });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }
  async validateErrorMessage<PageObject>(
    errorMessageFieldDataset: string,
    errorMessageSummaryDataset: string,
    key: string,
    page: PageObject
  ) {
    const typeAttribute = await page[key].first().getAttribute('type');
    // Create a new locator in required pages to validate the summary error labels.
    // The name of locator should be the same as in the test data and appended by '_summary_error_label'.
    const summaryLocatorKey = key + '_summary_error_label';
    await expect(
      this.errorMessageSummaryLabel.getByText(errorMessageSummaryDataset['error_message_summary_header'])
    ).toBeVisible();
    await expect(page[summaryLocatorKey].getByText(errorMessageSummaryDataset[key])).toBeVisible();
    if (typeAttribute === 'checkbox') {
      const checkboxLocator = page[key].locator('../../../..').locator(this.errorMessageFieldLabel);
      await expect(checkboxLocator).toHaveText(errorMessageFieldDataset[key]);
    } else if (typeAttribute === 'radio') {
      const radioLocator = page[key].locator('../../../..').locator(this.errorMessageFieldLabel);
      await expect(radioLocator).toHaveText(errorMessageFieldDataset[key]);
    } else if (
      typeAttribute === 'date' ||
      (await page[key].first().getAttribute('class')).toLowerCase().includes('date')
    ) {
      const dateLocator = page[key].locator('../../../../../..').locator(this.errorMessageFieldLabel);
      await expect(dateLocator).toHaveText(errorMessageFieldDataset[key]);
    } else {
      const otherLocator = page[key].locator('..').locator(this.errorMessageFieldLabel);
      await expect(otherLocator).toHaveText(errorMessageFieldDataset[key]);
    }
  }

  async validateUIComponentValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date') {
      expect(await locator.getAttribute('value')).toBe(dataset[key]);
    } else if (typeAttribute === 'radio') {
      expect(await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked());
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        expect(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked());
      }
    }
  }

  async getUiLabel<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    return confirmStringNotNull(await locator.textContent());
  }

  async clearUIComponent<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'email' || typeAttribute === 'tel') {
      await locator.clear();
    } else if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).uncheck();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).uncheck();
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        await locator.selectOption({ label: '' });
      }
    }
  }

  async getSelectedValues<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }

  async getAuditLog(): Promise<Map<string, string[]>> {
    const timeValues: string[] = [];
    const eventValues: string[] = [];
    const adminEmailValues: string[] = [];
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const timeValue = confirmStringNotNull(await columns.nth(0).textContent());
        timeValues.push(timeValue);
        const eventValue = confirmStringNotNull(await columns.nth(1).textContent());
        eventValues.push(eventValue);
        const adminEmailValue = confirmStringNotNull(await columns.nth(2).textContent());
        adminEmailValues.push(adminEmailValue);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const auditMap = new Map([
      ['timeValues', timeValues],
      ['eventValues', eventValues],
      ['adminEmailValues', adminEmailValues],
    ]);
    return auditMap;
  }
  async getSummaryErrorMessages() {
    const summaryErrorActualValues = await this.summaryErrorLinks.allTextContents();
    return summaryErrorActualValues;
  }

  async getFieldErrorMessages<PageObject>(key: string, page: PageObject) {
    let fieldErrorMessage: string;
    const element = await page[key].first();
    const typeAttribute = await element.getAttribute('type');
    if (typeAttribute === 'checkbox') {
      key = key.replace('checkbox', 'label');
      fieldErrorMessage = confirmStringNotNull(
        await this.errorFieldGroup.filter({ has: page[key] }).locator(this.errorMessageFieldLabel).textContent()
      );
    } else {
      fieldErrorMessage = confirmStringNotNull(
        await this.errorFieldGroup.filter({ has: element }).locator(this.errorMessageFieldLabel).textContent()
      );
    }
    return fieldErrorMessage;
  }

  async getMultipleFieldErrorMessages<PageObject>(key: string, page: PageObject) {
    const element = await page[key];
    const errorSpan = this.errorFieldGroup.filter({ has: element }).locator(this.errorMessageFieldLabel);
    const htmlContent = await errorSpan.innerHTML();
    const fieldErrorMessages = htmlContent.split('<br>').map(confirmStringNotNull);
    return fieldErrorMessages;
  }

  async clickErrorSummaryLink<PageObject>(errorMessageFieldDataset: JSON, key: string, page: PageObject) {
    const element: Locator = await page[key].first();
    await this.summaryErrorLinks
      .locator('..')
      .getByRole('link', { name: errorMessageFieldDataset[key], exact: true })
      .click();
    await this.page.waitForTimeout(500); //added to prevent instability when looping through multiple summary links
    return element;
  }

  async clickErrorSummaryLinkMultipleErrorField<PageObject>(errorMessage: any, key: string, page: PageObject) {
    const element: Locator = await page[key].first();
    await this.summaryErrorLinks.locator('..').getByRole('link', { name: errorMessage, exact: true }).click();
    return element;
  }

  async getUsers(): Promise<Map<string, string[]>> {
    const firstNameValues: string[] = [];
    const lastNameValues: string[] = [];
    const emailAddressValues: string[] = [];
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const firstName = confirmStringNotNull(await columns.nth(0).textContent());
        firstNameValues.push(firstName);
        const lastName = confirmStringNotNull(await columns.nth(1).textContent());
        lastNameValues.push(lastName);
        const emailAddress = confirmStringNotNull(await columns.nth(2).textContent());
        emailAddressValues.push(emailAddress);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const userMap = new Map([
      ['firstNameValues', firstNameValues],
      ['lastNameValues', lastNameValues],
      ['emailAddressValues', emailAddressValues],
    ]);
    return userMap;
  }

  async getAllUsersFromTheTable(): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      // since first row is header, starting from 1;
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const firstName = confirmStringNotNull(await columns.nth(0).textContent());
        const lastName = confirmStringNotNull(await columns.nth(1).textContent());
        const emailAddress = confirmStringNotNull(await columns.nth(2).textContent());
        searchResultValues.push(firstName + '|' + lastName + '|' + emailAddress);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
        await this.page.waitForTimeout(1000);
      } else {
        dataFound = true;
      }
    }
    const searchResultMap = new Map([['searchResultValues', searchResultValues]]);
    return searchResultMap;
  }

  async getAllOrgNamesFromTheTable(): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    let pageCount = 0;
    const maxPages = 3;
    while (pageCount < maxPages) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const orgName = confirmStringNotNull(await columns.nth(0).textContent());
        searchResultValues.push(orgName);
      }
      const hasNext = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNext && pageCount < maxPages - 1) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
        pageCount++;
      } else {
        break;
      }
    }
    return new Map([['searchResultValues', searchResultValues]]);
  }

  async validateSearchResults(listAfterSearch: any, searchKey: string) {
    for (const val of listAfterSearch) {
      if (val.includes(searchKey)) {
        return true;
      }
    }
    return false;
  }

  async validateSearchResultsMultipleWordsSearchKey(
    results: string[],
    searchTerms: string[] | string
  ): Promise<string[]> {
    const terms = Array.isArray(searchTerms) ? searchTerms : [searchTerms];
    const matchesSearchTerm = (text: string) => terms.some((term) => text.toLowerCase().includes(term.toLowerCase()));
    const resultsAfterFiltering = confirmArrayNotNull(results).filter(matchesSearchTerm);
    return resultsAfterFiltering;
  }

  async getTopMenuBarLinksNames() {
    const topMenuBarLinksValues: string[] = [];
    for (const val of await this.topMenuBarLinks.allTextContents()) {
      topMenuBarLinksValues.push(confirmStringNotNull(val));
    }
    return topMenuBarLinksValues;
  }

  async getPaginationResults(): Promise<string> {
    const paginationResultsActualValues = confirmStringNotNull(await this.pagination_results.textContent());
    return paginationResultsActualValues;
  }

  async getPageNumber(currentUrl: string) {
    const parts: string[] = currentUrl.split('?');
    const pageName: string[] = parts[1].split('&');
    const pageNumber = Number.parseInt(pageName[0].split('=')[1], 10);
    return pageNumber;
  }

  async getLastPageNumber() {
    const itemsMap = await this.getPaginationValues();
    const itemsValues: any = itemsMap.get('items');
    const visiblePagesMap = await this.getVisiblePages(itemsValues);
    const visiblePages: number[] = visiblePagesMap.get('visiblePages');
    const lastPageNumber = visiblePages.at(-1);
    return lastPageNumber;
  }

  async getTotalItems() {
    const totalItems = Number.parseInt(confirmStringNotNull(await this.result_count.textContent()).split(' ')[0], 10);
    return totalItems;
  }

  async getTotalItemsNavigatingToLastPage(pagename: string) {
    let pageSize: number;
    if (pagename == 'Participating_Organisations_Page') {
      pageSize = Number.parseInt(this.commonTestData.default_page_size_participating_organisation, 10);
    } else {
      pageSize = Number.parseInt(this.commonTestData.default_page_size, 10);
    }
    const lastPageNumber = await this.getLastPageNumber();
    await this.clickOnPages(lastPageNumber, 'page number');
    const totalLastPageItems = (await this.tableRows.count()) - 1;
    const totalItems = ((await this.getTotalPages()) - 1) * pageSize + totalLastPageItems;
    return totalItems;
  }

  async getItemsPerPage() {
    const rowCount = await this.tableRows.count();
    return rowCount;
  }

  async clickOnNavigationButton(button: Locator) {
    const isButtonVisible = await button.isVisible();
    if (isButtonVisible) {
      await button.click();
      await this.page.waitForLoadState('domcontentloaded');
    }
  }

  async clickOnNextLink() {
    await this.clickOnNavigationButton(this.next_button);
  }

  async clickOnPreviousLink() {
    await this.clickOnNavigationButton(this.previous_button);
  }

  async getLocatorforNextPreviousLinks(linkLabel: string) {
    let locatorVal: Locator;
    if (linkLabel === 'Next') {
      locatorVal = this.next_button;
    } else if (linkLabel === 'Previous') {
      locatorVal = this.previous_button;
    } else {
      throw new Error(`Unsupported link label: ${linkLabel}`);
    }
    return locatorVal;
  }

  async getPaginationValues() {
    const items = await this.pagination_items.allTextContents();
    const ellipsisIndices: number[] = [];
    const allVisibleItems: any[] = [];
    for (let i = 0; i < items.length; i++) {
      const text = items[i].trim();
      allVisibleItems.push(text);
      if (text === '⋯') {
        ellipsisIndices.push(i);
      }
    }
    const itemsMap = new Map([
      ['ellipsisIndices', ellipsisIndices],
      ['allVisibleItems', allVisibleItems],
      ['items', items],
    ]);
    return itemsMap;
  }

  async getVisiblePages(itemsValues: any[]) {
    const visiblePages = itemsValues
      .map((text) => text.trim())
      .filter((text) => /^\d+$/.test(text))
      .map(Number);
    const visiblePagesMap = new Map([['visiblePages', visiblePages]]);
    return visiblePagesMap;
  }
  async getStartEndPages(i: number, pageSize: number, totalItems: number) {
    const start = (i - 1) * pageSize + 1;
    const end = Math.min(i * pageSize, totalItems);
    const startEndPagesMap = new Map([
      ['start', start],
      ['end', end],
    ]);
    return startEndPagesMap;
  }

  async clickOnPages(currentPageNumber: number, navigateMethod: string) {
    const currentPageLink = this.pagination
      .getByRole('link', { name: `Page ${currentPageNumber}`, exact: true })
      .or(this.pagination.getByRole('button', { name: `Page ${currentPageNumber}`, exact: true }));
    if (navigateMethod === 'page number') {
      if (await currentPageLink.isVisible()) {
        await currentPageLink.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    return currentPageLink;
  }

  async getTotalPages(): Promise<number> {
    const count = await this.pageLinks.count();
    let maxPage = 1;
    const regex = /^Page (\d+)$/;
    for (let i = 0; i < count; i++) {
      const label = await this.pageLinks.nth(i).getAttribute('aria-label');
      const match = regex.exec(label ?? '');
      if (match) {
        const num = Number.parseInt(match[1], 10);
        if (num > maxPage) maxPage = num;
      }
    }
    return maxPage;
  }

  async splitSearchTerm(term: string) {
    return term.trim().split(/\s+/);
  }

  async filterResults(results: string[], searchTerms: string[] | string): Promise<string[]> {
    const terms = Array.isArray(searchTerms) ? searchTerms : [searchTerms];
    return results.filter((result) => terms.every((term) => result.toLowerCase().includes(term.toLowerCase())));
  }

  async captureLargeSizeScreenshot(page: Page, outputFile: string) {
    const viewportHeight = page.viewportSize()?.height || 800;
    const scrollHeight = await page.evaluate(() => {
      return document.documentElement.scrollHeight;
    });
    const totalParts = Math.ceil(scrollHeight / viewportHeight);
    const screenshotBuffers: Buffer[] = [];
    for (let i = 0; i < totalParts; i++) {
      const scrollY = i * viewportHeight;
      await page.evaluate((y) => window.scrollTo(0, y), scrollY);
      await page.waitForTimeout(300);
      const buf = await page.screenshot();
      screenshotBuffers.push(buf);
    }
    const images = await Promise.all(screenshotBuffers.map((b) => sharp(b).metadata()));
    const width = images[0].width;
    const heights = images.map((i) => i.height);
    const totalHeight = heights.reduce((a, b) => a + b, 0);
    const stitchedImage = sharp({
      create: {
        width,
        height: totalHeight,
        channels: 4,
        background: { r: 255, g: 255, b: 255, alpha: 1 },
      },
    });
    const composites = screenshotBuffers.map((input, index) => ({
      input,
      top: heights.slice(0, index).reduce((a, b) => a + b, 0),
      left: 0,
    }));
    await stitchedImage.composite(composites).toFile(outputFile);
  }

  async removeSelectedFilterValues(removeFilterLabel: string): Promise<string> {
    let removedFilterValues: string = '';
    if (removeFilterLabel) {
      let filterFound = true;
      while (filterFound) {
        const filterItems = this.active_filters_list_to_remove;
        const count = await filterItems.count();
        filterFound = false;
        for (let i = 0; i < count; i++) {
          const text = (await filterItems.nth(i).innerText()).trim().replace('Remove filter', '').trim();
          if (text === removeFilterLabel) {
            removedFilterValues = text;
            await filterItems.nth(i).locator('..').click({ force: true });
            await this.page.waitForTimeout(500);
            filterFound = true;
            break;
          }
        }
      }
    }
    return removedFilterValues;
  }

  async getActiveFilterLabelCheckbox(
    filterLabels: object,
    filterLabel: string,
    key: string,
    searchValue: RegExp,
    replaceValue: string
  ): Promise<string> {
    const label = filterLabels[key.replace(searchValue, replaceValue)];
    return `${label} - ${filterLabel}`;
  }

  async getActiveFilterLabelTextboxRadioButton(
    filterLabels: any,
    filterDataset: JSON,
    key: string,
    searchValue: RegExp,
    replaceValue: string
  ): Promise<string> {
    const label = filterLabels[key.replace(searchValue, replaceValue)];
    return `${label} - ${filterDataset[key]}`;
  }

  async getFromDateValue(filterDataset: JSON, key: string): Promise<string | null> {
    const baseKey = key.replace(/(_from_|_to_).*$/, '');
    const fromKey = `${baseKey}_from_day_text`;
    const fromDateValue = await this.getDateString(filterDataset, fromKey.replace('_day_text', ''));
    return fromDateValue;
  }

  async getToDateValue(filterDataset: JSON, key: string): Promise<string | null> {
    const baseKey = key.replace(/(_from_|_to_).*$/, '');
    const toKey = `${baseKey}_to_day_text`;
    const toDateValue = await this.getDateString(filterDataset, toKey.replace('_day_text', ''));
    return toDateValue;
  }

  async getActiveFilterLabelDateField(
    filterLabels: any,
    filterDataset: JSON,
    key: string,
    searchValue: RegExp,
    replaceValue: string
  ): Promise<string> {
    let activeFilterLabel = '';
    const fromDateValue = await this.getFromDateValue(filterDataset, key);
    const toDateValue = await this.getToDateValue(filterDataset, key);
    const label = filterLabels[key.replace(searchValue, replaceValue)];
    if (fromDateValue && toDateValue) {
      activeFilterLabel = `${label} - ${fromDateValue} to ${toDateValue}`;
    } else if (fromDateValue) {
      activeFilterLabel = `${label} - from ${fromDateValue}`;
    } else if (toDateValue) {
      activeFilterLabel = `${label} - to ${toDateValue}`;
    }
    return activeFilterLabel;
  }

  async shouldValidateDateFilter(key: string, filterDataset: JSON): Promise<boolean> {
    const fromDateValue = await this.getFromDateValue(filterDataset, key);
    const toDateValue = await this.getToDateValue(filterDataset, key);
    return (
      (fromDateValue && !toDateValue && key.endsWith('_from_day_text')) ||
      (!fromDateValue && toDateValue && key.endsWith('_to_day_text')) ||
      (fromDateValue && toDateValue && key.endsWith('_from_day_text'))
    );
  }

  async getCheckboxFilterLabels(
    key: string,
    filterDataset: any,
    filterLabels: any,
    replaceValue: string
  ): Promise<string[]> {
    const labels: string[] = [];
    for (const filterLabel of filterDataset[key]) {
      const activeFilterLabel = await this.getActiveFilterLabelCheckbox(
        filterLabels,
        filterLabel,
        key,
        /_checkbox$/,
        replaceValue
      );
      labels.push(activeFilterLabel);
    }
    return labels;
  }

  async getDateFilterLabel(
    key: string,
    filterDataset: any,
    filterLabels: any,
    replaceValue: string
  ): Promise<string | null> {
    const dateSuffixRegex = /(_from_day_text|_to_day_text)$/;
    if (key.startsWith('date_last_logged_in')) {
      return await this.getActiveFilterLabelLastLoggedInField(
        filterLabels,
        filterDataset,
        key,
        dateSuffixRegex,
        replaceValue
      );
    } else if (key.startsWith('date_submitted')) {
      return await this.getActiveFilterLabelDateField(filterLabels, filterDataset, key, dateSuffixRegex, replaceValue);
    }
  }

  async getTextboxRadioButtonFilterLabel(
    key: string,
    filterDataset: any,
    filterLabels: any,
    replaceValue: string
  ): Promise<string> {
    return await this.getActiveFilterLabelTextboxRadioButton(
      filterLabels,
      filterDataset,
      key,
      /(_text|_radio)$/,
      replaceValue
    );
  }

  async getDateString(dataset: JSON, prefix: string): Promise<string | null> {
    const day = +dataset[`${prefix}_day_text`];
    const monthRaw = dataset[`${prefix}_month_dropdown`];
    const year = dataset[`${prefix}_year_text`];
    const month = typeof monthRaw === 'string' ? monthRaw.slice(0, 3) : null;
    return day && month && year ? `${day} ${month} ${year}` : null;
  }

  async getCheckboxHintLabel(): Promise<string> {
    const hintLabel = 0 + ' ' + this.commonTestData.selected_checkboxes_hint_label;
    return hintLabel;
  }

  async areSearchResultsValid(actualValues: string[], allowedValues: string[]) {
    const allValid = actualValues.every((value) => allowedValues.includes(value));
    return allValid;
  }

  async getNoResultsBulletPoints(): Promise<string[]> {
    const bulletPoints = this.no_results_bullet_points;
    const count = await bulletPoints.count();
    const values: string[] = [];
    for (let i = 0; i < count; i++) {
      const text = confirmStringNotNull(await bulletPoints.nth(i).textContent());
      values.push(text);
    }
    return values;
  }

  async validatePagination(
    currentPage: any,
    totalPages: any,
    totalItems: number,
    pagename: string,
    navigateMethod: string
  ) {
    let pageSize: number;
    if (pagename == 'Participating_Organisations_Page') {
      pageSize = Number.parseInt(this.commonTestData.default_page_size_participating_organisation, 10);
    } else {
      pageSize = Number.parseInt(this.commonTestData.default_page_size, 10);
    }
    const currentPageLocator = await this.clickOnPages(currentPage, navigateMethod);
    await expect(currentPageLocator).toHaveAttribute('aria-current');
    const { start, end } = Object.fromEntries(await this.getStartEndPages(currentPage, pageSize, totalItems));
    const rowCount = await this.getItemsPerPage();
    expect(rowCount - 1).toBe(end - start + 1);
    const itemsMap = await this.getPaginationValues();
    const ellipsisIndices = itemsMap.get('ellipsisIndices');
    const itemsValues = itemsMap.get('items');
    const allVisibleItems = itemsMap.get('allVisibleItems');
    const visiblePages = (await this.getVisiblePages(itemsValues)).get('visiblePages');
    const firstPage = 1;
    const lastPage = totalPages;
    const assertVisiblePages = (expectedPages: number[]) => {
      expect(visiblePages).toEqual(expectedPages);
    };
    const assertAllVisibleItems = (expectedItems: string[]) => {
      expect(allVisibleItems).toEqual(expectedItems);
    };
    const buildExpected = (pages: number[], items: (number | string)[]) => {
      assertVisiblePages(pages);
      assertAllVisibleItems(items.map(String));
    };
    if (totalPages <= 7) {
      buildExpected(visiblePages, allVisibleItems);
      expect(ellipsisIndices.length).toBe(0);
    } else if (currentPage <= 3) {
      const base = [firstPage];
      switch (currentPage) {
        case 1:
          buildExpected([firstPage, 2, lastPage], [firstPage, 2, '⋯', lastPage]);
          break;
        case 2:
          buildExpected([...base, 2, 3, lastPage], [firstPage, 2, 3, '⋯', lastPage]);
          break;
        default:
          buildExpected(
            [...base, currentPage - 1, currentPage, currentPage + 1, lastPage],
            [firstPage, currentPage - 1, currentPage, currentPage + 1, '⋯', lastPage]
          );
      }
    } else if (currentPage >= totalPages - 2) {
      switch (currentPage) {
        case totalPages - 2:
          buildExpected(
            [firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage],
            [firstPage, '⋯', currentPage - 1, currentPage, currentPage + 1, lastPage]
          );
          break;
        case totalPages - 1:
          buildExpected(
            [firstPage, currentPage - 1, currentPage, lastPage],
            [firstPage, '⋯', currentPage - 1, currentPage, lastPage]
          );
          break;
        default:
          buildExpected([firstPage, currentPage - 1, lastPage], [firstPage, '⋯', currentPage - 1, lastPage]);
      }
    } else {
      buildExpected(
        [firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage],
        [firstPage, '⋯', currentPage - 1, currentPage, currentPage + 1, '⋯', lastPage]
      );
    }
    // Common assertions
    expect(visiblePages).toContain(currentPage);
    if (currentPage > 1) expect(visiblePages).toContain(currentPage - 1);
    if (currentPage < totalPages) expect(visiblePages).toContain(currentPage + 1);
    expect(visiblePages).toContain(firstPage);
    expect(visiblePages).toContain(lastPage);
    // Navigation
    if (navigateMethod === 'next link') {
      await this.clickOnNextLink();
    } else if (navigateMethod === 'previous link') {
      await this.clickOnPreviousLink();
    }
  }

  async uncheckAllCheckboxes(locator: Locator) {
    const type = await locator.first().getAttribute('type');
    if (type !== 'checkbox') return;
    const count = await locator.count();
    for (let index = 0; index < count; index++) {
      const checkbox = locator.nth(index);
      if (await checkbox.isChecked()) {
        await checkbox.uncheck();
      }
    }
  }

  async getLabelsFromCheckboxes(locator: Locator): Promise<string[]> {
    const labels: string[] = [];
    const count = await locator.count();
    for (let i = 0; i < count; i++) {
      const labelLocator = locator.nth(i).locator('..').locator('.govuk-label');
      const labelText = confirmStringNotNull(await labelLocator.first().textContent());
      labels.push(labelText);
    }
    return labels;
  }

  async getChangeLink<PageObject>(fieldKey: string, page: PageObject) {
    const locatorName = fieldKey.toLowerCase() + '_change_link';
    return page[locatorName];
  }

  async selectCheckboxUserProfileReviewBody<PageObject>(dataset: any, page: PageObject) {
    const locator: Locator = page['review_body_checkbox'];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset['review_body_checkbox']) {
        await locator.locator('..').getByLabel(checkbox).first().check();
      }
    }
  }

  async getLastLoggedInFilterLabel(
    key: string,
    filterDataset: any,
    filterLabels: any,
    replaceValue: string
  ): Promise<string | null> {
    return await this.getActiveFilterLabelLastLoggedInField(
      filterLabels,
      filterDataset,
      key,
      /(_from_day_text|_to_day_text)$/,
      replaceValue
    );
  }

  async getActiveFilterLabelLastLoggedInField(
    filterLabels: any,
    filterDataset: JSON,
    key: string,
    searchValue: RegExp,
    replaceValue: string
  ): Promise<string> {
    let activeFilterLabel: string;
    const label = filterLabels[key.replace(searchValue, replaceValue)];
    const dateType = key.includes('_from_') ? 'from' : 'to';
    const dateKey = key.replace('_day_text', '');
    const dateValue = await this.getDateString(filterDataset, dateKey);
    if (dateValue) {
      activeFilterLabel = `${label} - ${dateType} ${dateValue}`;
    }
    return activeFilterLabel;
  }

  async extractNumFromSearchResultCount(resultsString: string): Promise<number> {
    return Number.parseInt(resultsString.replace(searchFilterResultsData.search_results_suffix, '').trim());
  }

  async checkDateMultiDateSearchResultValues(
    dateResultValues: string[],
    searchInputDataset: any,
    searchInput: string
  ): Promise<boolean> {
    let expectedDateResultFound = false;
    const fromExpectedDate = new Date(
      `${searchInputDataset[searchInput].day_from_text} ${searchInputDataset[searchInput].month_from_dropdown} ${searchInputDataset[searchInput].year_from_text}`
    );
    const toExpectedDate = new Date(
      `${searchInputDataset[searchInput].day_to_text} ${searchInputDataset[searchInput].month_to_dropdown} ${searchInputDataset[searchInput].year_to_text}`
    );
    for (const date of dateResultValues) {
      const actualDate = new Date(date);
      if (searchInput.toLowerCase().includes('to')) {
        expectedDateResultFound = actualDate <= toExpectedDate;
      } else if (searchInput.toLowerCase().includes('from')) {
        expectedDateResultFound = actualDate >= fromExpectedDate;
      } else {
        expectedDateResultFound = actualDate >= fromExpectedDate && actualDate <= toExpectedDate;
      }
      if (!expectedDateResultFound) {
        return expectedDateResultFound;
      }
    }
    return expectedDateResultFound;
  }

  async sortModificationIdListValues(modificationIds: string[], sortDirection: string): Promise<string[]> {
    let sortedListAsNums: number[][];
    const sortedListAsStrings: string[] = [];
    const formattedModificationIds = modificationIds.map((id) => {
      const [prefix, suffix] = id.split('/');
      return [Number.parseInt(prefix), Number.parseInt(suffix)];
    });
    if (sortDirection.toLowerCase() == 'ascending') {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (a[0] - b[0] == 0) {
          return a[1] - b[1];
        } else {
          return a[0] - b[0];
        }
      });
    } else {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (b[0] - a[0] == 0) {
          return b[1] - a[1];
        } else {
          return b[0] - a[0];
        }
      });
    }
    for (const entry of sortedListAsNums.entries()) {
      sortedListAsStrings.push(entry[1].toString().replace(',', '/'));
    }
    return sortedListAsStrings;
  }

  async getActualListValues(tableBodyRows: Locator, columnIndex: number): Promise<string[]> {
    const actualListValues: string[] = [];
    for (const row of await tableBodyRows.all()) {
      const actualListValue = confirmStringNotNull(await row.getByRole('cell').nth(columnIndex).textContent())
        .replaceAll(/\s+/g, ' ')
        .trim();
      actualListValues.push(actualListValue);
    }
    return actualListValues;
  }

  async clickButton(page: string, buttonName: string) {
    const buttonLabel = this.buttonTextData[page][buttonName];
    await this.govUkButton
      .getByText(buttonLabel, { exact: true })
      .or(this.genericButton.getByText(buttonLabel, { exact: true }))
      .first()
      .click();
  }

  async clickErrorSummaryLinkSpecific<PageObject>(key: string, page: PageObject, errorMsg: string) {
    const element: Locator = await page[key].first();
    await this.summaryErrorLinks.locator('..').getByRole('link', { name: errorMsg, exact: true }).click();
    await this.page.waitForTimeout(500); //added to prevent instability when looping through multiple summary links
    return element;
  }

  async getFieldErrorMessagesList<PageObject>(key: string, page: PageObject) {
    const fieldErrorMessage: string[] = [];
    const element = await page[key].first();
    const errorMessagesLocator = this.errorFieldGroup.filter({ has: element }).locator(this.errorMessageFieldLabelList);
    const errorCount = await errorMessagesLocator.count();
    for (let i = 0; i < errorCount; i++) {
      const errorText = await errorMessagesLocator.nth(i).textContent();
      if (errorText) {
        fieldErrorMessage.push(errorText.trim());
      }
    }
    return fieldErrorMessage;
  }

  async clearCheckboxes<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    const count = await locator.count();
    for (let i = 0; i < count; i++) {
      const checkbox = locator.nth(i);
      const isChecked = await checkbox.isChecked();
      if (isChecked) {
        await checkbox.uncheck();
      }
    }
  }

  async selectSponsorOrgJsEnabled<PageObject>(dataset: JSON | Record<string, any>, key: string, page: PageObject) {
    dataset['sponsor_organisation_jsenabled_text'] = dataset[key];
    await this.fillUIComponent(dataset, 'sponsor_organisation_jsenabled_text', page);
    await this.page.waitForTimeout(2000);
    const suggestionVisible = await this.sponsor_organisation_suggestion_list_labels.first().isVisible();
    if (suggestionVisible) {
      await this.sponsor_organisation_suggestion_list_labels.first().click();
    }
  }
}
