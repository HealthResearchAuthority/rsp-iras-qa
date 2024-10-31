import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the application booking section in the booking page with {string}',
  async ({ bookingPage, commonItemsPage }, datasetName: string) => {
    const dataset = bookingPage.bookingPageTestData.Application_Booking[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, bookingPage);
      }
    }
  }
);
