import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

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
