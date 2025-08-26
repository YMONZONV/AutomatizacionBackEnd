Feature: Endpoint Consulta
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  @server20
  Scenario Outline: Buscar un usuario específico por su ID-Status 200
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def expected_response = read('classpath:data/Response/Get_Id/resp_GetId_200.json')
    * print 'responseEsperado: ', expected_response
    When method get
    * print 'response: ', response
    Then status 200
    And match response == expected_response
    Examples:
    | read ('classpath:data/Request/Get_Id/data_200.csv') |

  @server21
  Scenario Outline: 2.buscar un usuario específico por su ID-Status 400
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def expected_response = read('classpath:data/Response/Get_Id/resp_GetId_400.json')
    * print 'responseEsperado: ', expected_response
    When method get
    * print 'response: ', response
    Then status 400
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/Get_Id/data_400.csv') |