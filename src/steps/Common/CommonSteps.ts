import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the {string}', async ({ loginPage, homePage }, page: string) => {
  switch (page) {
    case 'Login_Page':
      await homePage.goto();
      await loginPage.assertOnLoginPage();
      break;
    case 'Home_Page':
      await homePage.goto();
      await homePage.assertOnHomePage();
      break;
    default:
      throw new Error(`${page} is not a valid option`);
  }
});

When('I can see the {string}', async ({ loginPage, homePage }, page: string) => {
  switch (page) {
    case 'Login_Page':
      await loginPage.assertOnLoginPage();
      break;
    case 'Home_Page':
      await homePage.assertOnHomePage();
      break;
    default:
      throw new Error(`${page} is not a valid option`);
  }
});

When('I do something {string}', async ({ commonItemsPage }, testType: string) => {
  commonItemsPage.samplePageAction(testType);
});

Then('I see something {string}', async ({ commonItemsPage }, testType: string) => {
  commonItemsPage.samplePageAction(testType);
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

Then('I click the {string} button on the {string}', async ({ commonItemsPage }, buttonKey: string, pageKey: string) => {
  const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
  await commonItemsPage.govUkButton.getByText(buttonValue, { exact: true }).click();
});

Then('I can see a {string} button on the {string}', async ({ commonItemsPage }, buttonKey: string, pageKey: string) => {
  const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
  expect(commonItemsPage.govUkButton.getByText(buttonValue, { exact: true })).toBeVisible();
});
