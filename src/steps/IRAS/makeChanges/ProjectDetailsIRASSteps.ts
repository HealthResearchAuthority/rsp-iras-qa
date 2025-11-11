import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { generateIrasId } from '../.././../utils/GenerateTestData';

const { Then } = createBdd(test);

Then('I can see the project details iras page', async ({ projectDetailsIRASPage }) => {
  await projectDetailsIRASPage.assertOnProjectDetailsIRASPage();
});

Then(
  'I can see the {string} ui labels on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, projectDetailsIRASPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I fill the project details iras page with {string}',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (['Valid_IRAS_ID_Max', 'Valid_IRAS_ID_Min', 'Invalid_IRAS_ID_Min_Length'].includes(datasetName)) {
          dataset[key] = generateIrasId(datasetName);
        }
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then('I fill the unique iras id in project details iras page', async ({ projectDetailsIRASPage }) => {
  const uniqueIrasId = await projectDetailsIRASPage.getValidIRASFromLegacySharepoint();
  await projectDetailsIRASPage.setUniqueIrasId(uniqueIrasId);
  await projectDetailsIRASPage.iras_id_text.fill(await projectDetailsIRASPage.getUniqueIrasId());
});

Then('I fill the existing iras id in project details iras page', async ({ projectDetailsIRASPage }) => {
  const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
  await projectDetailsIRASPage.iras_id_text.fill(irasIdRunTime);
});

Then(
  'I can see previously saved values for {string} displayed on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then(
  'I validate that the project not currently eligible to use the service page is displayed',
  async ({ commonItemsPage, projectDetailsIRASPage, context }) => {
    await expect(
      commonItemsPage.page_heading.getByText(
        projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.project_not_eligible_page_heading
      )
    ).toBeVisible();
    const pageBodyActual = (await projectDetailsIRASPage.page_body.textContent()).replaceAll(/\s+/g, ' ').trim();
    const pageBodyExpected =
      projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.project_not_eligible_page_body;
    expect(pageBodyActual).toBe(pageBodyExpected);
    await commonItemsPage.clickLink('IRAS_ID_Error_Page', 'Follow_Existing_Processes');
    const followExistingProcessesPage = await context.waitForEvent('page');
    await followExistingProcessesPage.waitForLoadState('load');
    const followExistingProcessesUrlActual = followExistingProcessesPage.url();
    const followExistingProcessesUrlExpected =
      projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.follow_existing_process_url;
    expect(followExistingProcessesUrlActual).toBe(followExistingProcessesUrlExpected);
    await followExistingProcessesPage.close();
    await commonItemsPage.clickLink('IRAS_ID_Error_Page', 'HRA_Support_Site');
    const hraSupporSitePage = await context.waitForEvent('page');
    await hraSupporSitePage.waitForLoadState('load');
    const hraSupporSiteUrlActual = hraSupporSitePage.url();
    const hraSupporSiteUrlExpected =
      projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.hra_support_site_url;
    expect(hraSupporSiteUrlActual).toBe(hraSupporSiteUrlExpected);
  }
);

Then(
  'I validate that the project record already exists page is displayed',
  async ({ commonItemsPage, projectDetailsIRASPage, context }) => {
    await expect(
      commonItemsPage.page_heading.getByText(
        projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.project_already_exist_heading
      )
    ).toBeVisible();
    const pageBodyActual = (await projectDetailsIRASPage.page_body.textContent()).replaceAll(/\s+/g, ' ').trim();
    const pageBodyExpected =
      projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.project_already_exist_page_body;
    expect(pageBodyActual).toBe(pageBodyExpected);
    await commonItemsPage.clickLink('IRAS_ID_Error_Page', 'HRA_Support_Site');
    const hraSupporSitePage = await context.waitForEvent('page');
    await hraSupporSitePage.waitForLoadState('load');
    const hraSupporSiteUrlActual = hraSupporSitePage.url();
    const hraSupporSiteUrlExpected =
      projectDetailsIRASPage.projectDetailsIRASPageTestData.IRAS_ID_Error_Page.hra_support_site_url;
    expect(hraSupporSiteUrlActual).toBe(hraSupporSiteUrlExpected);
  }
);
