*** Settings ***
Documentation    This Test folder tests the login and authorization functionality of moxfield
Library    Browser
resource    login.resource


*** Variables ***
${VALID_USERNAME}   Stasjo_test
${VALID_PASSWORD}   testpartnerpassword1234

*** Test Cases ***
Log-into Moxfield with Authorization
    [Documentation]    This test case tests the happy flow of the log-in functionality.
    [Tags]    Happyflow    Login
    Navigate to Website
    Log into Website    ${VALID_USERNAME}    ${VALID_PASSWORD}

Log-into Moxfield without Authorization
    [Documentation]    This test case tests the negative flow of the log-in functionality,
    ...    specifically if you can log in with bad credentials and whether you receive the expected error message.
    [Tags]    Negativeflow    Login    Unauthorized
    Navigate to Website
    Log into Website    username=invalid_name    password=invalid_password