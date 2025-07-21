import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the select area of change page', async ({ selectAreaOfChangePage }) => {
  await selectAreaOfChangePage.assertOnSelectAreaOfChangePage();
});

Then(
  'I select {string} from area of change dropdown and {string} from specific change dropdown',
  async (
    { commonItemsPage, selectAreaOfChangePage },
    areaOfChangeDatasetName: string,
    specificChangeDatasetName: string
  ) => {
    const areaOfChangeDataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Area_Of_Change[areaOfChangeDatasetName];
    const specificChangeDataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatasetName];
    for (const key in areaOfChangeDataset) {
      if (Object.prototype.hasOwnProperty.call(areaOfChangeDataset, key)) {
        await commonItemsPage.fillUIComponent(areaOfChangeDataset, key, selectAreaOfChangePage);
      }
    }
    for (const key in specificChangeDataset) {
      if (Object.prototype.hasOwnProperty.call(specificChangeDataset, key)) {
        await commonItemsPage.fillUIComponent(specificChangeDataset, key, selectAreaOfChangePage);
      }
    }
  }
);

Then(
  'I validate the field values with {string} on select area of change page',
  async ({ selectAreaOfChangePage, projectDetailsIRASPage, projectDetailsTitlePage }, projectTitleDatasetName) => {
    const projectTitleDataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[projectTitleDatasetName];
    const actualIrasIdValue = confirmStringNotNull(await selectAreaOfChangePage.iras_id_text.textContent());
    const expectedIrasIdValue = await projectDetailsIRASPage.getUniqueIrasId();
    const actualProjectTitle = confirmStringNotNull(
      await selectAreaOfChangePage.short_project_title_text.textContent()
    );
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    const expectedModificationId = irasIdRunTime + '/' + 1;
    const actualModificationId = confirmStringNotNull(await selectAreaOfChangePage.modification_id_text.textContent());
    const expectedProjectTitle = projectTitleDataset.short_project_title_text;
    expect(actualIrasIdValue).toBe(expectedIrasIdValue);
    expect(actualProjectTitle).toBe(expectedProjectTitle);
    expect(actualModificationId).toBe(expectedModificationId);
    expect(selectAreaOfChangePage.remove_this_change_link).toBeVisible();
  }
);

Then(
  'I can see previously saved values for {string} and {string} displayed on select area of change page',
  async ({ commonItemsPage, selectAreaOfChangePage }, areaOfChangeDatasetName: string, specificChangeDatasetName) => {
    const areaOfChangeDataset = selectAreaOfChangePage.selectAreaOfChangePageTestData[areaOfChangeDatasetName];
    const specificChangeDataset = selectAreaOfChangePage.selectAreaOfChangePageTestData[specificChangeDatasetName];
    for (const key in areaOfChangeDataset) {
      if (Object.prototype.hasOwnProperty.call(areaOfChangeDataset, key)) {
        await commonItemsPage.validateUIComponentValues(areaOfChangeDataset, key, selectAreaOfChangePage);
      }
    }
    for (const key in areaOfChangeDataset) {
      if (Object.prototype.hasOwnProperty.call(specificChangeDataset, key)) {
        await commonItemsPage.validateUIComponentValues(specificChangeDataset, key, selectAreaOfChangePage);
      }
    }
  }
);

Then(
  'I validate the modification id is incremented by one for every {int} new modification on select area of change page',
  async ({ selectAreaOfChangePage, projectDetailsIRASPage, commonItemsPage }, ModificationCount: number) => {
    const maxModificationCount = ModificationCount;
    let expectedModificationId: string;
    let actualModificationId: string;
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    for (let i = 1; i <= maxModificationCount; i++) {
      actualModificationId = confirmStringNotNull(await selectAreaOfChangePage.modification_id_text.textContent());
      expectedModificationId = irasIdRunTime + '/' + i;
      expect(actualModificationId).toBe(expectedModificationId);
      await commonItemsPage.govUkButton
        .getByText('Save for later', { exact: true })
        .or(commonItemsPage.genericButton.getByText('Save for later', { exact: true }))
        .first()
        .click();
      await commonItemsPage.govUkLink.getByText('Modifications', { exact: true }).click();
      const j = i + 1;
      const storeModificationId = irasIdRunTime + '/' + j;
      await selectAreaOfChangePage.setModificationId(storeModificationId);
    }
  }
);

Then(
  'I validate the specific change dropdown options are displayed based on the selected area of change dropdown with {string}',
  async ({ selectAreaOfChangePage }, datasetName: string) => {
    const expectedSpecificChangeDropdownValues =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Specific_Change_Options[datasetName];
    const actualSpecificChangeDropdownValues =
      await selectAreaOfChangePage.specific_change_dropdown_all_options.evaluateAll((values) =>
        values.map((value) => value.textContent)
      );
    expect(actualSpecificChangeDropdownValues).toEqual(expectedSpecificChangeDropdownValues);
  }
);
