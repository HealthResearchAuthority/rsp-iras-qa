import { createBdd, DataTable } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the {string}', async ({ loginPage, homePage, createApplicationPage }, page: string) => {
  switch (page) {
    case 'Login_Page':
      await homePage.goto();
      await homePage.assertOnHomePage('false');
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
    default:
      throw new Error(`${page} is not a valid option`);
  }
});

When(
  'I can see the {string}',
  async ({ loginPage, homePage, createApplicationPage, proceedApplicationPage }, page: string) => {
    switch (page) {
      case 'Login_Page':
        await loginPage.assertOnLoginPage();
        break;
      case 'Unauthenticated_Home_Page':
        await homePage.assertOnHomePage('false');
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
  async ({ commonItemsPage, homePage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (pageKey === 'Home_Page' && buttonKey === 'Login') {
      await homePage.loginBtn.click();
    } else {
      await commonItemsPage.govUkButton.getByText(buttonValue, { exact: true }).click();
    }
  }
);

Then(
  'I can see a {string} button on the {string}',
  async ({ commonItemsPage, homePage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (pageKey === 'Home_Page' && buttonKey === 'Login') {
      await expect(homePage.loginBtn).toBeVisible();
    } else {
      await expect(commonItemsPage.govUkButton.getByText(buttonValue, { exact: true })).toBeVisible();
    }
  }
);

Given(
  'I click the {string} link on the {string}',
  async ({ commonItemsPage, homePage }, linkKey: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    if (pageKey === 'Progress_Bar') {
      await commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true }).click();
    } else if (pageKey === 'Banner' && linkKey === 'My_Applications') {
      await commonItemsPage.bannerMyApplications.click();
    } else if (pageKey === 'Home_Page' && linkKey === 'My_Applications') {
      await homePage.myApplicationsLink.click();
    } else {
      await commonItemsPage.govUkLink.getByText(linkValue, { exact: true }).click();
    }
  }
);

Given(
  'I can see a {string} link on the {string}',
  async ({ commonItemsPage, homePage }, linkKey: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    if (pageKey === 'Progress_Bar') {
      await expect(commonItemsPage.qSetProgressBarStageLink.getByText(linkValue, { exact: true })).toBeVisible();
    } else if (pageKey === 'Banner' && linkKey === 'My_Applications') {
      await expect(commonItemsPage.bannerMyApplications).toBeVisible();
    } else if (pageKey === 'Home_Page' && linkKey === 'My_Applications') {
      await expect(homePage.myApplicationsLink).toBeVisible();
    } else {
      await expect(commonItemsPage.govUkLink.getByText(linkValue, { exact: true })).toBeVisible();
    }
  }
);

Then(
  'I see the expected validation errors appearing on the {string} page based on those inputs',
  async ({ commonItemsPage }, pageName: string, data: DataTable) => {
    // await commonItemsPage.page.pause();
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
    console.log('ALERTS EXPECTED:');
    console.log(expectedAlertBoxErrors);
    console.log('FIELDS EXPECTED:');
    console.log(expectedFieldErrors);

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
      const actualFieldError = await commonItemsPage.getFieldErrors(key, pageObject);
      console.log('EXPECT ' + (await actualFieldError.textContent()) + ' TO EQUAL ' + expectedFieldErrorMessage);
      await expect(actualFieldError).toHaveText(expectedFieldErrorMessage);
    }
  }
);

// Use Alfred fillUIComponent update with section param - done
// Use Alfred Validation Object with everything - created for Project Filter, do for others
// Dataset entered to fetch relevant keys and values from validation object - done
// Use keys array to assert field errors like I'm doing now - done
// Use values array to assert alert box errors like I'm doing now - done
// Do with JS disabled (turn off in config) and try methods - done
// should mean conditional object can be merged with mandatory and once null or empty check can apply - done
// Investigate status, seems to work, investigate different dataset input, shorten statement (optimise) - to do and PR
