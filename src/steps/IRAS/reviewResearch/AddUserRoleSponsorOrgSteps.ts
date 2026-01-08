import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
const { Given, When } = createBdd(test);

Given('I can see the add user role page', async ({ addUserRoleSponsorOrgPage }) => {
  await addUserRoleSponsorOrgPage.assertOnAddUserRoleSponsorOrganisationPage();
});

When(
  'I fill the add user role page using {string}',
  async ({ addUserRoleSponsorOrgPage, commonItemsPage }, datasetName: string) => {
    const dataset = addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, addUserRoleSponsorOrgPage);
      }
    }
  }
);
