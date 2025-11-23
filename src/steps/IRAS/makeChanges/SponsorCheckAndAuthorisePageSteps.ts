import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then('I can see the sponsor check and authorise page', async ({ sponsorCheckAndAuthorisePage }) => {
  await sponsorCheckAndAuthorisePage.assertOnSponsorCheckAndAuthorisePage();
});

Then(
  'I validate the date created for modification in sponsor check and authorise page',
  async ({ modificationsCommonPage }) => {
    const dateCreatedExpected = new Date().toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
    const dateCreatedActual = await removeUnwantedWhitespace(
      await modificationsCommonPage.dateCreatedValue.textContent()
    );
    expect.soft(dateCreatedActual).toBe(dateCreatedExpected);
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

Then(
  'I validate all fields on modification page using {string} for collapsed view and by expanding the view details',
  async ({ modificationsCommonPage, commonItemsPage, projectDetailsIRASPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset).reverse();
    // Headings assertions
    expect.soft(modificationsCommonPage.overall_modification_ranking_sub_heading).toBeVisible();
    expect.soft(modificationsCommonPage.ranking_sub_heading).toBeVisible();
    // Get actual values
    const actualValuesArray = await modificationsCommonPage.getActualFieldValuesOnModificationPage(
      modificationsCommonPage.allChangeCards,
      changesDataset,
      changeNames
    );
    // Loop through each change and assert
    for (let index = 0; index < actualValuesArray.length; index++) {
      const changeName = changeNames[index];
      const expectedData = changesDataset[changeName];
      for (const key of Object.keys(expectedData)) {
        const expectedValues = await modificationsCommonPage.getExpectedValues(expectedData, key, index);
        expect.soft(actualValuesArray[index].individualChangeStatus).toBe(expectedValues.expectedChangeStatus);
        expect
          .soft(actualValuesArray[index].areaOfChangeSubHeading)
          .toBe(expectedValues.expectedAreaOfChangeSubHeading);
        if (expectedValues.expectedSpecificChangeValue) {
          expect.soft(actualValuesArray[index].specificChangeValue).toBe(expectedValues.expectedSpecificChangeValue);
        }
      }
    }
    for (const changeName of changeNames) {
      const expectedData = changesDataset[changeName];
      const cardTitle = `${expectedData.area_of_change_dropdown}`;
      await modificationsCommonPage.page
        .getByText(cardTitle)
        .locator('..')
        .getByText(modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.ViewDetailsLink)
        .first()
        .click();
      await modificationsCommonPage.validateRankingForIndividualChange(changeName);
      const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
      const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
      const modificationIDExpected = modificationsCommonPage.getModificationID();
      const irasIDActual = await modificationsCommonPage.iras_id_value.textContent();
      const shortProjectTitleActual = confirmStringNotNull(
        await modificationsCommonPage.short_project_title_value.textContent()
      );
      const modificationIDActual = confirmStringNotNull(
        await modificationsCommonPage.modification_id_value.textContent()
      );
      expect.soft(irasIDActual).toBe(irasIDExpected);
      expect.soft(shortProjectTitleActual).toBe(shortProjectTitleExpected);
      expect.soft(modificationIDActual).toBe(modificationIDExpected);
      const expectedStatus =
        modificationsCommonPage.modificationsCommonPageTestData.Modification_Status_With_Sponsor.status;
      const actualStatus = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
      expect.soft(actualStatus).toBe(expectedStatus);
      const dateCreatedExpected = new Date().toLocaleDateString('en-GB', {
        day: 'numeric',
        month: 'long',
        year: 'numeric',
      });
      const dateCreatedActual = await removeUnwantedWhitespace(
        await modificationsCommonPage.dateCreatedValue.textContent()
      );
      expect.soft(dateCreatedActual).toBe(dateCreatedExpected);
      const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
        cardTitle,
        cardTitle,
        expectedData
      );
      modificationsCommonPage.validateCardData(expectedData, actualData.cardData);
      await commonItemsPage.clickButton('Modifications_Page', 'Return_To_Modification');
      await commonItemsPage.clickLink('Sponsor_Check_And_Authorise_Page', 'Modification_Details');
    }
  }
);
