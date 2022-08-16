*** Settings ***
Documentation       Suite de testes PUT

Resource            ${EXECDIR}/resources/steps/stepPUT.robot


*** Test Cases ***
Deve Atualizar o cadastro do usuário dado name e job então retorna status 200
    [Tags]    put
    Dado o endereço da API
    Quando realizar uma requisição alterando o cadastro do usuário para name: Davi Lucca , Job: ADM
    Então a API irá retornar os dados alterados respondendo o código 200

