import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the booking page with {string}',
  async ({ bookingPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = bookingPage.bookingPageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, bookingPage);
      }
    }
  }
);
