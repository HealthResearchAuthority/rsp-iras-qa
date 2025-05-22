import { PlaywrightTestConfig } from '@playwright/test';
import { cucumberReporter, defineBddConfig } from 'playwright-bdd';
import 'dotenv/config';
import { browserVal, platformVal, getReportFolderName } from './src/utils/UtilFunctions';

// Select Browser to use in Pipeline, Set in .env File Locally
const browser: any = browserVal;
const platform: string = platformVal;

/*
const customIOS744x1133 = {
  viewport: { width: 744, height: 1133 },
  userAgent:
    '(iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1',
  deviceScaleFactor: 2,
  isMobile: true,
  hasTouch: true,
  javaScriptEnabled: true,
};

const customIOS428x926 = {
  viewport: { width: 428, height: 926 },
  userAgent:
    ' (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
  deviceScaleFactor: 3,
  isMobile: true,
  hasTouch: true,
  javaScriptEnabled: true,
};

const customAndroid700x840 = {
  viewport: { width: 700, height: 840 },
  userAgent:
    'Mozilla/5.0 (Linux; Android 12; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36',
  deviceScaleFactor: 2,
  isMobile: true,
  hasTouch: true,
  javaScriptEnabled: true,
};

const customAndroid412x917 = {
  viewport: { width: 412, height: 917 },
  userAgent: 'Mozilla/5.0 (Linux; Android 12; Pixel 4a) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0',
  deviceScaleFactor: 2.625,
  isMobile: true,
  hasTouch: true,
  javaScriptEnabled: true,
};

*/

const customIOS744x1133 = {
  viewport: { width: 744, height: 1133 },
  userAgent:
    '(iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1',
  deviceScaleFactor: 2,
  isMobile: true,
  hasTouch: true,
  javaScriptEnabled: true,
};

const config: PlaywrightTestConfig = {
  reporter: [
    ['list', { printSteps: true }],
    ['html', { outputFolder: './test-reports/' + getReportFolderName() + '/playwright', open: 'never' }],
    cucumberReporter('json', {
      outputFile: './test-reports/' + getReportFolderName() + '/cucumber/json/test_report.json',
    }),
    ['./src/utils/Report.ts', { customOption: 'Cucumber HTML Report Generation' }],
  ],
  globalSetup: 'src/hooks/GlobalSetup.ts',
  globalTeardown: 'src/hooks/GlobalTeardown.ts',
  globalTimeout: 15 * 60 * 1000,
  timeout: 5 * 60 * 1000,
  workers: 1, // to enforce serial execution
  retries: 2,
  use: {
    ...browser,
    trace: 'on',
    baseURL: `${process.env.BASE_URL}`,
    screenshot: {
      mode: 'only-on-failure',
      fullPage: true,
    },
    actionTimeout: 30000,
    navigationTimeout: 30000,
    testIdAttribute: 'id',
  },
  expect: {
    timeout: 10000,
  },
  projects: [
    {
      // Authorise Tests Users before Test Run
      name: 'AuthSetup',
      testDir: defineBddConfig({
        features: ['tests/features/cross-compatible/authSetup/*.feature'],
        steps: ['src/steps/**/*.ts', 'src/hooks/CustomFixtures.ts'],
        outputDir: 'generated-feature-files/auth-setup',
      }),
      use: {
        headless: true,
        launchOptions: {
          slowMo: 0,
        },
      },
    },
    {
      name: 'FutureIras',
      dependencies: ['AuthSetup'],
      testDir: defineBddConfig({
        features: [
          'tests/features/cross-compatible/stories/**/*.feature',
          'tests/features/cross-compatible/accessibility/**/*.feature', //comment out to prevent running accessibility tests locally
          // 'tests/features/cross-compatible/userAdministration/**/*.feature', //comment out to prevent running User Administration tests locally
          `tests/features/${platform}/**/*.feature`,
        ],
        steps: ['src/steps/**/*.ts', 'src/hooks/CustomFixtures.ts'],
        outputDir: 'generated-feature-files/future-iras',
      }),
      use: {
        ...customIOS744x1133,
        headless: false,
        launchOptions: {
          slowMo: 0,
        },
        javaScriptEnabled: true,
      },
    },
  ],
};

export default config;
