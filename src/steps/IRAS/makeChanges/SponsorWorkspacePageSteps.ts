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
    await expect.soft(sponsorWorkspacePage.mainPageContent.getByText(authorisationsBodyLabel)).toBeVisible();
    const myOrganisationsLabel = sponsorWorkspacePage.sponsorWorkspacePageTestData.Label_Texts.my_organisations_label;
    await expect.soft(sponsorWorkspacePage.mainPageContent.getByText(myOrganisationsLabel)).toBeVisible();
  }
);

Then(
  'I click the {string} link on the sponsor workspace page',
  async ({ setupNewSponsorOrganisationPage }, datasetName: string) => {
    const dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        datasetName
      ];
    const linkName = dataset.sponsor_organisation_text;
    const link = setupNewSponsorOrganisationPage.page.getByRole('link', { name: linkName });
    await link.waitFor({ state: 'attached', timeout: 3000 }).catch(() => {});
    const count = await link.count();
    if (count > 0) {
      await link.click();
    }
  }
);
