*** Settings ***
Documentation    This test folder tests Log out functionality
Resource    logout.resource
Suite Setup    Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}  

*** Variables ***
${VALID_USERNAME}    Stasjo_test
${VALID_PASSWORD}    testpartnerpassword1234


*** Test Cases ***
Log out of Moxfield and close the Browser
    [Documentation]    This testcase test the Log out functionality
    Log out of Moxfield
    Close Browser