import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the project details iras page', async ({ projectDetailsIRASPage }) => {
  await projectDetailsIRASPage.assertOnProjectDetailsIRASPage();
});

Then(
  'I can see the {string} on the project details iras page',
  async ({ projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    expect(await projectDetailsIRASPage.irasIDTextBoxLabel.textContent()).toBe(dataset.iras_textbox_label);
    expect(await projectDetailsIRASPage.irasTextBoxHintLabel.textContent()).toBe(dataset.iras_textbox_hint);
  }
);

Then(
  'I fill the project details iras page with {string}',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then(
  'I can see {string} displayed on the project details iras page',
  async ({ projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    expect(await projectDetailsIRASPage.irasIDTextBox.textContent()).toBe(dataset.iras_id);
  }
);
