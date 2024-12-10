import { expect, Locator, Page } from '@playwright/test';
import * as bookingPageTestData from '../../../resources/test_data/iras/question_set/pages/booking_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class BookingPage {
  readonly page: Page;
  readonly bookingPageTestData: typeof bookingPageTestData;
  readonly booking_section_headings: Locator;
  readonly application_booking_section: Locator;
  readonly agree_project_information_be_used_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.bookingPageTestData = bookingPageTestData;

    //Locators
    this.booking_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Application Booking Section
    this.application_booking_section = this.page.locator(
      '//legend[contains(text(),"Application booking")]/parent::fieldset'
    );
    this.agree_project_information_be_used_text = this.application_booking_section.getByTestId('IQA00D1_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=D');
  }

  async assertOnBookingPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.bookingPageTestData.Booking.section_headings;
    expect(await activeStage.textContent()).toBe(this.bookingPageTestData.Booking.page_name);
    await expect(this.booking_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.booking_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.bookingPageTestData.Booking.title);
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Application_Booking') {
      sectionLocator = this.application_booking_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the booking page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
