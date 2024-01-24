*** Settings ***
Documentation       This test folder tests Log out functionality

Resource            logout.resource

Suite Setup         Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}


*** Variables ***
${VALID_USERNAME}       Stasjo_test
${VALID_PASSWORD}       testpartnerpassword1234


*** Test Cases ***
Log Out of Moxfield and Close the Browser
    [Documentation]    This test case tests the Log Out functionality.

    # Step 1: Log out of Moxfield (use the existing keyword)
    Log Out of Moxfield

    # Step 2: Close the browser
    Close Browser
