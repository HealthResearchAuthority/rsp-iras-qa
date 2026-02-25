import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I am navigated to the send modification to review body error page',
  async ({ sendModificationToReviewBodyErrorPage }) => {
    await sendModificationToReviewBodyErrorPage.assertOnSendModificationToReviewBodyErrorPage();
  }
);

Then(
  'I validate the field values and labels displayed on the send modification to review body error page',
  async ({ projectDetailsIRASPage, sendModificationToReviewBodyErrorPage }) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();

    const irasIDActual = await sendModificationToReviewBodyErrorPage.iras_id_text.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await sendModificationToReviewBodyErrorPage.short_project_title_text.textContent()
    );
    const modificationErrorMessageActual = confirmStringNotNull(
      await sendModificationToReviewBodyErrorPage.send_modification_to_sponsor_hint_label.textContent()
    );
    const modificationErrorMessageExpected = confirmStringNotNull(
      sendModificationToReviewBodyErrorPage.sendModificationToReviewBodyErrorPageTestData.Label_Texts
        .send_modification_to_reviewbody_hint_label
    );

    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect
      .soft(shortProjectTitleActual.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'))
      .toBe(shortProjectTitleExpected.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'));
    expect.soft(modificationErrorMessageActual).toBe(modificationErrorMessageExpected);
  }
);
