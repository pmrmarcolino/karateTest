Feature: Fail get build with unauthorized key
  Background:
    * def build = call read('token.feature')
  Scenario:
    Given url 'https://darwin-api.continuousplatform.com/moove/builds?tagName=&page=0&status=BUILT'
    And form field Connection = 'keep-alive'
    And form field x-application-id = '900c4342-df7e-488b-bf6f-1784ee7c0546'
    And form field Accept = 'application/json, text/plain, */*'
    And form field authorization = 'Bearer' + build.authToken
    And form field User-Agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'
    And form field Origin = 'https://darwin.continuousplatform.com'
    And form field Sec-Fetch-Site = 'same-site'
    And form field Sec-Fetch-Mode = 'cors'
    And form field Referer = 'https://darwin.continuousplatform.com/circles/a8685f7b-ac6d-498b-8b89-8206c03e9322/edit'
    And form field Accept-Encoding = 'gzip, deflate, br'
    And form field Accept-Language = 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6'
    And form field Authorization = 'Bearer' + build.response
    * print 'Bearer' + build.response
    When method GET
    Then status 401