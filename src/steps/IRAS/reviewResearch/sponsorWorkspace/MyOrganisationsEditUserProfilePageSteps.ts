import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

const { Given, Then } = createBdd(test);

Given(
  'I fill the my organisation edit user profile page using {string}',
  async (
    { myOrganisationsEditUserProfilePage, myOrganisationsUserProfilePage, commonItemsPage },
    datasetName: string
  ) => {
    const dataset =
      myOrganisationsEditUserProfilePage.myOrganisationsEditUserProfilePageTestData
        .My_Organisations_Edit_User_Profile_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, myOrganisationsEditUserProfilePage);
        if (key.toLowerCase().startsWith('role')) {
          await myOrganisationsUserProfilePage.setRole(dataset[key]);
        } else {
          await myOrganisationsUserProfilePage.setAuthoriser(dataset[key]);
        }
      }
    }
  }
);

Then(
  'I validate error message for selecting authorisor no for org admin role',
  async ({ myOrganisationsEditUserProfilePage }) => {
    await myOrganisationsEditUserProfilePage.errorVal_OrgAdmin_NotAuthorisor();
  }
);
