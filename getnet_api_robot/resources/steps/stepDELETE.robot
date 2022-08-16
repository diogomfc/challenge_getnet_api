*** Settings ***
Documentation       Guia para os testes de DELETE Users

Resource            ${EXECDIR}/resources/base.robot


*** Keywords ***
Validate status code 204
    Integer    response status    204
    Output    response status
    Rest instances    ${OUTPUTDIR}/rest.delete_user.json
    Output    $

Dado o endereço da API
    Start Session

Quando realizar uma requisição para excluir um cadastro de usuário com id valido
    REST.DELETE    ${ENDPOINT_DELETE}

Então a API irá retornar os dados da exclusão respondendo o código 204
    Validate status code 204

