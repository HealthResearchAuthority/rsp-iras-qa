import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { When } = createBdd(test);

When('I update user profile with {string}', async ({ commonItemsPage, editUserProfilePage }, datasetName: string) => {
  const dataset = editUserProfilePage.editUserProfilePageTestData[datasetName];
  for (const key in dataset) {
    if (Object.prototype.hasOwnProperty.call(dataset, key)) {
      await commonItemsPage.fillUIComponent(dataset, key, editUserProfilePage);
    }
  }
});

When(
  'I can see the newly created user record should be present in the list for {string} with {string} status in the manage user page',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string, status: string) => {
    const foundRecord = await manageUsersPage.getUniqueUserRecord(
      datasetName,
      status,
      createUserProfilePage,
      manageUsersPage
    );
    expect(foundRecord).toBeDefined();
    expect(foundRecord).toHaveCount(1);
  }
);

When(
  'I search and click on view edit link for existing {string} user with {string} status from the manage user page',
  async ({ manageUsersPage }, datasetName: string, status: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userEmail = dataset.email_address_text;
    const userStatus = await manageUsersPage.getUserStatus(status);
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size, userEmail);
    const foundRecord = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    expect(foundRecord).toBeDefined();
    expect(foundRecord).toHaveCount(1);
    await foundRecord.locator(manageUsersPage.view_edit_link).click();
  }
);
