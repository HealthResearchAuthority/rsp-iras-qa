import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';
import {
  readAxeResultsContents,
  generatehtmlReport,
  compareWcagStandards,
  assertWcagCompliance,
} from '../../utils/UtilFunctions';
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

Then('I analyse the results from the Axe scan', async ({ $testInfo }) => {
  await $testInfo.attach('accessibility-scan-results', {
    body: JSON.stringify(axeScanResults, null, 2),
    contentType: 'application/json',
  });
  const file = $testInfo.outputPath(`temp-axe-results.json`);
<<<<<<< HEAD
=======
  axeScanResults.violations.sort(compareWcagStandards);
  const wcagStandardAchieved = await assertWcagCompliance(axeScanResults.violations);
  axeScanResults.passes.sort(compareWcagStandards);
  axeScanResults.incomplete.sort(compareWcagStandards);
  axeScanResults.inapplicable.sort(compareWcagStandards);
>>>>>>> 92e8811 (adding an insert into AXE HTML Report that states the WCAG standard achieved, also removing redundant old generateAxeReport method)
  await writeFile(file, JSON.stringify(axeScanResults, null, 2), 'utf8');
  const htmlReport = createHtmlReport({
    results: axeScanResults,
    options: {
      projectKey: $testInfo.title,
      doNotCreateReportFile: true,
    },
  });
  //write the html report for each page
  generatehtmlReport(`${$testInfo.title.replace(' ', '_')}`, htmlReport, wcagStandardAchieved);
});

Then('I expect to receive no WCAG Violations', async ({ $testInfo }) => {
  const path = $testInfo.outputDir + '/temp-axe-results.json';
  const axeScanResults = await readAxeResultsContents(path);
  expect(JSON.parse(axeScanResults).violations).toEqual([]);
});
