import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import * as modificationsAssignmentConfirmationPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_assignment_confirmation_page_data.json';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the modifications assignment confirmation page for {string} with reviewer {string}',
  async (
    { modificationsAssignmentConfirmationPage, selectStudyWideReviewerPage },
    roleName: string,
    datasetName: string
  ) => {
    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    await modificationsAssignmentConfirmationPage.assertOnModificationsAssignmentConfirmationPage(roleName);
    const expectedConsent =
      modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page.consentPrefix +
      dataset.study_wide_reviewer_dropdown +
      modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page.consentSuffix;
    const valConsentUI: string | null = await modificationsAssignmentConfirmationPage.consentVal.textContent();
    const actualConsent = await removeUnwantedWhitespace(confirmStringNotNull(valConsentUI));
    expect.soft(actualConsent).toBe(expectedConsent);
  }
);
