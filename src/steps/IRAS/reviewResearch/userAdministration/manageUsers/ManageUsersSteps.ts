import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  //update
  await manageUsersPage.assertOnManageUsersPage();
});
Then(
  'I can see the list is sorted by default in the alphabetical order of the First Name and I can see the newly created user record should be present in the list for {string}',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await manageUsersPage.checkAlphabeticalSorting(dataset);
    // const SEARCH_RECORD = 'Alice | 25 | New York | USA'; // Modify as needed ...  First name	Last name	Email address
    // let foundRecord = false;
    // let hasNextPage = true;
    // const firstNames: string[] = [];
    // while (hasNextPage) {
    //   // Get all rows on the current page
    //   const rows = await manageUsersPage.locator('.govuk-table__row').all(); // Adjust selector
    //   for (const row of rows) {
    //     // Extract and combine all column values into a full-row string
    //     const columns = await row.locator('.govuk-table__cell').allTextContents(); // Adjust selector
    //     const fullRowData = columns.map((col) => col.trim()).join(' | '); // Extract first name (assuming it's in the first column)
    //     const firstName = columns[0]?.trim() || '';
    //     firstNames.push(firstName);
    //     // Check if the record matches the search
    //     if (fullRowData === SEARCH_RECORD) {
    //       foundRecord = true;
    //     }
    //   }
    //   // Check if pagination "Next" button is available
    //   const nextButton = page.locator('.next-button-selector'); // Adjust selector
    //   hasNextPage = (await nextButton.isVisible()) && !(await nextButton.isDisabled());
    //   if (hasNextPage) {
    //     await nextButton.click();
    //     await page.waitForLoadState('domcontentloaded');
    //   }
    // }
    // // Validate if names are sorted alphabetically
    // const sortedFirstNames = [...firstNames].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    // expect(firstNames).toEqual(sortedFirstNames); // Validate that the record was found
    // expect(foundRecord).toBeTruthy();
  }
);

// test('Validate alphabetical order of records by first name and check for a specific record', async ({ page }) => {
//   await page.goto('https://your-list-page-url.com'); // Replace with actual URL
//   const SEARCH_RECORD = 'Alice | 25 | New York | USA'; // Modify as needed ...  First name	Last name	Email address
//   let foundRecord = false;
//   let hasNextPage = true;
//   const firstNames: string[] = [];
//   while (hasNextPage) {
//     // Get all rows on the current page
//     const rows = await page.locator('.govuk-table__row').all(); // Adjust selector
//     for (const row of rows) {
//       // Extract and combine all column values into a full-row string
//       const columns = await row.locator('.govuk-table__cell').allTextContents(); // Adjust selector
//       const fullRowData = columns.map((col) => col.trim()).join(' | '); // Extract first name (assuming it's in the first column)
//       const firstName = columns[0]?.trim() || '';
//       firstNames.push(firstName);
//       // Check if the record matches the search
//       if (fullRowData === SEARCH_RECORD) {
//         foundRecord = true;
//       }
//     }
//     // Check if pagination "Next" button is available
//     const nextButton = page.locator('.next-button-selector'); // Adjust selector
//     hasNextPage = (await nextButton.isVisible()) && !(await nextButton.isDisabled());
//     if (hasNextPage) {
//       await nextButton.click();
//       await page.waitForLoadState('domcontentloaded');
//     }
//   }
//   // Validate if names are sorted alphabetically
//   const sortedFirstNames = [...firstNames].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
//   expect(firstNames).toEqual(sortedFirstNames); // Validate that the record was found
//   expect(foundRecord).toBeTruthy();
// });
