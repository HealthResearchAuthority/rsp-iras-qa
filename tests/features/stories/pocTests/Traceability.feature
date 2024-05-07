@pocUser @traceabilityFeature
Feature: This is a Testing Feature to Assess Traceability

    Background:
        Given I have navigated to the 'Tasks_Page'

    @RSp-744 @uniqueScenario @rsp-1111 @rsp-123574 @RSP-00948873
    Scenario: This is a Unique Scenario
        When I do something
        Then The JIRA Tag will be on the report

    @rSP-744 @rsp-745 @anotherUniqueScenario @rsp-1111 @rsp-123574 @RSP-00948873
    Scenario: This is another Unique Scenario
        When I do something
        Then The JIRA Tags will also be on the report
