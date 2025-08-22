import { expect, Locator, Page } from '@playwright/test';
import * as myResearchProjectsPageTestData from '../../../resources/test_data/iras/make_changes/my_research_projects_data.json';
import * as buttonTextData from '../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class MyResearchProjectsPage {
  readonly page: Page;
  readonly myResearchProjectsPageTestData: typeof myResearchProjectsPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly no_projects_available_label: Locator;
  readonly add_project_record_button_label: Locator;
  readonly project_search_button_label: Locator;
  readonly advanced_filter_label: Locator;
  readonly short_project_title_link: Locator;
  readonly iras_id_title: Locator;
  readonly date_created_title: Locator;
  readonly status_title: Locator;
  readonly projectListRows: Locator;
  readonly listCell: Locator;
  readonly titlelink: Locator;
  readonly next_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myResearchProjectsPageTestData = myResearchProjectsPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.heading, { exact: true });
    this.no_projects_available_label = this.page
      .locator('p[class="govuk-body"]')
      .getByText(this.myResearchProjectsPageTestData.No_Projects_Label_Texts.no_projects);

    this.add_project_record_button_label = this.page.getByRole('link', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.add_project_record_button_label,
    });
    this.project_search_button_label = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.search,
      exact: true,
    });
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.advanced_filter_label,
    });
    this.short_project_title_link = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.short_project_title_link,
      exact: true,
    });
    this.iras_id_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.iras_id_title,
      exact: true,
    });
    this.date_created_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.date_created_title,
      exact: true,
    });
    this.status_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.status_title,
      exact: true,
    });
    this.projectListRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.titlelink = this.page.getByRole('link', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.short_project_title_text,
      exact: true,
    });
    this.next_button = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.next_button,
      exact: true,
    });
  }

  //Page Methods
  async goto() {
    await this.page.goto('/application/welcome/');
  }

  async assertOnMyResearchProjectsPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.add_project_record_button_label).toBeVisible();
  }

  async findProjectLink(shortProjectTitle: string, irasId: string) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await this.projectListRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.listCell).allInnerTexts();
        const matchesSearchKey = columns[0].trim().includes(shortProjectTitle);

        if (matchesSearchKey && columns[1].trim() === irasId) {
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }

  async sortIrasIdListValues(irasIds: string[], sortDirection: string): Promise<string[]> {
    let sortedListAsNums: number[];
    const sortedListAsStrings: string[] = [];
    const formattedIrasIds = irasIds.map(Number);
    if (sortDirection.toLowerCase() == 'ascending') {
      sortedListAsNums = formattedIrasIds.toSorted((a, b) => {
        if (a[0] - b[0] == 0) {
          return a[1] - b[1];
        } else {
          return a[0] - b[0];
        }
      });
    } else {
      sortedListAsNums = formattedIrasIds.toSorted((a, b) => {
        if (b[0] - a[0] == 0) {
          return b[1] - a[1];
        } else {
          return b[0] - a[0];
        }
      });
    }
    for (const entry of sortedListAsNums.entries()) {
      sortedListAsStrings.push(entry[1].toString());
    }
    return sortedListAsStrings;
  }
}
