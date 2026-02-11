import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I am navigated to the create modification error page', async ({ createModificationErrorPage }) => {
  await createModificationErrorPage.assertOnCreateModificationErrorPage();
});

Then(
  'I validate the field values and labels displayed on the create modification error page',
  async ({ projectDetailsIRASPage, createModificationErrorPage }) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();

    const irasIDActual = await createModificationErrorPage.iras_id_text.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await createModificationErrorPage.short_project_title_text.textContent()
    );
    const errorMessageActual = confirmStringNotNull(
      await createModificationErrorPage.create_modification_hint_label.textContent()
    );
    const errorMessageExpected = confirmStringNotNull(
      createModificationErrorPage.createModificationErrorPageTestData.Label_Texts.create_modification_hint_label
    );

    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect
      .soft(shortProjectTitleActual.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'))
      .toBe(shortProjectTitleExpected.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'));
    expect.soft(errorMessageActual).toBe(errorMessageExpected);
  }
);
