import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the application {string} section in the booking page with {string}',
  async ({ bookingPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    let dataset: any;
    if (sectionName === 'application booking') {
      dataset = bookingPage.bookingPageTestData.Application_Booking[datasetName];
    }
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, bookingPage);
      }
    }
  }
);

Then(
  'I validate error displayed using {string} when no data entered on mandatory fields for {string} section in the booking page with {string}',
  async (
    { bookingPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    let dataset: any;
    if (sectionName === 'application booking') {
      dataset = bookingPage.bookingPageTestData.Application_Booking[datasetFieldNames];
    }
    const errorMessageSummaryEachQuestion = bookingPage.bookingPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].length === 0) {
          await commonItemsPage.validateQsetErrorMessage(errorMessageSummaryEachQuestion, key, bookingPage);
        }
      }
    }
  }
);
