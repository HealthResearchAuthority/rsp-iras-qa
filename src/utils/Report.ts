import report from 'multiple-cucumber-html-reporter';
import 'dotenv/config';
import { Reporter } from 'playwright/types/testReporter';
import type { FullResult } from '@playwright/test/reporter';
import {
  deviceType,
  defaultBrowserType,
  browserVersion,
  displayTimeZone,
  formatedDuration,
  getOSNameVersion,
} from '../utils/UtilFunctions';

class MyReporter implements Reporter {
  async onEnd(result: FullResult) {
    const endTime = new Date().toLocaleString();
    report.generate({
      jsonDir: './test-reports/cucumber/json/',
      reportPath: './test-reports/cucumber/html/',
      pageTitle: 'Multiple Cucumber HTML reporter',
      reportName: 'Future IRAS Automation Test Report-Playwright',
      displayDuration: true,
      durationInMS: true,
      pageFooter: '<div><p></p></div>',
      customMetadata: true,
      metadata: [
        { name: 'Device Type', value: `${deviceType}` },
        { name: 'Browser Name', value: `${defaultBrowserType}` },
        { name: 'Browser Version', value: `${browserVersion}` },
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
          // { label: 'Total Duration in milliseconds', value: `${result.duration}` },
          { label: 'Total Duration', value: formatedDuration(result.duration) },
        ],
      },
    });
  }
}
export default MyReporter;
