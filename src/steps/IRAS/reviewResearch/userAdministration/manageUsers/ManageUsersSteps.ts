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
  async ({ manageUsersPage, createUserProfilePage, commonItemsPage }, datasetName: string, status: string) => {
    const foundRecord = await manageUsersPage.getUniqueUserRecord(
      datasetName,
      status,
      createUserProfilePage,
      manageUsersPage,
      commonItemsPage
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
  async ({ manageUsersPage, createUserProfilePage, commonItemsPage }, datasetName: string, status: string) => {
    const foundRecord = await manageUsersPage.getUniqueUserRecord(
      datasetName,
      status,
      createUserProfilePage,
      manageUsersPage,
      commonItemsPage
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

When(
  'I enter {string} into the search field for manage users page',
  async ({ manageUsersPage }, datasetName: string) => {
    const dataset =
      manageUsersPage.manageUsersPageTestData.Search_For_Users.Search_Queries_Advanced_Filter[datasetName];
    await manageUsersPage.user_search_text.fill(dataset['search_input_text']);
  }
);

When(
  'I select advanced filters in the manage users page using {string}',
  async ({ manageUsersPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.includes('date')) {
          if (!(await manageUsersPage.date_last_logged_in_from_day_text.isVisible())) {
            await manageUsersPage.date_last_logged_in_from_day_text_chevron.click();
          }
          await commonItemsPage.fillUIComponent(dataset, key, manageUsersPage);
        } else if (key === 'review_body_checkbox') {
          await commonItemsPage.selectCheckboxReviewBody(dataset, key, manageUsersPage);
        } else {
          await manageUsersPage[key + '_chevron'].click();
          await commonItemsPage.fillUIComponent(dataset, key, manageUsersPage);
        }
      }
    }
  }
);

When(
  'I can see the results matching the search {string} and filter criteria {string} for manage users page',
  async ({ manageUsersPage, commonItemsPage }, searchDatasetName: string, filterDatasetName: string) => {
    const searchCriteriaDataset =
      manageUsersPage.manageUsersPageTestData.Search_For_Users.Search_Queries_Advanced_Filter[searchDatasetName];
    const filterDataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[filterDatasetName];
    if (searchDatasetName !== '') {
      await manageUsersPage.validateResults(
        commonItemsPage,
        searchCriteriaDataset,
        filterDataset,
        searchDatasetName,
        true
      );
    } else {
      await manageUsersPage.validateResults(
        commonItemsPage,
        searchCriteriaDataset,
        filterDataset,
        searchDatasetName,
        false
      );
    }
  }
);

Then(
  'I verify the hint text based on the {string} for manage users page',
  async ({ manageUsersPage }, filterDatasetName: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'country_checkbox') {
          const numberOfCheckboxesSelected = dataset[key].length;
          const hintLabel =
            numberOfCheckboxesSelected +
            ' ' +
            manageUsersPage.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List
              .selected_checkboxes_hint_label;
          expect(await manageUsersPage.country_selected_hint_label.textContent()).toBe(hintLabel);
        }
      }
    }
  }
);

When(
  'I expand the chevrons for {string} in manage users page',
  async ({ manageUsersPage }, filterDatasetName: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await manageUsersPage.clickFilterChevronUsers(dataset, key, manageUsersPage);
      }
    }
  }
);

Then('I can see the {string} ui labels in manage users page', async ({ manageUsersPage }, datasetName: string) => {
  const dataset = manageUsersPage.manageUsersPageTestData.Manage_Users_Page[datasetName];
  for (const key in dataset) {
    if (Object.hasOwn(dataset, key)) {
      await expect(manageUsersPage[key].getByText(dataset[key])).toBeVisible();
    }
  }
});

Then(
  'I validate {string} displayed on advanced filters in manage users page',
  async ({ manageUsersPage }, errorMessageFieldDatasetName: string) => {
    const fieldErrorMessagesExpected =
      manageUsersPage.manageUsersPageTestData.Error_Message_Field_Dataset[errorMessageFieldDatasetName];
    const fieldErrorMessagesActualValues = await manageUsersPage.date_last_logged_in_error_message.textContent();
    expect(fieldErrorMessagesActualValues).toEqual(fieldErrorMessagesExpected);
  }
);

Then(
  'I retrieve the list of review bodies displayed in the review body checkbox in the advanced filters of manage users page',
  async ({ manageUsersPage, commonItemsPage }) => {
    const actualList = await commonItemsPage.getLabelsFromCheckboxes(manageUsersPage.review_body_checkbox);
    await manageUsersPage.setReviewBodies(actualList);
  }
);

Then(
  'I can see the review body field in the review body checkbox in the advanced filters of manage users page should contain all currently enabled review bodies from the manage review bodies page',
  async ({ manageUsersPage, manageReviewBodiesPage }) => {
    const actualList = await manageUsersPage.getReviewBodies();
    const expectedList = await manageReviewBodiesPage.getOrgNamesListFromUI();
    expect(actualList).toEqual(expectedList);
  }
);

Then('I click the view edit link of the first user in the manage users page', async ({ manageUsersPage }) => {
  await manageUsersPage.view_edit_link.click();
});
