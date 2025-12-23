import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import {
  confirmStringNotNull,
  removeUnwantedWhitespace,
  convertDate,
  normalizeUiText,
} from '../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then('I can see the sponsor check and authorise page', async ({ sponsorCheckAndAuthorisePage }) => {
  await sponsorCheckAndAuthorisePage.assertOnSponsorCheckAndAuthorisePage();
});

Then(
  'I validate the date created for modification in sponsor check and authorise page',
  async ({ modificationsCommonPage }) => {
    const dateCreatedExpected = new Intl.DateTimeFormat('en-GB', {
      day: '2-digit',
      month: 'long',
      year: 'numeric',
    }).format(new Date());
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
    await await expect.soft(modificationsCommonPage.overall_modification_summary_heading).toBeVisible();
    await expect.soft(modificationsCommonPage.ranking_sub_heading).toBeVisible();
    const actualValuesArray = await modificationsCommonPage.getActualFieldValuesOnModificationPage(
      modificationsCommonPage.allChangeCards,
      changesDataset,
      changeNames
    );
    for (let index = 0; index < actualValuesArray.length; index++) {
      const changeName = changeNames[index];
      const expectedData = changesDataset[changeName];
      const keysString = Object.keys(expectedData).join(', ');
      const expectedValues = await modificationsCommonPage.getExpectedValues(expectedData, keysString, index);
      expect.soft(actualValuesArray[index].areaOfChangeSubHeading).toBe(expectedValues.expectedAreaOfChangeSubHeading);
      expect.soft(actualValuesArray[index].specificChangeValue).toBe(expectedValues.expectedSpecificChangeValue);
    }
    let changeIndex = 0;
    for (const changeName of changeNames) {
      const expectedData = changesDataset[changeName];
      const cardTitle = `${expectedData.area_of_change_dropdown}`;
      const eachChangeHeading = `Change ${changeIndex + 1} - ${cardTitle}`;
      await modificationsCommonPage.page
        .getByText(eachChangeHeading)
        .locator('..')
        .getByText(modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.ViewDetailsLink)
        .first()
        .click();
      await modificationsCommonPage.validateRankingForIndividualChange(changeName);
      const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
      const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
      const modificationIDExpected = await modificationsCommonPage.getModificationID();
      const irasIDActual = await modificationsCommonPage.iras_id_value.textContent();
      const shortProjectTitleActual = confirmStringNotNull(
        await modificationsCommonPage.short_project_title_value.textContent()
      );
      const normalizedshortProjectTitleActual = normalizeUiText(shortProjectTitleActual);
      const modificationIDActual = confirmStringNotNull(
        await modificationsCommonPage.modification_id_value.textContent()
      );
      expect.soft(irasIDActual).toBe(irasIDExpected);
      expect.soft(normalizedshortProjectTitleActual).toBe(shortProjectTitleExpected);
      expect.soft(modificationIDActual).toBe(modificationIDExpected);
      const expectedStatus =
        modificationsCommonPage.modificationsCommonPageTestData.Modification_Status_With_Sponsor.status;
      const actualStatus = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
      expect.soft(actualStatus).toBe(expectedStatus);
      const dateCreatedExpected = new Intl.DateTimeFormat('en-GB', {
        day: '2-digit',
        month: 'long',
        year: 'numeric',
      }).format(new Date());
      const dateCreatedActual = await removeUnwantedWhitespace(
        await modificationsCommonPage.dateCreatedValue.textContent()
      );
      expect.soft(dateCreatedActual).toBe(dateCreatedExpected);
      const actualDataAll = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
        cardTitle,
        expectedData
      );
      const actualData = actualDataAll.cardData;
      const keysString = Object.keys(expectedData).join(', ');
      if (keysString.toLowerCase().includes('free_text')) {
        actualData['specific_change_dropdown'] = expectedData['specific_change_dropdown'];
      } else if (keysString.toLowerCase().includes('end_year')) {
        const actualPlannedEndDate = await convertDate(
          expectedData['planned_project_end_day_text'],
          expectedData['planned_project_end_month_dropdown'],
          expectedData['planned_project_end_year_text']
        );
        expectedData['specific_change_dropdown'] = actualPlannedEndDate;
        actualData['specific_change_dropdown'] = actualPlannedEndDate;
      } else if (
        keysString.toLowerCase().includes('select_details_to_change_radio') ||
        keysString.toLowerCase().includes('select_contact_details_to_change_radio') ||
        keysString.toLowerCase().includes('project_reference_numbers_radio') ||
        keysString.toLowerCase().includes('title_radio')
      ) {
        actualData['specific_change_dropdown'] = expectedData['specific_change_dropdown'];
      }
      const excludeKeys = new Set(['change_status']);
      const filteredExpectedData = Object.fromEntries(
        Object.entries(expectedData).filter(([key]) => !excludeKeys.has(key))
      );
      await modificationsCommonPage.validateCardData(filteredExpectedData, actualData);
      await commonItemsPage.clickButton('Modifications_Page', 'Return_To_Modification');
      await commonItemsPage.clickLink('Sponsor_Check_And_Authorise_Page', 'Modification_Details');
      changeIndex++;
    }
  }
);
