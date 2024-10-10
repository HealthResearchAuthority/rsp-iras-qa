import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';
import { readAxeResultsContents } from '../../utils/UtilFunctions';
import { writeFile } from 'fs/promises';

const { When, Then } = createBdd(test);

When('I Scan the page with the Axe Accessibilty Tool', async ({ makeAxeBuilder, $bddWorld }) => {
  const axeScanner = makeAxeBuilder();
  const axeScanResults = await axeScanner
    .options({ reporter: 'v2' })
    .withTags(['wcag2a', 'wcag2aa', 'wcag2aaa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
    .analyze();

  await $bddContext.testInfo.attach('accessibility-scan-results', {
    body: JSON.stringify(axeScanResults, null, 2),
    contentType: 'application/json',
  });

  const file = $bddWorld.testInfo.outputPath('temp-axe-results.json');
  await writeFile(file, JSON.stringify(axeScanResults, null, 2), 'utf8');
});

Then('I expect to receive no WCAG Violations', async ({ $bddWorld }) => {
  const path = $bddWorld.testInfo.outputDir + '/temp-axe-results.json';
  const axeScanResults = await readAxeResultsContents(path);
  expect(JSON.parse(axeScanResults).violations).toEqual([]);
});
