import * as userProfileGeneratedataConfig from '../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
import RandExp from 'randexp';
import { faker } from '@faker-js/faker';

let forenamePattern_valid: RegExp;
let surnamePattern_valid: RegExp;
let telephonePattern_valid: RegExp;
let titlePattern_valid: RegExp;
let emailPattern_valid: RegExp;
let pattern_invalid: RegExp;
let testdata_output_faker: string[];
let testdata_output: string[];
let testdata_output_faker_invalid: string[];
let testdata_output_invalid: string[];
const results_invalid_phone: string[] = [];
const results_invalid_email: string[] = [];
const results_invalid: string[] = [];
let results: string[] = [];
let testdata: string;

export function getRegexforFieldsfromJSONconfig(typeofdata: string, fieldName: string) {
  if (typeofdata === 'Valid' && fieldName === 'Forename') {
    forenamePattern_valid = new RegExp(userProfileGeneratedataConfig.valid_data.Forename['regexp']);
  } else if (typeofdata === 'Valid' && fieldName === 'Surname') {
    surnamePattern_valid = new RegExp(userProfileGeneratedataConfig.valid_data.Surname['regexp']);
  } else if (typeofdata === 'Valid' && fieldName === 'Telephone') {
    telephonePattern_valid = new RegExp(userProfileGeneratedataConfig.valid_data.Telephone['regexp']);
  } else if (typeofdata === 'Valid' && fieldName === 'Title') {
    titlePattern_valid = new RegExp(userProfileGeneratedataConfig.valid_data.Title['regexp']);
  } else if (typeofdata === 'Valid' && fieldName === 'Email') {
    emailPattern_valid = new RegExp(userProfileGeneratedataConfig.valid_data.Email['regexp']);
  } else if (typeofdata === 'Invalid') {
    pattern_invalid = new RegExp(userProfileGeneratedataConfig.invalid_data.Email['regexp']);
  }
  return [
    forenamePattern_valid,
    surnamePattern_valid,
    telephonePattern_valid,
    titlePattern_valid,
    emailPattern_valid,
    pattern_invalid,
  ];
}
export function getJSONpath() {
  const jsonPath = userProfileGeneratedataConfig.JSON_Properties['json_path'];
  const jsonPath_faker = userProfileGeneratedataConfig.JSON_Properties['json_path_faker'];
  return [jsonPath, jsonPath_faker];
}
export function generateTestDataEmail(
  pattern_valid: RegExp,
  fieldName: string,
  typeofdata: string,
  pattern_invalid: RegExp
) {
  if (fieldName == 'Email' && typeofdata == 'Valid') {
    [testdata_output, testdata_output_faker] = generateTestDataEmailValid(pattern_valid, fieldName);
  } else if (fieldName == 'Email' && typeofdata == 'Invalid') {
    [testdata_output, testdata_output_faker] = generateTestDataEmailInvalid(pattern_valid, fieldName, pattern_invalid);
  }
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataEmailValid(pattern_valid: RegExp, fieldName: string) {
  const count = userProfileGeneratedataConfig.valid_data.Email['count'];
  const minLength = userProfileGeneratedataConfig.valid_data.Email['minLength'];
  const maxLength = userProfileGeneratedataConfig.valid_data.Email['maxLength'];
  [testdata_output, testdata_output_faker] = generateValidData(
    pattern_valid,
    fieldName,
    Number(count),
    Number(minLength),
    Number(maxLength)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataEmailInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
  const count = userProfileGeneratedataConfig.invalid_data.Email['count'];
  [testdata_output, testdata_output_faker] = generateInvalidData(
    pattern_invalid,
    pattern_valid,
    fieldName,
    Number(count)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataForename(
  pattern_valid: RegExp,
  fieldName: string,
  typeofdata: string,
  pattern_invalid: RegExp
) {
  if (fieldName == 'Forename' && typeofdata == 'Valid') {
    [testdata_output, testdata_output_faker] = generateTestDataForenameValid(pattern_valid, fieldName);
  } else if (fieldName == 'Forename' && typeofdata == 'Invalid') {
    [testdata_output, testdata_output_faker] = generateTestDataForenameInvalid(
      pattern_valid,
      fieldName,
      pattern_invalid
    );
  }
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataForenameValid(pattern_valid: RegExp, fieldName: string) {
  const count = userProfileGeneratedataConfig.valid_data.Forename['count'];
  const minLength = userProfileGeneratedataConfig.valid_data.Forename['minLength'];
  const maxLength = userProfileGeneratedataConfig.valid_data.Forename['maxLength'];
  [testdata_output, testdata_output_faker] = generateValidData(
    pattern_valid,
    fieldName,
    Number(count),
    Number(minLength),
    Number(maxLength)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataForenameInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
  const count = userProfileGeneratedataConfig.invalid_data.Forename['count'];
  [testdata_output, testdata_output_faker] = generateInvalidData(
    pattern_invalid,
    pattern_valid,
    fieldName,
    Number(count)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataSurname(
  pattern_valid: RegExp,
  fieldName: string,
  typeofdata: string,
  pattern_invalid: RegExp
) {
  if (fieldName == 'Surname' && typeofdata == 'Valid') {
    [testdata_output, testdata_output_faker] = generateTestDataSurnameValid(pattern_valid, fieldName);
  } else if (fieldName == 'Surname' && typeofdata == 'Invalid') {
    [testdata_output, testdata_output_faker] = generateTestDataSurnameInvalid(
      pattern_valid,
      fieldName,
      pattern_invalid
    );
  }
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataSurnameValid(pattern_valid: RegExp, fieldName: string) {
  const count = userProfileGeneratedataConfig.valid_data.Surname['count'];
  const minLength = userProfileGeneratedataConfig.valid_data.Surname['minLength'];
  const maxLength = userProfileGeneratedataConfig.valid_data.Surname['maxLength'];
  [testdata_output, testdata_output_faker] = generateValidData(
    pattern_valid,
    fieldName,
    Number(count),
    Number(minLength),
    Number(maxLength)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataSurnameInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
  const count = userProfileGeneratedataConfig.invalid_data.Surname['count'];
  [testdata_output, testdata_output_faker] = generateInvalidData(
    pattern_invalid,
    pattern_valid,
    fieldName,
    Number(count)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTelephone(
  pattern_valid: RegExp,
  fieldName: string,
  typeofdata: string,
  pattern_invalid: RegExp
) {
  if (fieldName == 'Telephone' && typeofdata == 'Valid') {
    [testdata_output, testdata_output_faker] = generateTestDataTelephoneValid(pattern_valid, fieldName);
  } else if (fieldName == 'Telephone' && typeofdata == 'Invalid') {
    [testdata_output, testdata_output_faker] = generateTestDataTelephoneInvalid(
      pattern_valid,
      fieldName,
      pattern_invalid
    );
  }
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTelephoneValid(pattern_valid: RegExp, fieldName: string) {
  const count = userProfileGeneratedataConfig.valid_data.Telephone['count'];
  const minLength = userProfileGeneratedataConfig.valid_data.Telephone['minLength'];
  const maxLength = userProfileGeneratedataConfig.valid_data.Telephone['maxLength'];
  [testdata_output, testdata_output_faker] = generateValidData(
    pattern_valid,
    fieldName,
    Number(count),
    Number(minLength),
    Number(maxLength)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTelephoneInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
  const count = userProfileGeneratedataConfig.invalid_data.Telephone['count'];
  [testdata_output, testdata_output_faker] = generateInvalidData(
    pattern_invalid,
    pattern_valid,
    fieldName,
    Number(count)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTitle(
  pattern_valid: RegExp,
  fieldName: string,
  typeofdata: string,
  pattern_invalid: RegExp
) {
  if (fieldName == 'Title' && typeofdata == 'Valid') {
    [testdata_output, testdata_output_faker] = generateTestDataTitleValid(pattern_valid, fieldName);
  } else if (fieldName == 'Title' && typeofdata == 'Invalid') {
    [testdata_output, testdata_output_faker] = generateTestDataTitleInvalid(pattern_valid, fieldName, pattern_invalid);
  }
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTitleValid(pattern_valid: RegExp, fieldName: string) {
  const count = userProfileGeneratedataConfig.valid_data.Title['count'];
  const minLength = userProfileGeneratedataConfig.valid_data.Title['minLength'];
  const maxLength = userProfileGeneratedataConfig.valid_data.Title['maxLength'];
  [testdata_output, testdata_output_faker] = generateValidData(
    pattern_valid,
    fieldName,
    Number(count),
    Number(minLength),
    Number(maxLength)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateTestDataTitleInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
  const count = userProfileGeneratedataConfig.invalid_data.Title['count'];
  [testdata_output, testdata_output_faker] = generateInvalidData(
    pattern_invalid,
    pattern_valid,
    fieldName,
    Number(count)
  );
  return [testdata_output, testdata_output_faker];
}
export function generateValidData(
  pattern_valid: RegExp,
  fieldName: string,
  count: number,
  minLength: number,
  maxLength: number
) {
  if (fieldName === 'Telephone' || fieldName === 'Title') {
    testdata_output = generateMatchingStringsTitlePhone(pattern_valid, fieldName, count);
  } else {
    testdata_output = generateMatchingStrings(pattern_valid, fieldName, count, minLength, maxLength);
  }
  if (fieldName == 'Telephone') {
    testdata_output_faker = generatefakerDataValidTelephone(pattern_valid, fieldName, count);
  } else {
    testdata_output_faker = generatefakerDataValid(pattern_valid, fieldName, count, minLength, maxLength);
  }
  return [testdata_output, testdata_output_faker];
}
export function generateInvalidData(pattern_invalid: RegExp, pattern_valid: RegExp, fieldName: string, count: number) {
  if (fieldName == 'Email') {
    testdata_output_faker_invalid = generatefakerDataInvalidEmail(pattern_valid, fieldName, count);
  } else if (fieldName == 'Telephone') {
    testdata_output_faker_invalid = generatefakerDataInvalidPhone(pattern_valid, count);
  } else {
    testdata_output_faker_invalid = generatefakerDataInvalid(pattern_valid, fieldName, count);
  }
  testdata_output_invalid = generateNonMatchingStrings(pattern_invalid, pattern_valid, count);
  return [testdata_output_invalid, testdata_output_faker_invalid];
}

export function generateNonMatchingStrings(regex_invalid: RegExp, regex_valid: RegExp, count: number) {
  const results: string[] = [];
  const generator = new RandExp(regex_invalid);
  for (let i = 0; i < count; i++) {
    const testdata = generator.gen();
    if (!regex_valid.test(testdata)) {
      results.push(testdata);
    }
  }
  return results;
}
export function generateMatchingStrings(
  regex: RegExp,
  fieldName: string,
  count: number,
  minLength: number,
  maxLength: number
) {
  const results: string[] = [];
  const generator = new RandExp(regex);
  for (let i = 0; i < count; i++) {
    const testdata = generator.gen();
    if (regex.test(testdata)) {
      if (testdata.length >= minLength) {
        if (testdata.length <= maxLength) {
          results.push(testdata);
        }
      }
    }
  }
  return results;
}
export function generateMatchingStringsTitlePhone(regex: RegExp, fieldName: string, count: number) {
  const results: string[] = [];
  const generator = new RandExp(regex);
  for (let i = 0; i < count; i++) {
    const testdata = generator.gen();
    if (regex.test(testdata)) {
      results.push(testdata);
    }
  }
  return results;
}

export function generatefakerDataInvalid(regex: RegExp, fieldName: string, count: number) {
  for (let i = 0; i < count; i++) {
    if (fieldName === 'Title') {
      testdata = faker.person.prefix();
    } else if (fieldName === 'Forename') {
      testdata = faker.person.firstName();
    } else if (fieldName === 'Surname') {
      testdata = faker.person.lastName();
    }
    [results] = generateInvalidDataConditions(regex, testdata);
  }
  return results;
}
export function generateInvalidDataConditions(regex: RegExp, testdata: string) {
  const resultsConditionPrefixSpecialChars = generateInvalidDataConditionPrefixSpecialChars(regex, testdata);
  const resultsConditionNumericPrefix = generateInvalidDataConditionNumericPrefix(regex, testdata);
  const resultsConditionInvalidPrefix = generateInvalidDataConditionInvalidPrefix(regex, testdata);
  const resultsConditionInvalidPostfix = generateInvalidDataConditionInvalidPostfix(regex, testdata);
  const resultsConditionBlankPostfix = generateInvalidDataConditionBlankPostfix(regex, testdata);
  const resultsConditionBlank = generateInvalidDataConditionBlank(regex);
  const resultsConditionBlankPrefix = generateInvalidDataConditionBlankPrefix(regex, testdata);
  return [
    resultsConditionPrefixSpecialChars,
    resultsConditionNumericPrefix,
    resultsConditionInvalidPrefix,
    resultsConditionInvalidPostfix,
    resultsConditionBlankPostfix,
    resultsConditionBlank,
    resultsConditionBlankPrefix,
  ];
}
export function generateInvalidDataConditionPrefixSpecialChars(regex: RegExp, testdata: string) {
  const testdataInvalid = ' +' + testdata;
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionNumericPrefix(regex: RegExp, testdata: string) {
  const testdataInvalid = '123' + testdata;
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionInvalidPrefix(regex: RegExp, testdata: string) {
  const testdataInvalid = '%^&*' + testdata;
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionInvalidPostfix(regex: RegExp, testdata: string) {
  const testdataInvalid = testdata + '12sd3';
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionBlankPostfix(regex: RegExp, testdata: string) {
  const testdataInvalid = testdata + '  ';
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionBlank(regex: RegExp) {
  const testdataInvalid = '  ';
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}
export function generateInvalidDataConditionBlankPrefix(regex: RegExp, testdata: string) {
  const testdataInvalid = '  ' + testdata;
  if (!regex.test(testdataInvalid)) {
    results_invalid.push(testdataInvalid);
  }
  return results_invalid;
}

export function removeAtSymbol(input: string): string {
  return input.replace(/@/g, '');
}
export function removeDomainpart(input: string) {
  const localpart = input.split('@')[0];
  return localpart;
}
export function removeLocalpart(input: string) {
  const domainpart = input.split('@')[1];
  return domainpart;
}
export function replaceLocalpart(input: string) {
  const domainpart = input.split('@')[1];
  const localpart = userProfileGeneratedataConfig.invalid_data.Email.data_condition4;
  return localpart + domainpart;
}
export function generatefakerDataInvalidEmail(regex: RegExp, fieldName: string, count: number) {
  let results: string[] = [];
  const testdata_faker_email = faker.internet.email();
  for (let i = 0; i < count; i++) {
    [results] = generateInvalidEmailDataConditions(regex, testdata_faker_email);
  }
  return results;
}
export function generateInvalidEmailDataConditions(regex: RegExp, testdata_faker_email: string) {
  const resultsConditionremoveAtSymbol = generateInvalidEmailConditionremoveAtSymbol(regex, testdata_faker_email);
  const resultsConditionremoveDomainpart = generateInvalidEmailConditionremoveDomainpart(regex, testdata_faker_email);
  const resultsConditionremoveLocalpart = generateInvalidEmailConditionremoveLocalpart(regex, testdata_faker_email);
  const resultsConditionreplaceLocalpart = generateInvalidEmailConditionreplaceLocalpart(regex, testdata_faker_email);
  const resultsConditionWords = generateInvalidEmailConditionWords(regex);
  const resultsConditionNoTLD = generateInvalidEmailConditionNoTLD(regex);
  const resultsConditionTooManydots = generateInvalidEmailConditionTooManydots(regex);
  const resultsConditionNumericTLD = generateInvalidEmailConditionNumericTLD(regex);
  const resultsConditionExtraChars = generateInvalidEmailConditionExtraChars(regex);
  return [
    resultsConditionremoveAtSymbol,
    resultsConditionremoveDomainpart,
    resultsConditionremoveLocalpart,
    resultsConditionreplaceLocalpart,
    resultsConditionWords,
    resultsConditionNoTLD,
    resultsConditionTooManydots,
    resultsConditionNumericTLD,
    resultsConditionExtraChars,
  ];
}
export function generateInvalidEmailConditionremoveAtSymbol(regex: RegExp, testdata: string) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition1 === 'removeAtSymbol') {
    const testdata_invalid = removeAtSymbol(testdata);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionremoveDomainpart(regex: RegExp, testdata: string) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition2 === 'removeDomainpart') {
    const testdata_invalid = removeDomainpart(testdata);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionremoveLocalpart(regex: RegExp, testdata: string) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition3 === 'removeLocalpart') {
    const testdata_invalid = removeLocalpart(testdata);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionreplaceLocalpart(regex: RegExp, testdata: string) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition4 === 'replaceLocalpart') {
    const testdata_invalid = replaceLocalpart(testdata);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionWords(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition5 === 'words') {
    const testdata_invalid = faker.word.words(3);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionNoTLD(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition6 === 'NoTLD') {
    const testdata_invalid = faker.word.words(1) + '@' + faker.word.words(1);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionTooManydots(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition7 === 'TooManydots') {
    const testdata_invalid =
      faker.word.words(1) + '@' + faker.word.words(1) + '.' + faker.word.words(1) + '.' + faker.word.words(1);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionNumericTLD(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition8 === 'NumericTLD') {
    const testdata_invalid = faker.word.words(1) + '@' + faker.word.words(1) + '.111.222.333.44444';
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generateInvalidEmailConditionExtraChars(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Email.condition9 === 'ExtraChars') {
    const testdata_invalid = faker.word.words(1) + '@' + faker.word.words(1) + '.com' + faker.word.words(1);
    if (!regex.test(testdata_invalid)) {
      results_invalid_email.push(testdata_invalid);
    }
  }
  return results_invalid_email;
}
export function generatefakerDataInvalidPhone(regex: RegExp, count: number) {
  let results: string[] = [];
  for (let i = 0; i < count; i++) {
    [results] = generateInvalidPhoneDataConditions(regex);
  }
  return results;
}
export function generateInvalidPhoneDataConditions(regex: RegExp) {
  const resultsConditionNaN = generateInvalidPhoneConditionNAN(regex);
  const resultsConditionPrefixSixDigits = generateInvalidPhoneConditionPrefixSixDigits(regex);
  const resultsConditionPostfixFourDigits = generateInvalidPhoneConditionPostfixFourDigits(regex);
  const resultsConditionMoreDigits = generateInvalidPhoneConditionMoreDigits(regex);
  const resultsConditionMixedChars = generateInvalidPhoneConditionMixedChars(regex);
  const resultsConditionNoPrefixNational = generateInvalidPhoneConditionNoPrefixNational(regex);
  const resultsConditionNoPrefixInternational = generateInvalidPhoneConditionNoPrefixInternational(regex);
  return [
    resultsConditionNaN,
    resultsConditionPrefixSixDigits,
    resultsConditionPostfixFourDigits,
    resultsConditionMoreDigits,
    resultsConditionMixedChars,
    resultsConditionNoPrefixNational,
    resultsConditionNoPrefixInternational,
  ];
}

export function generateInvalidPhoneConditionNAN(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition1 === 'Not a number') {
    const testdata_invalid = faker.word.words(1);
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionPrefixSixDigits(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition2 === '6 digits') {
    const testdata = faker.phone.number({ style: 'national' });
    const testdata_invalid = testdata.split('-')[0];
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionPostfixFourDigits(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition3 === '4 digits') {
    const testdata = faker.phone.number({ style: 'national' });
    const testdata_invalid = testdata.split('-')[1];
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionMoreDigits(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition4 === 'More digits') {
    const testdata = faker.phone.number({ style: 'national' });
    const testdata_invalid = testdata + testdata;
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionMixedChars(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition5 === 'Mixed characters') {
    const testdata_invalid = faker.phone.number({ style: 'national' }) + ' ' + faker.word.words(1);
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionNoPrefixNational(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition6 === 'No Prefix National') {
    const testdata = faker.phone.number({ style: 'national' });
    const testdata_invalid = testdata.split(' ')[1];
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}
export function generateInvalidPhoneConditionNoPrefixInternational(regex: RegExp) {
  if (userProfileGeneratedataConfig.invalid_data.Telephone.condition7 === 'No Prefix International') {
    const testdata = faker.phone.number({ style: 'international' });
    const testdata_invalid = testdata.split('+')[1] + ' ';
    if (!regex.test(testdata_invalid)) {
      results_invalid_phone.push(testdata_invalid);
    }
  }
  return results_invalid_phone;
}

export function generatefakerDataValid(
  regex: RegExp,
  fieldName: string,
  count: number,
  minLength: number,
  maxLength: number
) {
  const results: string[] = [];
  let testdata_faker: any;
  for (let i = 0; i < count; i++) {
    if (fieldName == 'Forename') {
      testdata_faker = faker.person.firstName();
    } else if (fieldName == 'Surname') {
      testdata_faker = faker.person.lastName();
    } else if (fieldName == 'Email') {
      testdata_faker = faker.internet.email();
    } else if (fieldName == 'Title') {
      testdata_faker = faker.person.prefix();
    }
    if (fieldName != 'Telephone') {
      if (regex.test(testdata_faker)) {
        if (testdata_faker.length >= minLength || testdata_faker.length <= maxLength) {
          results.push(testdata_faker);
        }
      }
    }
  }
  return results;
}
export function generatefakerDataValidTelephone(regex: RegExp, fieldName: string, count: number) {
  const results: string[] = [];
  for (let i = 0; i < count; i++) {
    if (fieldName == 'Telephone') {
      const phone_international = faker.phone.number({ style: 'international' });
      if (regex.test(phone_international)) {
        results.push(phone_international);
      }
      const phone_national = faker.phone.number({ style: 'national' });
      if (regex.test(phone_national)) {
        results.push(phone_national);
      }
    }
  }
  return results;
}
