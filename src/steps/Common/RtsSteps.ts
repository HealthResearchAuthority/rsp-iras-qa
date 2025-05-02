import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';

const { When } = createBdd(test);

When('I make a request to the rts api using {string} dataset', async ({ request, rtsPage }, datasetName: string) => {
  const dataset = rtsPage.rtsPageTestData[datasetName];
  const rtsBaseUrl: string = dataset.rts_base_url;
  let organisationNameList: string[] = [];
  const bearerToken = await rtsPage.authoriseRTS(request, dataset);
  const organisationName = dataset.organisation_name;
  const role = dataset.role;
  const count = dataset.count;
  const requestHeader =
    `${rtsBaseUrl}organization?` +
    `name:contains=` +
    organisationName +
    `&NihrRoleIdentifier=` +
    role +
    `&_count=` +
    count +
    `&_offset=3000`;
  const requestResponse = await rtsPage.executeRTSRequest(request, dataset, bearerToken, requestHeader);
  await expect(requestResponse).toBeOK();
  const receivedJson = await requestResponse.json();
  receivedJson.entry.forEach((element) => {
    if (element.resource.active === false) {
      organisationNameList.push(element.resource.name);
    }
  });
  organisationNameList = organisationNameList.sort();
  if (organisationNameList.length > 5) {
    organisationNameList = organisationNameList.slice(0, 5);
  }
  console.log(organisationNameList);
  console.log(organisationNameList.length);
  console.log(organisationNameList.length);
});
