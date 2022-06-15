Feature: Registering user action

  Background:
    * url 'http://api.1dt.com.br/services/api'

  Scenario Outline: Registering specified user action

    Given path '/v1/post'
    And request {data:{action:<action_id>, card:{id:<card_id>, pipe_id:<pipe_id>}}}
    When method post
    Then status 200
    Then print response

    And match $.result == 'ok'

    Examples:
      | action_id      | card_id       | pipe_id      |
      | create         | 100           | pipe-001     |
      | move           | 100           | pipe-123     |
      | delete         | 100           | pipe-999     |

  Scenario Outline: Return last specified card for specific user

    Given path '/v1/get/<pipe_id>/<user_id>'
    When method get
    Then status 200
    Then print response

    And match $.reason == 'OK'
    And match $.success == true

    Examples:
      | user_id      | pipe_id      |
      | user_001     | pipe-001     |
      | user_002     | pipe-123     |
      | user_123    | pipe-999     |

  Scenario Outline: Return if a card from a given pipe has a given action

    Given path '/v1/exist/<pipe_id>/<card_id>/<action_id>'
    When method get
    Then status 200
    Then print response

    And match $.success == true

    Examples:
      | action_id      | card_id       | pipe_id      |
      | create         | 100           | pipe-001     |
      | move           | 100           | pipe-123     |
      | delete         | 100           | pipe-999     |

  Scenario Outline: Registering specified user action using csv

    Given path '/v1/post'
    And request {data:{action:<action_id>, card:{id:<card_id>, pipe_id:<pipe_id>}}}
    When method post
    Then status 200
    Then print response

    And match $.result == 'ok'

    Examples:
      | action_id      | card_id       | pipe_id      |
      | create         | 100           | pipe-001     |
      | move           | 100           | pipe-123     |
      | delete         | 100           | pipe-999     |