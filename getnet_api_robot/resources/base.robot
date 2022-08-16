*** Settings ***
Documentation       Arquivo base do projeto

Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             JSONLibrary
Library             String
Library             REST    https://reqres.in/api/
Library             FakerLibrary
Resource            ${EXECDIR}/variables/variables.robot


*** Keywords ***
Start Session
    create Session    GETNET_API_ROBOT    ${BASE_URL}    verify=True

Get JSON
    [Arguments]    ${file_name}
    ${file}    Get File    ${EXECDIR}/resources/inputData/${file_name}
    ${super_var}    Evaluate    json.loads($file)    json
    RETURN    ${super_var}

