import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
const { Given, When, Then } = createBdd(test);

Given(
  'I can see the add user permission page based on {string}',
  async ({ addUserPermissionSponsorOrgPage }, availability: string) => {
    if (availability.toLowerCase() != 'No_Permission_To_Select') {
      await addUserPermissionSponsorOrgPage.assertOnAddUserPermissionSponsorOrganisationPage();
    }
  }
);

When(
  'I fill the add user permission page using {string}',
  async ({ addUserPermissionSponsorOrgPage, commonItemsPage }, datasetName: string) => {
    if (datasetName === 'Sponsor_Authoriser_Yes') {
      const dataset =
        addUserPermissionSponsorOrgPage.addUserPermissionSponsorOrgPageTestData.Add_User_Permission_Page[datasetName];
      for (const key in dataset) {
        if (Object.hasOwn(dataset, key)) {
          await commonItemsPage.fillUIComponent(dataset, key, addUserPermissionSponsorOrgPage);
        }
      }
    }
  }
);

Then(
  'I click the {string} button on the {string} based on {string}',
  async ({ commonItemsPage }, buttonKey: string, pageKey: string, availability: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    if (availability.toLowerCase() != 'No_Permission_To_Select') {
      await commonItemsPage.govUkButton
        .getByText(buttonValue, { exact: true })
        .or(commonItemsPage.genericButton.getByText(buttonValue, { exact: true }))
        .first()
        .click();
    }
  }
);
