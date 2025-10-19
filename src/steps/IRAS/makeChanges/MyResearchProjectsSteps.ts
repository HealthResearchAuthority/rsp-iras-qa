import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

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
