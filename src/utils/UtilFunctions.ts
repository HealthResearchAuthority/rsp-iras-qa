import { DataTable } from '@cucumber/cucumber';

export function getAuthState(user: string): string {
  let authState: string
  switch (user.toLowerCase()) {
    case 'poc':
      authState = 'auth-storage-states/contactManagerOnly.json';
      break;
    default:
      throw new Error(`${user} is not a valid option`);
  }
  return authState
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
  let dataValues: string[] = [];
  for (const values of dataRowValues) {
    for (const value of values) {
      dataValues.push(value);
    }
  }
  return dataValues
}

export function getValuesFromTestDataset(testData: any, dataset: string): string[] {
  let values: string[] = [];

  for (const key in testData[dataset]) {
    values.push(testData[dataset][key]);
  }
  return values;
}

function filterTagsForTicketRef(tag: string) {
  return tag.startsWith('@RSP-');
}

export function getTicketReferenceTags(tags: string[]): string[] {
  const ticketTag = tags.filter(filterTagsForTicketRef);
  let tickets: string[] = [];
  for (const tag of ticketTag) {
    const ticketNo = tag.replace('@', '');
    tickets.push('https://nihr.atlassian.net/browse/' + ticketNo + '\n');
  }
  return tickets;
}