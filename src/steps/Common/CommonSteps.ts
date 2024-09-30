import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the {string}', async ({ tasksPage, loginPage, homePage }, page: string) => {
  switch (page) {
    case 'Login_Page':
      await tasksPage.goto();
      await loginPage.assertOnLoginPage(page);
      break;
    case 'Home_Page':
      await homePage.goto();
      await homePage.assertOnHomePage();
      break;
    case 'Tasks_Page':
      await tasksPage.goto();
      await tasksPage.assertOnTasksPage();
      break;
    default:
      throw new Error(`${page} is not a valid option`);
  }
});

When('I can see the {string}', async ({ tasksPage, loginPage }, page: string) => {
  switch (page) {
    case 'Tasks_Page':
      await tasksPage.assertOnTasksPage();
      break;
    case 'Login_Page':
      await loginPage.assertOnLoginPage(page);
      break;
    default:
      throw new Error(`${page} is not a valid option`);
  }
});

When('I do something {string}', async ({ tasksPage }, testType: string) => {
  tasksPage.samplePageAction(testType);
});

Then('I see something {string}', async ({ tasksPage }, testType: string) => {
  tasksPage.samplePageAction(testType);
});

Then('the show all section accordion is {string}', async ({ commonItemsPage }, isExpanded: string) => {
  const accordionExpanded = await commonItemsPage.isAccordionExpanded(
    commonItemsPage.showAllSectionsAccordion,
    commonItemsPage.showAllSectionsIFrame
  );
  if (isExpanded === 'open') {
    expect(accordionExpanded).toBe('true');
  } else if (isExpanded === 'closed') {
    expect(accordionExpanded).toBe('false');
  }
});

Then('I click the show all section accordion', async ({ commonItemsPage }) => {
  commonItemsPage.toggleAccordion(commonItemsPage.showAllSectionsAccordion, commonItemsPage.showAllSectionsIFrame);
});

Then('I click the {string} button', async ({ commonItemsPage }, buttonText: string) => {
  await commonItemsPage.govUkButton.getByText(buttonText).click();
});
