import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the create project record page', async ({ createProjectRecordPage }) => {
  await createProjectRecordPage.assertOnCreateProjectRecordPage();
});

Then(
  'I can see the {string} on the create project record page',
  async ({ createProjectRecordPage }, datasetName: string) => {
    const dataset = createProjectRecordPage.createProjectRecordPageTestData[datasetName];
    expect(await createProjectRecordPage.guidanceTextLabel.textContent()).toBe(dataset.guidance_label);
  }
);
