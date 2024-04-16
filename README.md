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
TODO: Explain how to run the tests with the various commands, reports produced

## Running Locally via CLI  

In the current POC the password for the poc user will need to be hardcoded locally with the applicable value.  
Once a method for securely storing passwords has been agreed and established, then the code + this guide will be updated.  
For now Chris McNeill can provide the password.  

- The `password` value to be changed is in the `src/pages/LoginPage.ts` file
- Within the `loginWithUserCreds` method
- Within the `poc` switch case.

**To run all tests:** `npm test` OR `npx bddgen && npx playwright test`

*NOTE:* `npm test` is set as a script in the `package.json` file to trigger the longer command  
&nbsp;  
 
**To run tag specific tests:** `npx bddgen --tags "@authSetup or <@yourTestTag>" && npx playwright test`

*NOTE:* the `@authSetup` tag must always be called in this situation, to authorise test users before other test tags are run  

For example the screenhot below shows 2 feature files containing 3 test scenarios  
- The `AuthSetup.feature` contains the Feature tag `@authSetup` meaning every scenario it contains inherits it.
- The `PocTest.feature` has 2 scenarios one of which has the Scenario tag `@exampleTestTag`  
&nbsp; 

![running with tags](src/resources\images\runWithTag.png =1400x700)  
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
- Click Run

![runJob](src/resources\images\runPipeline.png)  
&nbsp; 

This will kick off a new Run, which will appear on the **Runs** loginWithUserCreds

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
&nbsp; 

# Test Structure

**Folder structure is still WIP**

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

**Page Object Model**

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
TODO: Explain Feature File structure, Use Of Tags, Playwright BDD Gen files, PW report limitation

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

For more information consult the Cucumber Documentation provided in the Supporting Documentation  
&nbsp; 

# Auth Setup
TODO: Describe how pre-authorize test users before main test run

# Writing Tests Guide
TODO: Quick guide of feature --> step def --> page --> run 

# Supporting Documentation

- [Playwright Documentation](https://playwright.dev/docs/api/class-playwright)
- [playwright-bdd Documentation](https://www.npmjs.com/package/playwright-bdd/v/5.1.1)
- [Cucumber Documentation](https://cucumber.io/docs/cucumber/)
- ADD LINK TO STANDARDS DOC ONCE RSP-730 IS COMPLETE