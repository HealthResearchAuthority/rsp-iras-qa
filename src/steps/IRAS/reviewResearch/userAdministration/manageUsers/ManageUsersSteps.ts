import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import dateTimeRelatedData from '../../../../../resources/test_data/common/date_time_related_data.json';
const { When, Then } = createBdd(test);

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

When(
  'I search and click on view edit link for unique {string} user with {string} status from the manage user page',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string, status: string) => {
    const foundRecord = await manageUsersPage.getUniqueUserRecord(
      datasetName,
      status,
      createUserProfilePage,
      manageUsersPage
    );
    expect(foundRecord).toBeDefined();
    expect(foundRecord).toHaveCount(1);
    await foundRecord.locator(manageUsersPage.view_edit_link).click();
  }
);

Then(
  'I can see the {string} ui labels on the manage users list page',
  async ({ commonItemsPage, manageUsersPage }, datasetName: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData.Manage_Users_Page[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, manageUsersPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I select a {string} User to View and Edit which is {string}',
  async ({ manageUsersPage }, userNamePrefix: string, status: string) => {
    const userStatus = await manageUsersPage.getUserStatus(status);
    await manageUsersPage.goto(
      manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size,
      userNamePrefix
    );
    const foundRecords = await manageUsersPage.findUserByStatus(userNamePrefix, userStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await foundRecords.locator(manageUsersPage.view_edit_link).click();
  }
);

When(
  'I search and click on view edit link for the removed user from the review body in the manage user page',
  async ({ manageUsersPage, checkRemoveUserReviewBodyPage, userListReviewBodyPage }) => {
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size);
    const userFirstName = await checkRemoveUserReviewBodyPage.getFirstName();
    const userLastName = await checkRemoveUserReviewBodyPage.getLastName();
    const userEmail = await checkRemoveUserReviewBodyPage.getEmail();
    const userStatus = await userListReviewBodyPage.getStatus();
    const foundRecord = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    await foundRecord.locator(manageUsersPage.view_edit_link).click();
  }
);

When(
  'I validate the last logged in is displayed blank for the new user who has not yet logged in to the application',
  async ({ manageUsersPage }) => {
    expect(manageUsersPage.last_logged_in_from_list_label).toBeEmpty();
  }
);

When('I keep note of the current login date', async ({ manageUsersPage }) => {
  const today = new Date();
  const formattedDateFull = new Intl.DateTimeFormat('en-GB', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  }).format(today);
  const formattedDateTruncated = new Intl.DateTimeFormat('en-GB', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  }).format(today);
  manageUsersPage.setLastLoggedInDateFull(formattedDateFull);
  manageUsersPage.setLastLoggedInDateTruncated(formattedDateTruncated);
  manageUsersPage.setLastLoggedInHours(today.getHours());
});

When(
  'I validate the last logged in is displayed as truncated date in manage users page',
  async ({ manageUsersPage }) => {
    expect(manageUsersPage.last_logged_in_from_list_label).toContainText(
      `${manageUsersPage.getLastLoggedInDateTruncated()} ${dateTimeRelatedData.at}`
    );
    if (manageUsersPage.getLastLoggedInHours() >= 12) {
      expect(manageUsersPage.last_logged_in_from_list_label).toContainText(`${dateTimeRelatedData.afternoon}`);
    } else {
      expect(manageUsersPage.last_logged_in_from_list_label).toContainText(`${dateTimeRelatedData.morning}`);
    }
  }
);

When(
  'I update the {string} email to {string}',
  async ({ manageUsersPage, createUserProfilePage }, inputType: string, caseValue: string) => {
    const email = await manageUsersPage.getUserEmail(inputType, createUserProfilePage);
    if (caseValue === 'lower case') {
      await createUserProfilePage.setUniqueEmail(email.toLowerCase());
    } else if (caseValue === 'upper case') {
      await createUserProfilePage.setUniqueEmail(email.toUpperCase());
    } else if (caseValue === 'remove QAAutomation prefix') {
      await createUserProfilePage.setUniqueEmail(email.replace('QAAUTOMATION', ''));
    }
  }
);
