import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';

const { Then } = createBdd(test);

Then('I can see the choose a record type to search page', async ({ chooseARecordTypeToSearchPage }) => {
  await chooseARecordTypeToSearchPage.assertOnChooseARecordTypeToSearchPage();
});
//  And I select the radio button for 'Modification record'
// Then(
//   'I select {string} from area of change dropdown and {string} from specific change dropdown',
//   async (
//     { commonItemsPage, selectAreaOfChangePage },
//     areaOfChangeDatasetName: string,
//     specificChangeDatasetName: string
//   ) => {
//     const areaOfChangeDataset =
//       selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Area_Of_Change[areaOfChangeDatasetName];
//     const specificChangeDataset =
//       selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatasetName];
//     for (const key in areaOfChangeDataset) {
//       if (Object.hasOwn(areaOfChangeDataset, key)) {
//         await commonItemsPage.fillUIComponent(areaOfChangeDataset, key, selectAreaOfChangePage);
//       }
//     }
//     for (const key in specificChangeDataset) {
//       if (Object.hasOwn(specificChangeDataset, key)) {
//         await commonItemsPage.fillUIComponent(specificChangeDataset, key, selectAreaOfChangePage);
//       }
//     }
//   }
// );

Then('I select the radio button for {string}', async ({ chooseARecordTypeToSearchPage }, radioButtonValue: string) => {
  // const locatorVal: Locator = chooseARecordTypeToSearchPage[`recordType_radio`];
  // const typeAttribute = await locatorVal
  //   .locator('[value=' + `${radioButtonValue}`)
  //   .first()
  //   .getAttribute('type');
  let recordType: string;
  if (radioButtonValue === 'Modification_Record') {
    recordType =
      chooseARecordTypeToSearchPage.chooseARecordTypeToSearchPageTestData.Label_Texts.modification_record_label;
  } else {
    recordType = chooseARecordTypeToSearchPage.chooseARecordTypeToSearchPageTestData.Label_Texts.project_record_label;
  }
  const locatorVal: Locator = chooseARecordTypeToSearchPage.page.getByRole('radio').filter({
    has: chooseARecordTypeToSearchPage.page.getByText(recordType),
  });

  await locatorVal.check();

  // const typeAttribute = await locatorVal.first().getAttribute('type');
  // if (typeAttribute === 'radio') {
  //   await locatorVal.check();
  // }
});
