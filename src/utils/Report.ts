import report from 'multiple-cucumber-html-reporter';
import 'dotenv/config';
import { Reporter } from 'playwright/types/testReporter';
import type { FullResult } from '@playwright/test/reporter';
import fs from 'fs';
import path from 'path';
import {
  deviceTypeVal,
  getBrowserType,
  getBrowserVersionDevices,
  displayTimeZone,
  formatedDuration,
  getOSNameVersion,
  getReportFolderName,
} from '../utils/UtilFunctions';

class MyReporter implements Reporter {
  async onEnd(result: FullResult) {
    const endTime = new Date().toLocaleString();
    const reportFolderName = getReportFolderName();
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
      reportName: 'Future IRAS Automation Test Report-Playwright',
      displayDuration: true,
      pageFooter: '<div><p></p></div>',
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
