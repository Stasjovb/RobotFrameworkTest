*** Settings ***
Documentation    This resource file contains the keywords to allow the user to Log out of moxfield and close the Browser
Library    Browser
Resource    ../Generic_keywords.resource


*** Variables ***

*** Keywords ***
Log out of Moxfield
    in moxfield Navigate to "Home"
    Wait For Elements State    a#mainmenu-user 
    Click    a#mainmenu-user
    Wait For Elements State     //div/a[text()='Sign out']
    Click     //div/a[text()='Sign out']

