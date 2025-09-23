import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { convertDate } from '../../../../../utils/UtilFunctions';
//import { confirmStringNotNull, convertDate } from '../../../../../utils/UtilFunctions';
//import { expect } from '@playwright/test';

const { Then } = createBdd(test);

Then(
  'I can see the review your document information page',
  async ({ reviewYourDocumentInformationModificationsPage }) => {
    await reviewYourDocumentInformationModificationsPage.assertOnReviewYourDocumentsInformationModificationsPage();
  }
);

Then(
  'I validate the field values {string} displayed in the review your document information page',
  async (
    { commonItemsPage, reviewYourDocumentInformationModificationsPage, addDocumentDetailsModificationsPage },
    datasetName: string
  ) => {
    const dataset = addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[datasetName];
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI();
    const displayedDocumentsList: string[] = displayedDocumentsListMap.get('displayedDocuments');
    for (let i = 0; i < displayedDocumentsList.length; i++) {
      const documentName = displayedDocumentsList[i];
      const trimmedDocumentName = documentName.replace('Add details for ', '').trim();
      const actualDocumentName = await reviewYourDocumentInformationModificationsPage.document_name_text
        .nth(i)
        .textContent();
      expect(trimmedDocumentName).toBe(actualDocumentName);
      for (const key in dataset) {
        if (Object.prototype.hasOwnProperty.call(dataset, key)) {
          if (
            key == 'sponsor_document_day_text' ||
            key == 'sponsor_document_month_dropdown' ||
            key == 'sponsor_document_year_text'
          ) {
            const sponsorDateFormatted = await convertDate(
              dataset.sponsor_document_day_text,
              dataset.sponsor_document_month_dropdown,
              dataset.sponsor_document_year_text
            );
            expect(await reviewYourDocumentInformationModificationsPage.getSponsorDocumentDate()).toBe(
              sponsorDateFormatted
            );
          } else {
            await commonItemsPage.validateUIComponentValues(
              dataset,
              key,
              reviewYourDocumentInformationModificationsPage
            );
          }
        }
      }
    }
  }
);

Then(
  'I click on the change link next to {string} in the add document details for specific document page',
  async (
    { addDocumentDetailsForSpecificDocumentModificationsPage, reviewYourDocumentInformationModificationsPage },
    changeLink: string
  ) => {
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();
    for (let i = 0; i < noOfDocuments; i++) {
      await reviewYourDocumentInformationModificationsPage.clickChangeLink(changeLink);
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
    }
  }
);

Then(
  'I click on the document type change link next to each document and enter new {string} in the add document details for the uploaded documents',
  async (
    {
      addDocumentDetailsForSpecificDocumentModificationsPage,
      reviewYourDocumentInformationModificationsPage,
      commonItemsPage,
    },
    datasetName: string
  ) => {
    const newDocumentType =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetName];
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();

    for (let i = 0; i < noOfDocuments; i++) {
      await reviewYourDocumentInformationModificationsPage.document_type_change_link.nth(i).click();
      for (const key in newDocumentType) {
        if (Object.prototype.hasOwnProperty.call(newDocumentType, key)) {
          await commonItemsPage.fillUIComponent(
            newDocumentType,
            key,
            addDocumentDetailsForSpecificDocumentModificationsPage
          );
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
      const newActualDocumentType = (
        await reviewYourDocumentInformationModificationsPage.document_type_dropdown.textContent()
      ).trim();
      const updatedExpectedDocumentType = newDocumentType.document_type_dropdown;
      expect(newActualDocumentType).toBe(updatedExpectedDocumentType);
    }
  }
);

Then(
  'I click on the document version change link next to each document and enter new {string} in the add document details for the uploaded documents',
  async (
    {
      addDocumentDetailsForSpecificDocumentModificationsPage,
      reviewYourDocumentInformationModificationsPage,
      commonItemsPage,
    },
    datasetName: string
  ) => {
    const newDocumentVersion =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetName];
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();

    for (let i = 0; i < noOfDocuments; i++) {
      await reviewYourDocumentInformationModificationsPage.sponsor_document_version_change_link.nth(i).click();
      for (const key in newDocumentVersion) {
        if (Object.prototype.hasOwnProperty.call(newDocumentVersion, key)) {
          await commonItemsPage.fillUIComponent(
            newDocumentVersion,
            key,
            addDocumentDetailsForSpecificDocumentModificationsPage
          );
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
      const newActualDocumentVersion = (
        await reviewYourDocumentInformationModificationsPage.sponsor_document_version_text.textContent()
      ).trim();
      const updatedExpectedDocumentVersion = newDocumentVersion.sponsor_document_version_text;
      expect(newActualDocumentVersion).toBe(updatedExpectedDocumentVersion);
    }
  }
);

Then(
  'I click on the document previously approved option change link next to each document and enter new {string} in the add document details for the uploaded documents',
  async (
    {
      addDocumentDetailsForSpecificDocumentModificationsPage,
      reviewYourDocumentInformationModificationsPage,
      commonItemsPage,
    },
    datasetName: string
  ) => {
    const newDocumentPreviouslyApprovedValue =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetName];
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();
    for (let i = 0; i < noOfDocuments; i++) {
      await reviewYourDocumentInformationModificationsPage.document_previously_approved_change_link.nth(i).click();
      for (const key in newDocumentPreviouslyApprovedValue) {
        if (Object.prototype.hasOwnProperty.call(newDocumentPreviouslyApprovedValue, key)) {
          await commonItemsPage.fillUIComponent(
            newDocumentPreviouslyApprovedValue,
            key,
            addDocumentDetailsForSpecificDocumentModificationsPage
          );
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
      const previouslyApprovedValueinUI = (
        await reviewYourDocumentInformationModificationsPage.document_previously_approved_radio.textContent()
      ).trim();
      const expectedPreviouslyApprovedValue = newDocumentPreviouslyApprovedValue.document_previously_approved_radio;
      expect(previouslyApprovedValueinUI).toBe(expectedPreviouslyApprovedValue);
    }
  }
);

Then(
  'I click on the document date change link next to each document and enter new {string} and validate if {string} is displayed in the add document details for the uploaded documents',
  async (
    {
      addDocumentDetailsForSpecificDocumentModificationsPage,
      reviewYourDocumentInformationModificationsPage,
      commonItemsPage,
    },
    dataset: string,
    datasetDate: string
  ) => {
    const newDocumentDate =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[dataset];
    const updatedDocumentDate =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetDate];
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();
    for (let i = 0; i < noOfDocuments; i++) {
      await reviewYourDocumentInformationModificationsPage.sponsor_document_date_change_link.nth(i).click();
      for (const key in newDocumentDate) {
        if (Object.prototype.hasOwnProperty.call(newDocumentDate, key)) {
          await commonItemsPage.fillUIComponent(
            newDocumentDate,
            key,
            addDocumentDetailsForSpecificDocumentModificationsPage
          );
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
      const actualDocumentDate = (
        await reviewYourDocumentInformationModificationsPage.sponsor_document_date_text.textContent()
      ).trim();
      const expectedDocumentDate = updatedDocumentDate.sponsor_document_date_text;
      expect(actualDocumentDate).toBe(expectedDocumentDate);
    }
  }
);
