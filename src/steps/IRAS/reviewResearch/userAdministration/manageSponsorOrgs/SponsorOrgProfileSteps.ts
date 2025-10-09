import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the sponsor organisation profile page', async ({ sponsorOrganisationProfilePage }) => {
  await sponsorOrganisationProfilePage.assertOnSponsorOrganisationProfilePage();
  await sponsorOrganisationProfilePage.setOrgName(
    confirmStringNotNull(await sponsorOrganisationProfilePage.organisation_name_value.textContent())
  );
  await sponsorOrganisationProfilePage.setCountries(
    confirmStringNotNull(await sponsorOrganisationProfilePage.country_value.textContent()).split(', ')
  );
  await sponsorOrganisationProfilePage.setEmail(
    confirmStringNotNull(await sponsorOrganisationProfilePage.email_address_value.textContent())
  );
  await sponsorOrganisationProfilePage.setDescription(
    confirmStringNotNull(await sponsorOrganisationProfilePage.description_value.textContent())
  );
  await sponsorOrganisationProfilePage.setLastUpdatedDate(
    confirmStringNotNull(await sponsorOrganisationProfilePage.last_updated_value.textContent())
  );
  const revBodyIdStartIndex = sponsorOrganisationProfilePage.page.url().lastIndexOf('/') + 1;
  await sponsorOrganisationProfilePage.setReviewBodyId(
    sponsorOrganisationProfilePage.page.url().substring(revBodyIdStartIndex)
  );
});
