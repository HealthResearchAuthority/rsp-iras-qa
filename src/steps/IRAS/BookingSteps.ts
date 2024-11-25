import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the application {string} section in the booking page with {string}',
  async ({ bookingPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = await bookingPage.getTestDataForBooking(sectionName, datasetName);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, bookingPage);
      }
    }
  }
);

Then(
  'I validate error message using {string} on mandatory fields for {string} section in the booking page with {string}',
  async (
    { bookingPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    const dataset = await bookingPage.getTestDataForBooking(sectionName, datasetFieldNames);
    const errorMessageSummaryEachQuestion = bookingPage.bookingPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateQsetErrorMessage(errorMessageSummaryEachQuestion, dataset, key, bookingPage);
      }
    }
  }
);
