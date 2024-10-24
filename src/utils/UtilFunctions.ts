import { DataTable } from 'playwright-bdd';
import { Locator, devices } from '@playwright/test';
import crypto from 'crypto';
import { readFile, writeFile } from 'fs/promises';
import 'dotenv/config';
import { deviceDSafari, deviceDFirefox, deviceDChrome } from '../hooks/GlobalSetup';
import fs from 'fs';
import { createHtmlReport } from 'axe-html-reporter';
import os from 'os';

export function getAuthState(user: string): string {
  let authState: string;
  switch (user.toLowerCase()) {
    case 'adminuser':
      authState = 'auth-storage-states/adminUser.json';
      break;
    default:
      throw new Error(`${user} is not a valid option`);
  }
  return authState;
}

export function confirmStringNotNull(inputString: string | null): string {
  if (inputString != null) {
    return inputString.trim();
  } else {
    throw new Error(`The input string is null`);
  }
}

export function getValuesFromDataTable(data: DataTable): string[] {
  const dataRowValues = data.rows();
  const dataValues: string[] = [];
  for (const values of dataRowValues) {
    for (const value of values) {
      dataValues.push(value);
    }
  }
  return dataValues;
}

export function getValuesFromTestDataset(testData: any, dataset: string): string[] {
  const values: string[] = [];

  for (const key in testData[dataset]) {
    values.push(testData[dataset][key]);
  }
  return values;
}

function filterTagsForTicketRef(tag: string) {
  return tag.toUpperCase().startsWith('@RSP-');
}

export function getTicketReferenceTags(tags: string[]): string[] {
  const ticketTag = tags.filter(filterTagsForTicketRef);
  const tickets: string[] = [];
  for (const tag of ticketTag) {
    const ticketNo = tag.replace('@', '');
    tickets.push('https://nihr.atlassian.net/browse/' + ticketNo.toUpperCase() + '\n');
  }
  return tickets;
}

export function getDecryptedValue(data: string) {
  let value: string = '';
  if (process.env.SECRET_KEY) {
    const decipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(`${process.env.SECRET_KEY}`), Buffer.alloc(16));
    let decrypted = decipher.update(data, 'hex', 'utf8');
    decrypted = decrypted + decipher.final('utf8');
    value = decrypted;
  } else {
    value = data;
  }
  return value;
}

export async function readAxeResultsContents(path: string): Promise<string> {
  let contents: string;
  try {
    contents = await readFile(`${path}`, { encoding: 'utf8' });
  } catch (error) {
    throw new Error('Note that running the Axe Tool is a prerequisite for this step\n' + error.message);
  }
  return contents;
}

export function generateDynamicLocator(dynamicLocator: string, value: string) {
  let newLocator: string = '';
  newLocator = dynamicLocator.replace('%s', value);
  return newLocator;
}

export async function getTextFromElementArray(inputArray: Locator[]): Promise<string[]> {
  const arrInputText: Array<string> = [];
  for await (const input of inputArray) {
    const inputText = confirmStringNotNull(await input.textContent());
    arrInputText.push(inputText.trim());
  }
  return arrInputText;
}

let browser: any;
let browserName: string;
// export function getDeviceType(): string | undefined {
//   switch (`${process.env.BROWSER}`.toUpperCase()) {
//     case 'CHROMIUM':
//       return `${deviceDChrome}`;
//     case 'FIREFOX':
//       return `${deviceDFirefox}`;
//     case 'SAFARI':
//       return `${deviceDSafari}`;
//     case 'IOS':
//       return `${deviceMIOS}`;
//     case 'ANDROID':
//       return `${deviceMAndroid}`;
//     default:
//       return `${deviceDChrome}`;
//   }
// }

// export const deviceType = getDeviceType();

export function getBrowserType(deviceType: string): string {
  browser = devices[`${deviceType}`];
  browserName = JSON.parse(JSON.stringify(browser)).defaultBrowserType;
  return browserName;
}

// export const defaultBrowserType = getBrowserType();
export function getBrowserVersionDevices(deviceType: string): string | undefined {
  browser = devices[`${deviceType}`];
  let version: string | undefined;
  const browserType = `${JSON.parse(JSON.stringify(browser)).defaultBrowserType}`;
  const userAgent = `${JSON.parse(JSON.stringify(browser)).userAgent}`;
  if (browserType == 'chromium') {
    const result: string[] = userAgent.split('Chrome/');
    const subresult: string = result[1];
    version = subresult.split(' ')[0];
  } else if (browserType == 'webkit') {
    const result: string[] = userAgent.split('Version/');
    const subresult: string = result[1];
    version = subresult.split(' ')[0];
  } else if (browserType == 'firefox') {
    const result: string[] = userAgent.split('Firefox/');
    const subresult: string = result[1];
    version = subresult;
  }
  return version;
}

// export const browserVersion = getBrowserVersionDevices();

let browserdata: any;
let platform: string;
// export function getBrowserDetails() {
//   if (`${process.env.BROWSER}` == 'safari') {
//     browserdata = devices[`${deviceDSafari}`];
//     platform = 'desktop';
//   } else if (`${process.env.BROWSER}` == 'firefox') {
//     browserdata = devices[`${deviceDFirefox}`];
//     platform = 'desktop';
//   } else if (`${process.env.BROWSER}` == 'ios') {
//     browserdata = devices[`${deviceMIOS}`];
//     platform = 'mobile';
//   } else if (`${process.env.BROWSER}` == 'android') {
//     browserdata = devices[`${deviceMAndroid}`];
//     platform = 'mobile';
//   } else if (`${process.env.BROWSER}` == 'chromium') {
//     browserdata = devices[`${deviceDChrome}`];
//     platform = 'desktop';
//   } else {
//     browserdata = devices[`${deviceDChrome}`];
//     platform = 'desktop';
//     console.info('Invalid browser name, hence executing tests with default browser Chromium');
//   }
//   return [browserdata, platform];
// }

// export const [browserVal, platformVal] = getBrowserDetails();
let deviceType: string;
export function getBrowserDetails() {
  if (`${process.env.PLATFORM?.toLowerCase()}` == 'mobile') {
    if (`${process.env.OS_TYPE?.toLowerCase()}` == 'ios') {
      browserdata = devices[`${process.env.IOS_Device}`];
      deviceType = `${process.env.IOS_Device}`;
    } else if (`${process.env.OS_TYPE?.toLowerCase()}` == 'android') {
      browserdata = devices[`${process.env.ANDROID_Device}`];
      deviceType = `${process.env.ANDROID_Device}`;
    }
  } else if (`${process.env.PLATFORM?.toLowerCase()}` == 'desktop') {
    if (`${process.env.BROWSER?.toLowerCase()}` == 'safari') {
      browserdata = devices[`${deviceDSafari}`];
      deviceType = `${deviceDSafari}`;
    } else if (`${process.env.BROWSER?.toLowerCase()}` == 'firefox') {
      browserdata = devices[`${deviceDFirefox}`];
      deviceType = `${deviceDFirefox}`;
    } else if (`${process.env.BROWSER?.toLowerCase()}` == 'chromium') {
      browserdata = devices[`${deviceDChrome}`];
      deviceType = `${deviceDChrome}`;
    } else {
      browserdata = devices[`${deviceDChrome}`];
      deviceType = `${deviceDChrome}`;

      console.info('Invalid browser name, hence executing tests with default browser Chromium');
    }
  }
  platform = `${process.env.PLATFORM?.toLowerCase()}`;
  return [browserdata, platform, deviceType];
}
export const [browserVal, platformVal, deviceTypeVal] = getBrowserDetails();

export function displayTimeZone(time: Date | string) {
  return new Date(time).toLocaleString(undefined, { timeZoneName: 'short' });
}

export function formatedDuration(duration: number) {
  const seconds = Math.floor((duration / 1000) % 60);

  const minutes = Math.floor((duration / 1000 / 60) % 60);

  const hours = Math.floor((duration / 1000 / 60 / 60) % 24);

  const formattedTime = [
    hours.toString().padStart(2, '0'),
    minutes.toString().padStart(2, '0'),
    seconds.toString().padStart(2, '0'),
  ].join(':');
  return formattedTime;
}

export function generatehtmlReport(path: string, htmlReport: string) {
  if (!fs.existsSync(path)) {
    fs.mkdirSync('./test-reports/axeAccessibility', {
      recursive: true,
    });
  }
  fs.writeFileSync(`./test-reports/axeAccessibility/${path}.html`, htmlReport);
}

export async function generateJSON($bddWorld, axeScanResults, jsonfile) {
  await $bddWorld.testInfo.attach('accessibility-scan-results', {
    body: JSON.stringify(axeScanResults, null, 2),
    contentType: 'application/json',
  });
  const file = $bddWorld.testInfo.outputPath(`${jsonfile}`);
  await writeFile(file, JSON.stringify(axeScanResults, null, 2), 'utf8');
}

export async function generateAxeHTMLReport($bddWorld, axeScanResults) {
  const htmlReport = createHtmlReport({
    results: axeScanResults,
    options: {
      projectKey: $bddWorld.testInfo.title,
      doNotCreateReportFile: false,
    },
  });
  //write the html report for each page
  generatehtmlReport(`${$bddWorld.testInfo.title.replace(' ', '_')}.html`, htmlReport);
}

export function getOSNameVersion() {
  let osVersion;
  if (`${os.version}`.includes('Ubuntu')) {
    osVersion = `${os.type}` + ' ' + `${os.release}`;
  } else {
    osVersion = `${os.version}`;
  }
  return osVersion;
}
