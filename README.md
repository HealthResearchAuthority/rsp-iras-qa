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

![running with tags](resources\images\runWithTag.png =1400x700)  
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

![reporters](resources\images\reporters.png)  
&nbsp; 
   
## Running in Azure Devops Pipeline
TODO: Will update upon completion of the [RSP-537](https://nihr.atlassian.net/browse/RSP-537) story

# Test Structure
TODO: Explain the different elelements of the test Structure e.g. Step Def, Feature Files, Page Objects

# Cucumber Overview
TODO: Explain Feature File structure, Use Of Tags, Playwright BDD Gen files, PW report limitation

# Auth Setup
TODO: Describe how pre-authorize test users before main test run

# Writing Tests Guide
TODO: Quick guide of feature --> step def --> page --> run 

# Supporting Documentation

- [Playwright Documentation](https://playwright.dev/docs/api/class-playwright)
- [playwright-bdd Documentation](https://www.npmjs.com/package/playwright-bdd/v/5.1.1)
- [Cucumber Documentation](https://cucumber.io/docs/cucumber/)