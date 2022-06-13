Feature: POSTCallReadingDataFromCSVFile

  Background:
    * url 'https://43db3005-4ed9-4bab-b0a3-bb066e79e816.mock.pstmn.io'

  Scenario Outline: create a user from given details.

    Given path '/POSTUser'
    And request {firstName:<firstName>, lastName:<lastName>,username:<userName>,email:<email>}
    When method post
    Then status 201
    Then print response

    And match $.Status == '#present'
    And match $.Status == 'OK'

    Examples:
      | read('karateTestData.csv') |