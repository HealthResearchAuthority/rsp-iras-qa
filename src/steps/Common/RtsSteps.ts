import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';
import { confirmStringNotNull, sortArray } from '../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

When('I authorise the rts api using {string}', async ({ request, rtsPage }, datasetName: string) => {
  const dataset = rtsPage.rtsPageTestData[datasetName];
  await rtsPage.authoriseRTS(request, dataset);
});

Then(
  'I make a request to the rts api using {string} dataset for sponsor organisation',
  async ({ request, rtsPage }, datasetName: string) => {
    const dataset = rtsPage.rtsPageTestData[datasetName];
    const rtsBaseUrl: string = dataset.rts_base_url;
    const organisationName = dataset.organisation_name;
    const active = dataset.active;
    const role = dataset.role;
    const count = dataset.count;
    const offset = dataset.offset;
    for (let offsetCount = 0; offsetCount <= offset; ) {
      const requestHeader =
        `${rtsBaseUrl}organization?` +
        `name:contains=` +
        organisationName +
        `&NihrRoleIdentifier=` +
        role +
        `&_count=` +
        count +
        `&_offset=` +
        offsetCount;
      const requestResponse = await rtsPage.executeRTSRequest(request, dataset, rtsPage.bearerToken, requestHeader);
      await expect(requestResponse).toBeOK();
      const receivedJson = await requestResponse.json();
      if (typeof receivedJson.entry !== 'undefined') {
        receivedJson.entry.forEach((element) => {
          const organisationRoles = element.resource.extension;
          for (const organisationRole of organisationRoles) {
            if (typeof organisationRole.extension !== 'undefined') {
              const extensions = organisationRole.extension;
              if (extensions[0].valueString === role) {
                if (extensions[3].valueString === 'Active' && element.resource.active === active) {
                  rtsPage.rtsResponseList.push(element.resource.name);
                }
              }
            }
          }
        });
      } else {
        break;
      }
      offsetCount = offsetCount + 1000;
    }
  }
);

Then(
  'I validate the list of sponsor organisations retrieved in ui compared to the rts response received using {string}',
  async ({ rtsPage }, datasetName: string) => {
    const dataset = rtsPage.rtsPageTestData[datasetName];
    const applicationUrl: string = `${process.env.BASE_URL}`;
    const organisationName = dataset.organisation_name;
    const role = dataset.role;
    const offset = dataset.offset;
    const newApplicationURL =
      `${applicationUrl}Organisation/GetOrganisations?` +
      `name=` +
      organisationName +
      `&role=` +
      role +
      `&pageSize=` +
      offset;
    await rtsPage.page.goto(newApplicationURL);
    const rtsDataFromApplication = confirmStringNotNull(await rtsPage.jsonDataPreLabel.textContent());
    const rtsDataFromApplicationJSON = JSON.parse(rtsDataFromApplication);
    const rtsOrganisationNamesFromApplication = rtsDataFromApplicationJSON.organisations
      .map((item: any) => item.name)
      .filter((name: string) => Boolean(name) && name.toLowerCase().includes(organisationName.toLowerCase()));
    const rtsDataFromApplicationJSONActual = await sortArray(rtsOrganisationNamesFromApplication);
    const rtsResponseDataExpected = await sortArray(rtsPage.rtsResponseList);
    expect(rtsDataFromApplicationJSONActual).toEqual(rtsResponseDataExpected);
  }
);

Then(
  'I make a request to the rts api using {string} dataset for sponsor organisation {string} and  retrive country',
  async ({ request, rtsPage, setupNewSponsorOrganisationPage }, datasetName: string, sponsorDatasetName: string) => {
    const dataset = rtsPage.rtsPageTestData[datasetName];
    const sponsorDataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        sponsorDatasetName
      ];
    const rtsBaseUrl: string = dataset.rts_base_url;
    const organisationName = sponsorDataset['sponsor_organisation_text'];
    const active = dataset.active;
    const role = dataset.role;
    const count = dataset.count;
    const offset = dataset.offset;

    for (let offsetCount = 0; offsetCount <= offset; ) {
      const requestHeader =
        `${rtsBaseUrl}organization?` +
        `name:contains=${organisationName}` +
        `&NihrRoleIdentifier=${role}` +
        `&_count=${count}` +
        `&_offset=${offsetCount}`;

      const requestResponse = await rtsPage.executeRTSRequest(request, dataset, rtsPage.bearerToken, requestHeader);

      await expect.soft(requestResponse).toBeOK();
      const receivedJson = await requestResponse.json();

      if (receivedJson.entry !== undefined) {
        for (const element of receivedJson.entry) {
          const organisationRoles = element.resource.extension;
          for (const organisationRole of organisationRoles) {
            if (typeof organisationRole.extension !== 'undefined') {
              const extensions = organisationRole.extension;
              if (
                extensions[0].valueString === role &&
                extensions[3].valueString === 'Active' &&
                element.resource.active === active
              ) {
                const name = element.resource.name;
                const country = element.resource.address?.[0]?.country || 'Unknown';
                rtsPage.rtsResponseListRecord.push({ name, country });
              }
            }
          }
        }
      } else {
        break;
      }

      offsetCount += 1000;
    }
  }
);
