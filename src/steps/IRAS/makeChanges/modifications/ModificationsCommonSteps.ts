import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the {string} page for modifications', async ({ modificationsCommonPage }, datasetName) => {
  const dataset = modificationsCommonPage.modificationsCommonPagePageTestData.Specific_Change_Pages[datasetName];
  await modificationsCommonPage.assertOnModificationsPage(dataset);
});

Then(
  'I validate the project information labels using {string} dataset displayed on modifications page',
  async (
    { modificationsCommonPage, projectDetailsIRASPage, projectDetailsTitlePage },
    projectTitleDatasetName: string
  ) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[projectTitleDatasetName].short_project_title_text;
    const modificationIDExpected = irasIDExpected + '/' + 1;
    const irasIDActual = confirmStringNotNull(await modificationsCommonPage.iras_id_label.textContent());
    const shortProjectTitleActual = confirmStringNotNull(
      await modificationsCommonPage.short_project_title_label.textContent()
    );
    const modificationIDActual = confirmStringNotNull(
      await modificationsCommonPage.modification_id_label.textContent()
    );
    expect(irasIDActual).toBe(irasIDExpected);
    expect(shortProjectTitleActual).toBe(shortProjectTitleExpected);
    expect(modificationIDActual).toBe(modificationIDExpected);
  }
);
