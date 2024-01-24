*** Settings ***
Documentation    This resource file contains the keywords to allow the user to navigate to Moxfield and (attempt to) Login 
Library    Browser


*** Variables ***

*** Keywords ***
navigate to website
    [Documentation]    This keyword allows the user to navigate to the homepage of Moxfield
    New Browser    headless=False
    New Context
    New Page    url=https://www.moxfield.com/
    Click    button[onclick="__npcmp('save')"]    


Log into website
    [Documentation]    This keyword allows the user to log into Moxfield
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    Click    a[href="/account/signin?redirect=/"]
    Fill Text    input#username   ${username}
    Fill Text    input#password   ${password}
    Click    button[class="btn xfXbvFpydldcPS0H45tv btn-primary"]
    ${succesfull_login}    Set Variable    //a[text()='Your Decks']
    ${unsuccesfull_login}    Set Variable    //p[text()='Invalid username or password.']
    Wait For Elements State   ${succesfull_login} | ${unsuccesfull_login}
