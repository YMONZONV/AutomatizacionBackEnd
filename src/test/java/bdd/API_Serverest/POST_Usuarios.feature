Feature: Endpoint Consulta
  Background:
  @server201
  Scenario Outline: 1.Registrar un nuevo usuario con datos válidos-Status 201
    Given url "https://serverest.dev/usuarios"
    * def request_body = read('classpath:data/Request/Post/req_201.json')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Post/resp_201.json')
    * print 'responseEsperado: ', expected_response
    When method post
    * print 'response: ', response
    Then status 201
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Post/data_201.csv') |

  @server202
  Scenario Outline: 2.Registrar un nuevo usuario con datos válidos-Status 400
    Given url "https://serverest.dev/usuarios"
    * def request_body = read('classpath:data/Request/POST/req_400.json')
    And request request_body
    * print 'request_body: ', request_body
    * def expected_response = read('classpath:data/Response/POST/resp_400.json')
    * print 'responseEsperado: ', expected_response
    When method post
    * print 'response: ', response
    Then status 400
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/POST/req_400.csv') |