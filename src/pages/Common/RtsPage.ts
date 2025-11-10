import { Locator, Page } from '@playwright/test';
import * as rtsPageTestData from '../../resources/test_data/common/rts_page_data.json';

//Declare Page Objects
export default class RtsPage {
  readonly page: Page;
  readonly rtsPageTestData: typeof rtsPageTestData;
  readonly jsonDataPreLabel: Locator;
  bearerToken: string;
  rtsResponseList: string[] = [];
  rtsResponseListRecord: { name: string; country: string }[] = [];

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.rtsPageTestData = rtsPageTestData;

    //Locators
    this.jsonDataPreLabel = page.locator('pre');
  }

  //Page Methods
  async authoriseRTS(request: any, dataset: any): Promise<string> {
    const idgBaseUrl: string = dataset.idg_base_url;
    const form = {
      grant_type: dataset.grant_type,
      scope: dataset.scope,
      client_id: dataset.client_id,
      client_secret: `${process.env.RTS_CLIENT_SECRET}`,
    };
    const headers = {
      accept: dataset.accept,
      'accept-encoding': dataset.accept_encoding,
      'accept-language': dataset.accept_language,
      'cache-control': dataset.cache_control,
      'content-type': dataset.content_type,
    };
    const expectedAuthResponse = {
      token_type: dataset.token_type,
    };
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
        this.bearerToken = 'Bearer ' + authResponse.access_token;
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
    return this.bearerToken;
  }

  async executeRTSRequest(request: any, dataset: any, bearerToken: string, requestHeader: string): Promise<any> {
    const requestResponse = await request.get(requestHeader, {
      headers: {
        accept: dataset.accept_encoding,
        'accept-encoding': dataset.accept_encoding,
        'accept-language': dataset.accept_language,
        authorization: bearerToken,
        'cache-control': dataset.cache_control,
        'content-type': dataset.content_type_json,
      },
    });
    return requestResponse;
  }
}
