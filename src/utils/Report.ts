const report = require('multiple-cucumber-html-reporter');
const os = require('os');
import 'dotenv/config';

report.generate({
  jsonDir: './test-reports/cucumber/json/',
  reportPath: './test-reports/cucumber/html/',
  pageFooter: '<div><p></p></div>',
  customMetadata: true,
  metadata: [
    { name: 'Device Name', value: `${process.env.BROWSER}` },
    { name: 'Browser Name', value: 'To be defined' },
    { name: 'Browser Version', value: 'To be defined' },
    { name: 'OS Name', value: `${os.type}` },
    { name: 'OS Version', value: `${os.release}` },
  ],
  customData: {
    title: 'Automation Test Report - Playwright',
    data: [
      { label: 'Project', value: 'To be defined' },
      { label: 'Release', value: 'To be defined' },
      { label: 'Cycle', value: 'To be defined' },
      { label: 'Execution Start Time', value: 'To be defined - Test - Nov 19th 2017, 02:31 PM EST' },
      { label: 'Execution End Time', value: 'To be defined - Test - Nov 19th 2017, 02:56 PM EST' },
    ],
  },
});
