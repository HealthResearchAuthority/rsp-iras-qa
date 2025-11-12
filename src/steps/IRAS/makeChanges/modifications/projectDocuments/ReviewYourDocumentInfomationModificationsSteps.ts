import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { convertDate } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the review your document information page',
  async ({ reviewYourDocumentInformationModificationsPage }) => {
    await reviewYourDocumentInformationModificationsPage.assertOnReviewYourDocumentsInformationModificationsPage();
  }
);

Then(
  'I can see document type guidance text next to each document type',
  async ({ reviewYourDocumentInformationModificationsPage }) => {
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();
    for (let i = 0; i < noOfDocuments; i++) {
      const expectedDocumentTypeGuidanceText =
        reviewYourDocumentInformationModificationsPage.reviewYourDocumentInfomationModificationsPageTestData
          .Review_Your_Document_Information.document_type_guidance_text;
      const actualDocumentTypeGuidanceText =
        await reviewYourDocumentInformationModificationsPage.document_type_guidance_text.nth(i).textContent();
      const trimmedDocumentTypeGuidanceText = actualDocumentTypeGuidanceText.replace('Document type', '').trim();
      expect(trimmedDocumentTypeGuidanceText).toBe(expectedDocumentTypeGuidanceText);
    }
  }
);

Then(
  'I select a document type {string} and validate the changes in review your information page',
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
      await reviewYourDocumentInformationModificationsPage.document_type_guidance_text.nth(0).click();
      for (const key in newDocumentType) {
        if (Object.hasOwn(newDocumentType, key)) {
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
      const updatedExpectedDocumentType = await newDocumentType.document_type_dropdown;
      expect.soft(newActualDocumentType).toBe(updatedExpectedDocumentType);
    }
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
      const trimmedActualDocumentName = actualDocumentName.trim();
      expect.soft(trimmedDocumentName).toBe(trimmedActualDocumentName);
      for (const key in dataset) {
        if (Object.hasOwn(dataset, key)) {
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
            expect
              .soft(await reviewYourDocumentInformationModificationsPage.getSponsorDocumentDate())
              .toBe(sponsorDateFormatted);
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
  'I click on the {string} change link next to each document and click on save changes without making any change in the add document details for the uploaded documents page',
  async (
    {
      addDocumentDetailsForSpecificDocumentModificationsPage,
      reviewYourDocumentInformationModificationsPage,
      commonItemsPage,
    },
    changeLink: string
  ) => {
    const noOfDocuments = await reviewYourDocumentInformationModificationsPage.getNumberOfDocuments();
    for (let i = 0; i < noOfDocuments; i++) {
      switch (changeLink.trim().toLowerCase()) {
        case 'document_type':
          await reviewYourDocumentInformationModificationsPage.document_type_change_link.nth(i).click();
          break;
        case 'document_version':
          await reviewYourDocumentInformationModificationsPage.sponsor_document_version_change_link.nth(i).click();
          break;
        case 'document_date':
          await reviewYourDocumentInformationModificationsPage.sponsor_document_date_change_link.nth(i).click();
          break;
        case 'previously_approved':
          await commonItemsPage.page.waitForTimeout(500);
          await reviewYourDocumentInformationModificationsPage.document_previously_approved_change_link.nth(i).click();
          break;
        default:
          throw new Error(`${changeLink} is not a valid option`);
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
    }
  }
);

Then(
  'I click on the document type change link next to each document and enter new {string} in the add document details for the uploaded documents page',
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
        if (Object.hasOwn(newDocumentType, key)) {
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
      const updatedExpectedDocumentType = await newDocumentType.document_type_dropdown;
      expect.soft(newActualDocumentType).toBe(updatedExpectedDocumentType);
    }
  }
);

Then(
  'I click on the document version change link next to each document and enter new {string} in the add document details for the uploaded documents page',
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
        if (Object.hasOwn(newDocumentVersion, key)) {
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
      const updatedExpectedDocumentVersion = await newDocumentVersion.sponsor_document_version_text;
      expect.soft(newActualDocumentVersion).toBe(updatedExpectedDocumentVersion);
    }
  }
);

Then(
  'I click on the document previously approved option change link next to each document and enter new {string} in the add document details for the uploaded documents page',
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
        if (Object.hasOwn(newDocumentPreviouslyApprovedValue, key)) {
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
      await commonItemsPage.page.waitForTimeout(500);
      const expectedPreviouslyApprovedValue =
        await newDocumentPreviouslyApprovedValue.document_previously_approved_radio;
      expect.soft(previouslyApprovedValueinUI).toBe(expectedPreviouslyApprovedValue);
    }
  }
);

Then(
  'I click on the document date change link next to each document and enter new {string} and validate if {string} is displayed in the add document details for the uploaded documents page',
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
    for (let index = 0; index < noOfDocuments; index++) {
      await reviewYourDocumentInformationModificationsPage.sponsor_document_date_change_link.nth(index).click();
      for (const key of Object.keys(newDocumentDate)) {
        await commonItemsPage.fillUIComponent(
          newDocumentDate,
          key,
          addDocumentDetailsForSpecificDocumentModificationsPage
        );
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_changes.click();
      if (updatedDocumentDate?.textContent === undefined) {
        break;
      }
      const actualDocumentDate = (
        await reviewYourDocumentInformationModificationsPage.sponsor_document_date_text.textContent()
      ).trim();
      const expectedDocumentDate = updatedDocumentDate.sponsor_document_date_text;
      expect.soft(actualDocumentDate).toBe(expectedDocumentDate);
    }
  }
);

Then(
  'I validate the error {string} displayed on {string}',
  async ({ commonItemsPage, reviewYourDocumentInformationModificationsPage }, errorKey: string, pageKey: string) => {
    const specialErrors = [
      'Missing_Mandatory_Question_Previously_Approved_Error',
      'Missing_Mandatory_Question_Previously_Approved_Document_Version_Date_Error',
    ];

    const isSpecialCase = specialErrors.includes(errorKey);

    const page =
      pageKey === 'Review_Your_Document_Infomation_Modifications_Page'
        ? reviewYourDocumentInformationModificationsPage
        : null;

    const errorDataset = page?.reviewYourDocumentInfomationModificationsPageTestData?.[errorKey];

    if (!errorDataset || !page) {
      throw new Error(`Invalid pageKey or dataset name: ${pageKey}, ${errorKey}`);
    }

    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();

    const stringifyValues = (values: any[]) =>
      values.map((val) => (typeof val === 'object' ? JSON.stringify(val) : val)).join(', ');

    const expectedSummaryErrors = isSpecialCase
      ? stringifyValues(Object.values(errorDataset))
      : Object.values(errorDataset);

    const actualSummaryErrors = isSpecialCase
      ? stringifyValues(await commonItemsPage.getSummaryErrorMessages())
      : await commonItemsPage.getSummaryErrorMessages();

    expect.soft(actualSummaryErrors).toEqual(expectedSummaryErrors);

    for (const [key, expectedFieldError] of Object.entries(errorDataset)) {
      const actualFieldError =
        await reviewYourDocumentInformationModificationsPage.getFieldErrorMessagesReviewInformation(key, page);

      expect.soft(actualFieldError).toEqual(expectedFieldError);

      const element = await commonItemsPage.clickErrorSummaryLink(errorDataset, key, page);
      await expect(element).toBeInViewport();

      await reviewYourDocumentInformationModificationsPage.setFieldErrorMessage(actualFieldError);
    }
  }
);

Then(
  'I click the error displayed on {string}',
  async ({ reviewYourDocumentInformationModificationsPage }, pageKey: string) => {
    let page: any;
    if (pageKey === 'Review_Your_Document_Infomation_Modifications_Page') {
      page = reviewYourDocumentInformationModificationsPage;
    }
    const fieldErrorMessage = await page.getFieldErrorMessage();
    await reviewYourDocumentInformationModificationsPage.page
      .getByRole('link', { name: fieldErrorMessage })
      .nth(1)
      .click();
  }
);
