# Introduction

This is the repository that will contain the Automated E2E Tests for the HRA IRAS project

The Tests are written in TypeScript, using the Node.js framework and Playwright Test Library

The Tests are executed via the Playwright Runner, while written in BDD Cucumber format utilizing the [playwright-bdd](https://github.com/vitalets/playwright-bdd) package.

# Getting Started

Follow the [QA Dev Box Setup Guide](https://healthresearchauthority.sharepoint.com/:w:/r/sites/Future-IRAS/_layouts/15/Doc.aspx?sourcedoc=%7BA23C42E7-F8E9-412C-8547-929545607B82%7D&file=QA%20Dev%20Box%20Setup%20Document.docx&action=default&mobileredirect=true)

This guide contains steps to:
1.	Initialise your Dev Box
2.	Install Node.js
3.	Install VS Code + Extensions
4.	Clone this repository and Open in VS Code
5.  Install Playwright and Project Dependencies
6.  Runs Tests Locally

# Running Tests

## Running Locally via CLI  

In the current POC the password for the poc user will need to be hardcoded locally with the applicable value.  
Once a method for securely storing passwords has been agreed and established, then the code + this guide will be updated.  
For now Chris McNeill can provide the password.  

- The `password` value to be changed is in the `src/pages/LoginPage.ts` file
- Within the `loginWithUserCreds` method
- Within the `poc` switch case.

**To run all tests:** `npm test` OR `npx bddgen && npx playwright test`

**To rerun all failed tests:** `npm run test-failed` OR `npx bddgen && npx playwright test --last-failed`

*NOTE:* `npm test` and `npm run test-failed` is set as a script in the `package.json` file to trigger the longer command  
&nbsp;  
 
**To run tag specific tests:** `npx bddgen --tags "@authSetup or <@yourTestTag>" && npx playwright test`

*NOTE:* the `@authSetup` tag must always be called in this situation, to authorise test users before other tests are run  

For example the screenhot below shows 2 feature files containing 3 test scenarios  
- The `AuthSetup.feature` contains the Feature tag `@authSetup` meaning every scenario it contains inherits it.
- The `PocTest.feature` has 2 scenarios one of which has the Scenario tag `@exampleTestTag`  
&nbsp; 

<img src="https://github.com/HealthResearchAuthority/rsp-iras-qa/blob/main/src/resources/images/runWithTag.png" alt="running with tags" width="1400" height="700">  
&nbsp;

So when I run the command `npx bddgen --tags "@authSetup or exampleTestTag" && npx playwright test` only 2 of the 3 scenarios execute
- The **Login & Authenticate POC User** scenario
- And the **POC User Can Access the Project Details Page, via the Tasks Page** scenario  
&nbsp;  
   
**To run tests in the Browser/UI mode:** Execute the above commands with `headless` property set to false in `playwright.config.ts`  
&nbsp;  
  
**To run test in debug mode:** `npx bddgen && npx playwright test --debug`

*NOTE:* Runs test in the browser with Playwright Inpector, allowing you to step through the test visually, `--debug` can also be appended to the tag specific command  
&nbsp;  

**To run test in local DevBox:**
All the test executions performed in DevBox should make sure that the sensitive test data are encrypted and not committed to the code repository. Below steps to encrypt and use the sensitive data:
- An executable encrypt utility is created under src/utils/Encrypt.mjs
- Run this utility to generate an encrypted value. Replace '<Add secret key here which is 32 character long>' with any key of your choice (Should follow the security standards of a password and should be 32 characters long).
- To run the utility, right click on the Encrypt.mjs file and click on 'Open in Integrated Terminal' option. Run this file using the script: 'node .\Encrypt.mjs'.
- The result of the execution will create an encrypted value, which should be stored in .env file (this file is never pushed to the code repository) and test execution can use the encrypted value from the .env file wherever needed.
- Copy and paste the generated encrypted value into the relevant user password variable in the .env file.
- Once encrypted value is generated revert the code in the Encrypt.mjs file immediately to ensure no secret values are stored within the local code.
- When running test case in local DevBox use following code in Git Bash Terminal: `SECRET_KEY='<Add secret key here which is 32 character long>' npm run test`

## Test reports

After the test run is complete 2 reports are currently generated:
- A HTML Playright Report, Playwright's built-in reporter
- A HTML Cucumber Report, one the reporters provided by the `playwright-bdd` package

Both reports are stored within the top level `test-reports` folder (which is set to be ignored by git)  
Within their respective `playwright` and `cucumber` folders  
This configuration is set within the `reporter` array property in the `playwright.config.ts` file

![reporters](src/resources\images\reporters.png)  
&nbsp; 
   
## Running in Azure Devops Pipeline

This repo has an associated Azure DevOps Pipeline job, which can run our tests remotely in a CI/CD environment

The Pipeline job is configured in the `azure-pipelines.yml`

The Pipeline job can be found [here](https://dev.azure.com/FutureIRAS/Research%20Systems%20Programme/_build?definitionId=9)

The job will trigger when we push code to our `main` branch

We can also trigger the job manually by:
- Navigating to the Pipeline page (linked above)
- Clicking the **Run pipeline** button
- Select the source branch, set to `main` by default
- Select the browser to use, set to ‘chrome’ by default 
- Select the Timeout value in minutes
- Set the Sonar Cloud Analysis value to true or false, set to true by default
- Click Run

![runJob](src/resources\images\runPipeline.png)  
&nbsp; 

This will kick off a new Run, which will appear on the **Runs** tab

To view the summary details of a Run, click the relevant run  
This will display the Run summary page.  
It shows:
- the time and length of the Run
- the branch it ran against
- the result (success or fail)
- any artifacts published (click link to view)
- the list of jobs that were executed

![jobSummary](src/resources\images\jobSummary.png)  
&nbsp; 

To see a detailed view of the run,

Click the **Run_Automated_E2E_Tests** listed in the Jobs list.

This will display the job details, showing a breakdown of each step executed.

You can click each step to display the step logs.

Any artifacts published will be available at the top level of the job (click link to view).

![azureJobDetails](src/resources\images\azureJobDetails.png =500x500)  
&nbsp; 

If you click the link to view the published Artifacts,  

You will see a page displaying the `cucumber-report` folder & `playwright-report` folder.  

Click the html document in either to download and view the relevant report.

![artifacts](src/resources\images\artifactsPage.png =200x300)  

This artifact will also be published to the teams SharePoint space [here](https://healthresearchauthority.sharepoint.com/:f:/r/sites/Future-IRAS/Testing/Test%20Reports?csf=1&web=1&e=8jF7Ic)  
&nbsp; 

# Framework dependencies upgrade and validation

Regularly updating dependencies in `package.json` file, guarantees that we have access to the latest features, bug fixes, and safety patches.

The `package.json` file carries dependencies on which project works, at the side of their respective versions.

There are following steps that were followed for updating `package.json` dependencies to the latest version.

## Step 1: Identifying NPM Outdated Dependencies

Before updating the dependencies to their modern version, we need to be aware of the availability of the new version of dependencies. 

For this purpose, use `npm-check-updates` package.

Executed the below command in my terminal to install the npm-check-updates package:

`npm install npm-check-updates`

The npm-check-updates package permits to check for updates of dependencies by running an easy command in the project’s directory:

`npx npm-check-updates`

This command will scan package.json file and display a list of packages that have newer versions available.

## Step 2: Updating Dependencies

Once we have identified the outdated dependencies, it’s time to update them. There are two ways: manually update each package or use a package manager like npm.

**Updating Dependencies Manually**

Manually change the version of a dependency that we want to update in the `package.json` and run the `npm install` command to update it. 

**Updating Dependencies with NPM**

Update each dependency to its latest version in the npm registry all at once by using npm directly.

Execute `npx npm-check-updates -u` to upgrade `package.json`. Now package.json is updated with latest version of the dependencies.

Then execute `npm install` to install new versions.

## Test and make sure the code works as expected in local devBox and Azure DevOps pipeline.

After updating dependencies, it is of extreme significance to conduct the whole testing of the software to affirm proper functioning.
 
# Known Warnings in the Azure DevOps pipeline

##[warning]SharePoint Online does not support 0-Byte files: '/home/vsts/work/1/s/test-reports/playwright/trace/recorder.B_SY1GJM.css'.

Playwright v1.48 made small changes to the Trace Viewer, which introduced the recorder.B_SY1GM.css file. It did not exist in previous versions.

The Azure SharePoint task, has a long standing known issue https://github.com/halliba/az-pipelines-2-sharepoint.

Due to a limitation (or bug?) of the Microsoft Graph File endpoint we can not upload files with 0-byte size. Those files will be skipped and a warning message is shown.

It has been decided that it is best to maintain the latest version of Playwright, rather than to revert and maintain an older version. Perhaps a future update will remove the file that is the root cause of the issue.

The issue has no impact, other than the warning message, as the Playwright Report still publishes to SharePoint and can be downloaded and opened.

##[warning]Task 'Upload files to SharePoint Online' version 0 (az-pipelines-2-sharepoint@0) is dependent on a Node version (10) that is end-of-life. Contact the extension owner for an updated version of the task. Task maintainers should review Node upgrade guidance: https://aka.ms/node-runner-guidance

Node.js 10 reached end-of-life on 2021-04-30 and is no longer supported. "No longer supported" means you won't get updates, even important security updates. 

But, it doesn't mean that it won't run any more. 

The warning first appeared after Node 10 had already been in the end of life state for 4.5 years.

As we are currently using the latest version of the SharePoint task, there is no further action we can take at this time.

Should the author of the SharePoint task release a new version, then we must upgrade immediately.

Or should we reach the point where the task no longer functions, then we must look for alternatives.

But otherwise we can continue to use the SharePoint task, having flagged it as a known issue


# Pull Request Process and Quality Checks

## Raising a Pull Request (PR)
To merge any new test code into the main branch of the repository,  
you must first raise a Pull Request against your source branch that contains your changes.  

To do this click the **Create a pull request** button within your branch page on Azure Devops

![pr button](src/resources\images\prButton.png)  
&nbsp; 

This will present you with a Pull Request Template form which must be completed before the PR can be raised.  
The form provides information regarding the PR to the reviewer such as:
- A summary of the intended outcomes of your work
- The relevant JIRA ticket
- A summary of the work that was completed

It also provides a checklist of items that will help you to assess the readiness of your branch for PR review.

![pr form](src/resources\images\prForm.png =600x600) 
&nbsp;  

## Quality Checks 

Once the form has been completed and you have submitted the PR a series of checks will occur.  
This is to validate all pull requests that target the main branch to ensure they meet quality standards before merging.  
The checks include:
- An Automated Pipeline run in which all steps must execute Successfully
- The Automated Regression Tests will run, these must all pass Successfully
- A Sonar Cloud Analysis will run, passing it is Optional.
- The PR must be approved by at least 1 other team member, upon their review
- Any comments that have been left by either a team member or the Sonar Cloud analysis, must be marked as resolved.
- There must be no merge conflicts

![pr checks](src/resources\images\prChecks.png =800x500)  
&nbsp; 

Once all the above checks have passed, or have been satisfied,  
then Complete button will become available and you may complete the merge

![pr complete](src/resources\images\prComplete.png)  
&nbsp; 

**When completing a PR please select the option to delete your source branch**  
**This is to avoid stale branches lingering in the repository and cluttering up the branch list**

## SonarCloud

A Quality Gate called Automation Testing has been setup within our SonarCloud account, 
and it has been assigned to cover the rsp-iras-qa repository.

To access the Quality Gate, open [SonarCloud](https://sonarcloud.io/) and login  
**Note that your HRA account will need to be added to the SonarCloud project and given correct permissions.**  
**Speak to DevOps lead if necessary**  
Select your profile options by clicking the icon in the top right of the screen

![sonar project](src/resources\images\sonarProject.png =1000x200) 
&nbsp; 

On the subsequent screen select the **Quality Gates tab**  
And then select the **Automation Testing** option from the list

Here you can adjust the conditions that the code must meet in order to pass the quality gate.  
You can also add or remove it from a repository within your project.

![sonar quality gate](src/resources\images\sonarQualityGate.png =1200x700) 
&nbsp; 

When the Azure DevOps Pipeline job runs  
and the Sonar Cloud Analysis parameter is set to true (Automatic for PR's and Schedules).  

Then SonarCloud will analyze the source code in our `rsp-iras-qa` repository,  
against the conditons that have been set in the Automation Testing quality gate.

The results of the SonarCloud analysis can be viewed within the Extensions tab of the pipeline summary page

![sonar summary](src/resources\images\sonarSummary.png) 
&nbsp; 

By clicking the **See analysis details on SonarCloud** link you will be taken to the results page on SonarCloud for more detailed results.

![quality gate results](src/resources\images\qualityGateResults.png =1000x500) 
&nbsp; 

By clicking on the numbers within the various sections you can get a detailed view of the issues raised.  
For example clicking the **7** within **New Issues** in the above screenshot would take you to the page below.

![issues analysis](src/resources\images\issuesAnalysis.png =1000x500) 
&nbsp; 

Any issues raised are also automatically added as comments on the PR (set under the name Shahzad Hassan),  
meaning that they will require some form of resolution before the PR can be merged into main branch.

![pull request issue comments](src/resources\images\pullRequest_IssueComments.png =700x600) 
&nbsp; 

It should be noted that the SonarCloud Analysis is an optional quality check.  
Other than having to resolve the comments, passing the SonarCloud analysis is optional,  
so it will not prevent merging if failures occur. 

This is useful for productivity especially as a Test framework does not have the same requirements as application code.  
However it is advised that the issues are addressed where possible.

# Test Structure

At present we have top level `src` and `tests` folders  
Config files such as `package.json` & `playwright.config.ts` also sit at the top level  

The `src` folder contains all source code files and resources such as test data,  
Sub folders include:
- **pages** - contains our page object
- **steps** - contains our step definitions
- **hooks** - contains our fixtures, setup and teardown files
- **utils** - contains useful, commonly used methods and scripts which our tests can call upon

The `tests` folder will contain our feature files, which contain our BDD test scenarios  
&nbsp; 

## Page Object Model

The tests are written using the Page Object Model (POM) design pattern

**Features**: 
- Contain Test scenarios written in the Gherkin Syntax
- Scenarios contain BDD test steps (Given, When, Then)

**Step Definitions**: 
- Step Definitions are the link between our Features, and the Page Objects that implement the test actions
- A Step Definition is a function with an expression that links it to one or more steps.
- When a step is being executed, Cucumber scans the `steps` folder (as defined in defineBddConfig in `playwright.config.ts`),  
and looks for a matching step definition to execute.
- Step definitions call upon elements and methods from the Page object.
- Step definitions will contain the majority of our assertions.

**Page Objects**: 
- The page object will contain a digital representation of the relevant page, using locators to represent the pages web elements
- The page object will contain methods which allow the test to interact with the pages elements and services.
- No code related to test outcomes should be within the page object (assertions).
- One assertion that should be within the page object, is to verify that the page (and key elements) has loaded correctly
- This verification should be done upon navigating to the page during the test.  
&nbsp; 


# Cucumber Overview

The Automated E2E tests utilizes Cucumber to provide test scenarios written in a BDD structure

These scenarios are stored in our `features` file.

The Cucumber configuration can be found in the `playwright.config.ts` file

An overview of the basic feature file structure is outlined below.

**Feature** − Name of the feature under test, should include the ticket number, e.g. RSP-001.

**Description** (optional) − Describe the feature under test at a high level.

**Scenario** − What is the specific scenario or behaviour, within the feature, being tested.

**Given** − Setup steps that need to occur to replicate the scenario

**When** − Action steps where the specific user inputs under test are performed

**Then** − Results steps where we check the outputs and outcomes from the actions performed in the When steps  
&nbsp; 

An overview of some of the more advanced feature file elements are outlined below.

**Background** - Used to group a common set of Given steps together in one place, if all Scenario's within a Feature contain them. They will then be executed before each scenario

**Scenario Outline** - Used to run the same Scenario multiple times using a template, with different combinations of values at runtime provided by Examples.

**Examples** - The Scenario Outline is run once for each row in the Examples section beneath it (not counting the first header row), and uses the values provided in that row

**Passing Values** - You can parametrise test steps, allowing you to pass values to the Step Definition. Data types that can be passed include: Integers, Strings & Data Tables

**Cucumber Tags**:
- Can be used to specify a particular subset of scenarios for traceability to user stories and accpetance criteria
- Can be used to run a specific test or subset of tests
- Can be used to add unique contexts, conditions or inputs for specific tests or subset of tests
- Tags can be placed above Features or Scenario's
- A Feature or Scenario can have as many tags as you like. Separate them with spaces
- Tags are inherited by child elements. E.g. tags that are placed above a Feature will be inherited by each Scenario within the Feature
- See the **Test Traceability** section of this ReadMe for more information on using Tags appropriately within the project

For more information consult the Cucumber Documentation provided in the Supporting Documentation  
&nbsp; 


# Playwright-BDD Overview

Our framework uses the `playwright-bdd` package to allow us to run tests in Playwright, while using Cucumber Features for our test scenarios

This means we can retain the advantages of the Playwright runner for test execution, while also writing tests in re-usable BDD Gherkin steps

The `playwright-bdd` package enables this by converting feature files, into test files that Playwright understands how to execute.

It does this at runtime when the tests are executed thanks to the `npx bddgen` portion of the run tests command.

Once the conversion has completed, the `npx playwright test` portion of the command is executed.

The Playwright compatible files are output and stored to the `generated-feature-files`, this folder is set to be git ignored.  
&nbsp; 

![feature to playwright test file](src/resources\images\featureToPwTestFile.png =1000x500)  
&nbsp; 


**Known Limitations**

- Background steps not displayed on the top level of the Playwright report

One of the benefits of writing our test Scenarios in the BDD Cucumber format,  
is that our test reports can be easily read and understood by non-technical members of the team.

However when using Background steps in our Feature files, the default `playwright.html` report produced at the end of the test run,
places these steps within Before Hooks, so they are not visible at the top level of the report.

The background steps can be viewed by digging down into the lower levels of the Before hook, as shown below.  
However we wouldn't expect non-technical members to do this.

This is not an issue for the cucumber html report that the test run also produces, so it is advised at this time,  
that this is the one shared with non-technical stakeholders.  
&nbsp; 

![playwright background report limitation](src/resources\images\pwReportBackgroundLimitation.png =600x600)  
&nbsp; 


# Test Traceability

In this project we will be utilizing Cucumber tags to:
- Uniquely identify Features - allowing us to run the Feature in isolation & easily locate it in the test report
- Uniquely identify Scenarios - allowing us to run a Scenario in isolation & easily locate it in the test report
- Link Scenarios to User Stories in JIRA - allowing us to trace test outputs to the specific functionalities under test,  
See the `$before` hook provided in `src/hooks/CustomFixtures.ts` for implementation

When writing Features and Scenarios we should follow these guidelines to provide appropriate tags.

## Feature Level Tags

There can be multiple Feature level tags, used for a variety of purposes, but:
- All Features must have 1 tag that uniquely identifies it.
- The unique tag should have the naming convention `<name of feature>Feature` 
- The unique tag name should relate to the name of the Feature under test,  
e.g. a `Login.feature` file could have the tag `@loginFeature`

## Scenario Level Tags

There can be multiple Scenario level tags, used for a variety of purposes, but:
- All Scenarios must have 1 tag that uniquely identifies it.
- All Scenarios must have 1 or more tags that link it to one or more User Stories in JIRA
- The unique tag should have the naming convention `<name of scenario>Scenario` 
- The unique tag name should relate to the name of the Scenario under test,  
e.g. a `User can Login Successfully with Correct Credentials` Scenario could have the tag `@loginSuccessScenario`
- The JIRA tag(s) must have the naming convention `@RSP-<JIRA ticket number>`, e.g. `<@RSP-101`  

## Best Practice Example

Consider the following as an example of how a Feature file containing multiple test Scenarios, should be written.

The `Traceability.feature` Feature file below shows:
- A unique Feature level tag - `<@traceabilityFeature`  
- Unique Scenario level tags for each Scenario - `<@uniqueScenario` & `<@anotherUniqueScenario`  
- Scenario level tags which link each Scenario to a ticket in JIRA - `<@RSP-744` for both & `<@RSP-745` for the second Scenario  

![best practice feature tagging](src/resources\images\scenarioTagsVsCode.png =500x400)  
&nbsp; 

This will output the following Cucumber report which:
- Allows us to find all Scenarios relating to a User Story - searching with `@RSP-<JIRA ticket number>`
- Allows us to find any specific Feature or Scenario - searching with a unique Feature or Scenario level tag
- Generates a list of Ticket References for each Scenario, which provide a link to the relevant User Stories in JIRA

![best practice tagging report](src/resources\images\scenarioTagsReport.png =500x600)  
&nbsp; 


# Auth Setup

## Configuration

In our automation tests we will be storing and re-using authentication states for our test accounts.

This is to avoid repetition and optimise our tests, as it avoids unnecesary out of scope test steps and saves time.

We have a projects array setup in our `playwright.config.ts` file

One of those projects is named `AuthSetup` and it is set to run only the Features stored in the `tests/features/authSetup` folder

In subsequent projects, we name the `AuthSetup` as a dependency, which ensure that the Features in the `AuthSetup` project are ran first  
&nbsp; 

![feature to playwright test file](src/resources\images\authConfig.png =500x500)  
&nbsp; 

## Setting the Authentication State

Within the `tests/features/authSetup` folder which is used by the `AuthSetup` project, 

We will write our Login Success Features for each user, an example of which is shown below for the `POC` user

Once we have established that the login was sucessful, we add a final step which stores the Authentication State for that user.

In the matching Step Definition we call a page method `storeAuthState`, passing in the user as an argument.

The page method then gets the `storageState` (cookies) of the current browser context, 

And saves them to a file path associated with the releavant user.  
&nbsp; 

![feature to playwright test file](src/resources\images\authSteps.png =600x600)  
&nbsp; 

All the storage state are stored in the `auth-storage-states` folder which is set to be git ignored.

## Re-using the Authentication State

With the Authentication States set by the `AuthSetup` project,

We can re-use them when needed in our other project's Features, by combining Playwright Fixtures and Cucumber tags.

Following on from the POC user example, shown below is a Feature file with the Cucumber tag `@pocUser` set at the Feature level.

We create custom Playwright Fixtures, such as Page objects, in our `CustomFixtures.ts` file,

Within this file we have: 
- declared the `storageState` custom fixture
- passed in all Cucumber tags associated with the current test
- passed in the `storageState` property from the current Browser Context (context is a built-in Playwright fixture)
- passed in the Test Config method `use`, which can set test configuration options and override settings from the `playwright.congig.ts` file

Within the custom `storageState` fixture:
- we check if any of the Cucumber tags match our `@pocUser` tag
- if true, we set the current Browser Context's storageState to that of the POC user, via the `getAuthState` utility method
- if false, the storage state will remain the default state, therefore unauthenticated

In this example the outcome will be true, so the test will load the Tasks Page as the POC user, without having to go through the Login process again.  
&nbsp; 

![feature to playwright test file](src/resources\images\authUse.png =600x600)  
&nbsp; 


## Additional Notes

1. As we add new test acccounts to the automation tests, we will need to update:
- the `storeAuthState` page method
- the `storageState` custom fixture
- the `getAuthState` utility method

To include the accounts and maintain this process.

2. Only apply one tag per test relating to user authentication.

3. Do not a add tag relating to user authentication, where an unauthenticated state is required for that test.

4. When running tests using a test tag in your run command, you must also include the `@authSetup` tag.  
This is to ensure that test users are authenticated before any of your desired tests are run  
E.g. `npx bddgen --tags "@authSetup or <@yourTestTag>" && npx playwright test`

5. All files created and stored in the `auth-storage-states` folder are deleted after the test run,  
as part the `GlobalTeardown.ts` file

# Self Healing locators

Self-healing locators refers to the capability of testing framework to automatically detect and recover from issues due to invalid locators that cause tests to fail.

Below steps to follow to use the Self Healing locators mechanism:

1. Self healer locator method is created under 'CommonItemsPage.ts'.

![self healing](src/resources\images\selfHealingCode.png)

2. Extend the CommonItemsPage class to the page where we need to use the self healing locator. Below example of how extended for the LoginPage

![self healing - login page](src/resources\images\selfHealingLoginPage.png)

3. Declare Locators as an array, and list the possible different combinations of locators for the web element as in below screenshot:

![self healing - login page](src/resources\images\selfHealingLocatorsAsArray.png)

4. Use the 'selfHealLocator' method created in 'CommonItemsPage.ts' to get the valid locator from the list of locators.

![self healing - login page](src/resources\images\selfHealingLoginPageCode.png) 

**Note**: Self healing should only be used for locators that have a history of being unreliable (flaky).

# Supporting Documentation

- [Playwright Documentation](https://playwright.dev/docs/api/class-playwright)
- [playwright-bdd Documentation](https://www.npmjs.com/package/playwright-bdd/v/5.1.1)
- [Cucumber Documentation](https://cucumber.io/docs/cucumber/)
- [Tooling Standards Documentation](https://healthresearchauthority.sharepoint.com/:w:/r/sites/Future-IRAS/Testing/RSP%20Test%20Approach/Draft/Automation%20Test%20Tool%20Standards%20Draft%20Content.docx?d=wc9b5951cd936470984f391877ed0bd20&csf=1&web=1&e=elADFz)