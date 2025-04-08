import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the review body profile page', async ({ reviewBodyProfilePage }) => {
  await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
});

Then(
  'I can verify the field values on review body profile page for {string}',
  async ({ createReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();

    expect(confirmStringNotNull(await reviewBodyProfilePage.organisation_name_value.textContent())).toBe(
      dataset.organisation_name_text
    );
    await expect(reviewBodyProfilePage.organisation_name_change_link).toBeVisible();
    expect(confirmStringNotNull(await reviewBodyProfilePage.country_value.textContent())).toBe(
      expectedCountryValues.replaceAll(',', ', ')
    );
    await expect(reviewBodyProfilePage.country_change_link).toBeVisible();
    expect(confirmStringNotNull(await reviewBodyProfilePage.email_address_value.textContent())).toBe(
      dataset.email_address_text
    );
    await expect(reviewBodyProfilePage.email_address_change_link).toBeVisible();
    expect(confirmStringNotNull(await reviewBodyProfilePage.description_value.textContent())).toBe(
      dataset.description_text
    );
    await expect(reviewBodyProfilePage.description_change_link).toBeVisible();

    await expect(reviewBodyProfilePage.view_this_review_body_list_of_users_link).toBeVisible();
    await expect(reviewBodyProfilePage.view_this_review_body_audit_history_link).toBeVisible();
    await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
    const expectedPageTitle = `${reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label}${dataset.organisation_name_text}`;
    const actualPageTitle = await reviewBodyProfilePage.page_heading.textContent();
    expect(actualPageTitle?.trim()).toBe(expectedPageTitle);
  }
);

Then('I can see the last updated date field is blank', async ({ reviewBodyProfilePage }) => {
  const lastUpdatedDateActualValue = await reviewBodyProfilePage.last_updated_value.textContent();
  expect(lastUpdatedDateActualValue?.trim()).toBe(''); // defect open - last updated date stamped for new review body
});
const { When, Then } = createBdd(test);

Then('I can see the review body profile page', async ({ reviewBodyProfilePage }) => {
  await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
  await reviewBodyProfilePage.setOrgName(
    confirmStringNotNull(await reviewBodyProfilePage.organisation_name_value.textContent())
  );
  await reviewBodyProfilePage.setCountries(
    confirmStringNotNull(await reviewBodyProfilePage.country_value.textContent()).split(', ')
  );
  await reviewBodyProfilePage.setEmail(
    confirmStringNotNull(await reviewBodyProfilePage.email_address_value.textContent())
  );
  await reviewBodyProfilePage.setDescription(
    confirmStringNotNull(await reviewBodyProfilePage.description_value.textContent())
  );
});

Then(
  'I see that the {string} review body profile page has the expected layout',
  async ({ reviewBodyProfilePage }, status: string) => {
    await expect(reviewBodyProfilePage.organisation_name_change_link).toBeVisible();
    await expect(reviewBodyProfilePage.country_change_link).toBeVisible();
    await expect(reviewBodyProfilePage.email_address_change_link).toBeVisible();
    await expect(reviewBodyProfilePage.description_change_link).toBeVisible();
    await expect(reviewBodyProfilePage.view_this_review_body_list_of_users_link).toBeVisible();
    await expect(reviewBodyProfilePage.view_this_review_body_audit_history_link).toBeVisible();
    await expect(reviewBodyProfilePage.last_updated_row).toBeVisible();
    if (status.toLowerCase() == 'active') {
      await expect(reviewBodyProfilePage.disable_sub_heading).toBeVisible();
      await expect(reviewBodyProfilePage.disable_guidance_text).toBeVisible();
      await expect(reviewBodyProfilePage.disable_button).toBeVisible();
    }
  }
);

When(
  'I click the change link against {string} on the review body profile page',
  async ({ reviewBodyProfilePage }, fieldKey: string) => {
    reviewBodyProfilePage.clickOnChangeButton(fieldKey);
  }
);

When(
  'I now see the review body profile page with the updated {string}',
  async ({ editReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();
    await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
    if (datasetName.startsWith('Valid_') || datasetName.startsWith('Review_')) {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(
        await editReviewBodyPage.getUniqueOrgName()
      );
    } else {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
    }
    await expect(reviewBodyProfilePage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ', '));
    await expect(reviewBodyProfilePage.email_address_value).toHaveText(dataset.email_address_text);
    await expect(reviewBodyProfilePage.description_value).toHaveText(dataset.description_text);
  }
);
