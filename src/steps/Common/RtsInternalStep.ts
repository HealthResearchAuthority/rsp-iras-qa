import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';

const { When } = createBdd(test);

const idgBaseUrl: string = 'https://test.id.nihr.ac.uk/';
const rtsBaseUrl: string = 'https://test.rts.nihr.ac.uk/api/';

const form = {
  grant_type: 'client_credentials',
  scope: 'openid+email',
  client_id: 'JEeWvNv4yYLEMTEAKTfX7FRve1ga',
  client_secret: '',
};

const headers = {
  accept: 'application/json',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
  'cache-control': 'no-cache',
  'Content-Type': 'application/x-www-form-urlencoded',
};

const expectedAuthResponse = {
  token_type: 'Bearer',
};

When('I make a request to the Internal API', async ({ request }) => {
  //Setup up request Authorisation
  try {
    const authResponse = await (
      await request.post(`${idgBaseUrl}oauth2/token`, {
        form,
        headers,
      })
    ).json();
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
    const response = await request.post(`${idgBaseUrl}oauth2/token`, {
      form,
      headers,
    });
    console.error(response.headers());
    console.error(await response.text());
    throw Error('FAILURE! REQUESTS WILL BE UNAUTHORIZED - STOPPING TEST EXECUTION');
  }

  //Make Authorised request
  const requestResponse = await request.get(`${rtsBaseUrl}organisations?search=testing`, {
    headers: {
      accept: 'application/json',
      'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
      authorization: `${process.env.BEARER}`,
      'cache-control': 'no-cache',
      'content-type': 'application/json',
    },
  });
  await expect(requestResponse).toBeOK();
  const receivedJson = await requestResponse.json();
  console.log('Internal Response Received:');
  console.log(receivedJson);
});
