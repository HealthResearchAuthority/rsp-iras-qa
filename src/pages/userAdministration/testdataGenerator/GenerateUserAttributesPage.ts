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
let testdata_output_faker_invalid: string[];
let testdata_output_invalid: string[];
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
  generateValidData(pattern_valid: RegExp, fieldName: string, count: number, minLength: number, maxLength: number) {
    const testdata_output = this.generateMatchingStrings(pattern_valid, fieldName, count, minLength, maxLength);
    const testdata_output_faker = this.generatefakerDataValid(pattern_valid, fieldName, count, minLength, maxLength);
    return [testdata_output, testdata_output_faker];
  }
  generateInvalidData(pattern_invalid: RegExp, pattern_valid: RegExp, fieldName: string, count: number) {
    if (fieldName == 'Email') {
      testdata_output_faker_invalid = this.generatefakerDataInvalidEmail(pattern_valid, fieldName, count);
    } else if (fieldName == 'Telephone') {
      testdata_output_faker_invalid = this.generatefakerDataInvalidPhone(pattern_valid, fieldName, count);
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
        {
          {
            results.push(testdata);
          }
        }
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
        if (fieldName != 'Telephone') {
          if (fieldName != 'Title') {
            if (testdata.length >= minLength) {
              if (testdata.length <= maxLength) {
                results.push(testdata);
              }
            }
          } else {
            results.push(testdata);
          }
        } else {
          results.push(testdata);
        }
      }
    }
    return results;
  }

  generatefakerDataInvalid(regex: RegExp, fieldName: string, count: number) {
    const results: string[] = [];
    let testdata;

    for (let i = 0; i < count; i++) {
      if (fieldName === 'Title') {
        testdata = faker.person.prefix();
      } else if (fieldName === 'Forename') {
        testdata = faker.person.firstName();
      } else if (fieldName === 'Surname') {
        testdata = faker.person.lastName();
      }
      const testdata1 = ' +' + testdata;
      if (!regex.test(testdata1)) {
        results.push(testdata1);
      }
      const testdata2 = '123' + testdata;
      if (!regex.test(testdata2)) {
        results.push(testdata2);
      }
      const testdata3 = '%^&*' + testdata;
      if (!regex.test(testdata3)) {
        results.push(testdata3);
      }
      const testdata4 = testdata + '12sd3';
      if (!regex.test(testdata4)) {
        results.push(testdata4);
      }
      const testdata5 = testdata + '  ';
      if (!regex.test(testdata5)) {
        results.push(testdata5);
      }
      const testdata6 = '  ';
      if (!regex.test(testdata6)) {
        results.push(testdata6);
      }
      const testdata7 = '  ' + testdata;
      if (!regex.test(testdata7)) {
        results.push(testdata7);
      }
    }
    return results;
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
    const results: string[] = [];
    let testdata;

    for (let i = 0; i < count; i++) {
      if (fieldName == 'Email') {
        testdata = faker.internet.email();
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition1 === 'removeAtSymbol') {
          const testdata_invalid1 = this.removeAtSymbol(testdata);
          if (!regex.test(testdata_invalid1)) {
            results.push(testdata_invalid1);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition2 === 'removeDomainpart') {
          const testdata_invalid2 = this.removeDomainpart(testdata);
          if (!regex.test(testdata_invalid2)) {
            results.push(testdata_invalid2);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition3 === 'removeLocalpart') {
          const testdata_invalid3 = this.removeLocalpart(testdata);
          if (!regex.test(testdata_invalid3)) {
            results.push(testdata_invalid3);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition4 === 'replaceLocalpart') {
          const testdata_invalid4 = this.replaceLocalpart(testdata);
          if (!regex.test(testdata_invalid4)) {
            results.push(testdata_invalid4);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition5 === 'words') {
          const testdata_invalid5 = faker.word.words(3);
          if (!regex.test(testdata_invalid5)) {
            results.push(testdata_invalid5);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition6 === 'NoTLD') {
          const testdata_invalid6 = faker.word.words(1) + '@' + faker.word.words(1);
          if (!regex.test(testdata_invalid6)) {
            results.push(testdata_invalid6);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition7 === 'TooManydots') {
          const testdata_invalid7 =
            faker.word.words(1) + '@' + faker.word.words(1) + '.' + faker.word.words(1) + '.' + faker.word.words(1);
          if (!regex.test(testdata_invalid7)) {
            results.push(testdata_invalid7);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition8 === 'NumericTLD') {
          const testdata_invalid8 = faker.word.words(1) + '@' + faker.word.words(1) + '.111.222.333.44444';
          if (!regex.test(testdata_invalid8)) {
            results.push(testdata_invalid8);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Email.condition9 === 'ExtraChars') {
          const testdata_invalid9 = faker.word.words(1) + '@' + faker.word.words(1) + '.com' + faker.word.words(1);
          if (!regex.test(testdata_invalid9)) {
            results.push(testdata_invalid9);
          }
        }
      }
    }
    return results;
  }
  generatefakerDataInvalidPhone(regex: RegExp, fieldName: string, count: number) {
    const results: string[] = [];

    for (let i = 0; i < count; i++) {
      if (fieldName == 'Telephone') {
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition1 === 'Not a number') {
          const testdata_invalid1 = faker.word.words(1);
          if (!regex.test(testdata_invalid1)) {
            results.push(testdata_invalid1);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition2 === '6 digits') {
          const testdata = faker.phone.number({ style: 'national' });
          const testdata_invalid2 = testdata.split('-')[0];
          if (!regex.test(testdata_invalid2)) {
            results.push(testdata_invalid2);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition3 === '4 digits') {
          const testdata = faker.phone.number({ style: 'national' });
          const testdata_invalid3 = testdata.split('-')[1];
          if (!regex.test(testdata_invalid3)) {
            results.push(testdata_invalid3);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition4 === 'More digits') {
          const testdata = faker.phone.number({ style: 'national' });
          const testdata_invalid4 = testdata + testdata;
          if (!regex.test(testdata_invalid4)) {
            results.push(testdata_invalid4);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition5 === 'Mixed characters') {
          const testdata_invalid5 = faker.phone.number({ style: 'national' }) + ' ' + faker.word.words(1);
          if (!regex.test(testdata_invalid5)) {
            results.push(testdata_invalid5);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition6 === 'No Prefix National') {
          const testdata = faker.phone.number({ style: 'national' });
          const testdata_invalid6 = testdata.split(' ')[1];
          if (!regex.test(testdata_invalid6)) {
            results.push(testdata_invalid6);
          }
        }
        if (this.userProfileGeneratedataConfig.invalid_data.Telephone.condition7 === 'No Prefix International') {
          const testdata = faker.phone.number({ style: 'international' });
          const testdata_invalid7 = testdata.split('+')[1] + ' ';
          if (!regex.test(testdata_invalid7)) {
            results.push(testdata_invalid7);
          }
        }
      }
    }
    return results;
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
      } else if (fieldName == 'Telephone') {
        const phone_international = faker.phone.number({ style: 'international' });
        if (regex.test(phone_international)) {
          results.push(phone_international);
        }
        const phone_national = faker.phone.number({ style: 'national' });
        if (regex.test(phone_national)) {
          results.push(phone_national);
        }
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
}
