import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the sponsor workspace page', async ({ sponsorWorkspacePage }) => {
  await sponsorWorkspacePage.assertOnSponsorWorkspacePage();
});

Then(
  'I can see the ui labels in sponsor workspace page',
  async ({ sponsorWorkspacePage, checkSetupSponsorOrganisationPage }) => {
    const authorisationsBodyLabel =
      sponsorWorkspacePage.sponsorWorkspacePageTestData.Label_Texts.authorisations_label.replace(
        '{{sponsor_organisation_name}}',
        await checkSetupSponsorOrganisationPage.getOrgName()
      );
    await expect(sponsorWorkspacePage.mainPageContent.getByText(authorisationsBodyLabel)).toBeVisible();
    const myOrganisationsLabel = sponsorWorkspacePage.sponsorWorkspacePageTestData.Label_Texts.my_organisations_label;
    await expect(sponsorWorkspacePage.mainPageContent.getByText(myOrganisationsLabel)).toBeVisible();
  }
);
