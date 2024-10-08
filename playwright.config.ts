import { PlaywrightTestConfig, devices } from '@playwright/test';
import { defineBddConfig, cucumberReporter } from 'playwright-bdd';
import 'dotenv/config';

// Select Browser to use in Pipeline, Set in .env File Locally
let browser: any;
let platform: string;
if (`${process.env.BROWSER}` == 'safari') {
  browser = devices['Desktop Safari'];
  platform = 'desktop';
} else if (`${process.env.BROWSER}` == 'firefox') {
  browser = devices['Desktop Firefox'];
  platform = 'desktop';
} else if (`${process.env.BROWSER}` == 'ios') {
  browser = devices['iPhone 14'];
  platform = 'mobile';
} else if (`${process.env.BROWSER}` == 'android') {
  browser = devices['Galaxy S8'];
  platform = 'mobile';
} else {
  browser = devices['Desktop Chrome'];
  platform = 'desktop';
}

const config: PlaywrightTestConfig = {
  reporter: [
    ['list', { printSteps: true }],
    ['html', { outputFolder: './test-reports/playwright', open: 'never' }],
    cucumberReporter('json', { outputFile: './test-reports/cucumber/json/test_report.json' }),
  ],
  globalSetup: 'src/hooks/GlobalSetup.ts',
  globalTeardown: 'src/hooks/GlobalTeardown.ts',
  globalTimeout: 10 * 60 * 1000,
  timeout: 5 * 60 * 1000,
  workers: 1, // to enforce serial execution
  retries: 2,
  use: {
    ...browser,
    trace: 'on',
    baseURL: `${process.env.BASE_URL}`,
    screenshot: 'only-on-failure',
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
        paths: ['tests/features/cross-compatible/authSetup/*.feature'],
        require: ['src/steps/**/*.ts'],
        importTestFrom: 'src/hooks/CustomFixtures.ts',
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
        paths: [
          'tests/features/cross-compatible/stories/**/*.feature',
          // 'tests/features/cross-compatible/accessibility/**/*.feature', uncomment when running accessibility tests
          `tests/features/${platform}/**/*.feature`,
        ],
        require: ['src/steps/**/*.ts'],
        importTestFrom: 'src/hooks/CustomFixtures.ts',
        outputDir: 'generated-feature-files/future-iras',
      }),
      use: {
        headless: true,
        launchOptions: {
          slowMo: 0,
        },
      },
    },
  ],
};

export default config;
