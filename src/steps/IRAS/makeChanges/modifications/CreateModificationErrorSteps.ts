import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the create modification error page', async ({ createModificationErrorPage }) => {
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
    const errorMessageOneActual = confirmStringNotNull(
      await createModificationErrorPage.error_message_line_one.textContent()
    );
    const errorMessageOneExpected = confirmStringNotNull(
      createModificationErrorPage.createModificationErrorPageTestData.Label_Texts.create_modification_error_line_one
    );

    const errorMessageTwoActual = confirmStringNotNull(
      await createModificationErrorPage.error_message_line_two.textContent()
    );
    const errorMessageTwoExpected = confirmStringNotNull(
      createModificationErrorPage.createModificationErrorPageTestData.Label_Texts.create_modification_error_line_two
    );

    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect
      .soft(shortProjectTitleActual.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'))
      .toBe(shortProjectTitleExpected.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'));
    expect.soft(errorMessageOneActual).toBe(errorMessageOneExpected);
    expect.soft(errorMessageTwoActual).toBe(errorMessageTwoExpected);
  }
);
