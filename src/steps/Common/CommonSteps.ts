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
const { Given, When, Then } = createBdd(test);
import * as userProfileGeneratedataConfig from '../../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
import { getCurrentTimeFormatted } from '../../utils/UtilFunctions';

Then('I capture the page screenshot', async () => {});

Given(
  'I have navigated to the {string}',
  async (
    {
      loginPage,
      homePage,
      createApplicationPage,
      systemAdministrationPage,
      manageReviewBodiesPage,
      userProfilePage,
      reviewBodyProfilePage,
      myResearchProjectsPage,
    },
    page: string
  ) => {
    switch (page) {
      case 'Login_Page':
        await homePage.goto();
        await homePage.loginBtn.click();
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
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

When(
  'I can see the {string}',
  async (
    {
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
        await userListReviewBodyPage.assertOnUserListReviewBodyPage();
        break;
      case 'Search_Add_User_Review_Body_Page':
        await searchAddUserReviewBodyPage.assertOnSearchAddUserReviewBodyPage();
        break;
      case 'My_Research_Page':
        await myResearchProjectsPage.assertOnMyResearchProjectsPage();
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

Then('I click the {string} button on the {string}', async ({ commonItemsPage }, buttonKey: string, pageKey: string) => {
  const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
  await commonItemsPage.govUkButton
    .getByText(buttonValue, { exact: true })
    .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
    .first()
    .click();
});

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
  'I click the {string} link on the {string}',
  async ({ commonItemsPage, checkCreateUserProfilePage }, linkKey: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    const noOfLinksFound = await commonItemsPage.govUkLink.getByText(linkValue).count();
    if (pageKey === 'Progress_Bar') {
      await commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true }).click();
    } else if (pageKey === 'Check_Create_User_Profile_Page' && linkKey === 'Back') {
      await checkCreateUserProfilePage.back_button.click(); //work around for now >> to click on Back link
    } else if (pageKey === 'Check_Create_Review_Body_Page' && linkKey === 'Back') {
      await checkCreateUserProfilePage.back_button.click(); //work around for now >> to click on Back link
    } else if (
      (pageKey === 'Search_Add_User_Review_Body_Page' || pageKey === 'Review_Body_User_List_Page') &&
      linkKey === 'Back_To_Users'
    ) {
      await commonItemsPage.govUkLink.getByText(linkValue).click();
    } else if (noOfLinksFound > 1) {
      await commonItemsPage.govUkLink.getByText(linkValue).first().click();
    } else {
      await commonItemsPage.govUkLink.getByText(linkValue, { exact: true }).click();
    }
  }
);

Given('I can see a {string} link on the {string}', async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
  const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
  if (pageKey === 'Progress_Bar') {
    await expect(commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true })).toBeVisible();
  } else {
    await expect(commonItemsPage.govUkLink.getByText(linkValue, { exact: true })).toBeVisible();
  }
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
      sectionInputsUsed.forEach((value: any, key: string) => {
        combinedInputsUsed.set(key, value);
      });
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
  async ({ auditHistoryReviewBodyPage, auditHistoryUserPage }, page: string) => {
    const currentTime = await getCurrentTimeFormatted();
    switch (page) {
      case 'Audit_History_Review_Body_Page':
        await auditHistoryReviewBodyPage.setUpdatedTime(currentTime);
        break;
      case 'Audit_History_User_Page':
        await auditHistoryUserPage.setUpdatedTime(currentTime);
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
      keyProjectRolesPage,
      createReviewBodyPage,
      editReviewBodyPage,
      reviewYourAnswersPage,
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
    } else if (pageKey == 'Key_Project_Roles_Page') {
      errorMessageFieldDataset =
        keyProjectRolesPage.keyProjectRolesPageTestData[errorMessageFieldAndSummaryDatasetName];
      page = keyProjectRolesPage;
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
    }
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
    const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    for (const key in errorMessageFieldDataset) {
      if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
        let fieldErrorMessagesActualValues: any;
        if (pageKey == 'Review_Your_Answers_Page') {
          expect(await page[key].getByRole('link').evaluate((e) => getComputedStyle(e).color)).toBe(
            commonItemsPage.commonTestData.rgb_red_color
          );
          fieldErrorMessagesActualValues = await reviewYourAnswersPage.getFieldErrorMessages(key, page);
        } else {
          fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, page);
        }
        expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
        await expect(element).toBeInViewport();
      }
    }
    if (errorMessageFieldAndSummaryDatasetName == 'Max_Description_Words_Error') {
      await expect(createReviewBodyPage.description_reason_error).toHaveText(
        createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.Validation.Max_Description_Reason
      );
    }
  }
);

When('I enter {string} into the search field', async ({ commonItemsPage }, searchKey: string) => {
  await commonItemsPage.search_text.fill(searchKey);
});

When(
  'I enter unique organisation name of the newly created review body into the search field',
  async ({ commonItemsPage, createReviewBodyPage }) => {
    await commonItemsPage.search_text.fill(await createReviewBodyPage.getUniqueOrgName());
  }
);
