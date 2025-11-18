import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsIRASPageTestData from '../../../resources/test_data/iras/make_changes/project_details_iras_data.json';
import { getSharpointGraphClient } from '../../../utils/UtilFunctions';
import { format as csvFormat } from '@fast-csv/format';
import { Readable, Transform } from 'node:stream';
import { pipeline } from 'node:stream/promises';
import csvParser from 'csv-parser';
import { TextDecoder } from 'node:util';
import CommonItemsPage from '../../Common/CommonItemsPage';
//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly projectDetailsIRASPageTestData: typeof projectDetailsIRASPageTestData;
  readonly pageHeading: Locator;
  readonly iras_textbox_label: Locator;
  readonly iras_id_text: Locator;
  readonly iras_id_text_summary_error_label: Locator;
  readonly iras_textbox_hint: Locator;
  readonly page_body: Locator;
  private _unique_iras_id: string;
  private _short_project_title: string;
  private _full_project_title: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsIRASPageTestData = projectDetailsIRASPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.heading);
    this.iras_textbox_label = this.page.getByText(this.projectDetailsIRASPageTestData.Label_Texts.iras_textbox_label, {
      exact: true,
    });
    this.iras_textbox_hint = this.page.getByText(this.projectDetailsIRASPageTestData.Label_Texts.iras_textbox_hint, {
      exact: true,
    });
    this.iras_id_text = this.page.getByTestId('IrasId');
    this.iras_id_text_summary_error_label = this.page.locator('.govuk-error-summary__list [href^="#IrasId"]');
    this.page_body = this.page.locator('[class="govuk-grid-column-two-thirds"]');
  }

  //Page Methods
  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async setUniqueIrasId(value: string): Promise<void> {
    this._unique_iras_id = value;
  }

  async getUniqueIrasId(): Promise<string> {
    return this._unique_iras_id;
  }
  async setShortProjectTitle(value: string): Promise<void> {
    this._short_project_title = value;
  }

  async getShortProjectTitle(): Promise<string> {
    return this._short_project_title;
  }
  async setFullProjectTitle(value: string): Promise<void> {
    this._full_project_title = value;
  }

  async getFullProjectTitle(): Promise<string> {
    return this._full_project_title;
  }

  async getValidIRASAndProjectTitlesFromLegacySharepoint() {
    const sharePointDriveId = `${process.env.sharepoint_drive_id}`;
    const csvFilePath = this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.legacy_iras_lookup_file_path;
    const maxRetries = new CommonItemsPage(this.page).commonTestData.sharepoint_max_retries;
    const client = await getSharpointGraphClient();
    let attempt = 0;
    let foundIRASID: string | null = null;
    let foundShortProjectTitle: string | null = null;
    let foundFullProjectTitle: string | null = null;
    while (attempt <= maxRetries) {
      let currentIRASID: string | null = null;
      let currentShortProjectTitle: string | null = null;
      let currentFullProjectTitle: string | null = null;
      try {
        const fileMeta: any = await client.api(`/drives/${sharePointDriveId}/root:/${csvFilePath}:/`).get();
        const etag = fileMeta['@odata.etag'] || fileMeta.eTag;
        const downloadUrl = fileMeta['@microsoft.graph.downloadUrl'];
        const response = await fetch(downloadUrl);
        const nodeStream = Readable.fromWeb(
          response.body as unknown as import('stream/web').ReadableStream<Uint8Array>
        );
        const decoder = new TextDecoder('utf-8');
        const decodeStream = new Transform({
          readableObjectMode: false,
          transform(chunk, _encoding, callback) {
            callback(null, decoder.decode(chunk, { stream: true }));
          },
          flush(callback) {
            callback(null, decoder.decode());
          },
        });
        const readStream = nodeStream.pipe(decodeStream);
        const csvFormatter = csvFormat({ headers: true });
        const outputBufferChunks: Buffer[] = [];
        csvFormatter.on('data', (chunk) => {
          outputBufferChunks.push(Buffer.from(chunk));
        });
        await pipeline(
          readStream,
          csvParser(),
          async function* (source) {
            for await (const row of source) {
              if (!currentIRASID && row.Status?.trim().toLowerCase() !== 'used') {
                currentIRASID = row.IRAS_ID;
                row.Status = 'Used';
                currentShortProjectTitle = row.Short_Project_Title;
                currentFullProjectTitle = row.Full_Project_Title;
              }
              yield row;
            }
          },
          csvFormatter
        );
        const uploadBuffer = Buffer.concat(outputBufferChunks);
        await client
          .api(`/drives/${sharePointDriveId}/root:/${csvFilePath}:/content`)
          .header('If-Match', etag)
          .put(uploadBuffer);
        if (currentIRASID) {
          foundIRASID = currentIRASID;
          foundShortProjectTitle = currentShortProjectTitle;
          foundFullProjectTitle = currentFullProjectTitle;
        } else {
          throw new Error('No IRAS ID found');
        }
        break;
      } catch (err: any) {
        if (err.statusCode === 412) {
          attempt++;
          if (attempt > maxRetries) {
            throw new Error(
              'Max retries reached due to concurrent updates in sharepoint. Not able to fetch the IRAS ID'
            );
          }
          await new Promise((res) => setTimeout(res, 2000));
          continue;
        } else {
          throw new Error('No IRAS ID found in the legacy lookup list in sharepoint');
        }
      }
    }
    return { foundIRASID, foundShortProjectTitle, foundFullProjectTitle };
  }
}
