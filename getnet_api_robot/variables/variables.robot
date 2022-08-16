*** Variables ***
${BASE_URL}                                 https://reqres.in
${ENDPOINT_LIST_USERS}                      users?page=2
${ENDPOINT_SINGLE_USER}                     users/4
${ENDPOINT_SINGLE_USER_NOT_FOUND}           users/23
${ENDPOINT_LIST_RESOURCE}                   unknown
${ENDPOINT_SINGLE_RESOURCE}                 unknown/2
${ENDPOINT_SINGLE_RESOURCE_NOT_FOUND}       unknown/23
${ENDPOINT_CREATE}                          users
${ENDPOINT_UPDATE}                          users/2
${ENDPOINT_DELETE}                          users/2
${ENDPOINT_DELETE_NOT_FOUND}                users/23
${ENDPOINT_REGISTER_SUCCESSFUL}             register
${ENDPOINT_REGISTER_UNSUCCESSFUL}           register
${ENDPOINT_LOGIN_SUCCESSFUL}                login
${ENDPOINT_LOGIN_UNSUCCESSFUL}              login
${ENDPOINT_DELAYED_RESPONSE}                users?delay=3

${PAGE_PATH}                                $.page
${ID_PATH}                                  $.id

