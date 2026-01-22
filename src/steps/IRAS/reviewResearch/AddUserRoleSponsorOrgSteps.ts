import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
const { Given, When, Then } = createBdd(test);

Given('I can see the add user role page', async ({ addUserRoleSponsorOrgPage }) => {
  await addUserRoleSponsorOrgPage.assertOnAddUserRoleSponsorOrganisationPage();
});

When(
  'I fill the add user role page using {string}',
  async ({ addUserRoleSponsorOrgPage, commonItemsPage, myOrganisationsUserProfilePage }, datasetName: string) => {
    const dataset = addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, addUserRoleSponsorOrgPage);
        await myOrganisationsUserProfilePage.setRole(dataset[key]);
      }
    }
    if (datasetName === 'Sponsor_Org_User_Role_Org_Admin') {
      await myOrganisationsUserProfilePage.setAuthoriser(
        myOrganisationsUserProfilePage.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page
          .authoriser_yes
      );
    }
  }
);

Then(
  'I validate {string} displayed when no role selected in {string}',
  async ({ commonItemsPage, addUserRoleSponsorOrgPage }, errorMessageSummaryDatasetName: string, pageKey: string) => {
    let errorMessageFieldDataset: any;
    if (pageKey === 'Add_User_Role_Sponsor_Org_Page') {
      errorMessageFieldDataset =
        addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Error_Validation[
          errorMessageSummaryDatasetName
        ];
    }
    await expect.soft(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
    const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
  }
);
