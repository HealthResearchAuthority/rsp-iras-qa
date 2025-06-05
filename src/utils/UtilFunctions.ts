import { DataTable } from 'playwright-bdd';
import { Locator, chromium, devices, firefox, webkit } from '@playwright/test';
import { createDecipheriv } from 'crypto';
import { readFile, writeFile } from 'fs/promises';
import 'dotenv/config';
import { deviceDSafari, deviceDFirefox, deviceDChrome, deviceDEdge } from '../hooks/GlobalSetup';
import fs from 'fs';
import os from 'os';
import * as fse from 'fs-extra';
import path from 'path';

const pathToCreateUserTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';
let browserdata: any;
let deviceType: string;
const todayDate = new Date();

export function getAuthState(user: string): string {
  let authState: string;
  switch (user.toLowerCase()) {
    case 'system_admin':
      authState = 'auth-storage-states/sysAdminUser.json';
      break;
    case 'frontstage_user':
      authState = 'auth-storage-states/frontStageUser.json';
      break;
    case 'backstage_user':
      authState = 'auth-storage-states/backStageUser.json';
      break;
    case 'admin_user':
      authState = 'auth-storage-states/adminUser.json';
      break;
    case 'non_admin_user':
      authState = 'auth-storage-states/nonAdminUser.json';
      break;
    default:
      throw new Error(`${user} is not a valid option`);
  }
  return authState;
}

export function confirmStringNotNull(inputString: string | null | undefined): string {
  if (inputString != null) {
    return inputString.trim();
  } else {
    throw new Error(`The input string is null`);
  }
}

export function confirmArrayNotNull<ArrayType>(inputArr: ArrayType[] | null | undefined): ArrayType[] {
  if (Array.isArray(inputArr)) {
    return inputArr;
  } else {
    throw new Error(`The input array is null`);
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

export function getDecryptedValue(data: string, secretKey?: any, authTag?: string) {
  let value: string = '';
  if (secretKey) {
    const decipher = createDecipheriv('AES-256-GCM', Buffer.from(`${secretKey}`), Buffer.alloc(16));
    decipher.setAuthTag(Buffer.from(`${authTag}`, 'hex'));
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

export async function getTextFromElementArray(inputArray: Locator[]): Promise<string[]> {
  const arrInputText: Array<string> = [];
  for (const input of inputArray) {
    const inputText = confirmStringNotNull(await input.textContent());
    arrInputText.push(inputText.trim());
  }
  return arrInputText;
}

export function getBrowserType(deviceType: string): string {
  const browser = devices[`${deviceType}`];
  let browserName: string;
  if (`${process.env.BROWSER?.toLowerCase()}` == 'microsoft edge') {
    browserName = 'Microsoft Edge';
  } else if (`${process.env.BROWSER?.toLowerCase()}` == 'google chrome') {
    browserName = 'Google Chrome';
  } else {
    browserName = JSON.parse(JSON.stringify(browser)).defaultBrowserType;
  }
  return browserName;
}

export async function getBrowserVersionDevices(deviceType: string): Promise<string | undefined> {
  const browser = devices[`${deviceType}`];
  let version: string | undefined;
  const browserType = `${JSON.parse(JSON.stringify(browser)).defaultBrowserType}`;
  if (browserType == 'chromium') {
    if (`${process.env.PLATFORM?.toLowerCase()}` == 'desktop') {
      if (`${process.env.BROWSER?.toLowerCase()}` == 'chromium') {
        version = await getAllBrowserVersion('chromium');
      } else if (`${process.env.BROWSER?.toLowerCase()}` == 'microsoft edge') {
        version = await getAllBrowserVersion('microsoft edge');
      } else if (`${process.env.BROWSER?.toLowerCase()}` == 'google chrome') {
        version = await getAllBrowserVersion('google chrome');
      }
    } else {
      version = await getAllBrowserVersion('chromium');
    }
  } else if (browserType == 'webkit') {
    version = await getAllBrowserVersion('webkit');
  } else if (browserType == 'firefox') {
    version = await getAllBrowserVersion('firefox');
  }
  return version;
}
function getMobileBrowserData() {
  if (`${process.env.OS_TYPE?.toLowerCase()}` == 'ios') {
    if (`${process.env.IOS_Device}` != 'N/A') {
      browserdata = devices[`${process.env.IOS_Device}`];
      deviceType = `${process.env.IOS_Device}`;
    } else {
      throw new Error('Invalid iOS device type selected, Please choose any valid option');
    }
  } else if (`${process.env.OS_TYPE?.toLowerCase()}` == 'android') {
    if (`${process.env.ANDROID_Device}` != 'N/A') {
      browserdata = devices[`${process.env.ANDROID_Device}`];
      deviceType = `${process.env.ANDROID_Device}`;
    } else {
      throw new Error('Invalid Android device type selected, Please choose any valid option');
    }
  } else {
    throw new Error('Invalid Mobile OS type selected, Please choose any valid option');
  }
}
function getDesktopBrowserData() {
  if (`${process.env.BROWSER?.toLowerCase()}` == 'safari') {
    browserdata = devices[`${deviceDSafari}`];
    deviceType = `${deviceDSafari}`;
  } else if (`${process.env.BROWSER?.toLowerCase()}` == 'firefox') {
    browserdata = devices[`${deviceDFirefox}`];
    deviceType = `${deviceDFirefox}`;
  } else if (
    `${process.env.BROWSER?.toLowerCase()}` == 'chromium' ||
    `${process.env.BROWSER?.toLowerCase()}` == 'google chrome'
  ) {
    browserdata = devices[`${deviceDChrome}`];
    deviceType = `${deviceDChrome}`;
  } else if (`${process.env.BROWSER?.toLowerCase()}` == 'microsoft edge') {
    browserdata = devices[`${deviceDEdge}`];
    deviceType = `${deviceDEdge}`;
  } else {
    browserdata = devices[`${deviceDChrome}`];
    deviceType = `${deviceDChrome}`;

    console.info('Invalid browser name, hence executing tests with default browser Chromium');
  }
}

export function getBrowserDetails() {
  if (`${process.env.PLATFORM?.toLowerCase()}` == 'mobile') {
    getMobileBrowserData();
  } else if (`${process.env.PLATFORM?.toLowerCase()}` == 'desktop') {
    getDesktopBrowserData();
  }
  const platformVal = `${process.env.PLATFORM?.toLowerCase()}`;
  return [browserdata, platformVal, deviceType];
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

export function generatehtmlReport(path: string, htmlReport: string, wcagStandard: string) {
  if (!fs.existsSync(path)) {
    fs.mkdirSync('./test-reports/axeAccessibility', {
      recursive: true,
    });
  }
  let resultHeaderInsert: string;
  if (wcagStandard.startsWith('is Not')) {
    resultHeaderInsert = `violations<br /><span style="color: #ff0000">The ${path.replace('_', ' ')} ${wcagStandard}</span>
      <h4>Please Note that this is Subject to Further Manual Checks</h4>`;
  } else {
    resultHeaderInsert = `violations<br />The ${path.replace('_', ' ')} ${wcagStandard}
      <h4>Please Note that this is Subject to Further Manual Checks</h4>`;
  }
  const adjustedHtmlReport = htmlReport.replace(/violations/, resultHeaderInsert).replace(/project/, '');
  fs.writeFileSync(`./test-reports/axeAccessibility/${path}.html`, adjustedHtmlReport);
}

export async function generateJSON($bddWorld, axeScanResults, jsonfile) {
  await $bddWorld.testInfo.attach('accessibility-scan-results', {
    body: JSON.stringify(axeScanResults, null, 2),
    contentType: 'application/json',
  });
  const file = $bddWorld.testInfo.outputPath(`${jsonfile}`);
  await writeFile(file, JSON.stringify(axeScanResults, null, 2), 'utf8');
}

export function getOSNameVersion() {
  let osVersion: string;
  if (`${os.version}`.includes('Ubuntu')) {
    osVersion = `${os.type}` + ' ' + `${os.release}`;
  } else {
    osVersion = `${os.version}`;
  }
  return osVersion;
}

export function getDeviceName() {
  let deviceName: string;
  if (`${process.env.PLATFORM?.toLowerCase()}` == 'desktop') {
    deviceName = 'Desktop';
  } else {
    deviceName = deviceTypeVal;
  }
  return deviceName;
}

export function getReportFolderName() {
  const day = todayDate.getDate();
  const month = todayDate.toLocaleString('default', { month: 'short' });
  const year = todayDate.getFullYear();
  const hours = (todayDate.getHours() < 10 ? '0' : '') + todayDate.getHours();
  const minutes = (todayDate.getMinutes() < 10 ? '0' : '') + todayDate.getMinutes();
  const deviceName = getDeviceName().replace(/^./, (char) => char.toUpperCase());
  const browserName = getBrowserType(deviceTypeVal).replace(/^./, (char) => char.toUpperCase());
  const testReportFolderName =
    day + '_' + month + '_' + year + ' ' + hours + minutes + ' ' + deviceName + '_' + browserName;
  return testReportFolderName;
}

export async function getAllBrowserVersion(browserName: string): Promise<string> {
  let browserLaunch: any;
  switch (browserName) {
    case 'microsoft edge': {
      browserLaunch = await chromium.launch({ channel: 'msedge', headless: true });
      break;
    }
    case 'google chrome': {
      browserLaunch = await chromium.launch({ channel: 'chrome', headless: true });
      break;
    }
    case 'chromium': {
      browserLaunch = await chromium.launch({ headless: true });
      break;
    }
    case 'webkit': {
      browserLaunch = await webkit.launch({ headless: true });
      break;
    }
    case 'firefox': {
      browserLaunch = await firefox.launch({ headless: true });
      break;
    }
    default: {
      throw new Error(`${browserName} is not defined`);
    }
  }
  const version = browserLaunch.version();
  await browserLaunch.close();
  return version;
}

//Sort Accessibilty Report Results based on WCAG Standard, A --> AAA
export function compareWcagStandards(a: { tags: string[] }, b: { tags: string[] }) {
  const aWcagTag = extractWcagTag(a.tags);
  const bWcagTag = extractWcagTag(b.tags);
  const aWcagTagGuideline = extractWcagGuideline(aWcagTag);
  const bWcagTagGuideline = extractWcagGuideline(bWcagTag);
  const aWcagTagStandard = extractWcagStandard(aWcagTag);
  const bWcagTagStandard = extractWcagStandard(bWcagTag);

  if (aWcagTagStandard.length < bWcagTagStandard.length) {
    return -1;
  } else if (aWcagTagStandard.length > bWcagTagStandard.length) {
    return 1;
  } else {
    if (aWcagTagGuideline > bWcagTagGuideline) {
      return -1;
    } else if (aWcagTagGuideline < bWcagTagGuideline) {
      return 1;
    }
    return 0;
  }
}

export async function assertWcagCompliance(violations: { tags: string[] }[]): Promise<string> {
  let doubleAStandardViolation: number = 0;
  let tripleAStandardViolation: number = 0;
  for (const violation of violations) {
    const wcagTag = extractWcagTag(violation.tags);
    const wcagTagStandard = extractWcagStandard(wcagTag);
    if (wcagTagStandard == 'a') {
      return 'is Not WCAG Compliant';
    } else if (wcagTagStandard == 'aa') {
      doubleAStandardViolation++;
    } else {
      tripleAStandardViolation++;
    }
  }
  return standardAcheived(doubleAStandardViolation, tripleAStandardViolation);
}

function extractWcagTag(tags: string[]): string {
  const wcagStandardRegex = new RegExp(/(?<=wcag2(?:[1-2])?)a+/);
  const wcagTag = confirmStringNotNull(tags.find((tag) => wcagStandardRegex.exec(tag)));
  return wcagTag;
}

function extractWcagStandard(wcagTag: string): string {
  const wcagStandardRegex = new RegExp(/(?<=wcag2(?:[1-2])?)a+/);
  const wcagTagStandard = confirmStringNotNull(wcagStandardRegex.exec(wcagTag)?.toString());
  return wcagTagStandard;
}

function extractWcagGuideline(wcagTag: string): number {
  const wcagGuidelineRegex = new RegExp(/\d+/);
  const wcagTagGuideline = parseInt(confirmStringNotNull(wcagGuidelineRegex.exec(wcagTag)?.toString()));
  return wcagTagGuideline;
}

function standardAcheived(doubleViolation: number, tripleViolation: number) {
  if (doubleViolation > 0) {
    return 'is WCAG Compliant to the A Standard';
  } else if (tripleViolation > 0) {
    return 'is WCAG Compliant to the AA Standard';
  } else {
    return 'is WCAG Compliant to the AAA Standard';
  }
}

export async function generateUniqueEmail(keyVal: string, prefix: string): Promise<string> {
  const timestamp = new Date().toISOString().replace(/[-:.TZ]/g, '');
  const domain = keyVal;
  return `${prefix}${timestamp}${domain}`;
}

export async function generateUniqueValue(keyVal: string, prefix: string): Promise<string> {
  const timestamp = new Date().toISOString().replace(/[-:.TZ]/g, '');
  const domain = keyVal;
  return `${domain}${prefix}${timestamp}`;
}

export async function removeUnwantedWhitespace(value: string): Promise<string> {
  return value.replaceAll(/\s+/g, ' ').trim();
}

export async function generateTimeStampedValue(keyVal: string, separator: string): Promise<string> {
  const timestamp = new Date().toISOString().replace(/[-:.TZ]/g, '');
  return `${keyVal}${separator}${timestamp}`;
}

export async function getCurrentTimeFormatted(): Promise<string> {
  const date = new Date();
  const utcDay = date.getUTCDate().toString().padStart(2, '0');
  const utcMonth = date.toLocaleString('en-GB', { month: 'short', timeZone: 'UTC' });
  const utcYear = date.getUTCFullYear();
  const utcHours = date.getUTCHours().toString().padStart(2, '0');
  const utcMinutes = date.getUTCMinutes().toString().padStart(2, '0');
  const formattedUTC = `${utcDay} ${utcMonth} ${utcYear} ${utcHours}:${utcMinutes}`;
  return formattedUTC;
}

export async function returnDataFromJSON(filePath?: string): Promise<any> {
  if (typeof filePath !== 'undefined') {
    const definedPath = path.resolve(filePath);
    return await fse.readJson(definedPath);
  } else {
    const createUserPath = path.resolve(pathToCreateUserTestDataJson);
    return await fse.readJson(createUserPath);
  }
}

export async function convertDate(day: string, month: number, year: number): Promise<any> {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  const formattedDate = `${day.padStart(2, '0')} ${monthNames[month - 1]} ${year}`;
  return formattedDate.toString();
}

export async function returnSingleRandomLocator(resolvesToMultiElements: Locator): Promise<Locator> {
  const noOfElements = await resolvesToMultiElements.count();
  const randomIndex = Math.floor(Math.random() * (noOfElements - 1));
  return resolvesToMultiElements.nth(randomIndex);
}

export async function sortArray(value: string[]): Promise<string[]> {
  return value.sort((a, b) => a.localeCompare(b, undefined, { sensitivity: 'base' }));
}

export function resolveEnvExpression(template: string): string {
  const passwordParts = template.split('`${process.env.');
  if (passwordParts.length < 2) {
    throw new Error('Invalid template format');
  }
  const envVar = passwordParts[1].split('}`')[0];
  const value = process.env[envVar];
  if (!value) {
    throw new Error(`Environment variable "${envVar}" is not defined`);
  }
  return value;
}

export function isAuthStateExpired(user: any) {
  const authStatePath = getAuthState(user);
  const storage = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
  const cookies = storage.cookies || [];
  const sessionCookie = cookies.find(
    (c: any) => c.name.toLowerCase() === 'session' || c.name.toLowerCase().includes('auth')
  );
  if (!sessionCookie) return true;
  const now = Date.now() / 1000;
  // console.log(sessionCookie.expires && sessionCookie.expires < now);
  return sessionCookie.expires && sessionCookie.expires < now;
}
