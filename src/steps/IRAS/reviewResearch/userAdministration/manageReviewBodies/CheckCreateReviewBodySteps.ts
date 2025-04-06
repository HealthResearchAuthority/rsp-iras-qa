import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

Then(
  'I can see the Check and create review body page for {string}',
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
  'I click the {string} link against {string} on the {string}',
  async ({ checkCreateReviewBodyPage }, buttonKey: string, fieldKey: string, pageKey: string) => {
    if (pageKey === 'Check_Create_Review_Body_Page' && buttonKey === 'Change' && fieldKey === 'Organisation_Name') {
      await checkCreateReviewBodyPage.organisation_name_change_link.click();
    } else if (pageKey === 'Check_Create_Review_Body_Page' && buttonKey === 'Change' && fieldKey === 'Country') {
      await checkCreateReviewBodyPage.country_change_link.click();
    } else if (pageKey === 'Check_Create_Review_Body_Page' && buttonKey === 'Change' && fieldKey === 'Email_Address') {
      await checkCreateReviewBodyPage.email_address_change_link.click();
    } else if (pageKey === 'Check_Create_Review_Body_Page' && buttonKey === 'Change' && fieldKey === 'Description') {
      await checkCreateReviewBodyPage.description_change_link.click();
    }
  }
);
