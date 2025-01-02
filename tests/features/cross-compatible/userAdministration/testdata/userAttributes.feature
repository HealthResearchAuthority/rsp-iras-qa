@UserAdministration @testdata
Feature: Generate test data for field validation of user attributes across user persona

    Scenario Outline: Generate test data to validate different attributes in the user roles
        When I generate '<TypeofData>' test data for '<FieldName1>'
        And I generate '<TypeofData>' test data for '<FieldName2>'
        And I generate '<TypeofData>' test data for '<FieldName3>'
        And I generate '<TypeofData>' test data for '<FieldName4>'
        And I generate '<TypeofData>' test data for '<FieldName5>'

        Examples:
            | FieldName1 | FieldName2 | FieldName3 | FieldName4 | FieldName5 | TypeofData |
            | Title      | Forename   | Surname    | Email      | Telephone  | Valid      |
            | Title      | Forename   | Surname    | Email      | Telephone  | Invalid    |