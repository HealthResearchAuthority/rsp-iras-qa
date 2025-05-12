import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the create project record page', async ({ createProjectRecordPage }) => {
  await createProjectRecordPage.assertOnCreateProjectRecordPage();
});
