*** Settings ***
Documentation     Guia para os testes de GET Users

Resource   ${EXECDIR}/resources/base.resource

*** Keywords ***

# Teste de GET Users
Dado que acesso a api https://reres.in
    [Tags]    GET
    Start Session
quando faço um GET para /api/users/2
    [Tags]    GET
    ${ENDPOINT_LIST_USERS}    set variable    /api/users?page=2
    ${response}    get on session    GETNET_API_ROBOT    ${ENDPOINT_LIST_USERS}
então devo receber um status code 200
    [Tags]    GET
    ${ENDPOINT_LIST_USERS}    set variable    /api/users?page=2
    ${response}    get on session    GETNET_API_ROBOT    ${ENDPOINT_LIST_USERS}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    log               ${response.content}

    ${response_status_code}    convert to string    ${response.status_code}
    should be equal    ${response_status_code}    200    

    ${json_response}    Convert String to JSON    ${response.content}
    ${contents}    Get Value From JSON    ${json_response}    ${PAGE_PATH}
    ${contents}    convert to string    ${contents}
    ${contents}    Remove String Using Regexp    ${contents}    ['\\[\\],]
    should be equal    ${contents}   2

    ${response_header_value}        Get From Dictionary         ${response.headers}      Content-Type
    should be equal     ${response_header_value}     application/json; charset=utf-8
