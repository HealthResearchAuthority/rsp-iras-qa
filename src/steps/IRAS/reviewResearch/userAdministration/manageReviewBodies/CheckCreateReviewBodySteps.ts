import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
import path from 'path';
import * as fse from 'fs-extra';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

const { When, Then } = createBdd(test);

Then(
  'I can see the check and create review body page for {string}',
  async ({ checkCreateReviewBodyPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();

    await checkCreateReviewBodyPage.assertOnCheckCreateReviewbodyPage();
    if (datasetName.startsWith('Valid_')) {
      await expect(checkCreateReviewBodyPage.organisation_name_value).toHaveText(
        await createReviewBodyPage.getUniqueOrgName()
      );
    } else {
      await expect(checkCreateReviewBodyPage.organisation_name_value).toHaveText(dataset.organisation_name_text);
    }
    await expect(checkCreateReviewBodyPage.organisation_name_change_link).toBeVisible();
    await expect(checkCreateReviewBodyPage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ', '));
    await expect(checkCreateReviewBodyPage.country_change_link).toBeVisible();
    await expect(checkCreateReviewBodyPage.email_address_value).toHaveText(dataset.email_address_text);
    await expect(checkCreateReviewBodyPage.email_address_change_link).toBeVisible();
    await expect(checkCreateReviewBodyPage.description_value).toHaveText(dataset.description_text);
    await expect(checkCreateReviewBodyPage.description_change_link).toBeVisible();
  }
);

When(
  'I click the change link against {string} on the check review body page',
  async ({ checkCreateReviewBodyPage }, fieldKey: string) => {
    checkCreateReviewBodyPage.clickOnChangeButton(fieldKey);
  }
);

Then(
  'I can see the Check and create review body page for audit {string}',
  async ({ checkCreateReviewBodyPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);

    await checkCreateReviewBodyPage.assertOnCheckCreateReviewbodyPage();
    expect(confirmStringNotNull(await checkCreateReviewBodyPage.organisation_name_value.textContent())).toBe(
      data.Create_Review_Body.organisation_name_unique
    );
    await expect(checkCreateReviewBodyPage.organisation_name_change_link).toBeVisible();
    expect(confirmStringNotNull(await checkCreateReviewBodyPage.country_value.textContent())).toBe(
      expectedCountryValues.replaceAll(',', ', ')
    );
    await expect(checkCreateReviewBodyPage.country_change_link).toBeVisible();
    expect(confirmStringNotNull(await checkCreateReviewBodyPage.email_address_value.textContent())).toBe(
      dataset.email_address_text
    );
    await expect(checkCreateReviewBodyPage.email_address_change_link).toBeVisible();
    expect(confirmStringNotNull(await checkCreateReviewBodyPage.description_value.textContent())).toBe(
      dataset.description_text
    );
    await expect(checkCreateReviewBodyPage.description_change_link).toBeVisible();
  }
);
