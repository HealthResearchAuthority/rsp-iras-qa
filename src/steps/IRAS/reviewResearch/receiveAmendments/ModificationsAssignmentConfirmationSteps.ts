import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import * as modificationsAssignmentConfirmationPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_assignment_confirmation_page_data.json';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the modifications assignment confirmation page for {string}',
  async ({ modificationsAssignmentConfirmationPage, selectStudyWideReviewerPage }, datasetName: string) => {
    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    await modificationsAssignmentConfirmationPage.assertOnModificationsAssignmentConfirmationPage();
    const expectedConsent =
      dataset.study_wide_reviewer_dropdown +
      modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page.consent;
    const valConsentUI: string | null = await modificationsAssignmentConfirmationPage.consentVal.textContent();
    const actualConsent = await removeUnwantedWhitespace(confirmStringNotNull(valConsentUI));
    expect(actualConsent).toBe(expectedConsent);
  }
);
