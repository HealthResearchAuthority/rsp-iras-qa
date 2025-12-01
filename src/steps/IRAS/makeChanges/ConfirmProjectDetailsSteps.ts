import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { removeUnwantedWhitespace, confirmStringNotNull } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the confirm project details page', async ({ confirmProjectDetailsPage }) => {
  await confirmProjectDetailsPage.assertOnConfirmProjectDetailsPage();
});

Then(
  'I confirm the values displayed in the confirm project details page',
  async ({ projectDetailsIRASPage, confirmProjectDetailsPage }) => {
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const actualIrasId = confirmStringNotNull(await confirmProjectDetailsPage.iras_id_row.textContent());
    const actualIrasIdUpdated = actualIrasId
      .replace(confirmProjectDetailsPage.confirmProjectDetailsPageTestData.Label_Texts.iras_id_label, '')
      .trim();
    const expectedShortProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
    const actualShortProjectTitle = confirmStringNotNull(
      (await confirmProjectDetailsPage.short_project_title_row.textContent())
        ?.replace(/[’‘]/g, "'")
        .replace(/[“”]/g, '"')
    );
    const actualShortProjectTitleUpdated = await removeUnwantedWhitespace(
      actualShortProjectTitle
        .replace(confirmProjectDetailsPage.confirmProjectDetailsPageTestData.Label_Texts.short_project_label, '')
        .trimEnd()
    );
    const expectedFullProjectTitle = (await projectDetailsIRASPage.getFullProjectTitle()).trimEnd();
    const actualFullProjectTitle = confirmStringNotNull(
      (await confirmProjectDetailsPage.full_project_title_row.textContent())
        ?.replace(/[’‘]/g, "'")
        .replace(/[“”]/g, '"')
    );
    const actualFullProjectTitleUpdated = await removeUnwantedWhitespace(
      actualFullProjectTitle
        .replace(confirmProjectDetailsPage.confirmProjectDetailsPageTestData.Label_Texts.full_project_label, '')
        .trimEnd()
    );
    expect.soft(actualIrasIdUpdated).toBe(expectedIrasId);
    expect.soft(actualShortProjectTitleUpdated).toBe(expectedShortProjectTitle);
    expect.soft(actualFullProjectTitleUpdated).toBe(expectedFullProjectTitle);
  }
);
