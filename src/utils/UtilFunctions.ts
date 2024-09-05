import { DataTable } from '@cucumber/cucumber';
import crypto from 'crypto';
import { readFile } from 'fs/promises';

export function getAuthState(user: string): string {
  let authState: string;
  switch (user.toLowerCase()) {
    case 'poc':
      authState = 'auth-storage-states/contactManagerOnly.json';
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
