import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
const { Given, When, Then } = createBdd(test);

Given(
  'I can see the add user permission page based on {string}',
  async ({ addUserPermissionSponsorOrgPage }, availability: string) => {
    if (availability.toLowerCase() != 'no_permission_to_select') {
      await addUserPermissionSponsorOrgPage.assertOnAddUserPermissionSponsorOrganisationPage();
    }
  }
);

When(
  'I fill the add user permission page using {string}',
  async ({ addUserPermissionSponsorOrgPage, commonItemsPage, myOrganisationsUserProfilePage }, datasetName: string) => {
    if (datasetName === 'Sponsor_Authoriser_Yes') {
      const dataset =
        addUserPermissionSponsorOrgPage.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page[datasetName];
      for (const key in dataset) {
        if (Object.hasOwn(dataset, key)) {
          await commonItemsPage.fillUIComponent(dataset, key, addUserPermissionSponsorOrgPage);
        }
      }
      await myOrganisationsUserProfilePage.setAuthoriser(
        myOrganisationsUserProfilePage.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page
          .authoriser_yes
      );
    } else if (datasetName === 'Sponsor_Authoriser_No') {
      await myOrganisationsUserProfilePage.setAuthoriser(
        myOrganisationsUserProfilePage.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page
          .authoriser_no
      );
    }
  }
);

Then(
  'I click the {string} button on the {string} based on {string}',
  async ({ commonItemsPage }, buttonKey: string, pageKey: string, availability: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (availability.toLowerCase() !== 'no_permission_to_select') {
      await commonItemsPage.govUkButton
        .getByText(buttonValue, { exact: true })
        .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
        .first()
        .click();
    }
  }
);
