import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Given, When } = createBdd(test);

Given(
  'I can see the check and add user to sponsor organisation page',
  async ({ checkAddUserSponsorOrganisationPage }) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
  }
);

When(
  'the check and add user to sponsor organisation page displays the expected user details',
  async ({ checkAddUserSponsorOrganisationPage }) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
    await checkAddUserSponsorOrganisationPage.setUserEmail(
      confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_email_value.textContent())
    );
    // validate user details from db using email address
  }
);
