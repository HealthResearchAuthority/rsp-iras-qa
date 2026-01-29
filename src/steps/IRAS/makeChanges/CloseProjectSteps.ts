import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../hooks/CustomFixtures';
import { removeUnwantedWhitespace } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the close project page', async ({ closeProjectPage }) => {
  await closeProjectPage.assertOnCloseProjectPage();
});

Then('I validate project cannot be closed error message', async ({ closeProjectPage }) => {
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Cant_Close_Project_Error.cant_close_project_error_label,
        { exact: true }
      )
    )
    .toBeVisible();
});

Then('I can see the ui labels on the close project page', async ({ closeProjectPage }) => {
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page.close_project_planned_project_end_date_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page
          .close_project_actual_project_closure_date_hint_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_day_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page
          .close_project_actual_project_closure_date_month_label,
        { exact: true }
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page
          .close_project_actual_project_closure_date_year_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page.close_project_now_send_to_sponsor_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      closeProjectPage.page.getByText(
        closeProjectPage.closeProjectPageTestData.Close_Project_Page.close_project_now_send_to_sponsor_hint_label
      )
    )
    .toBeVisible();
});

Then(
  'I validate the planned project end date in close project page using {string} dataset',
  async ({ closeProjectPage, projectDetailsTitlePage }, datasetName) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const currentPlannedEndDateExpected =
      dataset.planned_project_end_day_text +
      ' ' +
      dataset.planned_project_end_month_dropdown +
      ' ' +
      dataset.planned_project_end_year_text;
    await expect.soft(closeProjectPage.planned_end_date_label.getByText(currentPlannedEndDateExpected)).toBeVisible();
  }
);

Then(
  'I fill the close project page with {string}',
  async ({ commonItemsPage, closeProjectPage }, datasetName: string) => {
    const dataset = closeProjectPage.closeProjectPageTestData[datasetName];
    let actualClosureDate: any;
    if (datasetName === 'Valid_Date_Today') {
      const todayDate = new Date();
      actualClosureDate =
        todayDate.getDate().toString() +
        ' ' +
        todayDate.toLocaleString('en-US', { month: 'long' }) +
        ' ' +
        todayDate.getFullYear().toString();
      await closeProjectPage.close_project_actual_project_closure_date_day_textbox.fill(todayDate.getDate().toString());
      await closeProjectPage.close_project_actual_project_closure_date_month_dropdown.selectOption(
        todayDate.toLocaleString('en-US', { month: 'long' })
      );
      await closeProjectPage.close_project_actual_project_closure_date_year_textbox.fill(
        todayDate.getFullYear().toString()
      );
    } else {
      actualClosureDate =
        dataset.close_project_actual_project_closure_date_day_textbox +
        ' ' +
        dataset.close_project_actual_project_closure_date_month_dropdown +
        ' ' +
        dataset.close_project_actual_project_closure_date_year_textbox;
      for (const key in dataset) {
        if (Object.hasOwn(dataset, key)) {
          await commonItemsPage.fillUIComponent(dataset, key, closeProjectPage);
        }
      }
    }
    closeProjectPage.setProjectClosureDate(actualClosureDate);
  }
);

Then(
  'I {string} the project closure transaction details along with the {string} user and {string} status',
  async (
    { closeProjectPage, loginPage, projectDetailsIRASPage },
    action: string,
    userDatasetName: string,
    projectStatus: string
  ) => {
    if (action.toLowerCase() === 'keep note of') {
      const transactionID =
        'C' + (await projectDetailsIRASPage.getUniqueIrasId()) + '/' + ++closeProjectPage.transactionCount;
      closeProjectPage.setProjectClosureTransactionID(transactionID);
      const dateOfProjectClosure = new Date(await closeProjectPage.getProjectClosureDate()).toLocaleDateString(
        'en-GB',
        {
          day: 'numeric',
          month: 'short',
          year: 'numeric',
        }
      );
      const userEmail = loginPage.loginPageTestData[userDatasetName].username.toLowerCase();
      const dateSubmitted = new Date().toLocaleString('en-GB', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
      });
      const status = projectStatus;
      closeProjectPage.setProjectClosureTransactionDetailsRecord = {
        transactionID: transactionID,
        dateOfProjectClosure: dateOfProjectClosure,
        userEmail: userEmail,
        dateSubmitted: dateSubmitted,
        status: status,
      };
    } else if (action.toLowerCase() === 'update status of') {
      const transactionIDToUpdate = await closeProjectPage.getProjectClosureTransactionID();
      const record = closeProjectPage.projectClosureTransactionDetails.find(
        (r) => r.transactionID === transactionIDToUpdate
      );
      if (record) {
        record.status = projectStatus;
      }
    }
  }
);

Then('I validate the project closure transaction table', async ({ closeProjectPage }) => {
  const projectClosureTableHeadersActual = await Promise.all(
    (await closeProjectPage.projectClosureTransactionTableHeader.allTextContents()).map(
      async (header) => await removeUnwantedWhitespace(header)
    )
  );
  const projectClosureTableHeadersExpected =
    closeProjectPage.closeProjectPageTestData.Close_Project_Page.project_closure_transaction_table_headers;
  expect.soft(projectClosureTableHeadersActual).toEqual(projectClosureTableHeadersExpected);
  const rowCount = await closeProjectPage.projectClosureTransactionTableBodyRows.count();
  const actualProjectClosureTransactionRows: string[][] = [];
  for (
    let projectClosureTransactionRowIndex = 0;
    projectClosureTransactionRowIndex < rowCount;
    projectClosureTransactionRowIndex++
  ) {
    const row = closeProjectPage.projectClosureTransactionTableBodyRows.nth(projectClosureTransactionRowIndex);
    const cellTexts = await row.locator(closeProjectPage.tableCell).allTextContents();
    actualProjectClosureTransactionRows.push(cellTexts.map((text) => text.trim()));
  }
  const expectedProjectClosureTransactionRows = closeProjectPage.getProjectClosureTransactionDetailsRecord
    .slice()
    .map((record) => [
      record.transactionID,
      record.dateOfProjectClosure,
      record.userEmail,
      record.dateSubmitted,
      record.status,
    ]);
  expect.soft(actualProjectClosureTransactionRows).toEqual(expectedProjectClosureTransactionRows);
});
