*** Settings ***
Documentation       This resource file contains the keywords to allow the user to Log out of moxfield and close the Browser

Library             Browser
Resource            ../Generic_keywords.resource


*** Keywords ***
Log Out of Moxfield
    [Documentation]    This keyword allows the user to log out of Moxfield.

    # Step 1: Navigate to the "Home" page
    In Moxfield Navigate to "Home"

    # Step 2: Wait for the "User" menu element to be in the expected state
    Wait For Elements State    a#mainmenu-user

    # Step 3: Click on the "User" menu
    Click    a#mainmenu-user

    # Step 4: Wait for the "Sign Out" link to be in the expected state
    Wait For Elements State    //div/a[text()='Sign out']

    # Step 5: Click on the "Sign Out" link
    Click    //div/a[text()='Sign out']
