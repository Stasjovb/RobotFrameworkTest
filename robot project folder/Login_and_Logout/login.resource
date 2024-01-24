*** Settings ***
Documentation       This resource file contains the keywords to allow the user to navigate to Moxfield and (attempt to) Login

Library             Browser


*** Keywords ***
Navigate to Website
    [Documentation]    This keyword allows the user to navigate to the homepage of Moxfield.

    # Step 1: Open a new browser with options (headless=False)
    New Browser    headless=False

    # Step 2: Create a new context and open a new page with the Moxfield website URL
    New Context
    New Page    url=https://www.moxfield.com/

    # Step 3: Click on a button (you may add additional information about this button)
    Click    button[onclick="__npcmp('save')"]

Log into Website
    [Documentation]    This keyword allows the user to log into Moxfield.
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}

    # Step 1: Click on the "Sign In" link
    Click    a[href="/account/signin?redirect=/"]

    # Step 2: Fill in the username and password fields
    Fill Text    input#username    ${username}
    Fill Text    input#password    ${password}

    # Step 3: Click on the "Log In" button
    Click    button[class="btn xfXbvFpydldcPS0H45tv btn-primary"]

    # Step 4: Set variables for successful and unsuccessful login elements
    ${successful_login}    Set Variable    //a[text()='Your Decks']
    ${unsuccessful_login}    Set Variable    //p[text()='Invalid username or password.']

    # Step 5: Wait for elements to determine login success or failure
    Wait For Elements State    ${successful_login} | ${unsuccessful_login}
