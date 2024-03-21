import { devices, PlaywrightTestConfig } from '@playwright/test'

const config: PlaywrightTestConfig = {
  testDir: './tests/features',
  outputDir: './test-results',
  testMatch: /features/,
  reporter: [
    ['list', { printSteps: true }],
    ['html', { outputFolder: './test-report' }],
  ],
  globalSetup: 'src\\hooks\\GlobalSetup.ts',
  globalTeardown: 'src\\hooks\\GlobalTeardown.ts',
  timeout: 30000,
  workers: 1, // to enforce serial execution
  retries: 2,
  projects: [
    // {
    //   // Autorise Tests Users before Test Run
    //   name: 'setup',
    //   testDir: 'tests/authSetup',
    //   testMatch: 'LoginSetup.e2e.ts',
    //   use: {
    //     trace: 'on',
    //     baseURL: `${process.env.BASE_URL}`,
    //     headless: true,
    //     screenshot: 'on',
    //     launchOptions: {
    //       slowMo: 0,
    //     },
    //   },
    // },
    {
      name: 'NewIras',
      // dependencies: ['setup'],
      // testIgnore: '**/accessibilityTests/**',
      use: {
        trace: 'on',
        baseURL: `${process.env.BASE_URL}`,
        headless: true,
        screenshot: 'on',
        launchOptions: {
          slowMo: 0,
        },
      },
    },
  ],
}

export default config
