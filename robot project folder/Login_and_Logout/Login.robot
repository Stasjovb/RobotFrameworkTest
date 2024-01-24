*** Settings ***
Documentation    This Test folder tests the login and authorization functionality of moxfield
Library    Browser
resource    login.resource


*** Variables ***
${VALID_USERNAME}   Stasjo_test
${VALID_PASSWORD}   testpartnerpassword1234

*** Test Cases ***
Log-into Moxfield with authorization
    [Documentation]    This testcase tests the happyflow of the log-in functionality
    [Tags]     Happyflow    Login 
    navigate to website    
    Log into website    ${VALID_USERNAME}    ${VALID_PASSWORD}

Log-into Moxfield without authorization
    [Documentation]    This testcase test the negative flow of the log-in functionality
    ...     specifically if you can login with bad credentials and whether you receive the expected error message
    [Tags]    Negativeflow    Login    unauthorized
    navigate to website
    Log into website    username=invalid_name    password=invalid_password