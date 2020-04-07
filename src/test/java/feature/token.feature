Feature: Token Generator

  Scenario: Login success
    Given url 'https://darwin-keycloak.continuousplatform.com/auth/realms/darwin/protocol/openid-connect/token'
    And form field username = 'processoqa@zup.com.br'
    And form field password = '123mudar'
    And form field grant_type = 'password'
    And form field client_id = 'darwin-client'
    When method POST
    * def responseToken = response
    * assert response.access_token != null
    * assert response.expires_in == '3600'
    * assert response.refresh_expires_in == '1800'
    * assert response.refresh_token != null
    * assert response.token_type == 'bearer'
    * assert response.session_state != null
    * assert response.scope == 'profile email'
    Then status 200

  Scenario: Login fail with password incorrect
    Given url 'https://darwin-keycloak.continuousplatform.com/auth/realms/darwin/protocol/openid-connect/token'
    And form field username = 'processoqa@zup.com.br'
    And form field password = '1234mudar'
    And form field grant_type = 'password'
    And form field client_id = 'darwin-client'
    When method POST
    Then status 401
