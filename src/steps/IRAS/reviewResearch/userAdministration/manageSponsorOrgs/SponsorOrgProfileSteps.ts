import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

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

When(
  'I now see the sponsor organisation profile page with the created {string}',
  async ({ createReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();
    await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
    if (datasetName.startsWith('Valid_') || datasetName.startsWith('Review_')) {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(
        await createReviewBodyPage.getUniqueOrgName()
      );
      await expect(reviewBodyProfilePage.page_heading).toHaveText(
        reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label +
          (await createReviewBodyPage.getUniqueOrgName())
      );
    } else {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
      await expect(reviewBodyProfilePage.page_heading).toHaveText(dataset.organisation_name_text);
    }
    await expect(reviewBodyProfilePage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ', '));
    await expect(reviewBodyProfilePage.email_address_value).toHaveText(dataset.email_address_text);
    await expect(reviewBodyProfilePage.description_value).toHaveText(dataset.description_text);
  }
);
