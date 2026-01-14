import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

const { Given } = createBdd(test);

Given(
  'I fill the my organisation edit user profile page using {string}',
  async ({ myOrganisationsEditUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset =
      myOrganisationsEditUserProfilePage.myOrganisationsEditUserProfilePageTestData
        .My_Organisations_Edit_User_Profile_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, myOrganisationsEditUserProfilePage);
      }
    }
  }
);
