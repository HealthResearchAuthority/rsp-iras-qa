import report from 'multiple-cucumber-html-reporter';
import 'dotenv/config';
import { Reporter } from 'playwright/types/testReporter';
import type { FullResult } from '@playwright/test/reporter';
import * as fs from 'node:fs';
import path from 'node:path';
import {
  deviceTypeVal,
  getBrowserType,
  getBrowserVersionDevices,
  displayTimeZone,
  formatedDuration,
  getOSNameVersion,
  getReportFolderName,
  processKnownDefectsAsync,
} from '../utils/UtilFunctions';

class MyReporter implements Reporter {
  async onEnd(result: FullResult) {
    const endTime = new Date().toLocaleString();
    const reportFolderName = getReportFolderName();
    const jsonDir = `./test-reports/${reportFolderName}/cucumber/json/`;
    const knownDefectFailCount = await processKnownDefectsAsync(jsonDir);
    try {
      const tempDir = path.join(process.cwd(), '.temp');
      if (fs.existsSync(tempDir)) {
        fs.rmSync(tempDir, { recursive: true, force: true });
      }
    } catch (err) {
      console.error(err);
    }
    report.generate({
      jsonDir: './test-reports/' + reportFolderName + '/cucumber/json/',
      reportPath: './test-reports/' + reportFolderName + '/cucumber/html/',
      pageTitle: 'Multiple Cucumber HTML reporter',
      reportName: 'Plan and Manage Health and Care Research - Automation Test Report - Playwright',
      displayDuration: true,
      pageFooter: `
      <div><p></p></div>
      <style>
      /* Hide the entire Features card */
      .x_panel:has(#feature-chart),
      .col-md-6.col-lg-4.col-xs-12:has(#feature-chart),
      td.chart:has(#feature-chart) {
        display: none !important;
      }
      </style>
   `,
      customMetadata: true,
      metadata: [
        { name: 'Device Type', value: `${deviceTypeVal}` },
        { name: 'Browser Name', value: getBrowserType(deviceTypeVal) },
        { name: 'Browser Version', value: await getBrowserVersionDevices(deviceTypeVal) },
      ],

      customData: {
        title: 'Run Info',
        data: [
          { label: 'Environment', value: 'QA' },
          { label: 'Operating System', value: getOSNameVersion() },
          { label: 'Known Defect Failures - Pending', value: knownDefectFailCount },
          {
            label: 'Execution Start Time',
            value: displayTimeZone(result.startTime),
          },
          {
            label: 'Execution End Time',
            value: displayTimeZone(endTime),
          },
          { label: 'Total Duration', value: formatedDuration(result.duration) },
        ],
      },
    });
  }
}
export default MyReporter;
