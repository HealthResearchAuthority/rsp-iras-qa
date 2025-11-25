import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the approvals home page', async ({ approvalsPage }) => {
  await approvalsPage.assertOnApprovalsPage();
});
