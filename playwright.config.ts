import { PlaywrightTestConfig, chromium, firefox, webkit } from '@playwright/test';
import { defineBddConfig, cucumberReporter } from 'playwright-bdd';
import 'dotenv/config';

//Select Browser to use in Pipeline, Set in .env File Locally
let browser;
if (`${process.env.BROWSER}` == 'safari') {
  browser = webkit.name();
  console.log('BROWSER IS:' + browser);
} else if (`${process.env.BROWSER}` == 'firefox') {
  browser = firefox.name();
  console.log('BROWSER IS:' + browser);
} else {
  browser = chromium.name();
  console.log('BROWSER IS:' + browser);
}

const config: PlaywrightTestConfig = {
  reporter: [
    ['list', { printSteps: true }],
    ['html', { outputFolder: './test-reports/playwright' }],
    cucumberReporter('html', { outputFile: './test-reports/cucumber/report.html' })
  ],
  globalSetup: 'src/hooks/GlobalSetup.ts',
  globalTeardown: 'src/hooks/GlobalTeardown.ts',
  timeout: 30000,
  workers: 1, // to enforce serial execution
  retries: 2,
  use: {
    browserName: browser,
    trace: 'on',
    baseURL: `${process.env.BASE_URL}`,
    screenshot: 'on',
  },
  projects: [
    {
      //Authorise Tests Users before Test Run
      name: 'AuthSetup',
      testDir: defineBddConfig({
        paths: ['tests/features/authSetup/*.feature'],
        require: ['src/steps/*.ts'],
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
      name: 'OldIras',
      dependencies: ['AuthSetup'],
      testIgnore: 'tests/features/authSetup/*.feature',
      testDir: defineBddConfig({
        paths: ['tests/features/stories/**/*.feature'],
        require: ['src/steps/*.ts'],
        importTestFrom: 'src/hooks/CustomFixtures.ts',
        outputDir: 'generated-feature-files/old-iras',
      }),
      use: {
        headless: true,
        launchOptions: {
          slowMo: 0,
        },
      },
    },
  ],
}

export default config;
