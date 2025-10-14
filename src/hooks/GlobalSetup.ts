import { request } from '@playwright/test';

async function globalSetup() {
  process.env.BASE_URL = 'https://fd-rsp-applications-automationtest-uks-e7f6hkg3c5edhxex.a03.azurefd.net/';

  const req = await request.newContext({
    baseURL: 'https://cmsportal-dev.azurewebsites.net/umbraco/api/',
    extraHTTPHeaders: {
      accept: 'application/json',
    },
  });

  const getProjectSectionsResponse = await req.get('projectRecordQuestionset/getQuestionSections');
  console.log(getProjectSectionsResponse.status());
  // console.log(await getProjectSectionsResponse.body());
  //write to file
  //do for project qset labels and Id's
}
export default globalSetup;
export const deviceDSafari = 'Desktop Safari';
export const deviceDFirefox = 'Desktop Firefox';
export const deviceDChrome = 'Desktop Chrome';
export const deviceDEdge = 'Desktop Edge';
