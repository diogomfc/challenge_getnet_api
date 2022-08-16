*** Settings ***
Documentation       Suite de testes POST

Resource            ${EXECDIR}/resources/steps/stepPOST.robot


*** Test Cases ***
Quando cadastro um novo usuário dado name e job então retorna status 201
    [Tags]    post
    Dado o endereço da API
    Quando realizar uma requisição para cadastrar um usuário
    Então a API irá retornar os dados do cadastro respondendo o código 201

Quando registro um usuário dado e-mail e password então retorna status 200
    [Tags]    post
    Dado o endereço da API
    Quando realizar uma requisição para registrar um usuário com e-mail e password validos
    Então a API irá retornar id e token do registro respondendo o código 200

Quando efetuo login dado email e password validos então retorna status 200
    [Tags]    post
    Dado o endereço da API
    Quando realizar uma requisição para efetuar o login com e-mail e password validos
    Então a API irá retornar o token do login respondendo o código 200

Não deve registrar um novo usuário dado password vazio então retorna status 400
    [Tags]    post
    Dado o endereço da API
    Quando realizar uma requisição para rgistrar um usuário com password vazio
    Então a API irá retornar error respondendo o código 400

Não deve efetuar login dado password vazio então retorna status 400
    [Tags]    post
    Dado o endereço da API
    Quando realizar uma requisição para efetuar o login com password vazio
    Então a API irá retornar error respondendo o código 400

