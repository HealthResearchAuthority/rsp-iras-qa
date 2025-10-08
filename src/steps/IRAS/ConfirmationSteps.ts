import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../utils/UtilFunctions';

const { Given, When, Then } = createBdd(test);

When('I am on the confirmation screen', async ({ confirmationPage }) => {
  await confirmationPage.assertOnConfirmationPage();
});

Then(
  'I validate {string} labels displayed in disable user profile confirmation page using the {string} details',
  async ({ confirmationPage, createUserProfilePage }, validationLabelsDatasetName, userDetailsdatasetName: string) => {
    const userDetailsdataset =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[userDetailsdatasetName];
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedConfirmationHeader =
      validationLabelsDataset.disable_confirmation_header_label +
      ' ' +
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedConfirmationHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      validationLabelsDataset.disable_confirmation_body_label
    );
  }
);

Then(
  'I validate {string} labels displayed in disable user profile success page using the {string} details',
  async ({ confirmationPage, createUserProfilePage }, validationLabelsDatasetName, userDetailsdatasetName: string) => {
    const userDetailsdataset =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[userDetailsdatasetName];
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedSuccessHeader =
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text +
      ' ' +
      validationLabelsDataset.disable_confirmation_success_header_label;
    const expectedSuccessBody =
      validationLabelsDataset.disable_confirmation_success_body_one_label +
      ' ' +
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text +
      ' ' +
      validationLabelsDataset.disable_confirmation_success_body_two_label;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      expectedSuccessBody
    );
  }
);

Then(
  'I validate {string} labels displayed in enable user profile confirmation page using the {string} details',
  async ({ confirmationPage, createUserProfilePage }, validationLabelsDatasetName, userDetailsdatasetName: string) => {
    const userDetailsdataset =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[userDetailsdatasetName];
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedConfirmationHeader =
      validationLabelsDataset.enable_confirmation_header_label +
      ' ' +
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedConfirmationHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      validationLabelsDataset.enable_confirmation_body_label
    );
  }
);

Then(
  'I validate {string} labels displayed in enable user profile success page using the {string} details',
  async ({ confirmationPage, createUserProfilePage }, validationLabelsDatasetName, userDetailsdatasetName: string) => {
    const userDetailsdataset =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[userDetailsdatasetName];
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedSuccessHeader =
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text +
      ' ' +
      validationLabelsDataset.enable_confirmation_success_header_label;
    const expectedSuccessBody =
      validationLabelsDataset.enable_confirmation_success_body_one_label +
      ' ' +
      userDetailsdataset.first_name_text +
      ' ' +
      userDetailsdataset.last_name_text +
      ' ' +
      validationLabelsDataset.enable_confirmation_success_body_two_label;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      expectedSuccessBody
    );
  }
);

Then(
  'I validate {string} labels displayed in disable review body confirmation page using the organisation name',
  async ({ confirmationPage, createReviewBodyPage }, validationLabelsDatasetName: string) => {
    const organisationNameMemory = await createReviewBodyPage.getUniqueOrgName();
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedConfirmationHeader =
      validationLabelsDataset.disable_confirmation_header_label + ' ' + organisationNameMemory;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedConfirmationHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      validationLabelsDataset.disable_confirmation_body_label
    );
  }
);

Then(
  'I validate {string} labels displayed in disable review body success page using the organisation name',
  async ({ confirmationPage, createReviewBodyPage }, validationLabelsDatasetName) => {
    const organisationNameMemory = await createReviewBodyPage.getUniqueOrgName();
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedSuccessHeader = validationLabelsDataset.disable_confirmation_success_header_label;
    const expectedSuccessBody =
      validationLabelsDataset.disable_confirmation_success_body_one_label +
      ' ' +
      organisationNameMemory +
      ' ' +
      validationLabelsDataset.disable_confirmation_success_body_two_label;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect
      .soft(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim())
      .toBe(expectedSuccessBody);
  }
);

Then(
  'I validate {string} labels displayed in enable review body confirmation page using the organisation name',
  async ({ confirmationPage, createReviewBodyPage }, validationLabelsDatasetName: string) => {
    const organisationNameMemory = await createReviewBodyPage.getUniqueOrgName();
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedConfirmationHeader =
      validationLabelsDataset.enable_confirmation_header_label + ' ' + organisationNameMemory;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedConfirmationHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      validationLabelsDataset.enable_confirmation_body_label
    );
  }
);

Then(
  'I validate {string} labels displayed in enable review body success page using the organisation name',
  async ({ confirmationPage, createReviewBodyPage }, validationLabelsDatasetName) => {
    const organisationNameMemory = await createReviewBodyPage.getUniqueOrgName();
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedSuccessHeader = validationLabelsDataset.enable_confirmation_success_header_label;
    const expectedSuccessBody =
      validationLabelsDataset.enable_confirmation_success_body_one_label +
      ' ' +
      organisationNameMemory +
      ' ' +
      validationLabelsDataset.enable_confirmation_success_body_two_label;
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect
      .soft(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim())
      .toBe(expectedSuccessBody);
  }
);

Then(
  'I validate {string} labels displayed in the success confirmation page when the user removed from the review body',
  async ({ confirmationPage, checkRemoveUserReviewBodyPage, reviewBodyProfilePage }, validationLabelsDatasetName) => {
    const firstName = await checkRemoveUserReviewBodyPage.getFirstName();
    const lastName = await checkRemoveUserReviewBodyPage.getLastName();
    const organisationName = await reviewBodyProfilePage.getOrgName();
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    const expectedSuccessHeader = validationLabelsDataset.remove_user_confirmation_success_header_label;
    const expectedSuccessBody =
      firstName +
      ' ' +
      lastName +
      validationLabelsDataset.remove_user_confirmation_success_body_two_label +
      organisationName +
      '.';
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      expectedSuccessBody
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_header_label.textContent()).trim()).toBe(
      expectedSuccessHeader
    );
    expect(confirmStringNotNull(await confirmationPage.confirmation_body_label.textContent()).trim()).toBe(
      expectedSuccessBody
    );
  }
);

Given(
  'the add user to review body confirmation page displays the expected guidance text',
  async ({ confirmationPage, searchAddUserReviewBodyPage, reviewBodyProfilePage }) => {
    const firstName = await searchAddUserReviewBodyPage.getUserFirstName();
    const lastName = await searchAddUserReviewBodyPage.getUserLastName();
    const reviewBodyName = await reviewBodyProfilePage.getOrgName();
    const guidanceText = confirmationPage.confirmationPageTestData.Add_User_Review_Body_Labels.page_guidance_text;
    await expect(confirmationPage.confirmation_header_label).toHaveText(
      confirmationPage.confirmationPageTestData.Add_User_Review_Body_Labels.page_heading
    );
    await expect(confirmationPage.confirmation_body_label).toHaveText(
      `${firstName} ${lastName}${guidanceText}${reviewBodyName}.`
    );
  }
);

Then(
  'I validate {string} labels displayed in confirmation page for poject created using the {string} details',
  async (
    { confirmationPage, projectDetailsTitlePage, projectDetailsIRASPage },
    validationLabelsDatasetName,
    projectDetailsTitlePageDatasetName: string
  ) => {
    const projectDetailsTitlePageDataset =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[projectDetailsTitlePageDatasetName];
    const validationLabelsDataset = confirmationPage.confirmationPageTestData[validationLabelsDatasetName];
    await expect(confirmationPage.success_message_header_label).toBeVisible();
    const expectedSuccessMessage =
      validationLabelsDataset.page_heading_prefix +
      ' ' +
      projectDetailsTitlePageDataset.short_project_title_text +
      ', ' +
      validationLabelsDataset.page_heading_body_prefix +
      ' ' +
      (await projectDetailsIRASPage.getUniqueIrasId()).toString();
    const actualSuccessMessage = confirmStringNotNull(await confirmationPage.success_message_body_text.textContent());
    await expect(confirmationPage.success_message_body_text.getByText(expectedSuccessMessage)).toBeVisible();
    expect(actualSuccessMessage).toBe(expectedSuccessMessage);
  }
);

Then(
  'I validate all field {string} value on delete modification confirmation screeen',
  async (
    { modificationsCommonPage, projectDetailsIRASPage, projectDetailsTitlePage, confirmationPage },
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
    const expectedHeadingText =
      confirmationPage.confirmationPageTestData.Delete_Modification_Confirmation_Labels
        .delete_modification_page_heading + modificationIDExpected;
    const actualHeadingText = confirmStringNotNull(
      await confirmationPage.delete_modification_page_heading.textContent()
    );
    expect(irasIDActual).toBe(irasIDExpected);
    expect(shortProjectTitleActual).toBe(shortProjectTitleExpected);
    expect(modificationIDActual).toBe(modificationIDExpected);
    expect(expectedHeadingText).toBe(actualHeadingText);
  }
);
