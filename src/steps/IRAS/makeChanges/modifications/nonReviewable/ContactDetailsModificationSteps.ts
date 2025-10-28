import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the contact details modifications page with {string} for {string} action',
  async ({ commonItemsPage, contactDetailsModificationPage }, datasetName: string, action: string) => {
    const dataset = contactDetailsModificationPage.contactDetailsModificationPageTestData[datasetName];
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    const radioKey = 'select_contact_details_to_change_radio';
    if (dataset[radioKey]) {
      await commonItemsPage.fillUIComponent(dataset, radioKey, contactDetailsModificationPage);
      await commonItemsPage.clickButton('Modifications_Page', clickAction);
    }
    const contactKeys = [
      'chief_investigator_email_text',
      'sponsor_contact_email_text',
      'contact_name_text',
      'contact_email_text',
    ];
    for (const key of contactKeys) {
      if (dataset[key]) {
        await commonItemsPage.fillUIComponent(dataset, key, contactDetailsModificationPage);
      }
    }
  }
);

Then(
  'I keep note of the individual and overall ranking of contact details change created using {string} and {string} dataset',
  async (
    { contactDetailsModificationPage, modificationsCommonPage, reseachLocationsPage },
    datasetName,
    datasetNameResearchLocation
  ) => {
    const changeDataset = contactDetailsModificationPage.contactDetailsModificationPageTestData[datasetName];
    const researchLocationDataset = reseachLocationsPage.researchLocationsPageTestData[datasetNameResearchLocation];
    await modificationsCommonPage.calculateAndStoreRankingForChangesForNonApplicability(
      datasetName,
      changeDataset,
      researchLocationDataset
    );
    await modificationsCommonPage.calculateAndStoreOverallRanking();
  }
);

Then(
  'I click enter link displayed on review your answers page for contact details modification for {string}',
  async ({ contactDetailsModificationPage }, datasetName) => {
    switch (datasetName) {
      case 'Select_Details_To_Change': {
        await contactDetailsModificationPage.page
          .getByText(
            contactDetailsModificationPage.contactDetailsModificationPageTestData.Label_Texts
              .select_contact_detail_enter_link
          )
          .click();
        break;
      }
      case 'Chief_Investigator_Email': {
        await contactDetailsModificationPage.page
          .getByText(
            contactDetailsModificationPage.contactDetailsModificationPageTestData.Label_Texts
              .chief_investigator_enter_link
          )
          .click();
        break;
      }
      case 'Sponsor_Contact_Email': {
        await contactDetailsModificationPage.page
          .getByText(
            contactDetailsModificationPage.contactDetailsModificationPageTestData.Label_Texts.sponsor_contact_enter_link
          )
          .click();
        break;
      }
      case 'Other_Contact_Name': {
        await contactDetailsModificationPage.page
          .getByText(
            contactDetailsModificationPage.contactDetailsModificationPageTestData.Label_Texts
              .other_contact_name_enter_link
          )
          .click();
        break;
      }
      case 'Other_Contact_Email': {
        await contactDetailsModificationPage.page
          .getByText(
            contactDetailsModificationPage.contactDetailsModificationPageTestData.Label_Texts
              .other_contact_email_enter_link
          )
          .click();
        break;
      }
    }
  }
);

Then(
  'I validate the review modifications page for contact details using {string} dataset',
  async ({ contactDetailsModificationPage, modificationReviewChangesPage }, datasetName) => {
    const dataset = contactDetailsModificationPage.contactDetailsModificationPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        switch (key) {
          case 'select_contact_details_to_change_radio': {
            await expect.soft(modificationReviewChangesPage.select_details_to_change_value).toHaveText(dataset[key]);
            break;
          }
          case 'chief_investigator_email_text': {
            await expect.soft(modificationReviewChangesPage.chief_investigator_email_value).toHaveText(dataset[key]);
            break;
          }
          case 'sponsor_contact_email_text': {
            await expect.soft(modificationReviewChangesPage.sponsor_contact_email_value).toHaveText(dataset[key]);
            break;
          }
          case 'contact_name_text': {
            await expect.soft(modificationReviewChangesPage.name_text_value).toHaveText(dataset[key]);
            break;
          }
          case 'contact_email_text': {
            await expect.soft(modificationReviewChangesPage.email_text_value).toHaveText(dataset[key]);
            break;
          }
        }
      }
    }
  }
);
