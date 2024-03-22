import { PlaywrightTestConfig } from '@playwright/test';
import { defineBddConfig, cucumberReporter } from 'playwright-bdd';

const config: PlaywrightTestConfig = {
  reporter: [
    ['list', { printSteps: true }],
    ['html', { outputFolder: './test-reports/playwright' }],
    cucumberReporter('html', { outputFile: './test-reports/cucumber/report.html' })
  ],
  globalSetup: 'src\\hooks\\GlobalSetup.ts',
  globalTeardown: 'src\\hooks\\GlobalTeardown.ts',
  timeout: 30000,
  workers: 1, // to enforce serial execution
  // retries: 2,
  projects: [
    {
      //   Authorise Tests Users before Test Run
      name: 'AuthSetup',
      testDir: defineBddConfig({
        paths: ['tests/features/authSetup/*.feature'],
        require: ['src/steps/*.ts'],
        importTestFrom: 'src/hooks/CustomFixtures.ts',
        outputDir: 'generated-feature-files/login-setup',
      }),
      use: {
        trace: 'on',
        baseURL: `${process.env.BASE_URL}`,
        headless: false,
        screenshot: 'on',
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
        trace: 'on',
        baseURL: `${process.env.BASE_URL}`,
        headless: false,
        screenshot: 'on',
        launchOptions: {
          slowMo: 0,
        },
      },
    },
  ],
}

export default config;
