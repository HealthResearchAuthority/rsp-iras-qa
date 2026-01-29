import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the check and authorise project closure page', async ({ checkAuthoriseProjectClosurePage }) => {
  await checkAuthoriseProjectClosurePage.assertOnCheckAuthoriseProjectClosurePage();
});

Then(
  'I validate the planned project end date and actual project closure date in check and authorise project closure page using {string} dataset',
  async ({ checkAuthoriseProjectClosurePage, closeProjectPage, projectDetailsTitlePage }, datasetName) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const plannedEndDateExpected =
      dataset.planned_project_end_day_text +
      ' ' +
      dataset.planned_project_end_month_dropdown +
      ' ' +
      dataset.planned_project_end_year_text;
    const actualClosureDateExpected = await closeProjectPage.getProjectClosureDate();
    await expect
      .soft(checkAuthoriseProjectClosurePage.planned_end_date_label.getByText(plannedEndDateExpected))
      .toBeVisible();
    await expect
      .soft(checkAuthoriseProjectClosurePage.actual_closure_date_label.getByText(actualClosureDateExpected))
      .toBeVisible();
  }
);

Then(
  'I can see the ui labels on the check and authorise project closure page',
  async ({ checkAuthoriseProjectClosurePage }) => {
    await expect
      .soft(
        checkAuthoriseProjectClosurePage.page.getByText(
          checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
            .iras_id_label,
          { exact: true }
        )
      )
      .toBeVisible();
    await expect
      .soft(
        checkAuthoriseProjectClosurePage.page.getByText(
          checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
            .short_project_title_label,
          { exact: true }
        )
      )
      .toBeVisible();
    await expect
      .soft(
        checkAuthoriseProjectClosurePage.page.getByText(
          checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
            .sub_heading,
          { exact: true }
        )
      )
      .toBeVisible();
    await expect
      .soft(
        checkAuthoriseProjectClosurePage.page.getByText(
          checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
            .guidance_body
        )
      )
      .toBeVisible();
  }
);

Then(
  'I fill the check and authorise project closure page with {string}',
  async ({ commonItemsPage, checkAuthoriseProjectClosurePage }, datasetName: string) => {
    const dataset = checkAuthoriseProjectClosurePage.checkAuthoriseProjectClosurePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, checkAuthoriseProjectClosurePage);
      }
    }
  }
);
