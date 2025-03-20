import { createBdd } from 'playwright-bdd';
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

Given('I have navigated to the {string}', async ({ loginPage, homePage, createApplicationPage }, page: string) => {
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
  async ({ commonItemsPage, homePage, checkCreateUserProfilePage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (pageKey === 'Banner' && buttonKey === 'Login') {
      await commonItemsPage.bannerLoginBtn.click();
    } else if (pageKey === 'Home_Page' && buttonKey === 'Login') {
      await homePage.loginBtn.click();
    } else if (pageKey === 'Check_Create_User_Profile_Page' && buttonKey === 'Create_Profile') {
      await checkCreateUserProfilePage.create_profile_button.click();
    } else {
      await commonItemsPage.govUkButton.getByText(buttonValue, { exact: true }).click();
    }
  }
);

Then(
  'I can see a {string} button on the {string}',
  async ({ commonItemsPage, homePage }, buttonKey: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (pageKey === 'Banner' && buttonKey === 'Login') {
      await expect(commonItemsPage.bannerLoginBtn).toBeVisible();
    } else if (pageKey === 'Home_Page' && buttonKey === 'Login') {
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
