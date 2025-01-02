import { Page } from '@playwright/test';
import * as userProfileGeneratedataConfig from '../../../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
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

//Declare Page Objects
export default class GenerateUserAttributesPage {
  readonly page: Page;
  readonly userProfileGeneratedataConfig: typeof userProfileGeneratedataConfig;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfileGeneratedataConfig = userProfileGeneratedataConfig;
  }

  //Page Methods

  getRegexforFieldsfromJSONconfig(typeofdata: string, fieldName: string) {
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
  getJSONpath() {
    const jsonPath = userProfileGeneratedataConfig.JSON_Properties['json_path'];
    const jsonPath_faker = userProfileGeneratedataConfig.JSON_Properties['json_path_faker'];
    return [jsonPath, jsonPath_faker];
  }
  generateTestDataEmail(pattern_valid: RegExp, fieldName: string, typeofdata: string, pattern_invalid: RegExp) {
    if (fieldName == 'Email' && typeofdata == 'Valid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataEmailValid(pattern_valid, fieldName);
    } else if (fieldName == 'Email' && typeofdata == 'Invalid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataEmailInvalid(
        pattern_valid,
        fieldName,
        pattern_invalid
      );
    }
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataEmailValid(pattern_valid: RegExp, fieldName: string) {
    const count = this.userProfileGeneratedataConfig.valid_data.Email['count'];
    const minLength = this.userProfileGeneratedataConfig.valid_data.Email['minLength'];
    const maxLength = this.userProfileGeneratedataConfig.valid_data.Email['maxLength'];
    [testdata_output, testdata_output_faker] = this.generateValidData(
      pattern_valid,
      fieldName,
      Number(count),
      Number(minLength),
      Number(maxLength)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataEmailInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
    const count = this.userProfileGeneratedataConfig.invalid_data.Email['count'];
    [testdata_output, testdata_output_faker] = this.generateInvalidData(
      pattern_invalid,
      pattern_valid,
      fieldName,
      Number(count)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataForename(pattern_valid: RegExp, fieldName: string, typeofdata: string, pattern_invalid: RegExp) {
    if (fieldName == 'Forename' && typeofdata == 'Valid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataForenameValid(pattern_valid, fieldName);
    } else if (fieldName == 'Forename' && typeofdata == 'Invalid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataForenameInvalid(
        pattern_valid,
        fieldName,
        pattern_invalid
      );
    }
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataForenameValid(pattern_valid: RegExp, fieldName: string) {
    const count = this.userProfileGeneratedataConfig.valid_data.Forename['count'];
    const minLength = this.userProfileGeneratedataConfig.valid_data.Forename['minLength'];
    const maxLength = this.userProfileGeneratedataConfig.valid_data.Forename['maxLength'];
    [testdata_output, testdata_output_faker] = this.generateValidData(
      pattern_valid,
      fieldName,
      Number(count),
      Number(minLength),
      Number(maxLength)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataForenameInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
    const count = this.userProfileGeneratedataConfig.invalid_data.Forename['count'];
    [testdata_output, testdata_output_faker] = this.generateInvalidData(
      pattern_invalid,
      pattern_valid,
      fieldName,
      Number(count)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataSurname(pattern_valid: RegExp, fieldName: string, typeofdata: string, pattern_invalid: RegExp) {
    if (fieldName == 'Surname' && typeofdata == 'Valid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataSurnameValid(pattern_valid, fieldName);
    } else if (fieldName == 'Surname' && typeofdata == 'Invalid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataSurnameInvalid(
        pattern_valid,
        fieldName,
        pattern_invalid
      );
    }
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataSurnameValid(pattern_valid: RegExp, fieldName: string) {
    const count = this.userProfileGeneratedataConfig.valid_data.Surname['count'];
    const minLength = this.userProfileGeneratedataConfig.valid_data.Surname['minLength'];
    const maxLength = this.userProfileGeneratedataConfig.valid_data.Surname['maxLength'];
    [testdata_output, testdata_output_faker] = this.generateValidData(
      pattern_valid,
      fieldName,
      Number(count),
      Number(minLength),
      Number(maxLength)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataSurnameInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
    const count = this.userProfileGeneratedataConfig.invalid_data.Surname['count'];
    [testdata_output, testdata_output_faker] = this.generateInvalidData(
      pattern_invalid,
      pattern_valid,
      fieldName,
      Number(count)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTelephone(pattern_valid: RegExp, fieldName: string, typeofdata: string, pattern_invalid: RegExp) {
    if (fieldName == 'Telephone' && typeofdata == 'Valid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataTelephoneValid(pattern_valid, fieldName);
    } else if (fieldName == 'Telephone' && typeofdata == 'Invalid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataTelephoneInvalid(
        pattern_valid,
        fieldName,
        pattern_invalid
      );
    }
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTelephoneValid(pattern_valid: RegExp, fieldName: string) {
    const count = this.userProfileGeneratedataConfig.valid_data.Telephone['count'];
    const minLength = this.userProfileGeneratedataConfig.valid_data.Telephone['minLength'];
    const maxLength = this.userProfileGeneratedataConfig.valid_data.Telephone['maxLength'];
    [testdata_output, testdata_output_faker] = this.generateValidData(
      pattern_valid,
      fieldName,
      Number(count),
      Number(minLength),
      Number(maxLength)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTelephoneInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
    const count = this.userProfileGeneratedataConfig.invalid_data.Telephone['count'];
    [testdata_output, testdata_output_faker] = this.generateInvalidData(
      pattern_invalid,
      pattern_valid,
      fieldName,
      Number(count)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTitle(pattern_valid: RegExp, fieldName: string, typeofdata: string, pattern_invalid: RegExp) {
    if (fieldName == 'Title' && typeofdata == 'Valid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataTitleValid(pattern_valid, fieldName);
    } else if (fieldName == 'Title' && typeofdata == 'Invalid') {
      [testdata_output, testdata_output_faker] = this.generateTestDataTitleInvalid(
        pattern_valid,
        fieldName,
        pattern_invalid
      );
    }
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTitleValid(pattern_valid: RegExp, fieldName: string) {
    const count = this.userProfileGeneratedataConfig.valid_data.Title['count'];
    const minLength = this.userProfileGeneratedataConfig.valid_data.Title['minLength'];
    const maxLength = this.userProfileGeneratedataConfig.valid_data.Title['maxLength'];
    [testdata_output, testdata_output_faker] = this.generateValidData(
      pattern_valid,
      fieldName,
      Number(count),
      Number(minLength),
      Number(maxLength)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateTestDataTitleInvalid(pattern_valid: RegExp, fieldName: string, pattern_invalid: RegExp) {
    const count = this.userProfileGeneratedataConfig.invalid_data.Title['count'];
    [testdata_output, testdata_output_faker] = this.generateInvalidData(
      pattern_invalid,
      pattern_valid,
      fieldName,
      Number(count)
    );
    return [testdata_output, testdata_output_faker];
  }
  generateValidData(pattern_valid: RegExp, fieldName: string, count: number, minLength: number, maxLength: number) {
    if (fieldName === 'Telephone' || fieldName === 'Title') {
      testdata_output = this.generateMatchingStringsTitlePhone(pattern_valid, fieldName, count);
    } else {
      testdata_output = this.generateMatchingStrings(pattern_valid, fieldName, count, minLength, maxLength);
    }
    if (fieldName == 'Telephone') {
      testdata_output_faker = this.generatefakerDataValidTelephone(pattern_valid, fieldName, count);
    } else {
      testdata_output_faker = this.generatefakerDataValid(pattern_valid, fieldName, count, minLength, maxLength);
    }
    return [testdata_output, testdata_output_faker];
  }
  generateInvalidData(pattern_invalid: RegExp, pattern_valid: RegExp, fieldName: string, count: number) {
    if (fieldName == 'Email') {
      testdata_output_faker_invalid = this.generatefakerDataInvalidEmail(pattern_valid, fieldName, count);
    } else if (fieldName == 'Telephone') {
      testdata_output_faker_invalid = this.generatefakerDataInvalidPhone(pattern_valid, count);
    } else {
      testdata_output_faker_invalid = this.generatefakerDataInvalid(pattern_valid, fieldName, count);
    }
    testdata_output_invalid = this.generateNonMatchingStrings(pattern_invalid, pattern_valid, count);
    return [testdata_output_invalid, testdata_output_faker_invalid];
  }

  generateNonMatchingStrings(regex_invalid: RegExp, regex_valid: RegExp, count: number) {
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
  generateMatchingStrings(regex: RegExp, fieldName: string, count: number, minLength: number, maxLength: number) {
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
  generateMatchingStringsTitlePhone(regex: RegExp, fieldName: string, count: number) {
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

  generatefakerDataInvalid(regex: RegExp, fieldName: string, count: number) {
    for (let i = 0; i < count; i++) {
      if (fieldName === 'Title') {
        testdata = faker.person.prefix();
      } else if (fieldName === 'Forename') {
        testdata = faker.person.firstName();
      } else if (fieldName === 'Surname') {
        testdata = faker.person.lastName();
      }
      [results] = this.generateInvalidDataConditions(regex, testdata);
    }
    return results;
  }
  generateInvalidDataConditions(regex: RegExp, testdata: string) {
    const results_condition1 = this.generateInvalidDataCondition1(regex, testdata);
    const results_condition2 = this.generateInvalidDataCondition2(regex, testdata);
    const results_condition3 = this.generateInvalidDataCondition3(regex, testdata);
    const results_condition4 = this.generateInvalidDataCondition4(regex, testdata);
    const results_condition5 = this.generateInvalidDataCondition5(regex, testdata);
    const results_condition6 = this.generateInvalidDataCondition6(regex);
    const results_condition7 = this.generateInvalidDataCondition7(regex, testdata);
    return [
      results_condition1,
      results_condition2,
      results_condition3,
      results_condition4,
      results_condition5,
      results_condition6,
      results_condition7,
    ];
  }
  generateInvalidDataCondition1(regex: RegExp, testdata: string) {
    const testdata1 = ' +' + testdata;
    if (!regex.test(testdata1)) {
      results_invalid.push(testdata1);
    }
    return results_invalid;
  }
  generateInvalidDataCondition2(regex: RegExp, testdata: string) {
    const testdata2 = '123' + testdata;
    if (!regex.test(testdata2)) {
      results_invalid.push(testdata2);
    }
    return results_invalid;
  }
  generateInvalidDataCondition3(regex: RegExp, testdata: string) {
    const testdata3 = '%^&*' + testdata;
    if (!regex.test(testdata3)) {
      results_invalid.push(testdata3);
    }
    return results_invalid;
  }
  generateInvalidDataCondition4(regex: RegExp, testdata: string) {
    const testdata4 = testdata + '12sd3';
    if (!regex.test(testdata4)) {
      results_invalid.push(testdata4);
    }
    return results_invalid;
  }
  generateInvalidDataCondition5(regex: RegExp, testdata: string) {
    const testdata5 = testdata + '  ';
    if (!regex.test(testdata5)) {
      results_invalid.push(testdata5);
    }
    return results_invalid;
  }
  generateInvalidDataCondition6(regex: RegExp) {
    const testdata6 = '  ';
    if (!regex.test(testdata6)) {
      results_invalid.push(testdata6);
    }
    return results_invalid;
  }
  generateInvalidDataCondition7(regex: RegExp, testdata: string) {
    const testdata7 = '  ' + testdata;
    if (!regex.test(testdata7)) {
      results_invalid.push(testdata7);
    }
    return results_invalid;
  }

  removeAtSymbol(input: string): string {
    return input.replace(/@/g, '');
  }
  removeDomainpart(input: string) {
    const localpart = input.split('@')[0];
    return localpart;
  }
  removeLocalpart(input: string) {
    const domainpart = input.split('@')[1];
    return domainpart;
  }
  replaceLocalpart(input: string) {
    const domainpart = input.split('@')[1];
    const localpart = this.userProfileGeneratedataConfig.invalid_data.Email.data_condition4;
    return localpart + domainpart;
  }
  generatefakerDataInvalidEmail(regex: RegExp, fieldName: string, count: number) {
    let results: string[] = [];
    const testdata_faker_email = faker.internet.email();
    for (let i = 0; i < count; i++) {
      results = this.generateInvalidEmailCondition1(regex, testdata_faker_email);

      results = this.generateInvalidEmailCondition2(regex, testdata_faker_email);

      results = this.generateInvalidEmailCondition3(regex, testdata_faker_email);

      results = this.generateInvalidEmailCondition4(regex, testdata_faker_email);

      results = this.generateInvalidEmailCondition5(regex);

      results = this.generateInvalidEmailCondition6(regex);

      results = this.generateInvalidEmailCondition7(regex);

      results = this.generateInvalidEmailCondition8(regex);

      results = this.generateInvalidEmailCondition9(regex);
    }
    return results;
  }
  generateInvalidEmailCondition1(regex: RegExp, testdata: string) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition1 === 'removeAtSymbol') {
      const testdata_invalid1 = this.removeAtSymbol(testdata);
      if (!regex.test(testdata_invalid1)) {
        results_invalid_email.push(testdata_invalid1);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition2(regex: RegExp, testdata: string) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition2 === 'removeDomainpart') {
      const testdata_invalid2 = this.removeDomainpart(testdata);
      if (!regex.test(testdata_invalid2)) {
        results_invalid_email.push(testdata_invalid2);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition3(regex: RegExp, testdata: string) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition3 === 'removeLocalpart') {
      const testdata_invalid3 = this.removeLocalpart(testdata);
      if (!regex.test(testdata_invalid3)) {
        results_invalid_email.push(testdata_invalid3);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition4(regex: RegExp, testdata: string) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition4 === 'replaceLocalpart') {
      const testdata_invalid4 = this.replaceLocalpart(testdata);
      if (!regex.test(testdata_invalid4)) {
        results_invalid_email.push(testdata_invalid4);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition5(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition5 === 'words') {
      const testdata_invalid5 = faker.word.words(3);
      if (!regex.test(testdata_invalid5)) {
        results_invalid_email.push(testdata_invalid5);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition6(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition6 === 'NoTLD') {
      const testdata_invalid6 = faker.word.words(1) + '@' + faker.word.words(1);
      if (!regex.test(testdata_invalid6)) {
        results_invalid_email.push(testdata_invalid6);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition7(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition7 === 'TooManydots') {
      const testdata_invalid7 =
        faker.word.words(1) + '@' + faker.word.words(1) + '.' + faker.word.words(1) + '.' + faker.word.words(1);
      if (!regex.test(testdata_invalid7)) {
        results_invalid_email.push(testdata_invalid7);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition8(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition8 === 'NumericTLD') {
      const testdata_invalid8 = faker.word.words(1) + '@' + faker.word.words(1) + '.111.222.333.44444';
      if (!regex.test(testdata_invalid8)) {
        results_invalid_email.push(testdata_invalid8);
      }
    }
    return results_invalid_email;
  }
  generateInvalidEmailCondition9(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Email.condition9 === 'ExtraChars') {
      const testdata_invalid9 = faker.word.words(1) + '@' + faker.word.words(1) + '.com' + faker.word.words(1);
      if (!regex.test(testdata_invalid9)) {
        results_invalid_email.push(testdata_invalid9);
      }
    }
    return results_invalid_email;
  }
  generatefakerDataInvalidPhone(regex: RegExp, count: number) {
    let results: string[] = [];
    for (let i = 0; i < count; i++) {
      results = this.generateInvalidPhoneCondition1(regex);

      results = this.generateInvalidPhoneCondition2(regex);

      results = this.generateInvalidPhoneCondition3(regex);

      results = this.generateInvalidPhoneCondition4(regex);

      results = this.generateInvalidPhoneCondition5(regex);

      results = this.generateInvalidPhoneCondition6(regex);

      results = this.generateInvalidPhoneCondition7(regex);
    }
    return results;
  }

  generateInvalidPhoneCondition1(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition1 === 'Not a number') {
      const testdata_invalid1 = faker.word.words(1);
      if (!regex.test(testdata_invalid1)) {
        results_invalid_phone.push(testdata_invalid1);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition2(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition2 === '6 digits') {
      const testdata = faker.phone.number({ style: 'national' });
      const testdata_invalid2 = testdata.split('-')[0];
      if (!regex.test(testdata_invalid2)) {
        results_invalid_phone.push(testdata_invalid2);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition3(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition3 === '4 digits') {
      const testdata = faker.phone.number({ style: 'national' });
      const testdata_invalid3 = testdata.split('-')[1];
      if (!regex.test(testdata_invalid3)) {
        results_invalid_phone.push(testdata_invalid3);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition4(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition4 === 'More digits') {
      const testdata = faker.phone.number({ style: 'national' });
      const testdata_invalid4 = testdata + testdata;
      if (!regex.test(testdata_invalid4)) {
        results_invalid_phone.push(testdata_invalid4);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition5(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition5 === 'Mixed characters') {
      const testdata_invalid5 = faker.phone.number({ style: 'national' }) + ' ' + faker.word.words(1);
      if (!regex.test(testdata_invalid5)) {
        results_invalid_phone.push(testdata_invalid5);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition6(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition6 === 'No Prefix National') {
      const testdata = faker.phone.number({ style: 'national' });
      const testdata_invalid6 = testdata.split(' ')[1];
      if (!regex.test(testdata_invalid6)) {
        results_invalid_phone.push(testdata_invalid6);
      }
    }
    return results_invalid_phone;
  }
  generateInvalidPhoneCondition7(regex: RegExp) {
    if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition7 === 'No Prefix International') {
      const testdata = faker.phone.number({ style: 'international' });
      const testdata_invalid7 = testdata.split('+')[1] + ' ';
      if (!regex.test(testdata_invalid7)) {
        results_invalid_phone.push(testdata_invalid7);
      }
    }
    return results_invalid_phone;
  }

  generatefakerDataValid(regex: RegExp, fieldName: string, count: number, minLength: number, maxLength: number) {
    const results: string[] = [];
    let testdata;

    for (let i = 0; i < count; i++) {
      if (fieldName == 'Forename') {
        testdata = faker.person.firstName();
      } else if (fieldName == 'Surname') {
        testdata = faker.person.lastName();
      } else if (fieldName == 'Email') {
        testdata = faker.internet.email();
      } else if (fieldName == 'Title') {
        testdata = faker.person.prefix();
      }
      if (fieldName != 'Telephone') {
        if (regex.test(testdata)) {
          if (testdata.length >= minLength || testdata.length <= maxLength) {
            results.push(testdata);
          }
        }
      }
    }
    return results;
  }
  generatefakerDataValidTelephone(regex: RegExp, fieldName: string, count: number) {
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
}
