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
const { Given, When, Then, AfterStep } = createBdd(test);
import * as userProfileGeneratedataConfig from '../../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
import { getAuthState, getCurrentTimeFormatted } from '../../utils/UtilFunctions';
import { Locator } from 'playwright';
import fs from 'fs';

AfterStep(async ({ page, $step, $testInfo }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    const screenshot = await page.screenshot({ path: 'screenshot.png', fullPage: true });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }
});

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
      accessDeniedPage,
    },
    page: string
  ) => {
    switch (page) {
      case 'Login_Page':
        await loginPage.assertOnLoginPage();
        break;
      case 'Admin_Home_Page':
        await homePage.assertOnHomePage();
        break;
      case 'Non_Admin_Home_Page':
        await homePage.assertOnHomePage();
        await systemAdministrationPage.goto();
        await accessDeniedPage.assertOnAccessDeniedPage();
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
    let allSummaryErrorExpectedValues: any;
    let summaryErrorActualValues: any;
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    if (
      errorMessageFieldAndSummaryDatasetName === 'Error_Message_Incorrect_Format_Invalid_Character_Limit_Telephone' ||
      errorMessageFieldAndSummaryDatasetName === 'Error_Message_Incorrect_Format_Invalid_Character_Limit_Email_Address'
    ) {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset).toString();
      summaryErrorActualValues = (await commonItemsPage.getSummaryErrorMessages()).toString();
    } else {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
      summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    }
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    for (const key in errorMessageFieldDataset) {
      if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
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
          errorMessageFieldAndSummaryDatasetName ===
            'Error_Message_Incorrect_Format_Invalid_Character_Limit_Telephone' ||
          errorMessageFieldAndSummaryDatasetName ===
            'Error_Message_Incorrect_Format_Invalid_Character_Limit_Email_Address'
        ) {
          fieldErrorMessagesActualValues = (await commonItemsPage.getMultipleFieldErrorMessages(key, page)).toString();
          const allFieldErrorExpectedValues = Object.values(errorMessageFieldDataset).toString();
          expect(fieldErrorMessagesActualValues).toEqual(allFieldErrorExpectedValues); //defect https://nihr.atlassian.net/browse/RSP-3878
          const fieldValActuals = summaryErrorActualValues.split(',');
          for (const val of fieldValActuals) {
            const element = await commonItemsPage.clickErrorSummaryLinkMultipleErrorField(val, key, page);
            await expect(element).toBeInViewport();
          }
        } else {
          fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, page);
          expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
          const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
          await expect(element).toBeInViewport();
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

When('I enter {string} into the search field', async ({ commonItemsPage }, searchKey: string) => {
  await commonItemsPage.search_text.fill(searchKey);
});

When(
  'I enter unique organisation name of the newly created review body into the search field',
  async ({ commonItemsPage, createReviewBodyPage }) => {
    await commonItemsPage.search_text.fill(await createReviewBodyPage.getUniqueOrgName());
  }
);

When(
  'I am on the first page and it should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    await expect(commonItemsPage.firstPage).toHaveAttribute('aria-current', 'page');
  }
);

When(
  'I am on the last page and it and visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    const totalPages = await commonItemsPage.getTotalPages();
    const currentPageLocator = await commonItemsPage.clickOnPages(totalPages, 'clicking on page number');
    await expect(currentPageLocator).toHaveAttribute('aria-current', 'page');
  }
);

When('the pagination controls should be displayed at the bottom of the page', async ({ commonItemsPage }) => {
  await expect(commonItemsPage.pagination).toBeVisible();
});

When('the default page size should be twenty', async ({ commonItemsPage }) => {
  const rowCountActual = await commonItemsPage.tableRows.count();
  const rowCountExpected = parseInt(commonItemsPage.commonTestData.default_page_size, 10);
  expect(rowCountActual - 1).toBe(rowCountExpected);
});

When(
  'the {string} button will be {string} and {string} to the user',
  async ({ commonItemsPage }, linkLabel: string, enabledVal: string, visibleVal: string) => {
    const locatorVal: Locator = await commonItemsPage.getLocatorforNextPreviousLinks(linkLabel);
    if (enabledVal === 'enabled' && visibleVal === 'visible') {
      await expect(locatorVal).toBeVisible();
      await expect(locatorVal).toBeEnabled();
    } else if (enabledVal === 'disabled' && visibleVal === 'not visible') {
      await expect(locatorVal).toBeHidden();
      const isVisible = await locatorVal.isVisible().catch(() => false);
      expect(isVisible).toBeFalsy();
    } else {
      throw new Error(`Unsupported state combination: ${enabledVal}, ${visibleVal}`);
    }
  }
);

When(
  'the current page number should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    await commonItemsPage.next_button.click();
    const currentUrl = commonItemsPage.page.url();
    const pageNumber = await commonItemsPage.getPageNumber(currentUrl);
    await expect(commonItemsPage.currentPage).toHaveAttribute('aria-current', 'page');
    const pageLink = commonItemsPage.pagination.getByRole('link', { name: 'Page ' + pageNumber });
    await expect(pageLink).toHaveAttribute('aria-label', 'Page ' + pageNumber);
    const hrefValue = await pageLink.getAttribute('href');
    expect(currentUrl).toContain(hrefValue);
    await commonItemsPage.previous_button.click();
  }
);

Then(
  'I sequentially navigate through each page by {string} from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges',
  async ({ commonItemsPage }, navigateMethod: string) => {
    await commonItemsPage.firstPage.click();
    const totalItems = await commonItemsPage.getTotalItems();
    const pageSize = parseInt(commonItemsPage.commonTestData.default_page_size, 10);
    const totalPages = await commonItemsPage.getTotalPages();
    for (let currentPage = 1; currentPage <= totalPages; currentPage++) {
      const currentPageLocator = await commonItemsPage.clickOnPages(currentPage, navigateMethod);
      await expect(currentPageLocator).toHaveAttribute('aria-current', 'page');
      const startEndPagesMap = await commonItemsPage.getStartEndPages(currentPage, pageSize, totalItems);
      const start = startEndPagesMap.get('start');
      const end = startEndPagesMap.get('end');
      await expect(commonItemsPage.pagination_results).toHaveText(
        `Showing ${start} to ${end} of ${totalItems} results`
      );
      const rowCount = await commonItemsPage.getItemsPerPage();
      expect(rowCount - 1).toBe(parseInt(`${end}`, 10) - parseInt(`${start}`, 10) + 1);
      const itemsMap = await commonItemsPage.getPaginationValues();
      const ellipsisIndices: any = itemsMap.get('ellipsisIndices');
      const itemsValues: any = itemsMap.get('items');
      const visiblePagesMap = await commonItemsPage.getVisiblePages(itemsValues);
      const visiblePages: any = visiblePagesMap.get('visiblePages');
      const allVisibleItems: any = itemsMap.get('allVisibleItems');
      if (totalPages <= 7) {
        expect(visiblePages).toEqual(allVisibleItems);
        expect(ellipsisIndices.length).toBe(0);
      }
      const firstPage = 1;
      const lastPage = totalPages;
      if (totalPages > 7) {
        if (currentPage <= 3) {
          if (currentPage === firstPage) {
            expect(visiblePages).toEqual([firstPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([`${firstPage}`, `${currentPage + 1}`, '⋯', `${lastPage}`]);
          } else if (currentPage === firstPage + 1) {
            expect(visiblePages).toEqual([firstPage, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              '⋯',
              `${lastPage}`,
            ]);
          } else if (currentPage === firstPage + 2) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              `${currentPage - 1}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              '⋯',
              `${lastPage}`,
            ]);
          }
        } else if (currentPage >= totalPages - 2) {
          if (currentPage === lastPage - 2) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              '⋯',
              `${currentPage - 1}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              `${lastPage}`,
            ]);
          } else if (currentPage === lastPage - 1) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              '⋯',
              `${currentPage - 1}`,
              `${currentPage}`,
              `${lastPage}`,
            ]);
          } else if (currentPage === lastPage) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, lastPage]);
            expect(allVisibleItems).toEqual([`${firstPage}`, '⋯', `${currentPage - 1}`, `${lastPage}`]);
          }
        } else {
          expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
          expect(allVisibleItems).toEqual([
            `${firstPage}`,
            '⋯',
            `${currentPage - 1}`,
            `${currentPage}`,
            `${currentPage + 1}`,
            '⋯',
            `${lastPage}`,
          ]);
        }
      }
      expect(visiblePages).toContain(currentPage);
      if (currentPage > 1) {
        expect(visiblePages).toContain(currentPage - 1);
      }
      if (currentPage < totalPages) {
        expect(visiblePages).toContain(currentPage + 1);
      }
      expect(visiblePages).toContain(1);
      expect(visiblePages).toContain(totalPages);
      if (navigateMethod === 'clicking on next link') {
        await commonItemsPage.clickOnNextLink();
      } else if (navigateMethod === 'clicking on previous link') {
        await commonItemsPage.clickOnPreviousLink();
      }
    }
  }
);

Then(
  'I sequentially navigate through each page by {string} from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges',
  async ({ commonItemsPage }, navigateMethod: string) => {
    const totalPages = await commonItemsPage.getTotalPages();
    await commonItemsPage.clickOnPages(totalPages, 'clicking on page number');
    const totalItems = await commonItemsPage.getTotalItems();
    const pageSize = parseInt(commonItemsPage.commonTestData.default_page_size, 10);
    for (let currentPage = totalPages; currentPage >= 1; currentPage--) {
      const currentPageLocator = await commonItemsPage.clickOnPages(currentPage, navigateMethod);
      await expect(currentPageLocator).toHaveAttribute('aria-current', 'page');
      const startEndPagesMap = await commonItemsPage.getStartEndPages(currentPage, pageSize, totalItems);
      const start = startEndPagesMap.get('start');
      const end = startEndPagesMap.get('end');
      await expect(commonItemsPage.pagination_results).toHaveText(
        `Showing ${start} to ${end} of ${totalItems} results`
      );
      const rowCount = await commonItemsPage.getItemsPerPage();
      expect(rowCount - 1).toBe(parseInt(`${end}`, 10) - parseInt(`${start}`, 10) + 1);
      const itemsMap = await commonItemsPage.getPaginationValues();
      const ellipsisIndices: any = itemsMap.get('ellipsisIndices');
      const itemsValues: any = itemsMap.get('items');
      const visiblePagesMap = await commonItemsPage.getVisiblePages(itemsValues);
      const visiblePages: any = visiblePagesMap.get('visiblePages');
      const allVisibleItems: any = itemsMap.get('allVisibleItems');
      if (totalPages <= 7) {
        expect(visiblePages).toEqual(allVisibleItems);
        expect(ellipsisIndices.length).toBe(0);
      }
      const firstPage = 1;
      const lastPage = totalPages;
      if (totalPages > 7) {
        if (currentPage <= 3) {
          if (currentPage === firstPage) {
            expect(visiblePages).toEqual([firstPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([`${firstPage}`, `${currentPage + 1}`, '⋯', `${lastPage}`]);
          } else if (currentPage === firstPage + 1) {
            expect(visiblePages).toEqual([firstPage, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              '⋯',
              `${lastPage}`,
            ]);
          } else if (currentPage === firstPage + 2) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              `${currentPage - 1}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              '⋯',
              `${lastPage}`,
            ]);
          }
        } else if (currentPage >= totalPages - 2) {
          if (currentPage === lastPage - 2) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              '⋯',
              `${currentPage - 1}`,
              `${currentPage}`,
              `${currentPage + 1}`,
              `${lastPage}`,
            ]);
          } else if (currentPage === lastPage - 1) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, lastPage]);
            expect(allVisibleItems).toEqual([
              `${firstPage}`,
              '⋯',
              `${currentPage - 1}`,
              `${currentPage}`,
              `${lastPage}`,
            ]);
          } else if (currentPage === lastPage) {
            expect(visiblePages).toEqual([firstPage, currentPage - 1, lastPage]);
            expect(allVisibleItems).toEqual([`${firstPage}`, '⋯', `${currentPage - 1}`, `${lastPage}`]);
          }
        } else {
          expect(visiblePages).toEqual([firstPage, currentPage - 1, currentPage, currentPage + 1, lastPage]);
          expect(allVisibleItems).toEqual([
            `${firstPage}`,
            '⋯',
            `${currentPage - 1}`,
            `${currentPage}`,
            `${currentPage + 1}`,
            '⋯',
            `${lastPage}`,
          ]);
        }
      }
      expect(visiblePages).toContain(currentPage);
      if (currentPage > 1) {
        expect(visiblePages).toContain(currentPage - 1);
      }
      if (currentPage < totalPages) {
        expect(visiblePages).toContain(currentPage + 1);
      }
      expect(visiblePages).toContain(1);
      expect(visiblePages).toContain(totalPages);
      if (navigateMethod === 'clicking on next link') {
        await commonItemsPage.clickOnNextLink();
      } else if (navigateMethod === 'clicking on previous link') {
        await commonItemsPage.clickOnPreviousLink();
      }
    }
  }
);

When(
  'I enter the {string} of the {string} item in the list, into the search field',
  async ({ userListReviewBodyPage, commonItemsPage, manageReviewBodiesPage }, fieldKey: string, position: string) => {
    if ((await commonItemsPage.tableRows.count()) >= 2) {
      let searchKey: string = '';
      if (fieldKey === 'First_Name' || fieldKey === 'Last_Name' || fieldKey === 'Email_Address') {
        searchKey = await commonItemsPage.getSearchQueryFNameLNameEmailByPosition(
          position,
          fieldKey,
          userListReviewBodyPage
        );
      } else if (fieldKey === 'Full_Name') {
        await commonItemsPage.setSearchQueryFullNameByPosition(position, fieldKey, userListReviewBodyPage);
        searchKey = await userListReviewBodyPage.getSearchQueryFullName(position);
      } else if (fieldKey === 'Organisation_Name') {
        await commonItemsPage.setSearchQueryReviewBodyByPosition(position, fieldKey, manageReviewBodiesPage);
        searchKey = await manageReviewBodiesPage.getSearchQueryOrgName(position);
      }
      await userListReviewBodyPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

When(
  'I enter the {string} as the search query into the search field',
  async ({ userListReviewBodyPage, commonItemsPage }, searchKey: string) => {
    if ((await commonItemsPage.tableRows.count()) >= 2) {
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: any = userListBeforeSearch.get('searchResultValues');
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      await userListReviewBodyPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

Then(
  'the system displays no results found message if there is no user on the system that matches the search criteria',
  async ({ manageUsersPage, commonItemsPage, userListReviewBodyPage }) => {
    const filteredSearchResults = await commonItemsPage.getFilteredSearchResultsBeforeSearch(userListReviewBodyPage);
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    expect(filteredSearchResults).toEqual([]);
    await expect(manageUsersPage.no_results_heading).toHaveText(
      manageUsersPage.manageUsersPageTestData.Manage_Users_Page.no_results_heading
    );
    await expect(manageUsersPage.no_results_guidance_text).toHaveText(
      manageUsersPage.manageUsersPageTestData.Manage_Users_Page.no_results_guidance_text
    );
  }
);

Then(
  'the system displays no results found message if there is no review body on the system that matches the search criteria',
  async ({ manageReviewBodiesPage, commonItemsPage, userListReviewBodyPage }) => {
    const filteredSearchResults = await commonItemsPage.getFilteredSearchResultsBeforeSearch(userListReviewBodyPage);
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    expect(filteredSearchResults).toEqual([]);
    await expect(manageReviewBodiesPage.no_results_heading).toHaveText(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_heading
    );
    await expect(manageReviewBodiesPage.no_results_guidance_text).toHaveText(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_guidance_text
    );
  }
);

Given(
  'I have navigated to the {string} as {string}',
  async (
    { homePage, createApplicationPage, systemAdministrationPage, accessDeniedPage, manageReviewBodiesPage },
    page: string,
    user: string
  ) => {
    const authStatePath = getAuthState(user);
    const authState = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
    switch (page) {
      case 'Home_Page':
        await homePage.page.context().addCookies(authState.cookies);
        await homePage.goto();
        await homePage.assertOnHomePage();
        break;
      case 'Create_Application_Page':
        await createApplicationPage.page.context().addCookies(authState.cookies);
        await createApplicationPage.goto();
        await createApplicationPage.assertOnCreateApplicationPage();
        break;
      case 'System_Administration_Page':
        await systemAdministrationPage.page.context().addCookies(authState.cookies);
        await systemAdministrationPage.goto();
        await systemAdministrationPage.assertOnSystemAdministrationPage();
        break;
      case 'Access_Denied_Page':
        await systemAdministrationPage.page.context().addCookies(authState.cookies);
        await systemAdministrationPage.goto();
        await accessDeniedPage.assertOnAccessDeniedPage();
        break;
      case 'Manage_Review_Bodies_Page':
        await manageReviewBodiesPage.page.context().addCookies(authState.cookies);
        await manageReviewBodiesPage.goto();
        await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

Given(
  'I logged out from the {string} as {string}',
  async (
    {
      homePage,
      createApplicationPage,
      systemAdministrationPage,
      accessDeniedPage,
      manageReviewBodiesPage,
      userProfilePage,
      reviewBodyProfilePage,
    },
    page: string,
    user: string
  ) => {
    const authStatePath = getAuthState(user);
    const authState = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
    switch (page) {
      case 'Home_Page':
        await homePage.page.context().clearCookies(authState.cookies);
        break;
      case 'Create_Application_Page':
        await createApplicationPage.page.context().clearCookies(authState.cookies);
        break;
      case 'System_Administration_Page':
        await systemAdministrationPage.page.context().clearCookies(authState.cookies);
        break;
      case 'Access_Denied_Page':
        await accessDeniedPage.page.context().clearCookies(authState.cookies);
        break;
      case 'Manage_Review_Bodies_Page':
        await manageReviewBodiesPage.page.context().clearCookies(authState.cookies);
        break;
      case 'User_Profile_Page':
        await userProfilePage.page.context().clearCookies(authState.cookies);
        break;
      case 'Review_Body_Profile_Page':
        await reviewBodyProfilePage.page.context().clearCookies(authState.cookies);
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);
