import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then, When } = createBdd(test);

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
  await reviewBodyProfilePage.setLastUpdatedDate(
    confirmStringNotNull(await reviewBodyProfilePage.last_updated_value.textContent())
  );
  const revBodyIdStartIndex = reviewBodyProfilePage.page.url().lastIndexOf('/') + 1;
  await reviewBodyProfilePage.setReviewBodyId(reviewBodyProfilePage.page.url().substring(revBodyIdStartIndex));
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
    } else if (status.toLowerCase() == 'disabled') {
      await expect(reviewBodyProfilePage.enable_sub_heading).toBeVisible();
      await expect(reviewBodyProfilePage.enable_guidance_text).toBeVisible();
      await expect(reviewBodyProfilePage.enable_button).toBeVisible();
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
      await expect(reviewBodyProfilePage.page_heading).toHaveText(
        reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label +
          (await editReviewBodyPage.getUniqueOrgName())
      );
    } else {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
      await expect(reviewBodyProfilePage.page_heading).toHaveText(dataset.organisation_name_text);
    }
    await expect(reviewBodyProfilePage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ','));
    await expect(reviewBodyProfilePage.email_address_value).toHaveText(dataset.email_address_text);
    await expect(reviewBodyProfilePage.description_value).toHaveText(dataset.description_text);
  }
);

When(
  'I now see the review body profile page with the created {string}',
  async ({ createReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValues: string = dataset.country_checkbox.toString();
    await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
    if (datasetName.startsWith('Valid_') || datasetName.startsWith('Review_')) {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(
        await createReviewBodyPage.getUniqueOrgName()
      );
      await expect(reviewBodyProfilePage.page_heading).toHaveText(
        reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label +
          (await createReviewBodyPage.getUniqueOrgName())
      );
    } else {
      await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
      await expect(reviewBodyProfilePage.page_heading).toHaveText(dataset.organisation_name_text);
    }
    await expect(reviewBodyProfilePage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ', '));
    await expect(reviewBodyProfilePage.email_address_value).toHaveText(dataset.email_address_text);
    await expect(reviewBodyProfilePage.description_value).toHaveText(dataset.description_text);
  }
);

When(
  'I now see the review body profile page with the updated {string} for field {string}',
  async ({ editReviewBodyPage, reviewBodyProfilePage }, datasetName: string, fieldName: string) => {
    await reviewBodyProfilePage.assertOnReviewbodyProfilePage();
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    let organisationName = await reviewBodyProfilePage.getOrgName();
    if (fieldName == 'Organisation_Name') {
      if (datasetName.startsWith('Valid_') || datasetName.startsWith('Review_')) {
        organisationName = await editReviewBodyPage.getUniqueOrgName();
        await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(organisationName);
        await expect(reviewBodyProfilePage.page_heading).toHaveText(
          reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label +
            organisationName
        );
      } else {
        await expect(reviewBodyProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
        await expect(reviewBodyProfilePage.page_heading).toHaveText(dataset.organisation_name_text);
      }
      await reviewBodyProfilePage.setNewOrgName(
        confirmStringNotNull(await reviewBodyProfilePage.organisation_name_value.textContent())
      );
    } else if (fieldName == 'Country') {
      const expectedCountryValues: string = dataset.country_checkbox.toString();
      await expect(reviewBodyProfilePage.country_value).toHaveText(expectedCountryValues.replaceAll(',', ', '));
      await reviewBodyProfilePage.setNewCountries(
        confirmStringNotNull(await reviewBodyProfilePage.country_value.textContent()).split(', ')
      );
    } else if (fieldName == 'Email_Address') {
      await expect(reviewBodyProfilePage.email_address_value).toHaveText(dataset.email_address_text);
      await reviewBodyProfilePage.setNewEmail(
        confirmStringNotNull(await reviewBodyProfilePage.email_address_value.textContent())
      );
    } else if (fieldName == 'Description') {
      await expect(reviewBodyProfilePage.description_value).toHaveText(dataset.description_text);
      await reviewBodyProfilePage.setNewDescription(
        confirmStringNotNull(await reviewBodyProfilePage.description_value.textContent())
      );
    }
  }
);

Then('I can see the last updated date field is blank', async ({ reviewBodyProfilePage }) => {
  const lastUpdatedDateActualValue = confirmStringNotNull(await reviewBodyProfilePage.getLastUpdatedDate()).trim();
  expect(lastUpdatedDateActualValue).toBe(''); // defect open - last updated date stamped for new review body
});

Then(
  'I can see the {string} ui labels on the manage review body profile page',
  async ({ commonItemsPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset = reviewBodyProfilePage.reviewBodyProfilePageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, reviewBodyProfilePage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

When('I can see the updated review body profile page heading', async ({ reviewBodyProfilePage }) => {
  await expect(reviewBodyProfilePage.page_heading).toHaveText(
    reviewBodyProfilePage.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label +
      (await reviewBodyProfilePage.getOrgName())
  );
});
