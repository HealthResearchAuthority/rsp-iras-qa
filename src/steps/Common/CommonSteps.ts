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
import { confirmArrayNotNull, getAuthState, getCurrentTimeFormatted } from '../../utils/UtilFunctions';
import { Locator } from 'playwright/test';
import fs from 'fs';
import path from 'path';

Then('I capture the page screenshot', async () => {});

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
      searchModificationsPage,
      modificationsReadyToAssignPage,
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
      case 'Search_Modifications_Page':
        await searchModificationsPage.assertOnSearchModificationsPage();
        break;
      case 'Modifications_Tasklist_Page':
        await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
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
  await commonItemsPage.page.waitForLoadState('domcontentloaded');
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
      selectAreaOfChangePage,
      participatingOrganisationsPage,
      affectedOrganisationSelectionPage,
      addDocumentsModificationsPage,
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
    }
    let allSummaryErrorExpectedValues: any;
    let summaryErrorActualValues: any;
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    if (
      errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Telephone_Error' ||
      errorMessageFieldAndSummaryDatasetName === 'Incorrect_Format_Invalid_Character_Limit_Email_Address_Error'
    ) {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset).toString();
      summaryErrorActualValues = (await commonItemsPage.getSummaryErrorMessages()).toString();
    } else {
      allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
      summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    }
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    if (!errorMessageFieldAndSummaryDatasetName.includes('Summary_Only')) {
      for (const key in errorMessageFieldDataset) {
        if (Object.hasOwn(errorMessageFieldDataset, key)) {
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
          } else {
            fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, page);
            if (fieldErrorMessagesActualValues.includes('Error: ')) {
              fieldErrorMessagesActualValues = fieldErrorMessagesActualValues.replace('Error: ', '');
            }
            expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
            const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
            await expect(element).toBeInViewport();
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
    { commonItemsPage, reviewBodyProfilePage, createReviewBodyPage, createUserProfilePage },
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
      case 'name of the newly created user':
        searchValue = await createUserProfilePage.getUniqueEmail();
        break;
      default:
        searchValue = inputType;
    }
    await commonItemsPage.search_text.fill(searchValue);
  }
);

When(
  'I am on the {string} page and it should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }, position: string) => {
    let pageLocator: Locator;
    if (position.toLowerCase() === 'first') {
      pageLocator = commonItemsPage.firstPage;
    } else {
      const totalPages = await commonItemsPage.getTotalPages();
      pageLocator = await commonItemsPage.clickOnPages(totalPages, 'page number');
    }
    await expect(pageLocator).toHaveAttribute('aria-current', 'page');
  }
);

When('the default page size should be {string}', async ({ commonItemsPage }, pageSize: string) => {
  const rowCountActual = await commonItemsPage.tableRows.count();
  let rowCountExpected: number;
  if (pageSize == 'ten') {
    rowCountExpected = parseInt(commonItemsPage.commonTestData.default_page_size_participating_organisation, 10);
  } else {
    rowCountExpected = parseInt(commonItemsPage.commonTestData.default_page_size, 10);
  }
  expect(rowCountActual - 1).toBe(rowCountExpected);
});

Then(
  'the {string} button will be {string} to the user',
  async ({ commonItemsPage }, linkLabel: string, availabilityVal: string) => {
    const locatorVal: Locator = await commonItemsPage.getLocatorforNextPreviousLinks(linkLabel);
    if (availabilityVal.toLowerCase() === 'available') {
      await expect(locatorVal).toBeVisible();
      await expect(locatorVal).toBeEnabled();
    } else if (availabilityVal.toLowerCase() === 'not available') {
      await expect(locatorVal).toBeHidden();
    } else {
      throw new Error(`Unsupported button state: ${availabilityVal}`);
    }
  }
);

When(
  'the current page number should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    await commonItemsPage.next_button.click();
    const currentUrl = commonItemsPage.page.url();
    const currentPageNumber = await commonItemsPage.getPageNumber(currentUrl);
    const currentPageLabel = `Page ${currentPageNumber}`;
    const currentPageLink = commonItemsPage.pagination.getByRole('link', { name: currentPageLabel });
    await expect(currentPageLink).toHaveAttribute('aria-current');
    const currentPageLinkHref = await currentPageLink.getAttribute('href');
    expect(currentUrl).toContain(currentPageLinkHref);
    await commonItemsPage.previous_button.click();
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
        searchKey = await userListReviewBodyPage.getSearchQueryFullName(position);
      } else if (fieldKey === 'Organisation_Name') {
        const orgList = await manageReviewBodiesPage.getReviewBodyListByPosition(position, commonItemsPage);
        await manageReviewBodiesPage.setOrgName(orgList.get('orgNameValues'));
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
    if ((await commonItemsPage.tableBodyRows.count()) >= 1) {
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: string[] = confirmArrayNotNull(userListBeforeSearch.get('searchResultValues'));
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      await userListReviewBodyPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

Then(
  'the system displays no results found message if there is no {string} on the system that matches the search criteria',
  async ({ commonItemsPage, userListReviewBodyPage, manageUsersPage, manageReviewBodiesPage }, entityType: string) => {
    const filteredSearchResults = await userListReviewBodyPage.getFilteredSearchResultsBeforeSearch(commonItemsPage);
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    expect(filteredSearchResults).toEqual([]);
    let headingLocator: Locator, guidanceLocator: Locator, expectedHeading: any, expectedGuidance: any;
    if (entityType === 'user') {
      headingLocator = manageUsersPage.no_results_heading;
      guidanceLocator = manageUsersPage.no_results_guidance_text;
      expectedHeading = manageUsersPage.manageUsersPageTestData.Manage_Users_Page.no_results_heading;
      expectedGuidance = manageUsersPage.manageUsersPageTestData.Manage_Users_Page.no_results_guidance_text;
      await expect(headingLocator).toHaveText(expectedHeading);
      await expect(guidanceLocator).toHaveText(expectedGuidance);
    } else if (entityType === 'review body') {
      headingLocator = manageReviewBodiesPage.no_results_heading;
      guidanceLocator = manageReviewBodiesPage.no_results_guidance_text;
      expectedHeading = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_heading;
      expectedGuidance =
        manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_guidance_text;
      await expect(headingLocator).toHaveText(expectedHeading);
      await expect(guidanceLocator).toHaveText(expectedGuidance);
    }
  }
);

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
      searchModificationsPage,
      modificationsReadyToAssignPage,
      approvalsPage,
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
      case 'Search_Modifications_Page':
        await searchModificationsPage.goto();
        await searchModificationsPage.assertOnSearchModificationsPage();
        break;
      case 'Modifications_Tasklist_Page':
        await modificationsReadyToAssignPage.goto();
        await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
        break;
      case 'Approvals_Page':
        await approvalsPage.goto();
        await approvalsPage.assertOnApprovalsPage();
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }
);

Given(
  'I have navigated to the {string} as {string}',
  async (
    { homePage, systemAdministrationPage, accessDeniedPage, myResearchProjectsPage, approvalsPage },
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

      default:
        throw new Error(`${page} is not a valid option`);
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
    const totalPages = await commonItemsPage.getTotalPages();
    //Limiting the max pages to validate to 10
    let maxPagesToValidate = 0;
    if (totalPages > commonItemsPage.commonTestData.maxPagesToValidate) {
      maxPagesToValidate = commonItemsPage.commonTestData.maxPagesToValidate;
    } else {
      maxPagesToValidate = totalPages;
    }
    await commonItemsPage.firstPage.click();
    for (let currentPage = 1; currentPage <= maxPagesToValidate; currentPage++) {
      await commonItemsPage.validatePagination(currentPage, totalPages, pagename, navigateMethod);
    }
  }
);

Then(
  'I sequentially navigate through each {string} by clicking on {string} from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges',
  async ({ commonItemsPage }, pagename: string, navigateMethod: string) => {
    const totalPages = await commonItemsPage.getTotalPages();
    //Limiting the max pages to validate to 10
    let maxPagesToValidate = 0;
    if (totalPages > commonItemsPage.commonTestData.maxPagesToValidate) {
      maxPagesToValidate = totalPages - commonItemsPage.commonTestData.maxPagesToValidate;
    } else {
      maxPagesToValidate = totalPages;
    }
    await commonItemsPage.clickOnPages(totalPages, 'page number');
    for (let currentPage = totalPages; currentPage >= maxPagesToValidate; currentPage--) {
      await commonItemsPage.validatePagination(currentPage, totalPages, pagename, navigateMethod);
    }
  }
);

Then('I can see the {string} ui labels', async ({ commonItemsPage }, datasetName: string) => {
  const dataset = commonItemsPage.commonTestData[datasetName];
  for (const key in dataset) {
    if (Object.hasOwn(dataset, key)) {
      await expect(commonItemsPage[key].getByText(dataset[key])).toBeVisible();
    }
  }
});

Then(
  'all selected filters displayed under active Filters have been successfully removed',
  async ({ commonItemsPage }) => {
    await expect(commonItemsPage.advanced_filter_chevron).toBeVisible();
    expect(await commonItemsPage.active_filters_list.count()).toBe(0);
    expect(await commonItemsPage.clear_all_filters_link.count()).toBe(0);
  }
);

Then(
  '{string} active filters {string} in the {string}',
  async (
    { searchModificationsPage, manageReviewBodiesPage, manageUsersPage, commonItemsPage },
    actionToPerform: string,
    filterDatasetName: string,
    pageKey: string
  ) => {
    const isDisplayAction = actionToPerform === 'I can see the selected filters are displayed under';
    const isRemoveAction = actionToPerform === 'I remove the selected filters from';
    const replaceValue = '_label';
    const pageMap = {
      Search_Modifications_Page: {
        filterDataset: searchModificationsPage.searchModificationsPageTestData.Advanced_Filters,
        filterLabels: searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page,
      },
      Manage_Review_Bodies_Page: {
        dataset: manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters,
        labels: manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page,
      },
      Manage_Users_Page: {
        dataset: manageUsersPage.manageUsersPageTestData.Advanced_Filters,
        labels: manageUsersPage.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List,
      },
    };
    const { dataset, filterLabels } = pageMap[pageKey];
    const filterDataset = dataset[filterDatasetName];

    const validateFilter = async (key: string, labelFetcher: (key: string) => Promise<string | string[]>) => {
      const labels = await labelFetcher(key);
      const labelArray = Array.isArray(labels) ? labels : [labels];
      for (const label of labelArray) {
        if (isDisplayAction) {
          await expect.soft(commonItemsPage.active_filters_list.getByText(label)).toBeVisible();
        } else if (isRemoveAction) {
          const removed = await commonItemsPage.removeSelectedFilterValues(label);
          expect.soft(removed).toBe(label);
          await expect.soft(commonItemsPage.active_filters_list.getByText(label)).not.toBeVisible();
        }
      }
    };
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key.endsWith('_checkbox')) {
          await validateFilter(key, async (k) =>
            commonItemsPage.getCheckboxFilterLabels(k, filterDataset, filterLabels, replaceValue)
          );
        } else if (key.startsWith('date_submitted') || key.startsWith('date_last_logged_in')) {
          if (await commonItemsPage.shouldValidateDateFilter(key, filterDataset)) {
            await validateFilter(key, async (k) =>
              commonItemsPage.getDateFilterLabel(k, filterDataset, filterLabels, replaceValue)
            );
          }
        } else {
          await validateFilter(key, async (k) =>
            commonItemsPage.getTextboxRadioButtonFilterLabel(k, filterDataset, filterLabels, replaceValue)
          );
        }
      }
    }
  }
);

Then(
  'I validate {string} displayed on {string} in advanced filters',
  async (
    { commonItemsPage, searchModificationsPage },
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
          const actualMessage =
            await searchModificationsPage.sponsor_organisation_jsdisabled_min_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else {
          throw new Error(`Unhandled error message dataset name: ${errorMessageFieldAndSummaryDatasetName}`);
        }
        const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
        await expect(element).toBeInViewport();
      }
    }
  }
);

Then('the advanced filters section should collapse automatically', async ({ commonItemsPage }) => {
  await expect(commonItemsPage.apply_filters_button).not.toBeVisible();
});

Then('I upload {string} documents', async ({ commonItemsPage }, uploadDocumentsDatasetName) => {
  const documentPath = commonItemsPage.documentUploadTestData[uploadDocumentsDatasetName];
  await commonItemsPage.upload_files_input.setInputFiles(documentPath);
  if (typeof documentPath === 'string') {
    const fileName = path.basename(documentPath);
    await expect(commonItemsPage.page.getByText(fileName)).toBeVisible();
  } else {
    await expect(
      commonItemsPage.page.getByText(
        `${documentPath.length}` + commonItemsPage.commonTestData.uploaded_documents_counter_label
      )
    ).toBeVisible();
  }
});
