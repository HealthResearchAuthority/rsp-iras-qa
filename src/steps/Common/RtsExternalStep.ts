import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';

const { When } = createBdd(test);

const baseUrl: string = 'https://test.rts.nihr.ac.uk/api/';

const form = {
  grant_type: 'client_credentials',
  scope: 'openid+email',
};

const headers = {
  accept: 'application/json',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
  authorization: `Basic QmtIRVBxR3RpdzFSaUlIbTVMM1JBem9tU3pzYTpSWG1MQWdjNkxKTjRBTjZzTmRyY0NwQ0NBZDBh`,
  'cache-control': 'no-cache',
  'Content-Type': 'application/x-www-form-urlencoded',
};

const expectedAuthResponse = {
  token_type: 'Bearer',
};

When('I make a request to the External API', async ({ request }) => {
  //Setup up request Authorisation
  try {
    const authResponse = await (
      await request.post(`${baseUrl}auth/token`, {
        form,
        headers,
      })
    ).json();
    console.log('Response Received:');
    console.log(authResponse);
    const isGetTokenSuccessful = authResponse.token_type === expectedAuthResponse.token_type;
    if (!isGetTokenSuccessful) {
      console.error('ERROR: Get Auth Token Request Failed To Return a Bearer Token');
      console.error(authResponse);
      throw Error('REQUESTS WILL BE UNAUTHORIZED - STOPPING TEST EXECUTION');
    } else {
      process.env.BEARER = 'Bearer ' + authResponse.access_token;
    }
  } catch (error) {
    console.error(error);
    const response = await request.post(`${baseUrl}auth/token`, {
      form,
      headers,
    });
    console.error(response.headers());
    console.error(await response.text());
    throw Error('FAILURE! REQUESTS WILL BE UNAUTHORIZED - STOPPING TEST EXECUTION');
  }

  //Make Authorised request
  const requestResponse = await request.get(
    `${baseUrl}v2/Rts/GetOrganisationList?pageNumber=1&pageSize=3&modifiedDate=2023-05-01`,
    {
      headers: {
        accept: 'application/json',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
        authorization: `${process.env.BEARER}`,
        'cache-control': 'no-cache',
        'content-type': 'application/json',
      },
    }
  );
  await expect(requestResponse).toBeOK();
  const receivedJson = await requestResponse.json();
  console.log('Response Received:');
  console.log(receivedJson);
});
