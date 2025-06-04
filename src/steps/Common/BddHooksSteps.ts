import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { getTicketReferenceTags } from '../../utils/UtilFunctions';

const { AfterStep, BeforeScenario } = createBdd(test);

AfterStep(async ({ page, $step, $testInfo }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    const screenshot = await page.screenshot({ path: 'screenshot.png', fullPage: true });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }
});

BeforeScenario(
  { name: 'Attach relevant ticket links to each scenario in test report' },
  async function ({ $tags, $testInfo }) {
    const tickets = getTicketReferenceTags($tags);
    if (tickets.length > 0) {
      $testInfo.attach('Ticket Reference:', { body: tickets.toString().replace(/,/g, '') });
    }
  }
);

BeforeScenario(
  { name: 'Check that current auth state has not expired', tags: '@Regression or @SystemTest' },
  async function ({ commonItemsPage, loginPage, homePage }) {
    if (
      (await commonItemsPage.page.request.get('application/welcome', { maxRedirects: 0 }).then((response) => {
        return response.status();
      })) != 200
    ) {
      test.use({ javaScriptEnabled: true });
      console.info('Current auth states have expired!\nReauthenticating test users before continuing test execution');
      await commonItemsPage.page.context().clearCookies();
      await homePage.goto();
      await homePage.loginBtn.click();
      await loginPage.assertOnLoginPage();
      await loginPage.loginWithUserCreds('Admin_User');
      await homePage.assertOnHomePage();
      await commonItemsPage.storeAuthState('Admin_User');
      test.use({ javaScriptEnabled: false });
    }
  }
);
