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
  'I click the {string} link on the my research page',
  async ({ myResearchProjectsPage, projectDetailsTitlePage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const shortProjectTitleData = dataset.short_project_title_text;
    const irasidData = await projectDetailsIRASPage.getUniqueIrasId();
    const foundRecords = await myResearchProjectsPage.findProjectLink(shortProjectTitleData, irasidData);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await foundRecords.locator(myResearchProjectsPage.titlelink).click();
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
