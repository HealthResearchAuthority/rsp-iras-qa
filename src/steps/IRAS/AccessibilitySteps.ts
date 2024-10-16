import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';
import { readAxeResultsContents, generatehtmlReport } from '../../utils/UtilFunctions';
import { writeFile } from 'fs/promises';
import { createHtmlReport } from 'axe-html-reporter';

const { When, Then } = createBdd(test);
let axeScanResults: any;

When('I Scan the page with the Axe Accessibilty Tool', async ({ makeAxeBuilder }) => {
  const axeScanner = makeAxeBuilder();
  axeScanResults = await axeScanner
    .options({ reporter: 'v2' })
    .withTags(['wcag2a', 'wcag2aa', 'wcag2aaa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
    .analyze();
});
Then('I generate JSON {string} from the scanned results', async ({ $bddWorld }, jsonfile: string) => {
  await $bddWorld.testInfo.attach('accessibility-scan-results', {
    body: JSON.stringify(axeScanResults, null, 2),
    contentType: 'application/json',
  });
  const file = $bddWorld.testInfo.outputPath(`${jsonfile}`);
  await writeFile(file, JSON.stringify(axeScanResults, null, 2), 'utf8');
});
Then('I create the axe-core html report from the scanned results', async ({ $bddWorld }) => {
  const htmlReport = createHtmlReport({
    results: axeScanResults,
    options: {
      projectKey: $bddWorld.testInfo.title,
      doNotCreateReportFile: false,
    },
  });
  //write the html report for each page
  generatehtmlReport(`${$bddWorld.testInfo.title.replace(' ', '_')}.html`, htmlReport);
});

Then('I expect to receive no WCAG Violations', async ({ $bddWorld }) => {
  const path = $bddWorld.testInfo.outputDir + '/temp-axe-results.json';
  const axeScanResults = await readAxeResultsContents(path);
  expect(JSON.parse(axeScanResults).violations).toEqual([]);
});
