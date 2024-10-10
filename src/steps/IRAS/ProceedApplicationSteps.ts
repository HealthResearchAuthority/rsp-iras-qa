import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Given } = createBdd(test);

Given(
  'I can see the Proceed Application Page for {string}',
  async ({ proceedApplicationPage, createApplicationPage }, datasetName: string) => {
    const dataset = createApplicationPage.createApplicationPageData[datasetName];
    await proceedApplicationPage.assertOnProceedApplicationPage();
    const actualProjectTitle = await proceedApplicationPage.irasIdProjectTitleListValue.nth(1).textContent();
    const actualProjectDescription = await proceedApplicationPage.projectDescriptionListValue.textContent();
    expect(actualProjectTitle).toBe(dataset.name);
    expect(actualProjectDescription).toBe(dataset.description);
  }
);
