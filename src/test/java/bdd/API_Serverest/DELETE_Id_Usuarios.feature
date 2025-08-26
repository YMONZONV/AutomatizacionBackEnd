Feature: Endpoint Consulta
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  @server50
  Scenario Outline: Registro excluído com sucesso | Nenhum registro excluído
    Given url "https://serverest.dev/usuarios/<P_Id>"
    * def expected_response = read('classpath:data/Response/Delete/resp_delete_200.json')
    * print 'responseEsperado: ', expected_response
    When method delete
    * print 'response: ', response
    Then status 200
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/Delete/delete_200.csv') |
