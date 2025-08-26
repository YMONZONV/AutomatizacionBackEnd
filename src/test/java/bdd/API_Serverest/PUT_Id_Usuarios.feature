Feature: Endpoint Consulta
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  @server19
  Scenario Outline: 1.actualizar la información de un usuario existente-Status 200
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def request_body = read('classpath:data/Request/Put/req_put_200.json')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Put/resp_put_200.json')
    * print 'responseEsperado: ', expected_response
    When method put
    * print 'response: ', response
    Then status 200
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/Put/data_200.csv') |


  @server40
  Scenario Outline: 1.actualizar la información de un usuario existente-Status 201
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def request_body = read('classpath:data/Request/Put/req_put_201.json')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Put/resp_put_201.json')
    * print 'responseEsperado: ', expected_response
    When method put
    * print 'response: ', response
    Then status 201
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Put/data_201.csv') |

  @server41
  Scenario Outline: 1.actualizar la información de un usuario existente-Status 400
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def request_body = read('classpath:data/Request/Put/req_put_201.json')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Put/resp_put_201.json')
    * print 'responseEsperado: ', expected_response
    When method put
    * print 'response: ', response
    Then status 400
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/Put/data_400.csv') |