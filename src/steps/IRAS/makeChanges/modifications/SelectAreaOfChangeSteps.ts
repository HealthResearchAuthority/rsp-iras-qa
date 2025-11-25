import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import config from '../../../../../playwright.config';

const { Then } = createBdd(test);

Then('I can see the select area of change page', async ({ selectAreaOfChangePage }) => {
  await selectAreaOfChangePage.assertOnSelectAreaOfChangePage();
});

Then(
  'I select {string} from area of change dropdown and {string} from specific change dropdown',
  async (
    { commonItemsPage, selectAreaOfChangePage, $tags },
    areaOfChangeDatasetName: string,
    specificChangeDatasetName: string
  ) => {
    const areaOfChangeDataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Area_Of_Change[areaOfChangeDatasetName];
    const specificChangeDataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatasetName];
    for (const key in areaOfChangeDataset) {
      if (Object.hasOwn(areaOfChangeDataset, key)) {
        await commonItemsPage.fillUIComponent(areaOfChangeDataset, key, selectAreaOfChangePage);
      }
    }
    if ($tags.includes('@jsDisabled') || !config.projects?.[1].use?.javaScriptEnabled) {
      await selectAreaOfChangePage.apply_selection_button.click();
      for (const key in specificChangeDataset) {
        if (Object.hasOwn(specificChangeDataset, key)) {
          await commonItemsPage.fillUIComponent(specificChangeDataset, key, selectAreaOfChangePage);
        }
      }
    } else {
      for (const key in specificChangeDataset) {
        if (Object.hasOwn(specificChangeDataset, key)) {
          await commonItemsPage.fillUIComponent(specificChangeDataset, key, selectAreaOfChangePage);
        }
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
      if (Object.hasOwn(areaOfChangeDataset, key)) {
        await commonItemsPage.validateUIComponentValues(areaOfChangeDataset, key, selectAreaOfChangePage);
      }
    }
    for (const key in areaOfChangeDataset) {
      if (Object.hasOwn(specificChangeDataset, key)) {
        await commonItemsPage.validateUIComponentValues(specificChangeDataset, key, selectAreaOfChangePage);
      }
    }
  }
);

Then(
  'I validate the modification id is incremented by one for every {string} new modification on select area of change page',
  async ({ selectAreaOfChangePage, projectDetailsIRASPage, commonItemsPage }, datasetName: string) => {
    const maxModificationCount = selectAreaOfChangePage.selectAreaOfChangePageTestData[datasetName];
    let expectedModificationId: string;
    let actualModificationId: string;
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    const buttonValue = commonItemsPage.buttonTextData.Project_Overview_Page.Create_New_Modification;
    for (let index = 1; index <= maxModificationCount; index++) {
      actualModificationId = confirmStringNotNull(await selectAreaOfChangePage.modification_id_text.textContent());
      expectedModificationId = irasIdRunTime + '/' + index;
      expect(actualModificationId).toBe(expectedModificationId);
      await commonItemsPage.govUkButton
        .getByText(buttonTextData.Select_Area_Of_Change_Page.Save_For_Later, { exact: true })
        .first()
        .click();
      await commonItemsPage.govUkLink
        .getByText(linkTextData.Project_Overview_Page.Post_Approval, { exact: true })
        .click();
      await commonItemsPage.govUkButton
        .getByText(buttonValue, { exact: true })
        .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
        .first()
        .click();
      await commonItemsPage.page.waitForLoadState('domcontentloaded');
      const newModificationIndex = index + 1;
      const storeModificationId = irasIdRunTime + '/' + newModificationIndex;
      await selectAreaOfChangePage.setModificationId(storeModificationId);
    }
  }
);

Then(
  'I validate the specific change dropdown options are displayed based on the selected area of change dropdown with {string}',
  async ({ selectAreaOfChangePage, $testInfo }, datasetName: string) => {
    const expectedSpecificChangeDropdownValues =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Specific_Change_Options[datasetName];
    const actualSpecificChangeDropdownValues =
      await selectAreaOfChangePage.specific_change_dropdown_all_options.evaluateAll((values) =>
        values.map((value) => value.textContent)
      );
    await $testInfo.attach('Evidence:', {
      body:
        'Actual value from UI = ' +
        actualSpecificChangeDropdownValues +
        ' and Expected value = ' +
        expectedSpecificChangeDropdownValues,
    });
    expect(actualSpecificChangeDropdownValues).toEqual(expectedSpecificChangeDropdownValues);
  }
);
