import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then, When } = createBdd(test);

Then('I have navigated to the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.goto();
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});

Then('I can see the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});

Then(
  'I can see the {string} ui labels on the my research project page',
  async ({ commonItemsPage, myResearchProjectsPage }, datasetName: string) => {
    const dataset = myResearchProjectsPage.myResearchProjectsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, myResearchProjectsPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see my research page is sorted by {string} order of the {string}',
  async (
    { myResearchProjectsPage, modificationsReceivedCommonPage, commonItemsPage },
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'short project title':
        columnIndex = 0;
        break;
      case 'iras id':
        columnIndex = 1;
        break;
      case 'date created':
        columnIndex = 2;
        break;
      case 'status':
        columnIndex = 3;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'iras id') {
      sortedList = await myResearchProjectsPage.sortIrasIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date created') {
      sortedList = await modificationsReceivedCommonPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    if (sortedList.map((date) => date.includes('Sept'))) {
      //Only for September month its returning Sept instead Sep. Hence this temporary fix
      const updatedSortedList = sortedList.map((date) => date.replace('Sept', 'Sep'));
      expect(actualList).toEqual(updatedSortedList);
    } else {
      expect(actualList).toEqual(sortedList);
    }
  }
);

Then(
  'I can see the project status as {string} on the my research page',
  async ({ myResearchProjectsPage, projectDetailsIRASPage }, statusValue: string) => {
    const dataset = myResearchProjectsPage.myResearchProjectsPageTestData[statusValue];
    const expectedStatus = dataset.status;
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const projectRecord = await myResearchProjectsPage.getProjectDetails(expectedIrasId);
    const actualIrasId = projectRecord.get('displayedIrasId');
    expect.soft(actualIrasId).toBe(expectedIrasId);
    const actualStatus = projectRecord.get('displayedStatusValue');
    expect.soft(actualStatus).toBe(expectedStatus);
  }
);

Then(
  'I can see the project delete success message on my research page',
  async ({ myResearchProjectsPage, commonItemsPage }) => {
    await expect
      .soft(
        commonItemsPage.alert_box.getByText(
          myResearchProjectsPage.myResearchProjectsPageTestData.My_Research_Projects_Page.success_header_label
        )
      )
      .toBeVisible();
    await expect
      .soft(
        commonItemsPage.alert_box.getByText(
          myResearchProjectsPage.myResearchProjectsPageTestData.My_Research_Projects_Page.project_deleted_message_label
        )
      )
      .toBeVisible();
    expect
      .soft(await commonItemsPage.alert_box.evaluate((e: any) => getComputedStyle(e).getPropertyValue('border-color')))
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await commonItemsPage.alert_box.evaluate((e: any) => getComputedStyle(e).getPropertyValue('background-color'))
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I validate deleted project does not exist in the my research projects list',
  async ({ myResearchProjectsPage, projectDetailsIRASPage, commonItemsPage }) => {
    await myResearchProjectsPage.search_text_box.fill(await projectDetailsIRASPage.getUniqueIrasId());
    await commonItemsPage.clickButton('My_Research_Projects_Page', 'Search');
    await expect
      .soft(
        commonItemsPage.no_matching_search_result_header_label.getByText(
          commonItemsPage.commonTestData.no_results_heading,
          { exact: true }
        )
      )
      .toBeVisible();
    await expect
      .soft(
        commonItemsPage.no_matching_search_result_sub_header_label.getByText(
          commonItemsPage.commonTestData.no_results_guidance_text,
          { exact: true }
        )
      )
      .toBeVisible();
    expect
      .soft((await commonItemsPage.no_results_bullet_points.allTextContents()).map((t) => t.trim()))
      .toEqual(commonItemsPage.commonTestData.no_results_bullet_points);
  }
);

When(
  'I select advanced filters in the my research page using {string}',
  async ({ myResearchProjectsPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = myResearchProjectsPage.myResearchProjectsPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.includes('date')) {
          if (!(await myResearchProjectsPage.date_project_created_from_day_text.isVisible())) {
            await myResearchProjectsPage.date_project_created_from_day_text_chevron.click();
          }
          await commonItemsPage.fillUIComponent(dataset, key, myResearchProjectsPage);
        } else {
          await myResearchProjectsPage[key + '_chevron'].click();
          await commonItemsPage.fillUIComponent(dataset, key, myResearchProjectsPage);
        }
      }
    }
  }
);

When(
  'I can see the results matching the search {string} and filter criteria {string} for my research page',
  async ({ myResearchProjectsPage, commonItemsPage }, searchDatasetName: string, filterDatasetName: string) => {
    const searchCriteriaDataset =
      myResearchProjectsPage.myResearchProjectsPageTestData.Search_Queries[searchDatasetName];
    const filterDataset = myResearchProjectsPage.myResearchProjectsPageTestData.Advanced_Filters[filterDatasetName];
    if (searchDatasetName !== '') {
      await myResearchProjectsPage.validateResults(
        commonItemsPage,
        searchCriteriaDataset,
        filterDataset,
        searchDatasetName,
        true
      );
    }
  }
);

When(
  'I can see the results matching the filter criteria {string} for my research page',
  async ({ myResearchProjectsPage, commonItemsPage }, filterDatasetName: string) => {
    const filterDataset = myResearchProjectsPage.myResearchProjectsPageTestData.Advanced_Filters[filterDatasetName];
    await myResearchProjectsPage.validateResults(commonItemsPage, {}, filterDataset, false);
  }
);

Then(
  'I click on the short project title for the searched iras id from my research projects page',
  async ({ myResearchProjectsPage, projectDetailsIRASPage }) => {
    const shortProjectTitleLabel = await projectDetailsIRASPage.getShortProjectTitle();
    await myResearchProjectsPage.page.getByText(shortProjectTitleLabel, { exact: true }).click();
  }
);
