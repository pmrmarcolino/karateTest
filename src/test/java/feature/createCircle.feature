Feature: create Feature
  Scenario: Fail create circle
    Given url 'https://darwin-api.continuousplatform.com/moove/circles'
    And form field Authorization = ''
    And form field Content-Type = 'application/json'
    When method POST
    Then status 401