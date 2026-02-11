import { createBdd, DataTable } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';
import {
  getRegexforFieldsfromJSONconfig,
  generateTestDataTitle,
  generateTestDataEmail,
  generateTestDataForename,
  generateTestDataSurname,
  generateTestDataTelephone,
  writeGeneratedTestDataToJSON,
} from '../../utils/GenerateTestData';
import * as userProfileGeneratedataConfig from '../../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
import {
  confirmArrayNotNull,
  confirmStringNotNull,
  getAuthState,
  getTimeFormatted,
  getRandomNumber,
} from '../../utils/UtilFunctions';
import { Locator } from 'playwright/test';
import * as fs from 'node:fs';
import path from 'node:path';
import config from '../../../playwright.config';

const { Given, When, Then } = createBdd(test);

Then('I capture the page screenshot', async () => {});

When(
  'I can see the {string}',
  async (
    {
      commonItemsPage,
      loginPage,
      homePage,
      createApplicationPage,
      proceedApplicationPage,
      systemAdministrationPage,
      createReviewBodyPage,
      manageReviewBodiesPage,
      userListReviewBodyPage,
      manageUsersPage,
      searchAddUserReviewBodyPage,
      myResearchProjectsPage,
      searchModificationsPage,
      modificationsReadyToAssignPage,
      myModificationsTasklistPage,
      teamManagerDashboardPage,
      manageSponsorOrganisationPage,
      setupNewSponsorOrganisationPage,
      checkAddUserSponsorOrganisationPage,
      searchAddUserSponsorOrganisationPage,
      sponsorOrganisationProfilePage,
      viewEditUserProfilePage,
      userListSponsorOrganisationPage,
      selectStudyWideReviewerPage,
      accessDeniedPage,
      profileCommonPage,
      profileSettingsPage,
      editYourProfilePage,
      completeYourProfilePage,
      checkYourProfilePage,
      chooseARecordTypeToSearchPage,
      searchProjectsPage,
      projectOverviewPage,
      modificationsReceivedCommonPage,
      myOrganisationsUserProfilePage,
      myOrganisationsEditUserProfilePage,
    },
    page: string
  ) => {
    switch (page) {
      case 'Login_Page':
        await loginPage.assertOnLoginPage();
        break;
      case 'Home_Page':
        await homePage.assertOnHomePage();
        break;
      case 'Create_Application_Page':
        await createApplicationPage.assertOnCreateApplicationPage();
        break;
      case 'Proceed_Application_Page':
        await proceedApplicationPage.assertOnProceedApplicationPage();
        break;
      case 'System_Administration_Page':
        await systemAdministrationPage.assertOnSystemAdministrationPage();
        break;
      case 'Create_Review_Body_Page':
        await createReviewBodyPage.assertOnCreateReviewbodyPage();
        break;
      case 'Manage_Review_Bodies_Page':
        await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
        break;
      case 'Manage_Users_Page':
        await manageUsersPage.assertOnManageUsersPage();
        break;
      case 'Review_Body_User_List_Page':
        await userListReviewBodyPage.assertOnUserListReviewBodyPage(commonItemsPage);
        break;
      case 'Search_Add_User_Review_Body_Page':
        await searchAddUserReviewBodyPage.assertOnSearchAddUserReviewBodyPage();
        break;
      case 'My_Research_Page':
        await myResearchProjectsPage.assertOnMyResearchProjectsPage();
        break;
      case 'Search_Modifications_Page':
        await searchModificationsPage.assertOnSearchModificationsPage();
        break;
      case 'Modifications_Tasklist_Page':
        await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'Team_Manager_Dashboard_Page':
        await teamManagerDashboardPage.assertOnTeamManagerDashboardPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'My_Modifications_Tasklist_Page':
        await myModificationsTasklistPage.assertOnMyModificationsTasklistPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'My_Modifications_Tasklist_No_Result_Page':
        await myModificationsTasklistPage.assertOnMyModificationsTaskNoResultPage();
        break;
      case 'Select_Study_Wide_Reviewer_Page':
        await selectStudyWideReviewerPage.assertOnSelectStudyWideReviewerPage();
        break;
      case 'Manage_Sponsor_Organisations_Page':
        await manageSponsorOrganisationPage.assertOnManageSponsorOrganisationsPage();
        break;
      case 'Setup_New_Sponsor_Organisation_Page':
        await setupNewSponsorOrganisationPage.assertOnSetupNewSponsorOrganisationsPage();
        break;
      case 'Check_Add_User_Sponsor_Org_Page':
        await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
        break;
      case 'Search_Add_User_Sponsor_Org_Page':
        await searchAddUserSponsorOrganisationPage.assertOnSearchAddUserSponsorOrganisationPage();
        break;
      case 'Sponsor_Organisation_Profile_Page':
        await sponsorOrganisationProfilePage.assertOnSponsorOrganisationProfilePage();
        break;
      case 'View_Edit_User_Profile_Page':
        await viewEditUserProfilePage.assertOnViewEditUserProfilePage();
        break;
      case 'Sponsor_Org_User_List_Page':
        await userListSponsorOrganisationPage.assertOnUserListSponsorOrgPage(commonItemsPage);
        break;
      case 'Access_Denied_Page':
        await accessDeniedPage.assertOnAccessDeniedPage();
        break;
      case 'Profile_Settings_Page':
        await profileSettingsPage.assertOnProfileSettingsPage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Edit_Your_Profile_Page':
        await editYourProfilePage.assertOnEditProfilePage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Complete_Your_Profile_Page':
        await completeYourProfilePage.assertOnCompleteProfilePage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Check_Your_Profile_Page':
        await checkYourProfilePage.assertOnCheckProfilePage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Choose_A_Record_Type_To_Search_Page':
        await chooseARecordTypeToSearchPage.assertOnChooseARecordTypeToSearchPage();
        break;
      case 'Search_Projects_Page':
        await searchProjectsPage.assertOnSearchProjectsPage();
        break;
      case 'Project_Overview_Page':
        await projectOverviewPage.assertOnProjectOverviewPage();
        break;
      case 'Modification_Details_Page':
        await modificationsReceivedCommonPage.assertOnModificationDetailsPage();
        break;
      case 'My_Organisations_User_Profile_Page':
        await myOrganisationsUserProfilePage.assertOnMySponsorOrgUserProfilePage();
        break;
      case 'My_Organisations_Edit_User_Profile_Page':
        await myOrganisationsEditUserProfilePage.assertOnMySponsorOrgEditUserProfilePage();
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

When(
  'I can see the {string} question set',
  async (
    {
      commonItemsPage,
      projectFilterPage,
      projectDetailsPage,
      studentPage,
      devicesPage,
      tissuePage,
      adultsLackingCapacityPage,
      childrenPage,
      bookingPage,
    },
    questionSet: string
  ) => {
    switch (questionSet) {
      case 'Project_Filter':
        await projectFilterPage.assertOnProjectFilterPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Project_Details':
        await projectDetailsPage.assertOnProjectDetailsPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Student':
        await studentPage.assertOnStudentPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Devices':
        await devicesPage.assertOnDevicesPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Tissue':
        await tissuePage.assertOnTissuePage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Adults_Lacking_Capacity':
        await adultsLackingCapacityPage.assertOnAdultsLackingCapacityPage(
          commonItemsPage.qSetProgressBarActiveStageLink
        );
        break;
      case 'Children':
        await childrenPage.assertOnChildrenPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      case 'Booking':
        await bookingPage.assertOnBookingPage(commonItemsPage.qSetProgressBarActiveStageLink);
        break;
      default:
        throw new Error(`${questionSet} is not a valid option`);
    }
  }
);

When('I do something {string}', async ({ commonItemsPage }, testType: string) => {
  commonItemsPage.samplePageAction(testType);
});

Then('I see something {string}', async ({ commonItemsPage }, testType: string) => {
  commonItemsPage.samplePageAction(testType);
});

Then(
  'I click the {string} button on the {string}',
  async ({ commonItemsPage, modificationsReceivedCommonPage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    let button: Locator;
    if (
      (pageKey === 'Review_All_Changes_Page' && buttonKey === 'Send_Modification_To_Sponsor') ||
      (pageKey === 'Confirmation_Page' && buttonKey === 'Return_To_Project_Overview') ||
      (pageKey === 'Setup_New_Sponsor_Organisation_Page' && buttonKey === 'Save_Continue')
    ) {
      button = commonItemsPage.govUkButton
        .getByText(buttonValue)
        .or(commonItemsPage.genericButton.getByText(buttonValue))
        .first();
    } else {
      if (pageKey === 'Project_Overview_Page' && buttonKey === 'Create_New_Modification') {
        ++modificationsReceivedCommonPage.modificationCounter;
      }
      button = commonItemsPage.govUkButton
        .getByText(buttonValue, { exact: true })
        .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
        .first();
    }
    await commonItemsPage.page.waitForTimeout(500);
    await button.click();
    await commonItemsPage.page.waitForLoadState('domcontentloaded');
  }
);

Then('I can see a {string} button on the {string}', async ({ commonItemsPage }, buttonKey: string, pageKey: string) => {
  const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
  await expect(
    commonItemsPage.govUkButton
      .getByText(buttonValue, { exact: true })
      .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
      .first()
  ).toBeVisible();
});

Given(
  'I cannot see a {string} button on the {string}',
  async ({ commonItemsPage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    await expect
      .soft(
        commonItemsPage.govUkButton
          .getByText(buttonValue, { exact: true })
          .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
          .first()
      )
      .toHaveCount(0);
  }
);

Given('I click the {string} link on the {string}', async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
  const linkValue = await commonItemsPage.linkTextData[pageKey][linkKey];
  const noOfLinksFound = await commonItemsPage.govUkLink.getByText(linkValue).count();
  if (pageKey === 'Progress_Bar') {
    await commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true }).click();
    return;
  }
  if (pageKey === 'My_Research_Page' && linkKey === 'My_Account') {
    await commonItemsPage.myAccountGovUkBreadCrumbsLink.click();
    return;
  }
  if (linkKey.includes('_Filter_Panel')) {
    await commonItemsPage.active_filter_list.locator(commonItemsPage.govUkLink.getByText(linkValue)).click();
    return;
  }
  if (
    (pageKey === 'Search_Add_User_Review_Body_Page' || pageKey === 'Review_Body_User_List_Page') &&
    linkKey === 'Back_To_Users'
  ) {
    await commonItemsPage.govUkLink.getByText(linkValue).click();
    return;
  }
  if (noOfLinksFound > 1 && linkKey !== 'Back' && linkKey !== 'View' && linkKey !== 'History') {
    await commonItemsPage.govUkLink.getByText(linkValue).first().click();
    return;
  }
  if (pageKey === 'Review_Body_User_List_Page' && linkValue === 'Remove') {
    await commonItemsPage.removeLink.click();
    return;
  }
  if (
    (pageKey === 'Manage_Users_Page' && linkValue === 'View/Edit') ||
    (pageKey === 'My_Organisations_Sponsor_Org_Profile_Page' && linkValue === 'Users') ||
    (pageKey === 'Modification_Outcome_Check_Send_Page' && linkValue === 'Change')
  ) {
    await commonItemsPage.govUkLink.getByText(linkValue).click();
    return;
  }
  await commonItemsPage.govUkLink.getByText(linkValue, { exact: true }).click();
});

Given('I can see a {string} link on the {string}', async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
  const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
  if (pageKey === 'Progress_Bar') {
    await expect(commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true })).toBeVisible();
  } else {
    await expect(commonItemsPage.govUkLink.getByText(linkValue, { exact: true })).toBeVisible();
  }
});

Given('I cannot see a {string} link on the {string}', async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
  const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
  await expect(commonItemsPage.govUkLink.getByText(linkValue, { exact: true })).toHaveCount(0);
});

Then(
  'I generate {string} test data for {string}',
  async ({ commonItemsPage }, typeofdata: string, fieldName: string) => {
    let testdata_output: any;
    let testdata_output_faker: any;
    const [forename_valid, surname_valid, telephone_valid, title_valid, email_valid, pattern_invalid] =
      getRegexforFieldsfromJSONconfig(typeofdata, fieldName);
    switch (fieldName) {
      case 'Title': {
        [testdata_output, testdata_output_faker] = generateTestDataTitle(
          title_valid,
          fieldName,
          typeofdata,
          pattern_invalid
        );
        break;
      }
      case 'Forename': {
        [testdata_output, testdata_output_faker] = generateTestDataForename(
          forename_valid,
          fieldName,
          typeofdata,
          pattern_invalid
        );
        break;
      }
      case 'Surname': {
        [testdata_output, testdata_output_faker] = generateTestDataSurname(
          surname_valid,
          fieldName,
          typeofdata,
          pattern_invalid
        );
        break;
      }
      case 'Email': {
        [testdata_output, testdata_output_faker] = generateTestDataEmail(
          email_valid,
          fieldName,
          typeofdata,
          pattern_invalid
        );
        break;
      }
      case 'Telephone': {
        [testdata_output, testdata_output_faker] = generateTestDataTelephone(
          telephone_valid,
          fieldName,
          typeofdata,
          pattern_invalid
        );
        break;
      }
      default: {
        throw new Error(`${fieldName} is not a valid option`);
      }
    }
    await writeGeneratedTestDataToJSON(
      { commonItemsPage },
      fieldName,
      typeofdata,
      testdata_output,
      testdata_output_faker
    );
  }
);

Then('I attach the generated test data json files to the report', async ({ $testInfo }) => {
  const jsonPath = userProfileGeneratedataConfig.JSON_Properties['json_path'];
  const jsonPath_faker = userProfileGeneratedataConfig.JSON_Properties['json_path_faker'];
  $testInfo.attach('User Attributes test data generated using Faker library', {
    path: jsonPath_faker,
    contentType: 'text/plain',
  });
  $testInfo.attach('User Attributes test data generated using regular expression', {
    path: jsonPath,
    contentType: 'text/plain',
  });
});

Then(
  'I see the expected validation errors appearing on the {string} page based on those inputs',
  async ({ commonItemsPage }, pageName: string, data: DataTable) => {
    const combinedInputsUsed = new Map<string, any>();
    const expectedAlertBoxErrors: string[] = [];
    const expectedFieldErrors: string[] = [];

    const { pageObject, dataName } = await commonItemsPage.getQsetPageObjectDataName(pageName);
    for (const row of data.hashes()) {
      const sectionInputsUsed = await commonItemsPage.getQsetPageValidationData(pageName, row.Section, row.Dataset);
      for (const [key, value] of sectionInputsUsed) {
        combinedInputsUsed.set(key, value);
      }
    }

    for (const key in pageObject[dataName].All_Mandatory_Validations) {
      if (!combinedInputsUsed.has(key) || !combinedInputsUsed.get(key)) {
        expectedAlertBoxErrors.push(pageObject[dataName].All_Mandatory_Validations[key]);
        expectedFieldErrors.push(key);
      }
    }
    // Any Expected Conditional Field Validation must be included in input dataset with an empty value
    for (const key in pageObject[dataName].All_Conditional_Validations) {
      if (combinedInputsUsed.has(key) && !combinedInputsUsed.get(key)) {
        expectedAlertBoxErrors.push(pageObject[dataName].All_Conditional_Validations[key]);
        expectedFieldErrors.push(key);
      }
    }

    await expect(commonItemsPage.alert_box).toBeVisible();
    await expect(commonItemsPage.alert_box_headings).toHaveText(
      commonItemsPage.questionSetData.Validation.alert_box_heading
    );

    const actualAlertBoxErrors = commonItemsPage.alert_box_list_items;
    const actualFieldErrorsArray = await commonItemsPage.govUkFieldValidationError.all();
    await expect(actualAlertBoxErrors).toHaveText(expectedAlertBoxErrors, { useInnerText: true });
    expect(actualFieldErrorsArray).toHaveLength(expectedFieldErrors.length);
    for (const key of expectedFieldErrors) {
      const expectedFieldErrorMessage = await commonItemsPage.getFieldTypeErrorMessage(key, pageObject);
      const actualFieldError = await commonItemsPage.getFieldErrorMessages(key, pageObject);
      expect(actualFieldError).toEqual(expectedFieldErrorMessage);
    }
  }
);

Then('I navigate {string}', async ({ commonItemsPage }, navigation: string) => {
  switch (navigation) {
    case 'forward':
      await commonItemsPage.goForward();
      break;
    case 'back':
      await commonItemsPage.goBack();
      break;
    default:
      throw new Error(`${navigation} is not a valid option`);
  }
});

Then(
  'I can see the default sort should be the most recent entry first based on date and time',
  async ({ commonItemsPage }) => {
    const auditLog = await commonItemsPage.getAuditLog();
    const timeValues: any = auditLog.get('timeValues');
    const timeDates = timeValues.map((time: any) => new Date(time));
    const isSortedDesc = timeDates.every((time: number, i: number, arr: number[]) => {
      if (i === 0) {
        return true;
      } else {
        return arr[i - 1] >= time;
      }
    });
    expect(isSortedDesc).toBe(true);
  }
);

Then(
  'I capture the current time for {string}',
  async (
    {
      auditHistoryReviewBodyPage,
      auditHistoryUserPage,
      sponsorOrganisationProfilePage,
      projectIdentifiersPage,
      reviewYourAnswersPage,
    },
    page: string
  ) => {
    const currentTime = await getTimeFormatted();
    switch (page) {
      case 'Audit_History_Review_Body_Page':
        await auditHistoryReviewBodyPage.setUpdatedTime(currentTime);
        break;
      case 'Audit_History_User_Page':
        await auditHistoryUserPage.setUpdatedTime(currentTime);
        break;
      case 'Sponsor_Organisation_Profile_Page':
        await sponsorOrganisationProfilePage.setUpdatedTime(currentTime);
        break;
      case 'Project_Identifier_Page':
        await projectIdentifiersPage.setCurrentDate();
        break;
      case 'Review_Answers_Page':
        await reviewYourAnswersPage.setCurrentDate();
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

Then(
  'I validate {string} displayed on {string}',
  async (
    {
      commonItemsPage,
      createUserProfilePage,
      editUserProfilePage,
      projectDetailsIRASPage,
      projectDetailsTitlePage,
      chiefInvestigatorPage,
      createReviewBodyPage,
      editReviewBodyPage,
      reviewYourAnswersPage,
      selectAreaOfChangePage,
      participatingOrganisationsPage,
      affectedOrganisationSelectionPage,
      addDocumentsModificationsPage,
      modificationsReadyToAssignPage,
      myModificationsTasklistPage,
      sponsorReferencePage,
      projectIdentifiersPage,
      setupNewSponsorOrganisationPage,
      completeYourProfilePage,
      editYourProfilePage,
      addDocumentDetailsForSpecificDocumentModificationsPage,
      projectIdentificationEnterReferenceNumbersPage,
      contactDetailsModificationPage,
      projectPersonnelChangeChiefInvestigatorPage,
      sponsorCheckAndAuthorisePage,
      chooseARecordTypeToSearchPage,
      teamManagerDashboardPage,
      plannedEndDateChangePage,
      projectPersonnelChangePrincipalInvestigatorPage,
      closeProjectPage,
      checkAuthoriseProjectClosurePage,
    },
    errorMessageFieldAndSummaryDatasetName: string,
    pageKey: string
  ) => {
    let errorMessageFieldDataset: any;
    let page: any;
    if (pageKey === 'Create_User_Profile_Page') {
      errorMessageFieldDataset =
        createUserProfilePage.createUserProfilePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = createUserProfilePage;
    } else if (pageKey === 'Edit_User_Profile_Page') {
      errorMessageFieldDataset =
        editUserProfilePage.editUserProfilePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = editUserProfilePage;
    } else if (pageKey == 'Project_Details_IRAS_Page') {
      errorMessageFieldDataset =
        projectDetailsIRASPage.projectDetailsIRASPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = projectDetailsIRASPage;
    } else if (pageKey == 'Project_Details_Title_Page') {
      errorMessageFieldDataset =
        projectDetailsTitlePage.projectDetailsTitlePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = projectDetailsTitlePage;
    } else if (pageKey == 'Chief_Investigator_Page') {
      errorMessageFieldDataset =
        chiefInvestigatorPage.chiefInvestigatorPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = chiefInvestigatorPage;
    } else if (pageKey == 'Project_Identifiers_Page') {
      errorMessageFieldDataset =
        projectIdentifiersPage.projectIdentifiersPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = projectIdentifiersPage;
    } else if (pageKey == 'Create_Review_Body_Page') {
      errorMessageFieldDataset =
        createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = createReviewBodyPage;
    } else if (pageKey == 'Edit_Review_Body_Page') {
      errorMessageFieldDataset =
        editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body.Validation[errorMessageFieldAndSummaryDatasetName];
      page = createReviewBodyPage;
    } else if (pageKey == 'Review_Your_Answers_Page') {
      errorMessageFieldDataset =
        reviewYourAnswersPage.reviewYourAnswersPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = reviewYourAnswersPage;
    } else if (pageKey == 'Select_Area_Of_Change_Page') {
      errorMessageFieldDataset =
        selectAreaOfChangePage.selectAreaOfChangePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = selectAreaOfChangePage;
    } else if (pageKey == 'Participating_Organisations_Page') {
      errorMessageFieldDataset =
        participatingOrganisationsPage.participatingOrganisationsPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = participatingOrganisationsPage;
    } else if (pageKey == 'Affected_Organisation_Selection_Page') {
      errorMessageFieldDataset =
        affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = affectedOrganisationSelectionPage;
    } else if (pageKey == 'Add_Document_Modifications_Page') {
      errorMessageFieldDataset =
        addDocumentsModificationsPage.addDocumentsModificationsPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = addDocumentsModificationsPage;
    } else if (pageKey == 'Modifications_Tasklist_Page') {
      errorMessageFieldDataset =
        modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = modificationsReadyToAssignPage;
    } else if (pageKey == 'My_Modifications_Tasklist_Page') {
      errorMessageFieldDataset =
        myModificationsTasklistPage.myModificationsTasklistPageTestData.Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = myModificationsTasklistPage;
    } else if (pageKey == 'Sponsor_Reference_Page') {
      errorMessageFieldDataset =
        sponsorReferencePage.sponsorReferencePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = sponsorReferencePage;
    } else if (pageKey === 'Setup_New_Sponsor_Organisation_Page') {
      errorMessageFieldDataset =
        setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = commonItemsPage;
    } else if (pageKey == 'Complete_Your_Profile_Page') {
      errorMessageFieldDataset =
        completeYourProfilePage.completeYourProfilePageTestData.Validation[errorMessageFieldAndSummaryDatasetName];
      page = completeYourProfilePage;
    } else if (pageKey == 'Edit_Your_Profile_Page') {
      errorMessageFieldDataset =
        editYourProfilePage.editYourProfilePageTestData.Validation[errorMessageFieldAndSummaryDatasetName];
      page = completeYourProfilePage;
    } else if (pageKey == 'Add_Document_Details_For_Specific_Document_Modifications_Page') {
      errorMessageFieldDataset =
        addDocumentDetailsForSpecificDocumentModificationsPage
          .addDocumentDetailsForSpecificDocumentModificationsPageTestData.Error_Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = addDocumentDetailsForSpecificDocumentModificationsPage;
    } else if (pageKey == 'Project_Identification_Enter_Reference_Numbers_Page') {
      errorMessageFieldDataset =
        projectIdentificationEnterReferenceNumbersPage.projectIdentificationEnterReferenceNumbersPageTestData[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = projectIdentificationEnterReferenceNumbersPage;
    } else if (pageKey == 'Contact_Details_Modification_Page') {
      errorMessageFieldDataset =
        contactDetailsModificationPage.contactDetailsModificationPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = contactDetailsModificationPage;
    } else if (pageKey == 'Project_Personnel_Change_Chief_Investigator_Page') {
      errorMessageFieldDataset =
        projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = projectPersonnelChangeChiefInvestigatorPage;
    } else if (pageKey == 'Sponsor_Check_And_Authorise_Page') {
      errorMessageFieldDataset =
        sponsorCheckAndAuthorisePage.sponsorCheckAndAuthorisePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = sponsorCheckAndAuthorisePage;
    } else if (pageKey == 'Choose_A_Record_Type_To_Search_Page') {
      errorMessageFieldDataset =
        chooseARecordTypeToSearchPage.chooseARecordTypeToSearchPageTestData.Error_Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = chooseARecordTypeToSearchPage;
    } else if (pageKey == 'Team_Manager_Dashboard_Page') {
      errorMessageFieldDataset =
        teamManagerDashboardPage.teamManagerDashboardPageTestData.Validation[errorMessageFieldAndSummaryDatasetName];
      page = teamManagerDashboardPage;
    } else if (pageKey == 'Planned_End_Date_Change_Page') {
      errorMessageFieldDataset =
        plannedEndDateChangePage.plannedEndDateChangePageTestData[errorMessageFieldAndSummaryDatasetName];
      page = plannedEndDateChangePage;
    } else if (pageKey == 'Project_Personnel_Change_Principal_Investigator_Page') {
      errorMessageFieldDataset =
        projectPersonnelChangePrincipalInvestigatorPage
          .projectPersonnelChangePrincipalInvestigatorModificationPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = projectPersonnelChangePrincipalInvestigatorPage;
    } else if (pageKey == 'Close_Project_Page') {
      errorMessageFieldDataset = closeProjectPage.closeProjectPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = closeProjectPage;
    } else if (pageKey == 'Check_Authorise_Project_Closure_Page') {
      errorMessageFieldDataset =
        checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = checkAuthoriseProjectClosurePage;
    }
    let allSummaryErrorExpectedValues: any;
    let summaryErrorActualValues: any;
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    if (
      errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Telephone_Error' ||
      errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Email_Address_Error' ||
      errorMessageFieldAndSummaryDatasetName === 'Both_Filters_Not_Selected_Same_Time_Summary_Only_Error'
    ) {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset).toString();
      summaryErrorActualValues = (await commonItemsPage.getSummaryErrorMessages()).toString();
    } else {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
      summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    }
    expect.soft(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    if (!errorMessageFieldAndSummaryDatasetName.includes('Summary_Only')) {
      for (const key in errorMessageFieldDataset) {
        if (Object.hasOwn(errorMessageFieldDataset, key)) {
          const expectedMessage = errorMessageFieldDataset[key];
          let fieldErrorMessagesActualValues: any;
          if (pageKey == 'Review_Your_Answers_Page') {
            expect(await page[key].getByRole('link').evaluate((e: any) => getComputedStyle(e).color)).toBe(
              commonItemsPage.commonTestData.rgb_red_color
            );
            fieldErrorMessagesActualValues = await reviewYourAnswersPage.getFieldErrorMessages(key, page);
            expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
            const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
            await expect(element).toBeInViewport();
          } else if (
            errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Telephone_Error' ||
            errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Email_Address_Error'
          ) {
            fieldErrorMessagesActualValues = (
              await commonItemsPage.getMultipleFieldErrorMessages(key, page)
            ).toString();
            const allFieldErrorExpectedValues = Object.values(errorMessageFieldDataset).toString();
            expect.soft(fieldErrorMessagesActualValues).toEqual(allFieldErrorExpectedValues);
            const fieldValActuals = summaryErrorActualValues.split(',');
            for (const val of fieldValActuals) {
              const element = await commonItemsPage.clickErrorSummaryLinkMultipleErrorField(val, key, page);
              await expect(element).toBeInViewport();
            }
          } else if (errorMessageFieldAndSummaryDatasetName === 'Sponsor_Organisation_Min_Char_Error') {
            let actualMessage = confirmStringNotNull(
              await commonItemsPage.sponsor_organisation_jsdisabled_min_error_message.textContent()
            );
            if (actualMessage.includes('Error: ')) {
              actualMessage = actualMessage.replace('Error: ', '');
            }
            expect.soft(actualMessage).toEqual(expectedMessage);
            const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
            await expect(element).toBeInViewport();
          } else if (
            errorMessageFieldAndSummaryDatasetName === 'JavaScript_Disabled_Duplicate_Sponsor_Organisation_Setup_Error'
          ) {
            fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessageSponsor(key, page);
            expect.soft(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
          } else {
            fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, page);
            if (fieldErrorMessagesActualValues.includes('Error: ')) {
              fieldErrorMessagesActualValues = fieldErrorMessagesActualValues.replace('Error: ', '');
            }
            expect.soft(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
            const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
            await element.scrollIntoViewIfNeeded();
            await expect.soft(element).toBeInViewport();
          }
        }
      }
    }
    if (errorMessageFieldAndSummaryDatasetName == 'Max_Description_Words_Error') {
      await expect(createReviewBodyPage.description_reason_error).toHaveText(
        createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.Validation.Max_Description_Reason
      );
    }
  }
);

When(
  'I enter {string} into the search field',
  async (
    {
      commonItemsPage,
      reviewBodyProfilePage,
      createReviewBodyPage,
      createUserProfilePage,
      editReviewBodyPage,
      checkSetupSponsorOrganisationPage,
      checkAddUserSponsorOrganisationPage,
      manageSponsorOrganisationPage,
      loginPage,
      modificationsCommonPage,
      projectDetailsIRASPage,
    },
    inputType: string
  ) => {
    let searchValue: string;
    switch (inputType) {
      case 'name of the previously used review body':
        searchValue = await reviewBodyProfilePage.getOrgName();
        break;
      case 'name of the new review body':
        searchValue = await createReviewBodyPage.getUniqueOrgName();
        break;
      case 'timestamp of the edited review body':
        searchValue = await editReviewBodyPage.getUniqueOrgTimestamp();
        break;
      case 'name of the newly added sponsor organisation':
        searchValue = await checkSetupSponsorOrganisationPage.getOrgName();
        break;
      case 'name of the previously added sponsor organisation':
        searchValue = await manageSponsorOrganisationPage.findExistingSponsorOrganisations();
        await manageSponsorOrganisationPage.saveExistingSponsorOrganisation(searchValue);
        break;
      case 'name of the newly created user':
        searchValue = await createUserProfilePage.getUniqueEmail();
        break;
      case 'an active review body name':
        await reviewBodyProfilePage.sqlGetSingleRandomReviewBodyByStatus('Active');
        searchValue = await reviewBodyProfilePage.getOrgName();
        break;
      case 'a disabled review body name':
        await reviewBodyProfilePage.sqlGetSingleRandomReviewBodyByStatus('Disabled');
        searchValue = await reviewBodyProfilePage.getOrgName();
        break;
      case 'email of the newly added user in the selected sponsor organisation':
        searchValue = await checkAddUserSponsorOrganisationPage.getUserEmail();
        break;
      case 'automation sponsor email':
        searchValue = loginPage.loginPageTestData.Sponsor_User.username;
        break;
      case 'system admin email':
        searchValue = loginPage.loginPageTestData.System_Admin.username;
        break;
      case 'sponsor org admin email':
        searchValue = loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
        break;
      case 'Studywide_Reviewer_NI':
        searchValue = loginPage.loginPageTestData.Studywide_Reviewer_NI.username;
        break;
      case 'modification id':
        searchValue = await modificationsCommonPage.getModificationID();
        break;
      case 'new iras id':
      case 'iras id':
        searchValue = await projectDetailsIRASPage.getUniqueIrasId();
        break;
      case 'existing iras id':
        searchValue = projectDetailsIRASPage.projectDetailsIRASPageTestData.Existing_IRAS_ID.iras_id_text;
        projectDetailsIRASPage.setShortProjectTitle(
          projectDetailsIRASPage.projectDetailsIRASPageTestData.Existing_IRAS_ID.short_project_title_text
        );
        break;
      case 'iras id for multiple modification':
        searchValue =
          projectDetailsIRASPage.projectDetailsIRASPageTestData.Existing_IRAS_ID_Multiple_Modification.iras_id_text;
        projectDetailsIRASPage.setShortProjectTitle(
          projectDetailsIRASPage.projectDetailsIRASPageTestData.Existing_IRAS_ID_Multiple_Modification
            .short_project_title_text
        );
        break;
      case 'short project title':
        searchValue = await projectDetailsIRASPage.getShortProjectTitle();
        break;
      default:
        searchValue = inputType;
    }
    await commonItemsPage.setSearchKey(searchValue);
    await commonItemsPage.search_text.fill(searchValue);
  }
);

When(
  'I am on the {string} page and it should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }, position: string) => {
    let pageLocator: Locator;
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
      if (position.toLowerCase() === 'first') {
        pageLocator = commonItemsPage.firstPage;
      } else {
        const totalPages = await commonItemsPage.getTotalPages();
        commonItemsPage.setNumberofTotalPages(totalPages);
        pageLocator = await commonItemsPage.clickOnPages(totalPages, 'page number');
      }
      await expect(pageLocator).toHaveAttribute('aria-current', 'page');
    }
  }
);

When('the default page size should be {string}', async ({ commonItemsPage }, pageSize: string) => {
  const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
    await commonItemsPage.search_results_count.textContent()
  );
  if (recordsCount > 20) {
    const rowCountActual = await commonItemsPage.tableRows.count();
    let rowCountExpected: number;
    if (pageSize == 'ten') {
      rowCountExpected = Number.parseInt(
        commonItemsPage.commonTestData.default_page_size_participating_organisation,
        10
      );
    } else {
      rowCountExpected = Number.parseInt(commonItemsPage.commonTestData.default_page_size, 10);
    }
    expect.soft(rowCountActual - 1).toBe(rowCountExpected);
  }
});

Then(
  'the {string} button will be {string} to the user',
  async ({ commonItemsPage }, linkLabel: string, availabilityVal: string) => {
    if (linkLabel === 'Next' || linkLabel === 'Previous') {
      const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
        await commonItemsPage.search_results_count.textContent()
      );
      if (recordsCount > 20) {
        const locatorVal: Locator = await commonItemsPage.getLocatorforNextPreviousLinks(linkLabel);
        if (availabilityVal.toLowerCase() === 'available') {
          await expect.soft(locatorVal).toBeVisible();
          await expect.soft(locatorVal).toBeEnabled();
        } else if (availabilityVal.toLowerCase() === 'not available') {
          await expect.soft(locatorVal).toBeHidden();
        } else {
          throw new Error(`Unsupported button state: ${availabilityVal}`);
        }
      }
    } else if (linkLabel === 'Confirm_Selection') {
      const buttonValue = commonItemsPage.buttonTextData['Sponsor_Check_And_Authorise_Page']['Confirm_Selection'];
      const locatorVal: Locator = commonItemsPage.govUkButton
        .getByText(buttonValue, { exact: true })
        .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
        .first();
      if (availabilityVal.toLowerCase() === 'available') {
        await expect.soft(locatorVal).toBeVisible();
        await expect.soft(locatorVal).toBeEnabled();
      } else if (availabilityVal.toLowerCase() === 'not available') {
        await expect.soft(locatorVal).toBeHidden();
      } else {
        throw new Error(`Unsupported button state: ${availabilityVal}`);
      }
    }
  }
);

When(
  'the current page number should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
      await commonItemsPage.next_button.click();
      const currentUrl = commonItemsPage.page.url();
      const currentPageNumber = await commonItemsPage.getPageNumber(currentUrl);
      const currentPageLabel = `Page ${currentPageNumber}`;
      const currentPageLink = commonItemsPage.pagination
        .getByRole('link', { name: currentPageLabel, exact: true })
        .first();
      await expect.soft(currentPageLink).toHaveAttribute('aria-current');
      const currentPageLinkHref = await currentPageLink.getAttribute('href');
      expect.soft(currentUrl).toContain(currentPageLinkHref);
      await commonItemsPage.previous_button.click();
    }
  }
);

When(
  'I enter the {string} of the {string} item in the list, into the search field',
  async ({ userListReviewBodyPage, commonItemsPage, manageReviewBodiesPage }, fieldKey: string, position: string) => {
    if ((await commonItemsPage.tableRows.count()) >= 2) {
      let searchKey: string = '';
      if (fieldKey === 'First_Name' || fieldKey === 'Last_Name' || fieldKey === 'Email_Address') {
        searchKey = await userListReviewBodyPage.getSearchQueryFNameLNameEmailByPosition(
          position,
          fieldKey,
          commonItemsPage
        );
      } else if (fieldKey === 'Full_Name') {
        await userListReviewBodyPage.setSearchQueryFullNameByPosition(position, fieldKey, commonItemsPage);
        searchKey = await userListReviewBodyPage.getSearchQueryFullName(position, commonItemsPage);
      } else if (fieldKey === 'Organisation_Name') {
        const orgList = await manageReviewBodiesPage.getReviewBodyListByPosition(position, commonItemsPage);
        await manageReviewBodiesPage.setOrgName(orgList.get('orgNameValues'));
        searchKey = await manageReviewBodiesPage.getSearchQueryOrgName(position);
      }
      await commonItemsPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

Given(
  'I have navigated to the {string}',
  async (
    {
      commonItemsPage,
      loginPage,
      homePage,
      createApplicationPage,
      systemAdministrationPage,
      manageUsersPage,
      createUserProfilePage,
      manageReviewBodiesPage,
      userProfilePage,
      reviewBodyProfilePage,
      myResearchProjectsPage,
      searchModificationsPage,
      modificationsReadyToAssignPage,
      approvalsPage,
      myModificationsTasklistPage,
      manageSponsorOrganisationPage,
      profileCommonPage,
      profileSettingsPage,
      editYourProfilePage,
      teamManagerDashboardPage,
      searchProjectsPage,
      sponsorWorkspacePage,
    },
    page: string
  ) => {
    switch (page) {
      case 'Login_Page':
        await homePage.goto();
        await homePage.startNowBtn.click();
        await loginPage.assertOnLoginPage();
        break;
      case 'Home_Page':
        await homePage.goto();
        await homePage.assertOnHomePage();
        break;
      case 'Create_Application_Page':
        await createApplicationPage.goto();
        await createApplicationPage.assertOnCreateApplicationPage();
        break;
      case 'System_Administration_Page':
        await systemAdministrationPage.goto();
        await systemAdministrationPage.assertOnSystemAdministrationPage();
        break;
      case 'Manage_Users_Page':
        await manageUsersPage.goto();
        await manageUsersPage.assertOnManageUsersPage();
        break;
      case 'Create_User_Profile_Page':
        await createUserProfilePage.goto();
        await createUserProfilePage.assertOnCreateUserProfilePage();
        break;
      case 'Manage_Review_Bodies_Page':
        await manageReviewBodiesPage.goto();
        await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
        break;
      case 'User_Profile_Page':
        await userProfilePage.goto(await userProfilePage.getUserId());
        await userProfilePage.assertOnUserProfilePage();
        break;
      case 'Review_Body_Profile_Page':
        await reviewBodyProfilePage.goto(await reviewBodyProfilePage.getReviewBodyId());
        await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
        break;
      case 'My_Research_Page':
        await myResearchProjectsPage.goto();
        await myResearchProjectsPage.assertOnMyResearchProjectsPage();
        break;
      case 'Search_Modifications_Page':
        await searchModificationsPage.goto();
        await searchModificationsPage.assertOnSearchModificationsPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'Modifications_Tasklist_Page':
        await modificationsReadyToAssignPage.goto();
        await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'Team_Manager_Dashboard_Page':
        await teamManagerDashboardPage.goto();
        await teamManagerDashboardPage.assertOnTeamManagerDashboardPage();
        await commonItemsPage.setNoOfResultsBeforeSearch(
          await commonItemsPage.extractNumFromSearchResultCount(
            await commonItemsPage.search_results_count.textContent()
          )
        );
        break;
      case 'Approvals_Page':
        await approvalsPage.goto();
        await approvalsPage.assertOnApprovalsPage();
        break;
      case 'My_Modifications_Tasklist_Page':
        await myModificationsTasklistPage.goto();
        await myModificationsTasklistPage.assertOnMyModificationsTasklistPage();
        break;
      case 'Search_Projects_Page':
        await searchProjectsPage.goto();
        await searchProjectsPage.assertOnSearchProjectsPage();
        break;
      case 'Manage_Sponsor_Organisations_Page':
        await manageSponsorOrganisationPage.goto();
        await manageSponsorOrganisationPage.assertOnManageSponsorOrganisationsPage();
        break;
      case 'Profile_Settings_Page':
        await profileSettingsPage.goto();
        await profileSettingsPage.assertOnProfileSettingsPage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Edit_Your_Profile_Page':
        await editYourProfilePage.goto();
        await editYourProfilePage.assertOnEditProfilePage();
        await profileCommonPage.assertCommonProfilePageItems();
        break;
      case 'Sponsor_Workspace_Page':
        await sponsorWorkspacePage.goto();
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

Given(
  'I have navigated to the {string} as {string}',
  async (
    {
      homePage,
      loginPage,
      systemAdministrationPage,
      accessDeniedPage,
      myResearchProjectsPage,
      approvalsPage,
      myModificationsTasklistPage,
      modificationsReadyToAssignPage,
      searchModificationsPage,
      teamManagerDashboardPage,
      manageUsersPage,
      myOrgSponsorOrgProfilePage,
    },
    page: string,
    user: string
  ) => {
    if (user == 'One_Login_Account_User') {
      await homePage.page.context().clearCookies();
      await homePage.goto();
      await homePage.startNowBtn.click();
      await loginPage.assertOnLoginPage();
    } else {
      const authStatePath = getAuthState(user);
      const authState = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
      switch (page) {
        case 'Home_Page':
          await homePage.page.context().addCookies(authState.cookies);
          await homePage.goto();
          await homePage.assertOnHomePage();
          break;
        case 'System_Administration_Page':
          await systemAdministrationPage.page.context().addCookies(authState.cookies);
          await systemAdministrationPage.goto();
          await systemAdministrationPage.assertOnSystemAdministrationPage();
          break;
        case 'System_Administration_Access_Denied_Page':
          await systemAdministrationPage.page.context().addCookies(authState.cookies);
          await systemAdministrationPage.goto();
          await accessDeniedPage.assertOnAccessDeniedPage();
          break;
        case 'Approvals_Access_Denied_Page':
          await approvalsPage.page.context().addCookies(authState.cookies);
          await approvalsPage.goto();
          await accessDeniedPage.assertOnAccessDeniedPage();
          break;
        case 'My_Research_Page':
          await myResearchProjectsPage.page.context().addCookies(authState.cookies);
          await myResearchProjectsPage.goto();
          await myResearchProjectsPage.assertOnMyResearchProjectsPage();
          break;
        case 'My_Research_Access_Denied_Page':
          await myResearchProjectsPage.page.context().addCookies(authState.cookies);
          await myResearchProjectsPage.goto();
          await accessDeniedPage.assertOnAccessDeniedPage();
          break;
        case 'My_Modifications_Tasklist_Page':
          await myModificationsTasklistPage.page.context().addCookies(authState.cookies);
          await myModificationsTasklistPage.goto();
          await myModificationsTasklistPage.assertOnMyModificationsTasklistPage();
          break;
        case 'Modifications_Tasklist_Page':
          await modificationsReadyToAssignPage.page.context().addCookies(authState.cookies);
          await modificationsReadyToAssignPage.goto();
          await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
          break;
        case 'Search_Modifications_Page':
          await searchModificationsPage.page.context().addCookies(authState.cookies);
          await searchModificationsPage.goto();
          await searchModificationsPage.assertOnSearchModificationsPage();
          break;
        case 'Approvals_Page':
          await approvalsPage.page.context().addCookies(authState.cookies);
          await approvalsPage.goto();
          await approvalsPage.assertOnApprovalsPage();
          break;
        case 'Team_Manager_Dashboard_Page':
          await teamManagerDashboardPage.page.context().addCookies(authState.cookies);
          await teamManagerDashboardPage.goto();
          await teamManagerDashboardPage.assertOnTeamManagerDashboardPage();
          break;
        case 'Manage_Users_Page':
          await manageUsersPage.page.context().addCookies(authState.cookies);
          await manageUsersPage.goto();
          await manageUsersPage.assertOnManageUsersPage();
          break;
        case 'My_Organisations_Sponsor_Org_Profile_Page':
          await myOrgSponsorOrgProfilePage.page.context().addCookies(authState.cookies);
          await myOrgSponsorOrgProfilePage.goto(await myOrgSponsorOrgProfilePage.getRtsId());
          await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(
            await myOrgSponsorOrgProfilePage.getOrgName()
          );
          break;
        default:
          throw new Error(`${page} is not a valid option`);
      }
    }
  }
);

Given('I logged out from the system', async ({ commonItemsPage }) => {
  await commonItemsPage.page.context().clearCookies();
});

Then(
  'I can see the list is sorted by default in the alphabetical order of the {string}',
  async ({ manageUsersPage, manageReviewBodiesPage, reviewUploadedDocumentsModificationsPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'first name':
        actualList = await manageUsersPage.getFirstNamesListFromUI();
        break;
      case 'organisation name':
        actualList = await manageReviewBodiesPage.getOrgNamesListFromUI();
        break;
      case 'uploaded documents':
      case 'document type':
        actualList = await reviewUploadedDocumentsModificationsPage.getUploadedDocumentsListFromUI();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect.soft(actualList).toEqual(sortedList);
  }
);

Then(
  'I sequentially navigate through each {string} by clicking on {string} from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges',
  async ({ commonItemsPage }, pagename: string, navigateMethod: string) => {
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
      const totalPages = await commonItemsPage.getTotalPages();
      //Limiting the max pages to validate to 10
      let maxPagesToValidate = 0;
      if (totalPages > commonItemsPage.commonTestData.maxPagesToValidate) {
        maxPagesToValidate = commonItemsPage.commonTestData.maxPagesToValidate;
      } else {
        maxPagesToValidate = totalPages;
      }
      let totalItems: number;
      if (
        pagename === 'My_Research_Projects_Page' ||
        pagename === 'Post_Approval_Page' ||
        pagename === 'Sponsor_Org_User_List_Page' ||
        pagename === 'Review_All_Changes_Page' ||
        pagename === 'Manage_Sponsor_Organisations_Page' ||
        pagename === 'Project_Documents_Page'
      ) {
        totalItems = await commonItemsPage.getTotalItemsNavigatingToLastPage(pagename);
      } else {
        totalItems = await commonItemsPage.getTotalItems();
      }
      await commonItemsPage.firstPage.click();
      for (let currentPage = 1; currentPage <= maxPagesToValidate; currentPage++) {
        await commonItemsPage.validatePagination(currentPage, totalPages, totalItems, pagename, navigateMethod);
      }
    }
  }
);

Then(
  'I sequentially navigate through each {string} by clicking on {string} from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges',
  async ({ commonItemsPage }, pagename: string, navigateMethod: string) => {
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
      const totalPages = await commonItemsPage.getTotalPages();
      //Limiting the max pages to validate to 10
      let validatePageUntil = 0;
      if (totalPages > commonItemsPage.commonTestData.maxPagesToValidate) {
        validatePageUntil = totalPages - commonItemsPage.commonTestData.maxPagesToValidate;
      } else {
        validatePageUntil = totalPages;
      }
      let totalItems: number;
      if (
        pagename == 'My_Research_Projects_Page' ||
        pagename === 'Post_Approval_Page' ||
        pagename === 'Sponsor_Org_User_List_Page' ||
        pagename === 'Review_All_Changes_Page' ||
        pagename === 'Manage_Sponsor_Organisations_Page' ||
        pagename === 'Project_Documents_Page'
      ) {
        totalItems = await commonItemsPage.getTotalItemsNavigatingToLastPage(pagename);
      } else {
        totalItems = await commonItemsPage.getTotalItems();
      }
      await commonItemsPage.clickOnPages(totalPages, navigateMethod);
      for (let currentPage = totalPages; currentPage >= validatePageUntil; currentPage--) {
        await commonItemsPage.validatePagination(currentPage, totalPages, totalItems, pagename, navigateMethod);
      }
    }
  }
);

Then(
  '{string} active filters {string} in the {string}',
  async (
    {
      searchModificationsPage,
      manageReviewBodiesPage,
      manageUsersPage,
      commonItemsPage,
      myResearchProjectsPage,
      projectOverviewPage,
      searchProjectsPage,
    },
    actionToPerform: string,
    filterDatasetName: string,
    pageKey: string
  ) => {
    const isDisplayAction = actionToPerform === 'I can see the selected filters are displayed under';
    const isRemoveAction = actionToPerform === 'I remove the selected filters from';
    const replaceValue = '_label';
    const pageMap = {
      Search_Modifications_Page: {
        dataset: searchModificationsPage.searchModificationsPageTestData.Advanced_Filters,
        labels: searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page,
      },
      Search_Projects_Page: {
        dataset: searchProjectsPage.searchProjectsPageTestData.Advanced_Filters,
        labels: searchProjectsPage.searchProjectsPageTestData.Search_Projects_Page,
      },
      Manage_Review_Bodies_Page: {
        dataset: manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters,
        labels: manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page,
      },
      Manage_Users_Page: {
        dataset: manageUsersPage.manageUsersPageTestData.Advanced_Filters,
        labels: manageUsersPage.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List,
      },
      My_Research_Page: {
        dataset: myResearchProjectsPage.myResearchProjectsPageTestData.Advanced_Filters,
        labels: myResearchProjectsPage.myResearchProjectsPageTestData.My_Research_Projects_Page,
      },
      Post_Approval_Page: {
        dataset: projectOverviewPage.projectOverviewPageTestData.Advanced_Filters,
        labels: projectOverviewPage.projectOverviewPageTestData.Post_Approval_Page_Label_Texts,
      },
    };
    const { dataset, labels } = pageMap[pageKey];
    const filterLabels = labels;
    const filterDataset = dataset[filterDatasetName];

    const validateFilter = async (key: string, labelFetcher: (key: string) => Promise<string | string[]>) => {
      const labels = await labelFetcher(key);
      const labelArray = Array.isArray(labels) ? labels : [labels];
      for (const label of labelArray) {
        if (isDisplayAction) {
          await expect.soft(commonItemsPage.active_filter_items.getByText(label)).toBeVisible();
        } else if (isRemoveAction) {
          const removed = await commonItemsPage.removeSelectedFilterValues(label);
          expect.soft(removed).toBe(label);
          await expect.soft(commonItemsPage.active_filter_items.getByText(label)).not.toBeVisible();
        }
      }
    };
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key.endsWith('_checkbox')) {
          await validateFilter(
            key,
            async (k) => await commonItemsPage.getCheckboxFilterLabels(k, filterDataset, filterLabels, replaceValue)
          );
        } else if (
          key.startsWith('date_submitted') ||
          key.startsWith('date_last_logged_in') ||
          key.startsWith('date_project_created')
        ) {
          if (await commonItemsPage.shouldValidateDateFilter(key, filterDataset)) {
            await validateFilter(
              key,
              async (k) => await commonItemsPage.getDateFilterLabel(k, filterDataset, filterLabels, replaceValue)
            );
          }
        } else {
          await validateFilter(
            key,
            async (k) =>
              await commonItemsPage.getTextboxRadioButtonFilterLabel(k, filterDataset, filterLabels, replaceValue)
          );
        }
      }
    }
  }
);

Then(
  'I validate {string} displayed on {string} in advanced filters',
  async (
    { commonItemsPage, searchModificationsPage, myResearchProjectsPage, projectOverviewPage, searchProjectsPage },
    errorMessageFieldAndSummaryDatasetName: string,
    pageKey: string
  ) => {
    let errorMessageFieldDataset: JSON;
    let page: any;
    if (pageKey === 'Search_Modifications_Page') {
      errorMessageFieldDataset =
        searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.Error_Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = searchModificationsPage;
    } else if (pageKey === 'Search_Projects_Page') {
      errorMessageFieldDataset =
        searchProjectsPage.searchProjectsPageTestData.Search_Projects_Page.Error_Validation[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = searchModificationsPage;
    } else if (pageKey == 'My_Research_Page') {
      errorMessageFieldDataset =
        myResearchProjectsPage.myResearchProjectsPageTestData.Error_Validation[errorMessageFieldAndSummaryDatasetName];
      page = myResearchProjectsPage;
    } else if (pageKey === 'Post_Approval_Page') {
      errorMessageFieldDataset =
        projectOverviewPage.projectOverviewPageTestData.Error_Validation[errorMessageFieldAndSummaryDatasetName];
      page = projectOverviewPage;
    }
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
    const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    for (const key in errorMessageFieldDataset) {
      if (Object.hasOwn(errorMessageFieldDataset, key)) {
        const expectedMessage = errorMessageFieldDataset[key];
        if (
          errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_Range_To_Before_From_Error' ||
          errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_To_Error'
        ) {
          const actualMessage = await searchModificationsPage.date_submitted_to_date_error.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_From_Error') {
          const actualMessage = await searchModificationsPage.date_submitted_from_date_error.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (errorMessageFieldAndSummaryDatasetName === 'Sponsor_Organisation_Min_Char_Error') {
          const actualMessage = await commonItemsPage.sponsor_organisation_jsdisabled_min_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (
          errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_Created_Range_To_Before_From_Error' ||
          errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_Created_To_Error'
        ) {
          const actualMessage = await myResearchProjectsPage.date_project_created_to_date_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (errorMessageFieldAndSummaryDatasetName === 'Invalid_Date_Created_From_Error') {
          const actualMessage =
            await myResearchProjectsPage.date_project_created_from_date_error_messaage.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (
          errorMessageFieldAndSummaryDatasetName === 'Post_Approval_Invalid_Date_Range_To_Before_From_Error' ||
          errorMessageFieldAndSummaryDatasetName === 'Post_Approval_Invalid_Date_To_Error'
        ) {
          const actualMessage = await projectOverviewPage.date_submitted_to_date_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (errorMessageFieldAndSummaryDatasetName === 'Post_Approval_Invalid_Date_From_Error') {
          const actualMessage = await projectOverviewPage.date_submitted_from_date_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else {
          throw new Error(`Unhandled error message dataset name: ${errorMessageFieldAndSummaryDatasetName}`);
        }
        if (key.includes('sponsor_organisation')) {
          const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, commonItemsPage);
          await expect(element).toBeInViewport();
        } else {
          const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
          await expect(element).toBeInViewport();
        }
      }
    }
  }
);

Then(
  'I upload {string} documents',
  async ({ commonItemsPage, reviewUploadedDocumentsModificationsPage, $tags }, uploadDocumentsDatasetName) => {
    const documentPath = commonItemsPage.documentUploadTestData[uploadDocumentsDatasetName];
    await commonItemsPage.upload_files_input.setInputFiles(documentPath);
    if ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) {
      if (typeof documentPath === 'string') {
        const fileName = path.basename(documentPath);
        await expect(commonItemsPage.page.getByText(fileName).first()).toBeVisible();
      } else {
        await expect(
          commonItemsPage.page.getByText(
            `${documentPath.length}` + commonItemsPage.commonTestData.uploaded_documents_counter_label
          )
        ).toBeVisible();
      }
    }
    const filePaths = await reviewUploadedDocumentsModificationsPage.getUploadedFileName();
    if (filePaths.length == 0) {
      await reviewUploadedDocumentsModificationsPage.setUploadedFileName(documentPath);
    }
  }
);

Then('the no search results found message is displayed', async ({ commonItemsPage, myOrganisationsPage }) => {
  await expect.soft(commonItemsPage.tableRows).not.toBeVisible();
  if (!myOrganisationsPage) {
    await expect
      .soft(commonItemsPage.search_results_count)
      .toHaveText(commonItemsPage.searchFilterResultsData.search_no_results_count);
  }
  await expect.soft(commonItemsPage.search_no_results_container).toBeVisible();
  await expect.soft(commonItemsPage.search_no_results_header).toBeVisible();
  await expect.soft(commonItemsPage.search_no_results_guidance_text).toBeVisible();
  await expect.soft(commonItemsPage.search_no_results_guidance_points).toBeVisible();
  const actualBulletPoints = commonItemsPage.search_no_results_guidance_points.getByRole('listitem');
  await expect
    .soft(actualBulletPoints)
    .toHaveText(commonItemsPage.searchFilterResultsData.search_no_results_guidance_points);
});

Then('I {string} see the advanced filters panel', async ({ commonItemsPage }, visibility: string) => {
  if (visibility.toLowerCase() == 'cannot') {
    await expect.soft(commonItemsPage.advanced_filter_panel).not.toBeVisible();
  } else {
    await expect.soft(commonItemsPage.advanced_filter_panel).toBeVisible();
  }
});

Then('I {string} see active filters displayed', async ({ commonItemsPage }, visibility: string) => {
  if (visibility.toLowerCase() == 'cannot') {
    await expect(commonItemsPage.active_filters_label).not.toBeVisible();
    await expect(commonItemsPage.active_filter_list).not.toBeVisible();
    await expect(commonItemsPage.clear_all_filters_link).not.toBeVisible();
  } else {
    await expect(commonItemsPage.active_filters_label).toBeVisible();
    await expect(commonItemsPage.active_filter_list).toBeVisible();
    await expect(commonItemsPage.clear_all_filters_link).toBeVisible();
  }
});

Then(
  'I can see active filters displayed for {string}',
  async ({ commonItemsPage, modificationsReceivedCommonPage }, searchInput: string) => {
    let assertionMade = false;
    if (searchInput.toLowerCase().includes('title')) {
      assertionMade = true;
      const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_short_project_title_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${await commonItemsPage.getShortProjectTitleFilter()}`;
      await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
    }
    if (searchInput.toLowerCase().includes('date')) {
      if (searchInput.toLowerCase().includes('from')) {
        assertionMade = true;
        const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_date_submitted_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${commonItemsPage.searchFilterResultsData.from_separator} ${await commonItemsPage.getDateSubmittedFromFilter()}`;
        await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
      }
      if (searchInput.toLowerCase().includes('to')) {
        assertionMade = true;
        const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_date_submitted_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${commonItemsPage.searchFilterResultsData.to_separator} ${await commonItemsPage.getDateSubmittedToFilter()}`;
        await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
      }
      if (searchInput.toLowerCase().includes('range')) {
        assertionMade = true;
        const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_date_submitted_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${await commonItemsPage.getDateSubmittedFromFilter()} ${commonItemsPage.searchFilterResultsData.to_separator} ${await commonItemsPage.getDateSubmittedToFilter()}`;
        await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
      }
    }
    if (searchInput.toLowerCase().includes('days')) {
      if (searchInput.toLowerCase().includes('from') || searchInput.toLowerCase().includes('range')) {
        assertionMade = true;
        const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_days_since_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${commonItemsPage.searchFilterResultsData.from_separator} ${await modificationsReceivedCommonPage.getDaysSinceSubmissionFromFilter()}`;
        await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
      }
      if (searchInput.toLowerCase().includes('to') || searchInput.toLowerCase().includes('range')) {
        assertionMade = true;
        const expectedActiveFilterText = `${commonItemsPage.searchFilterResultsData.active_filter_days_since_label} ${commonItemsPage.searchFilterResultsData.label_value_separator} ${commonItemsPage.searchFilterResultsData.to_separator} ${await modificationsReceivedCommonPage.getDaysSinceSubmissionToFilter()}`;
        await expect.soft(commonItemsPage.active_filter_items.getByText(expectedActiveFilterText)).toBeVisible();
      }
    }
    if (!assertionMade) {
      throw new Error(`${searchInput} does not contain any assertion identifier`);
    }
  }
);

When(
  'the number of search results has {string} from the {string} number',
  async ({ commonItemsPage }, comparator: string, baselineInput: string) => {
    const currentNoOfResults = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    let baselineValue: number;
    if (baselineInput.toLowerCase() == 'original') {
      baselineValue = await commonItemsPage.getNoOfResultsBeforeSearch();
    } else {
      baselineValue = await commonItemsPage.getNoOfResultsAfterSearch();
    }
    if (comparator.toLowerCase() == 'decreased') {
      expect(currentNoOfResults).toBeLessThan(baselineValue);
    } else {
      expect(currentNoOfResults).toBeGreaterThan(baselineValue);
    }
    await commonItemsPage.setNoOfResultsAfterSearch(currentNoOfResults);
  }
);

When('the number of search results has returned to the original number', async ({ commonItemsPage }) => {
  const currentNoOfResults = await commonItemsPage.extractNumFromSearchResultCount(
    await commonItemsPage.search_results_count.textContent()
  );
  const originalValue = await commonItemsPage.getNoOfResultsBeforeSearch();
  expect(currentNoOfResults).toEqual(originalValue);
});

When('I can see the date from and date to filters have the expected hint text', async ({ commonItemsPage }) => {
  await expect(commonItemsPage.date_from_label).toBeVisible();
  await expect(commonItemsPage.date_from_hint_label).toBeVisible();
  await expect(commonItemsPage.date_to_label).toBeVisible();
  await expect(commonItemsPage.date_to_hint_label).toBeVisible();
});

Then(
  'Each {string} displayed on the {string} is a link',
  async ({ commonItemsPage, modificationsReceivedCommonPage }, columnName: string, page: string) => {
    const columnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(page, columnName);
    for (const row of await commonItemsPage.tableBodyRows.all()) {
      await row.getByRole('cell').nth(columnIndex).getByRole('link').highlight();
      const shortTitleTextLink = row.getByRole('cell').nth(columnIndex).getByRole('link');
      expect(shortTitleTextLink).toBeVisible();
    }
  }
);

When(
  'I click a {string} on the {string}',
  async ({ commonItemsPage, modificationsReceivedCommonPage }, fieldName: string, pageKey: string) => {
    let testNum: number;
    await commonItemsPage.tableBodyRows.waitFor({ state: 'visible' });
    const columnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(pageKey, fieldName);
    const rowCount = await commonItemsPage.tableBodyRows.all().then((locators: Locator[]) => locators.length);
    if (rowCount > 1) {
      testNum = await getRandomNumber(0, rowCount - 1);
    } else if (rowCount == 1) {
      testNum = 0;
    }
    const fieldLocator = commonItemsPage.tableBodyRows
      .nth(testNum)
      .getByRole('cell')
      .nth(columnIndex)
      .getByRole('link');
    await fieldLocator.click();
  }
);

When(
  'I click the {string} of the captured modification on the {string}',
  async (
    { commonItemsPage, modificationsReceivedCommonPage, searchModificationsPage },
    fieldName: string,
    pageKey: string
  ) => {
    const columnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(pageKey, fieldName);
    const modificationId = await searchModificationsPage.getModificationId();
    const row = commonItemsPage.tableBodyRows.filter({
      has: commonItemsPage.page.getByRole('link', { name: modificationId }),
    });
    const fieldLocator = row.getByRole('cell').nth(columnIndex).getByRole('link');
    await fieldLocator.waitFor({ state: 'visible' });
    await fieldLocator.click();
  }
);

Then(
  'I validate {string} displayed on {string} while uploading {string} documents',
  async (
    { commonItemsPage, addDocumentsModificationsPage, reviewUploadedDocumentsModificationsPage },
    errorKey: string,
    pageKey: string,
    uploadType: string
  ) => {
    const isSpecialError = ['Duplicate_File_Upload_Error', 'Invalid_Format_File_Error'].includes(errorKey);
    const page = pageKey === 'Add_Document_Modifications_Page' ? addDocumentsModificationsPage : null;
    const errorDataset = page?.addDocumentsModificationsPageTestData?.[errorKey];

    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();

    const getFileNames = async (): Promise<string[]> => {
      const names = await reviewUploadedDocumentsModificationsPage.getUploadedFileName();
      return uploadType === 'multiple invalid' ? names : [names.toString()];
    };

    const safeStringify = (val: any): string => {
      if (val === null || val === undefined) return String(val);
      if (typeof val === 'object') {
        try {
          return JSON.stringify(val);
        } catch {
          return '[Unstringifiable Object]';
        }
      }
      return String(val);
    };
    const stringifyValues = (dataset: any): string => Object.values(dataset).map(safeStringify).join(', ');

    const buildExpectedMessages = async (dataset: any, files: string[]): Promise<string[]> =>
      files.map((file) => `${path.basename(file)}${stringifyValues(dataset)}`);

    const expectedSummaryErrors = isSpecialError
      ? await buildExpectedMessages(errorDataset, await getFileNames())
      : Object.values(errorDataset);

    const actualSummaryErrors = await commonItemsPage.getSummaryErrorMessages();
    expect.soft(actualSummaryErrors).toEqual(expectedSummaryErrors);

    if (errorKey.includes('Summary_Only')) return;

    for (const [key, expectedValue] of Object.entries(errorDataset)) {
      if (!Object.hasOwn(errorDataset, key)) continue;

      if (isSpecialError) {
        const fileNames = await getFileNames();
        const expectedMessages = await buildExpectedMessages(errorDataset, fileNames);

        for (const message of expectedMessages) {
          const element = await commonItemsPage.clickErrorSummaryLinkSpecific(key, page, message);
          await expect(element).toBeInViewport();
        }

        const actualMessages =
          uploadType === 'multiple invalid'
            ? await commonItemsPage.getFieldErrorMessagesList(key, page)
            : [await commonItemsPage.getFieldErrorMessages(key, page)];

        expect(actualMessages).toEqual(expectedMessages);
      } else {
        const actualMessages = await commonItemsPage.getFieldErrorMessages(key, page);
        expect(actualMessages).toEqual(expectedValue);

        const element = await commonItemsPage.clickErrorSummaryLink(errorDataset, key, page);
        await expect(element).toBeInViewport();
      }
    }
  }
);

Then(
  'I click the view edit link of the {string}',
  async ({ manageReviewBodiesPage, manageSponsorOrganisationPage }, recordType: string) => {
    if (recordType === 'newly created review body') {
      const createdReviewBodyRow = await manageReviewBodiesPage.getReviewBodyRow();
      await createdReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
    } else if (
      recordType === 'newly added sponsor organisation' ||
      recordType === 'previously added sponsor organisation'
    ) {
      const createdSponsorOrgRow = await manageSponsorOrganisationPage.getSponsorOrgRow();
      await createdSponsorOrgRow.locator(manageSponsorOrganisationPage.actionsLink).click();
    }
  }
);

Then(
  'the system displays {string} matching the search criteria',
  async ({ commonItemsPage }, searchListType: string) => {
    if (searchListType.toLowerCase() === 'sponsor organisations' || searchListType.toLowerCase() === 'review bodies') {
      const searchKey = await commonItemsPage.getSearchKey();
      const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
      const orgList = await commonItemsPage.getAllOrgNamesFromTheTable();
      const orgListAfterSearch: string[] = confirmArrayNotNull(orgList.get('searchResultValues'));
      const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        orgListAfterSearch,
        searchTerms
      );
      expect.soft(searchResult).toBeTruthy();
      expect.soft(orgListAfterSearch).toEqual(searchResult);
    }
  }
);

When(
  'I enter the {string} of the {string} user shown on the current {string} users list, into the search field',
  async ({ userListReviewBodyPage, commonItemsPage }, fieldKey: string, position: string, orgType: string) => {
    if (orgType === 'review body' || orgType === 'sponsor organisation') {
      if ((await commonItemsPage.userListTableRows.count()) >= 2) {
        let searchKey: string = '';
        if (fieldKey === 'First_Name' || fieldKey === 'Last_Name' || fieldKey === 'Email_Address') {
          searchKey = await userListReviewBodyPage.getSearchQueryFNameLNameEmail(position, fieldKey, commonItemsPage);
        } else if (fieldKey === 'Full_Name') {
          searchKey = await userListReviewBodyPage.getSearchQueryFullName(position, commonItemsPage);
        }
        const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
        const userValues: any = userListBeforeSearch.get('searchResultValues');
        await commonItemsPage.setUserListBeforeSearch(userValues);
        await commonItemsPage.setSearchKey(searchKey);
        commonItemsPage.search_text.fill(searchKey);
      } else {
        throw new Error(`There are no items in list to search`);
      }
    }
  }
);

Then(
  'I can see the user list page of the {string}',
  async (
    {
      userListReviewBodyPage,
      reviewBodyProfilePage,
      sponsorOrganisationProfilePage,
      userListSponsorOrganisationPage,
      commonItemsPage,
    },
    orgType: string
  ) => {
    let userList: Map<string, string[]>;
    if (orgType === 'review body') {
      await userListReviewBodyPage.assertOnUserListReviewBodyPage(commonItemsPage);
      const organisationName = await reviewBodyProfilePage.getOrgName();
      await expect(userListReviewBodyPage.page_heading).toHaveText(
        userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
      );
      userList = await commonItemsPage.getUsers();
    } else if (orgType === 'sponsor organisation') {
      await userListSponsorOrganisationPage.assertOnUserListSponsorOrgPage(commonItemsPage);
      const organisationName = await sponsorOrganisationProfilePage.getOrgName();
      await expect(userListSponsorOrganisationPage.page_heading).toHaveText(
        userListSponsorOrganisationPage.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .heading_prefix_label + organisationName
      );
      userList = await commonItemsPage.getSponsorUsers();
    }
    if ((await commonItemsPage.userListTableRows.count()) >= 2) {
      await commonItemsPage.setUserFirstNameLastNameEmail(userList);
    }
  }
);

Then(
  'I can see no users in the {string} with a message to add users to the {string}',
  async ({ commonItemsPage }, orgTypeValOne: string, orgTypeValTwo: string) => {
    if (
      (orgTypeValOne && orgTypeValTwo) === 'review body' ||
      (orgTypeValOne && orgTypeValTwo) === 'sponsor organisation'
    ) {
      expect(await commonItemsPage.userListTableRows.count()).toBe(0);
    }
  }
);

Then(
  'I can see the user list of the selected {string} is sorted by default in the alphabetical order of the {string}',
  async ({ commonItemsPage }, orgType: string, sortField: string) => {
    let firstNameValues: any;
    if (orgType === 'review body' || orgType === 'sponsor organisation') {
      if (sortField.toLowerCase() === 'first name') {
        firstNameValues = await commonItemsPage.getUserFirstName();
      } else {
        throw new Error(`${sortField} is not a valid option`);
      }
      const sortedList = [...firstNameValues].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
      expect.soft(firstNameValues).toEqual(sortedList);
    }
  }
);

Then(
  'I can see the {string} ui labels on the {string} profile page',
  async (
    { commonItemsPage, reviewBodyProfilePage, sponsorOrganisationProfilePage, viewEditUserProfilePage },
    datasetName: string,
    orgType: string
  ) => {
    const orgTypeMap: Record<string, { page: any; data: any }> = {
      'manage review body': {
        page: reviewBodyProfilePage,
        data: reviewBodyProfilePage.reviewBodyProfilePageData,
      },
      'sponsor organisation': {
        page: sponsorOrganisationProfilePage,
        data: sponsorOrganisationProfilePage.sponsorOrgProfilePageTestData,
      },
      'user in sponsor organisation': {
        page: viewEditUserProfilePage,
        data: viewEditUserProfilePage.viewEditUserProfilePageTestData,
      },
    };
    const orgConfig = orgTypeMap[orgType];
    if (orgConfig) {
      const dataset = orgConfig.data[datasetName];
      const page = orgConfig.page;
      for (const key of Object.keys(dataset)) {
        const labelVal = await commonItemsPage.getUiLabel(key, page);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'the add users to {string} search has returned results with the {string}',
  async ({ searchAddUserReviewBodyPage }, orgType: string, searchQueryName: string) => {
    if (orgType === 'review body' || orgType === 'sponsor organisation') {
      const searchQueryValue =
        searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries[
          searchQueryName
        ]['search_input_text'];
      const allResultRow = await searchAddUserReviewBodyPage.search_result_table_row.all();
      switch (searchQueryName) {
        case 'Existing_QA_User_First_Name':
          for (const element of allResultRow) {
            const firstNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_first_name);
            await expect(firstNameTableCell).toContainText(searchQueryValue);
          }
          break;
        case 'Existing_QA_User_Last_Name':
          for (const element of allResultRow) {
            const lastNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_last_name);
            await expect(lastNameTableCell).toContainText(searchQueryValue);
          }
          break;
        case 'Existing_QA_User_Full_Name':
          for (const element of allResultRow) {
            const firstNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_first_name);
            const lastNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_last_name);
            await expect(firstNameTableCell).toContainText(
              searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries
                .Existing_QA_User_First_Name['search_input_text']
            );
            await expect(lastNameTableCell).toContainText(
              searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries
                .Existing_QA_User_Last_Name['search_input_text']
            );
          }
          break;
        case 'Existing_QA_User_Email':
          for (const element of allResultRow) {
            const emailTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_email);
            await expect(emailTableCell).toContainText(searchQueryValue);
          }
          break;
        default:
          throw new Error(`${searchQueryName} is not a valid option`);
      }
    }
  }
);

When(
  'I can see that the add users to {string} search page contains {string}',
  async ({ searchAddUserReviewBodyPage, reviewBodyProfilePage }, orgType: string, searchResult: string) => {
    if (orgType === 'review body' || orgType === 'sponsor organisation') {
      if (searchResult.toLowerCase() == 'no_results') {
        await expect(searchAddUserReviewBodyPage.no_search_results_heading).toBeVisible();
        await expect(searchAddUserReviewBodyPage.no_search_results_guidance_text).toBeVisible();
        await expect(searchAddUserReviewBodyPage.back_to_users_link).toBeVisible();
        await expect(searchAddUserReviewBodyPage.manage_users_link).toBeVisible();
        const expectedBackToUsersText = `${searchAddUserReviewBodyPage.linkTextData.Search_Add_User_Review_Body_Page.Back_To_Users}${await reviewBodyProfilePage.getOrgName()}`;
        await expect(searchAddUserReviewBodyPage.back_to_users_link).toHaveText(expectedBackToUsersText);
      } else {
        const expectedTableHeadings =
          searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page
            .search_table_headings;
        await expect(searchAddUserReviewBodyPage.no_search_results_heading).not.toBeVisible();
        await expect(searchAddUserReviewBodyPage.no_search_results_guidance_text).not.toBeVisible();
        await expect(searchAddUserReviewBodyPage.back_to_users_link).not.toBeVisible();
        await expect(searchAddUserReviewBodyPage.manage_users_link).not.toBeVisible();
        await expect(searchAddUserReviewBodyPage.search_result_table).toBeVisible();
        await expect(searchAddUserReviewBodyPage.search_result_table_header).toHaveText(expectedTableHeadings);
        await searchAddUserReviewBodyPage.setUserFirstName(
          confirmStringNotNull(
            await searchAddUserReviewBodyPage.search_result_table_row
              .first()
              .locator(searchAddUserReviewBodyPage.search_result_table_first_name)
              .textContent()
          )
        );
        await searchAddUserReviewBodyPage.setUserLastName(
          confirmStringNotNull(
            await searchAddUserReviewBodyPage.search_result_table_row
              .first()
              .locator(searchAddUserReviewBodyPage.search_result_table_last_name)
              .textContent()
          )
        );
        await searchAddUserReviewBodyPage.setUserEmail(
          confirmStringNotNull(
            await searchAddUserReviewBodyPage.search_result_table_row
              .first()
              .locator(searchAddUserReviewBodyPage.search_result_table_email)
              .textContent()
          )
        );
        await searchAddUserReviewBodyPage.setUserStatus(
          confirmStringNotNull(
            await searchAddUserReviewBodyPage.search_result_table_row
              .first()
              .locator(searchAddUserReviewBodyPage.search_result_table_status)
              .textContent()
          )
        );
      }
    }
  }
);

Given(
  'I see that the newly added user appears in the user list page for the {string}',
  async ({ searchAddUserReviewBodyPage, commonItemsPage }, orgType: string) => {
    await expect.soft(commonItemsPage.userListTableBodyRows).toHaveCount(1);
    if (orgType === 'review body') {
      await expect(commonItemsPage.first_name_value_first_row).toHaveText(
        await searchAddUserReviewBodyPage.getUserFirstName()
      );
      await expect
        .soft(commonItemsPage.last_name_value_first_row)
        .toHaveText(await searchAddUserReviewBodyPage.getUserLastName());
      await expect
        .soft(commonItemsPage.email_address_value_first_row)
        .toHaveText(await searchAddUserReviewBodyPage.getUserEmail());
      await expect
        .soft(commonItemsPage.status_value_first_row)
        .toHaveText(await searchAddUserReviewBodyPage.getUserStatus());
    } else if (orgType === 'sponsor organisation') {
      await expect(commonItemsPage.users_sponsor_org_name_value_first_row).toHaveText(
        (await searchAddUserReviewBodyPage.getUserFirstName()) +
          ' ' +
          (await searchAddUserReviewBodyPage.getUserLastName())
      );
      await expect
        .soft(commonItemsPage.users_sponsor_org_email_value_first_row)
        .toHaveText(await searchAddUserReviewBodyPage.getUserEmail());
      await expect
        .soft(commonItemsPage.users_sponsor_org_status_value_first_row)
        .toHaveText(await searchAddUserReviewBodyPage.getUserStatus());
    }
  }
);

Given(
  'I click the {string} link in the breadcrumbs on the {string}',
  async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    const noOfLinksFound = await commonItemsPage.govUkBreadCrumbsLink.getByText(linkValue).count();
    if (noOfLinksFound > 1) {
      await commonItemsPage.govUkLink.getByText(linkValue).first().click();
    } else {
      await commonItemsPage.govUkLink.getByText(linkValue, { exact: true }).click();
    }
  }
);

Then(
  'I can validate the {string} are displayed in the supporting documents table',
  async (
    {
      commonItemsPage,
      addDocumentDetailsForSpecificDocumentModificationsPage,
      addDocumentDetailsModificationsPage,
      modificationsCommonPage,
    },
    datasetName: string
  ) => {
    const dataset = commonItemsPage.documentUploadTestData[datasetName];
    const originalUploadedFiles = dataset.map((path: string) => path.split('/').pop());
    const expectedDocDetails =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData.Valid_Data_Fields;
    const monthMap: Record<string, string> = {
      January: 'Jan',
      February: 'Feb',
      March: 'Mar',
      April: 'Apr',
      May: 'May',
      June: 'Jun',
      July: 'Jul',
      August: 'Aug',
      September: 'Sep',
      October: 'Oct',
      November: 'Nov',
      December: 'Dec',
    };

    const expectedDocDate = `${expectedDocDetails.sponsor_document_day_text} ${monthMap[expectedDocDetails.sponsor_document_month_dropdown]} ${expectedDocDetails.sponsor_document_year_text}`;
    const documentRows = modificationsCommonPage.documentRows;
    const rowCount = await documentRows.count();
    const actualDocsInTable: string[] = [];

    for (let rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      const actualDocType = await documentRows
        .nth(rowIndex)
        .locator(modificationsCommonPage.documentTypeCell)
        .innerText();
      const actualDocName = await documentRows
        .nth(rowIndex)
        .locator(modificationsCommonPage.documentNameCell)
        .innerText();
      const actualFileName = await documentRows.nth(rowIndex).locator(modificationsCommonPage.fileNameCell).innerText();
      const actualDocVersion = await documentRows
        .nth(rowIndex)
        .locator(modificationsCommonPage.documentVersionCell)
        .innerText();
      const actualDocDate = await documentRows
        .nth(rowIndex)
        .locator(modificationsCommonPage.documentDateCell)
        .innerText();
      expect.soft(actualDocType).toBe(expectedDocDetails.document_type_dropdown);
      expect.soft(actualDocVersion).toBe(expectedDocDetails.sponsor_document_version_text);
      expect.soft(actualDocDate).toBe(expectedDocDate);
      const actualUniqueDocNames = await addDocumentDetailsModificationsPage.getUniqueDocNames();
      expect.soft(actualUniqueDocNames).toContain(actualDocName);

      if (originalUploadedFiles.includes(actualFileName)) {
        actualDocsInTable.push(actualFileName);
      }
    }
    for (const doc of originalUploadedFiles) {
      expect.soft(actualDocsInTable).toContain(doc);
    }
  }
);

Then(
  'I can see the {string} status displayed for all documents in the table',
  async ({ modificationsCommonPage, commonItemsPage }, status: string) => {
    const documentStatus = await modificationsCommonPage.getModificationStatus(status);
    const statusValues: string[] = [];
    const rowsCount = await commonItemsPage.tableBodyRows.count();
    for (let rowIndex = 0; rowIndex < rowsCount; rowIndex++) {
      const statusColumnValue = await commonItemsPage.tableBodyRows
        .nth(rowIndex)
        .locator(modificationsCommonPage.documentStatusCell)
        .innerText();
      statusValues.push(statusColumnValue);
    }
    for (const value of statusValues) {
      expect.soft(value).toBe(documentStatus);
    }
  }
);

Then(
  'I can see {string} button {string} on the {string}',
  async ({ commonItemsPage }, buttonKey: string, availability: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (availability.toLowerCase() === 'enabled') {
      await expect(
        commonItemsPage.govUkButton
          .getByText(buttonValue, { exact: true })
          .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
          .first()
      ).toBeVisible();
      await expect(
        commonItemsPage.govUkButton
          .getByText(buttonValue, { exact: true })
          .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
          .first()
      ).toBeEnabled();
    } else if (availability.toLowerCase() === 'disabled') {
      await expect(
        commonItemsPage.govUkButton
          .getByText(buttonValue, { exact: true })
          .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
          .first()
      ).toBeDisabled();
    }
  }
);

Then('I download the document from supporting documents table', async ({ modificationsCommonPage, page }) => {
  const documentRows = modificationsCommonPage.documentRows;
  const rowCount = 1;
  for (let rowIndex = 0; rowIndex < rowCount; rowIndex++) {
    const actualFileName = (
      await documentRows.nth(rowIndex).locator(modificationsCommonPage.fileNameCell).innerText()
    ).trim();
    const fileLocatorToDownload = modificationsCommonPage.documentRows
      .nth(rowIndex)
      .locator(modificationsCommonPage.fileNameCell)
      .getByText(actualFileName);

    const downloadPath = path.resolve(process.env.HOME || process.env.USERPROFILE || '', 'Downloads');
    const [download] = await Promise.all([page.waitForEvent('download'), fileLocatorToDownload.click()]);

    const suggestedFileName = download.suggestedFilename();
    const savedFilePath = path.join(downloadPath, suggestedFileName);
    await download.saveAs(savedFilePath);
    const expectedFileName = path.basename(savedFilePath);
    expect.soft(actualFileName).toBe(expectedFileName);
  }
});

Then(
  'I can see the {string} list sorted by {string} order of the {string} on the {string} page',
  async (
    { manageUsersPage, commonItemsPage },
    listType: string,
    sortDirection: string,
    sortField: string,
    currentPage: string
  ) => {
    const lowerListType = listType.toLowerCase();
    const lowerSortField = sortField.toLowerCase();
    const lowerSortDirection = sortDirection.toLowerCase();
    const lowerCurrentPage = currentPage.toLowerCase();

    // Common locals
    let actualList: string[] = [];
    let sortedList: string[] = [];
    let columnIndex: number | undefined;

    // ----- Branch: User-based lists -----
    if (lowerListType === 'manage users') {
      // Map columns for user lists
      switch (lowerSortField) {
        case 'first name':
          columnIndex = 0;
          break;
        case 'name':
          columnIndex = 0;
          break;
        case 'last name':
          columnIndex = 1;
          break;
        case 'email address':
          columnIndex = 2;
          break;
        case 'status':
          columnIndex = 3;
          break;
        case 'last logged in':
          columnIndex = 4;
          break;
        default:
          throw new Error(`${sortField} is not a valid option`);
      }
    }
    if (lowerListType === 'sponsor organisation users') {
      // Map columns for user lists after clicking on 'View this sponsor organisation's list of users' in 'Manage Sponsor Organisations'
      switch (lowerSortField) {
        case 'name':
          columnIndex = 0;
          break;
        case 'email address':
          columnIndex = 1;
          break;
        case 'status':
          columnIndex = 2;
          break;
        case 'role':
          columnIndex = 3;
          break;
        case 'authoriser':
          columnIndex = 4;
          break;
        default:
          throw new Error(`${sortField} is not a valid option`);
      }
    }
    if (lowerListType === 'manage users' || lowerListType === 'sponsor organisation users') {
      // Gather actual list values
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);

      // Special handling for "Last logged in"
      if (lowerSortField === 'last logged in') {
        sortedList = await manageUsersPage.sortLastLoggedInListValues(actualList, sortDirection);
      } else if (lowerSortDirection === 'ascending') {
        sortedList = [...actualList].toSorted((a, b) =>
          a.localeCompare(b, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
        if (lowerSortField === 'status' && lowerCurrentPage === 'first') {
          expect.soft(actualList).toContain(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enabled_status);
        }
      } else {
        sortedList = [...actualList].toSorted((a, b) =>
          b.localeCompare(a, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
        if (lowerSortField === 'status' && lowerCurrentPage === 'first') {
          expect.soft(actualList).toContain(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.disabled_status);
        }
      }

      expect.soft(actualList).toEqual(sortedList);
      return;
    }
    if (lowerListType === 'sponsor organisation users') {
      // Map columns for user lists
      switch (lowerSortField) {
        case 'name':
          columnIndex = 0;
          break;
        case 'email address':
          columnIndex = 1;
          break;
        case 'status':
          columnIndex = 2;
          break;
        case 'role':
          columnIndex = 3;
          break;
        case 'authoriser':
          columnIndex = 4;
          break;
        default:
          throw new Error(`${sortField} is not a valid option`);
      }

      // Gather actual list values
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);

      if (lowerSortDirection === 'ascending') {
        sortedList = [...actualList].toSorted((a, b) =>
          a.localeCompare(b, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
      } else {
        sortedList = [...actualList].toSorted((a, b) =>
          b.localeCompare(a, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
      }

      expect.soft(actualList).toEqual(sortedList);
      return;
    }

    // ----- Branch: Organisation/Review-body lists -----
    if (
      lowerListType === 'manage sponsor organisations' ||
      lowerListType === 'manage review bodies' ||
      lowerListType === 'sponsor organisations'
    ) {
      // Map columns for organisation/review-body lists
      switch (lowerSortField) {
        case 'organisation name':
          columnIndex = 0;
          break;
        case 'country':
          columnIndex = 1;
          break;
        case 'status':
          columnIndex = 2;
          break;
        default:
          throw new Error(`${sortField} is not a valid option`);
      }

      // Special handling for "country" (strip anything after a comma)
      if (lowerSortField === 'country') {
        const originalList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
        actualList = originalList.map((country) =>
          country.includes(',') ? country.slice(0, country.indexOf(',')) : country
        );
      }

      // For "organisation name" or "status", use the short-title/SWR-aware extractor
      // if (lowerSortField === 'organisation name' || lowerSortField === 'status') {
      //   actualList = await commonItemsPage.getActualListValuesShortProjectTitleSWRStatus(
      //     commonItemsPage.tableBodyRows,
      //     columnIndex
      //   );
      // } else
      else {
        // Otherwise the generic extractor
        actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
      }

      if (lowerSortDirection === 'ascending') {
        sortedList = [...actualList].toSorted((a, b) =>
          a.localeCompare(b, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
        if (lowerSortField === 'status' && lowerCurrentPage === 'first') {
          expect.soft(actualList).toContain(commonItemsPage.commonTestData.enabled_status);
        }
      } else {
        sortedList = [...actualList].toSorted((a, b) =>
          b.localeCompare(a, undefined, { sensitivity: 'base', ignorePunctuation: false })
        );
        if (lowerSortField === 'status' && lowerCurrentPage === 'first') {
          expect.soft(actualList).toContain(commonItemsPage.commonTestData.disabled_status);
        }
      }

      expect.soft(actualList).toEqual(sortedList);
      return;
    }

    // ----- Unsupported list type -----
    throw new Error(`${listType} is not a supported list type for this step`);
  }
);

Then(
  'I see only modifications where the lead nation is the country linked to the {string} {string} and with status {string}',
  async (
    { modificationsReadyToAssignPage, teamManagerDashboardPage, commonItemsPage },
    userType: string,
    user: string,
    status: string
  ) => {
    let modificationsByLeadNation: string[] = [];
    if (userType.toLowerCase() === 'workflow coordinator') {
      let leadNation =
        modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Workflow_Coordinator_Nations[user];
      if (leadNation === 'Northern Ireland') {
        leadNation = 'Northern_Ireland';
      }
      modificationsByLeadNation = await modificationsReadyToAssignPage.sqlGetModificationByLeadNationAndStatusWFC(
        leadNation,
        status
      );
    } else if (userType.toLowerCase() === 'team manager') {
      let leadNation = teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user];
      if (leadNation === 'Northern Ireland') {
        leadNation = 'Northern_Ireland';
      }
      modificationsByLeadNation = await teamManagerDashboardPage.sqlGetModificationByLeadNationAndStatus(
        leadNation,
        status
      );
    }

    const actualList = await commonItemsPage.getActualModificationListValues(commonItemsPage.tableBodyRows, 1);

    const normalize = (arr: any[]) =>
      arr
        .map((item) => item.toString().trim())
        .sort((a, b) => {
          const numA = Number.parseFloat(a);
          const numB = Number.parseFloat(b);
          if (!Number.isNaN(numA) && !Number.isNaN(numB)) {
            return numA - numB; // Numeric comparison
          }

          return 0; // Keeps original order for non-numeric values
        });
    expect.soft(normalize(actualList)).toEqual(normalize(modificationsByLeadNation));
  }
);

Then(
  'the {string} link will be {string} to the user in the {string}',
  async ({ commonItemsPage }, linkKey: string, availabilityVal: string, pageKey: string) => {
    const linkValue = await commonItemsPage.linkTextData[pageKey][linkKey];
    const locatorVal: Locator = commonItemsPage.govUkLink
      .getByText(linkValue, { exact: true })
      .or(commonItemsPage.govUkLink.getByText(linkValue))
      .first();
    if (availabilityVal.toLowerCase() === 'available') {
      await expect.soft(locatorVal).toBeVisible();
      await expect.soft(locatorVal).toBeEnabled();
    } else if (availabilityVal.toLowerCase() === 'not available') {
      await expect.soft(locatorVal).toBeHidden();
    } else {
      throw new Error(`Unsupported button state: ${availabilityVal}`);
    }
  }
);

Then('I click on the short project title link', async ({ projectDetailsIRASPage }) => {
  const shortProjectTitle = await projectDetailsIRASPage.getShortProjectTitle();
  await projectDetailsIRASPage.page.getByText(shortProjectTitle, { exact: true }).first().click();
});

Then('I validate iras id and short project title displayed', async ({ projectDetailsIRASPage, commonItemsPage }) => {
  const irasID = await projectDetailsIRASPage.getUniqueIrasId();
  const shortProjectTitle = await projectDetailsIRASPage.getShortProjectTitle();
  await expect.soft(commonItemsPage.page.getByText(irasID)).toBeVisible();
  await expect.soft(commonItemsPage.page.getByText(shortProjectTitle)).toBeVisible();
});

Then('I have performed this action as the {string}', async ({ commonItemsPage, loginPage }, adminUser: string) => {
  const adminUserEmail = loginPage.loginPageTestData[adminUser].username;
  await commonItemsPage.setAdminEmail(adminUserEmail);
});
