import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the send modification to sponsor error page', async ({ sendModificationToSponsorErrorPage }) => {
  await sendModificationToSponsorErrorPage.assertOnSendModificationToSponsorErrorPage();
});

Then(
  'I validate the field values and labels displayed on the send modification to sponsor error page',
  async ({ projectDetailsIRASPage, sendModificationToSponsorErrorPage }) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();

    const irasIDActual = await sendModificationToSponsorErrorPage.iras_id_text.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await sendModificationToSponsorErrorPage.short_project_title_text.textContent()
    );
    const modificationErrorMessageActual = confirmStringNotNull(
      await sendModificationToSponsorErrorPage.send_modification_to_sponsor_hint_label.textContent()
    );
    const modificationErrorMessageExpected = confirmStringNotNull(
      sendModificationToSponsorErrorPage.sendModificationErrorPageTestData.Label_Texts
        .send_modification_to_sponsor_hint_label
    );

    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect
      .soft(shortProjectTitleActual.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'))
      .toBe(shortProjectTitleExpected.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'));
    expect.soft(modificationErrorMessageActual).toBe(modificationErrorMessageExpected);
  }
);
