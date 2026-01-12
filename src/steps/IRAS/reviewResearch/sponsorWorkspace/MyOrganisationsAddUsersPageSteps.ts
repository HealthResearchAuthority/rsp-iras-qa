import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { generateUniqueEmail } from '../../../../utils/UtilFunctions';
const { Then, When } = createBdd(test);

Then(
  'I navigate to the add user page for the selected sponsor organisation {string}',
  async ({ mySponsorOrgAddUserPage }, sponsorOrg: string) => {
    await mySponsorOrgAddUserPage.assertOnMySponsorOrgAddUsersPage(sponsorOrg);
  }
);

When(
  'I fill the add user page using {string}',
  async ({ mySponsorOrgAddUserPage, createUserProfilePage, loginPage }, datasetName: string) => {
    let valueToFill: string | undefined;
    const prefix = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile.email_address_prefix;
    const dataset =
      await mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        // if (key === 'email_address_text') {
        const locator = mySponsorOrgAddUserPage[key];
        if (datasetName === 'Non_Registered_User') {
          const uniqueEmail = await generateUniqueEmail(dataset[key], prefix);
          valueToFill = uniqueEmail;
        } else if (datasetName.startsWith('Invalid_Email_')) {
          valueToFill = await dataset[key];
        } else if (datasetName === 'Sponsor_Org_Admin_User') {
          valueToFill = await loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
        } else if (datasetName === 'System_Admin') {
          valueToFill = await loginPage.loginPageTestData.System_Admin.username;
        } else if (datasetName === 'Sponsor_User') {
          valueToFill = await loginPage.loginPageTestData.Sponsor_User.username;
        }
        if (valueToFill) {
          await locator.fill(valueToFill);
        }
        // }
      }
    }
  }
);

Then('I see a notification page stating {string}', async ({ mySponsorOrgAddUserPage }, errorMessage: string) => {
  await mySponsorOrgAddUserPage.assertOnNonRegisteredUserErrorPage(errorMessage);
});

Then(
  'I validate {string} displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in {string} for the selected sponsor organisation {string}',
  async (
    { commonItemsPage, mySponsorOrgAddUserPage },
    errorMessageSummaryDatasetName: string,
    pageKey: string,
    sponsorOrg: string
  ) => {
    let errorMessageFieldDataset: any;
    if (pageKey === 'My_Organisations_Users_Add_User_Page') {
      if (errorMessageSummaryDatasetName.endsWith('Email_Address_Error')) {
        errorMessageFieldDataset =
          mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation[
            errorMessageSummaryDatasetName
          ];
        await expect.soft(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
        const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
        const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
        expect.soft(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
      } else if (errorMessageSummaryDatasetName.endsWith('User_Exists_Message')) {
        errorMessageFieldDataset =
          mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation[
            errorMessageSummaryDatasetName
          ];
        const notification_content = errorMessageFieldDataset.user_exists_notification_text + sponsorOrg;
        await expect.soft(mySponsorOrgAddUserPage.banner).toBeVisible();
        await expect.soft(mySponsorOrgAddUserPage.banner_heading).toBeVisible();
        await expect(
          mySponsorOrgAddUserPage.banner.getByRole('heading', { level: 3, name: notification_content })
        ).toBeVisible();
      }
    }
  }
);
