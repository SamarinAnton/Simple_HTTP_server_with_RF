*** Settings ***
Library     RequestsLibrary
Library     Process

Suite Setup         Run Server And Create Session
Suite Teardown      Kill Server And Delete Session
Test Template       Send Header And Verify Return Code

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
    ${resp}=        Get Request             localhost   /           headers=${header}
    Should Be Equal As Strings              ${resp.status_code}     ${code}

Run Server And Create Session
    Start Process       python2     main.py                     alias=server
    Create Session      localhost   http://${HOST}:${PORT}      max_retries=3
    Wait For Process    server      timeout=100ms

Kill Server And Delete Session
    Delete All Sessions
    Terminate Process 	server 	kill=true
