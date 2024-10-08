import { expect, Locator, Page } from '@playwright/test';
import * as projectFilterPageTestData from '../../resources/test_data/iras/project_filter_page_data.json';

//Declare Page Objects
export default class ProjectFilterPage {
  readonly page: Page;
  readonly projectFilterPageTestData: typeof projectFilterPageTestData;
  readonly pageHeadingCaption: Locator;
  readonly pageHeading: Locator;
  readonly shortProjectTitleTextBox: Locator;
  readonly fullProjectTitleTextBox: Locator;
  readonly isProjectManagedCommercialResearchRadio: string;
  readonly seekingNIHRFundingRadio: string;
  readonly accessCPMSServiceRadio: string;
  readonly emailInitialContactCPMSTextBox: Locator;
  readonly isEducationalProjectRadio: string;
  readonly activitiesInvolvedCheckBox: string;
  readonly isResearchBioresourceRadio: string;
  readonly bioresourceNHSOrHSCRadio: string;
  readonly isCTIMPRadio: string;
  readonly optionsForProjectRadio: string;
  readonly geneticallyModifiedOrganismRadio: string;
  readonly isClinicalOrMedicalDevicesRadio: string;
  readonly exposingIonisingRadiationRadio: string;
  readonly usingHumanSamplesRadio: string;
  readonly patientDataAccessedOutsideRadio: string;
  readonly adultsNotAbleToConsentRadio: string;
  readonly includeChildrenRadio: string;
  readonly includePrisonersOffendersRadio: string;
  readonly involveMinistryOfDefenceRadio: string;
  readonly involveHFEARadio: string;
  readonly isOutsideUKRadio: string;
  readonly placeInUKForProjectCheckBox: string;
  readonly whereHumanSamplesHeldCheckBox: string;
  readonly whereHumanSampleObtainedCheckBox: string;
  readonly whereProjectTakePlaceCheckBox: string;
  readonly detailsOfOtherOrganisationTextBox: Locator;
  readonly usePICsRadio: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectFilterPageTestData = projectFilterPageTestData;

    //Locators
    this.pageHeadingCaption = page.locator('legend', {
      hasText: this.projectFilterPageTestData['Project_Filter'].heading_caption,
    });
    this.pageHeading = page.getByText(this.projectFilterPageTestData['Project_Filter'].heading);
    this.shortProjectTitleTextBox = page.locator('input[id="IQA0002_Text"]');
    this.fullProjectTitleTextBox = page.locator('input[id="IQA0003_Text"]');
    this.isProjectManagedCommercialResearchRadio = '//label[contains(@for,"IQA0004") and text()="%s"]';
    this.seekingNIHRFundingRadio = '//label[contains(@for,"IQA03271") and text()="%s"]';
    this.accessCPMSServiceRadio = '//label[contains(@for,"IQA0005") and text()="%s"]';
    this.emailInitialContactCPMSTextBox = page.locator('input[id="IQA0006_Text"]');
    this.isEducationalProjectRadio = '//label[contains(@for,"IQA0012") and text()="%s"]';
    this.activitiesInvolvedCheckBox = '//label[contains(@for,"IQA0061") and text()="%s"]';
    this.isResearchBioresourceRadio = '//label[contains(@for,"IQA0014") and text()="%s"]';
    this.bioresourceNHSOrHSCRadio = '//label[contains(@for,"IQA0015") and text()="%s"]';
    this.isCTIMPRadio = '//label[contains(@for,"IQA0017") and text()="%s"]';
    this.optionsForProjectRadio = '//label[contains(@for,"IQA0018") and text()="%s"]';
    this.geneticallyModifiedOrganismRadio = '//label[contains(@for,"IQA03282") and text()="%s"]';
    this.isClinicalOrMedicalDevicesRadio = '//label[contains(@for,"IQA0020") and text()="%s"]';
    this.exposingIonisingRadiationRadio = '//label[contains(@for,"IQA0021") and text()="%s"]';
    this.usingHumanSamplesRadio = '//label[contains(@for,"IQA0022") and text()="%s"]';
    this.patientDataAccessedOutsideRadio = '//label[contains(@for,"IQA0024") and text()="%s"]';
    this.adultsNotAbleToConsentRadio = '//label[contains(@for,"IQA0025") and text()="%s"]';
    this.includeChildrenRadio = '//label[contains(@for,"IQA0026") and text()="%s"]';
    this.includePrisonersOffendersRadio = '//label[contains(@for,"IQA0027") and text()="%s"]';
    this.involveMinistryOfDefenceRadio = '//label[contains(@for,"IQA0028") and text()="%s"]';
    this.involveHFEARadio = '//label[contains(@for,"IQA0029") and text()="%s"]';
    this.isOutsideUKRadio = '//label[contains(@for,"IQA0142") and text()="%s"]';
    this.placeInUKForProjectCheckBox = '//label[contains(@for,"IQA0032") and text()="%s"]';
    this.whereHumanSamplesHeldCheckBox = '//label[contains(@for,"IQA0033") and text()="%s"]';
    this.whereHumanSampleObtainedCheckBox = '//label[contains(@for,"IQA0034") and text()="%s"]';
    this.whereProjectTakePlaceCheckBox = '//label[contains(@for,"IQA0144") and text()="%s"]';
    this.detailsOfOtherOrganisationTextBox = page.locator('input[id="IQA0145_Text"]');
    this.usePICsRadio = '//label[contains(@for,"IQA0146") and text()="%s"]';
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnProjectFilterPage() {
    await expect(this.pageHeadingCaption).toBeVisible();
    await expect(this.pageHeading).toBeVisible();
    expect(await this.page.title()).toBe(this.projectFilterPageTestData['Project_Filter'].title);
  }
}
