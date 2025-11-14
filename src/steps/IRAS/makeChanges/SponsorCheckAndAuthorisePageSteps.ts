import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { removeUnwantedWhitespace } from '../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then('I can see the sponsor check and authorise page', async ({ sponsorCheckAndAuthorisePage }) => {
  await sponsorCheckAndAuthorisePage.assertOnSponsorCheckAndAuthorisePage();
});

Then(
  'I validate the date created and status in sponsor check and authorise page',
  async ({ sponsorCheckAndAuthorisePage, sponsorAuthorisationsPage }) => {
    const dateCreatedExpected = new Date().toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
    const statusExpected =
      sponsorAuthorisationsPage.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page.withSponsorStatus;
    const dateCreatedActual = await removeUnwantedWhitespace(
      await sponsorCheckAndAuthorisePage.dateCreatedValue.textContent()
    );
    const statusActual = await removeUnwantedWhitespace(await sponsorCheckAndAuthorisePage.statusValue.textContent());
    expect.soft(dateCreatedActual).toBe(dateCreatedExpected);
    expect.soft(statusActual).toBe(statusExpected);
  }
);

Then(
  'I can see the ui labels in sponsor check and authorise page',
  async ({ sponsorCheckAndAuthorisePage, commonItemsPage }) => {
    await expect
      .soft(
        commonItemsPage.page_heading.getByText(
          sponsorCheckAndAuthorisePage.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page
            .overallModificationRankingHeading,
          { exact: true }
        )
      )
      .toBeVisible();
    await expect
      .soft(
        commonItemsPage.page_heading.getByText(
          sponsorCheckAndAuthorisePage.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page
            .overallModificationRankingSubHeading,
          { exact: true }
        )
      )
      .toBeVisible();
    const outcomeBodyActual = await removeUnwantedWhitespace(
      await sponsorCheckAndAuthorisePage.outcomeBodyLabel.textContent()
    );
    const outcomeBodyExpected =
      sponsorCheckAndAuthorisePage.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page.outcomeBody;
    expect.soft(outcomeBodyActual).toBe(outcomeBodyExpected);
  }
);

Then(
  'I fill the sponsor check and authorise page with {string}',
  async ({ commonItemsPage, sponsorCheckAndAuthorisePage }, datasetName: string) => {
    const dataset = sponsorCheckAndAuthorisePage.sponsorCheckAndAuthorisePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, sponsorCheckAndAuthorisePage);
      }
    }
  }
);
