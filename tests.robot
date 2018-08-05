*** Settings ***
Library     RequestsLibrary

Suite Setup     Create Session  localhost   http://${HOST}:${PORT}   max_retries=3
Test Template   Send Header And Verify Return Code

*** Variables ***
${PORT}     8080
${HOST}     127.0.0.1

*** Test Cases ***      NAME OF HEADER                  CODE
Valid Test 1            ABCabc123456                    200
Valid Test 2            a                               200
Wrong length            123456789abcdeABCDE12312312     500
Wrong character         123 45-6                        500

*** Keywords ***
Send Header And Verify Return Code
    [Arguments]    ${name}      ${code}
    ${header}=      Create Dictionary       ${name}=something
    ${resp}=        Get Request             localhost   /       headers=${header}
    Should Be Equal As Strings              ${resp.status_code}     ${code}
