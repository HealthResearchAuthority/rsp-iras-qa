@UserAdministration @testdata
Feature: Generate test data for field validation of user attributes across user persona

    @rsp-2087
    Scenario Outline: Generate test data to validate different attributes in the user roles
        When I generate '<TypeofData>' test data for '<FieldName>'
        Then I attach the generated test data json files to the report
        Examples:
            | FieldName | TypeofData |
            | Title     | Valid      |
            | Title     | Invalid    |
            | Forename  | Valid      |
            | Forename  | Invalid    |
            | Surname   | Valid      |
            | Surname   | Invalid    |
            | Email     | Valid      |
            | Email     | Invalid    |
            | Telephone | Valid      |
            | Telephone | Invalid    |