*** Settings ***
Documentation       Suite de testes

Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary
Library    String

Library    REST     https://reqres.in


Resource    ../resources/base.resource

*** Variables ***
#Dados gerais
${BASE_URL}     https://reqres.in
${PAGE_PATH}    $.page
${ID_PATH}      $.id

${name}         Diogo
${job}          Developer


${name_update}         morpheus
${job_update}          zion resident


*** Keywords ***

Iniciar session
    Create Session     session1     ${BASE_URL}       disable_warnings=1


Listar todos usuários
    [Tags]    GET
    ${ENDPOINT_LIST_USERS}          set variable     /api/users?page=2
    ${RESPONSE_LIST_USERS}   get on session    session1      ${ENDPOINT_LIST_USERS}
    Log To Console    ${RESPONSE_LIST_USERS.status_code}
    Log To Console    ${RESPONSE_LIST_USERS.content}
    Log To Console    ${RESPONSE_LIST_USERS.headers}
    log               ${RESPONSE_LIST_USERS.content}
    
    #VALIDATIONS
    ${RESPONSE_LIST_USERS_status_code}      convert to string      ${RESPONSE_LIST_USERS.status_code}
    should be equal     ${RESPONSE_LIST_USERS_status_code}     200    

    ${json_response}      Convert String to JSON      ${RESPONSE_LIST_USERS.content}
    ${contents}           Get Value From JSON         ${json_response}      ${PAGE_PATH}
    ${contents}           convert to string           ${contents}
    ${contents}           Remove String Using Regexp    ${contents}     ['\\[\\],]
    should be equal     ${contents}     2
    
    ${RESPONSE_LIST_USERS_headerValue}        Get From Dictionary         ${RESPONSE_LIST_USERS.headers}      Content-Type
    should be equal     ${RESPONSE_LIST_USERS_headerValue}     application/json; charset=utf-8

List all ussers
    REST.GET    /api/users?page=2
    Integer     response status   200
    Output      $

*** Test Cases ***
GET Resquest API
    [Tags]    GET
    Create Session     session1     ${BASE_URL}       disable_warnings=1
    ${ENDPOINT_LIST_USERS}          set variable     /api/users?page=2
    ${RESPONSE_LIST_USERS}   get on session    session1      ${ENDPOINT_LIST_USERS}
    Log To Console    ${RESPONSE_LIST_USERS.status_code}
    Log To Console    ${RESPONSE_LIST_USERS.content}
    Log To Console    ${RESPONSE_LIST_USERS.headers}
    log               ${RESPONSE_LIST_USERS.content}
    
    #VALIDATIONS
    ${RESPONSE_LIST_USERS_status_code}      convert to string      ${RESPONSE_LIST_USERS.status_code}
    should be equal     ${RESPONSE_LIST_USERS_status_code}     200    

    ${json_response}      Convert String to JSON      ${RESPONSE_LIST_USERS.content}
    ${contents}           Get Value From JSON         ${json_response}      ${PAGE_PATH}
    ${contents}           convert to string           ${contents}
    ${contents}           Remove String Using Regexp    ${contents}     ['\\[\\],]
    should be equal     ${contents}     2
    
    ${RESPONSE_LIST_USERS_headerValue}        Get From Dictionary         ${RESPONSE_LIST_USERS.headers}      Content-Type
    should be equal     ${RESPONSE_LIST_USERS_headerValue}     application/json; charset=utf-8

POST Resquest API
    [Tags]    POST
    Create Session     session1     ${BASE_URL}       disable_warnings=1

    ${ENDPOINT_CREATE}              set variable      /api/users
    ${body}        Create Dictionary     name=${name}    job=${job}

    ${RESPONSE_CREATE}         Post On Session    session1      ${ENDPOINT_CREATE}     data=${body}
    Log To Console    ${RESPONSE_CREATE.status_code}
    Log To Console    ${RESPONSE_CREATE.content}

    
    #VALIDATIONS
    ${RESPONSE_CREATE_status_code}      Convert To String      ${RESPONSE_CREATE.status_code}
    should be equal     ${RESPONSE_CREATE_status_code}     201    

    ${json_response}      Convert String to JSON      ${RESPONSE_CREATE.content}
    ${contents}           Get Value From JSON         ${json_response}      ${ID_PATH}
    Should Not Be Empty   ${contents}

PUT Resquest API
    [Tags]    PUT
    Create Session     session1     ${BASE_URL}       disable_warnings=1

    ${ENDPOINT_UPDATE}              set variable      /api/users/2
    ${body}        Create Dictionary     name=${name_update}    job=${job_update}

    ${RESPONSE_UPDATE}         Put On Session    session1      ${ENDPOINT_UPDATE}     data=${body}
    Log To Console    ${RESPONSE_UPDATE.status_code}
    Log To Console    ${RESPONSE_UPDATE.content}

    
    #VALIDATIONS
    ${RESPONSE_UPDATE_status_code}      Convert To String      ${RESPONSE_UPDATE.status_code}
    should be equal     ${RESPONSE_UPDATE_status_code}     200    
DELETE Resquest API

    [Tags]    DELETE
    Create Session     session1     ${BASE_URL}       disable_warnings=1

    ${ENDPOINT_DELETE}              set variable      /api/users/2

    ${RESPONSE_DELETE}         Delete On Session    session1      ${ENDPOINT_DELETE}
    Log To Console    ${RESPONSE_DELETE.status_code}
    Log To Console    ${RESPONSE_DELETE.content}
 
    #VALIDATIONS
    ${RESPONSE_UPDATE_status_code}      Convert To String      ${RESPONSE_DELETE.status_code}
    should be equal     ${RESPONSE_UPDATE_status_code}     204    


RESTinstance GET
    REST.GET    /api/users?page=2
    Integer     response status   200
    Output      $

RESTinstance POST
    REST.POST    /api/users
    Create Dictionary     name=${name}    job=${job}
    Integer     response status   201
    Output      $

Deve listar todos usuários da pagina 2 então retorna status 200
   List all ussers