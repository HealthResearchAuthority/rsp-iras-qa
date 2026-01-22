import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

When(
  'I can see all the selected modifications on that page including details such as the short project title and the modification id',
  async ({ modificationsReadyToAssignPage, commonItemsPage }) => {
    const modificationRecordActual: string[] = [];
    const modificationRecordExpected = await modificationsReadyToAssignPage.getSelectedModificationsIdTitle();
    for (const row of await commonItemsPage.tableBodyRows.all()) {
      const modification_id = confirmStringNotNull(await row.getByRole('cell').nth(0).textContent());
      const shortProjectTitle = confirmStringNotNull(await row.getByRole('link').nth(1).textContent());
      modificationRecordActual.push(modification_id + ':' + shortProjectTitle.trim());
    }
    expect.soft(modificationRecordExpected).toEqual(modificationRecordActual);
  }
);

When(
  'I select a study wide reviewer in the select a reviewer page using {string}',
  async ({ selectStudyWideReviewerPage, commonItemsPage }, datasetName: string) => {
    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, selectStudyWideReviewerPage);
      }
    }
  }
);

Then(
  'I can see newly created study-wide reviewer {string} of {string} is {string} in the dropdown based on the lead nation of the selected modification and the review body',
  async (
    { selectStudyWideReviewerPage, createUserProfilePage },
    datasetName: string,
    leadNation: string,
    availability: string
  ) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userFullName = `${userFirstName} ${userLastName}`;
    const dropdownValues: string[] = [];
    const dropdown = selectStudyWideReviewerPage.study_wide_reviewer_dropdown;
    const options = await dropdown.locator('option').all();
    for (const option of options) {
      const text = await option.textContent();
      dropdownValues.push(text);
    }
    const normalizedValues = dropdownValues.map((v) => v.trim());
    const uniqueDropdownValues = [...new Set(normalizedValues)];

    if (availability.toLowerCase() === 'available' && leadNation.toLowerCase() === 'england') {
      expect.soft(uniqueDropdownValues).toContain(userFullName);
    } else {
      expect.soft(uniqueDropdownValues).not.toContain(userFullName);
    }
  }
);

Then(
  'I can see study-wide reviewer of {string} is {string} in the dropdown based on the lead nation of the selected modification and the review body',
  async ({ selectStudyWideReviewerPage }, swrLeadNation: string, availability: string) => {
    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[swrLeadNation];
    const userFullName = dataset.study_wide_reviewer_dropdown;
    const dropdownValues: string[] = [];
    const dropdown = selectStudyWideReviewerPage.study_wide_reviewer_dropdown;
    const options = await dropdown.locator('option').all();
    for (const option of options) {
      const text = await option.textContent();
      dropdownValues.push(text);
    }
    const normalizedValues = dropdownValues.map((v) => v.trim());
    const uniqueDropdownValues = [...new Set(normalizedValues)];

    if (availability.toLowerCase() === 'available' && swrLeadNation.toLowerCase().endsWith('england')) {
      expect.soft(uniqueDropdownValues).toContain(userFullName);
    } else {
      expect.soft(uniqueDropdownValues).not.toContain(userFullName);
    }
  }
);
