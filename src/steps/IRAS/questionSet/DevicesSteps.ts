import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the devices filter questions section in the devices page with {string}',
  async ({ devicesPage, commonItemsPage }, datasetName: string) => {
    const dataset = devicesPage.devicesPageTestData.Devices_Filter_Questions[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, devicesPage);
      }
    }
  }
);

Then(
  'I fill the device investigation no mhra section in the devices page with {string}',
  async ({ devicesPage, commonItemsPage }, datasetName: string) => {
    const dataset = devicesPage.devicesPageTestData.Device_Investigation_No_MHRA[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, devicesPage);
      }
    }
  }
);
