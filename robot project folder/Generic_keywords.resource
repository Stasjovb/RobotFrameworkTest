*** Settings ***
Documentation    This is the Generic Keyword resource file which stores all the keywords that are used in multiple files and folders to avoid duplication.
Library    Browser
Resource    ./Login_and_Logout./login.resource
Resource    ./Login_and_Logout./logout.resource

*** Variables ***


*** Keywords ***
Navigate to Moxfield and Sign-In
    [Documentation]    This keyword navigates to the Moxfield website and logs in with a username and password.
    ...                This keyword will be used in most, if not all, of the test cases.
    [Arguments]    ${username}    ${password}
    
    # Step 1: Navigate to the Moxfield website
    Navigate to Website
    
    # Step 2: Log into Moxfield using the provided username and password
    Log into website    ${username}    ${password}

In Moxfield Navigate to ${Location_Name}
    [Documentation]    This keyword navigates within the main menu tabs on Moxfield.
    
    # Step 1: Click on the menu tab with the provided location name
    Click    //a[contains(text(), ${Location_Name})]

Log Out of Moxfield and Close the Browser
    [Documentation]    This keyword logs out of Moxfield and closes the browser.
    
    # Step 1: Log out of Moxfield (use the existing keyword)
    Log out of Moxfield
    
    # Step 2: Close the browser (use the existing keyword)
    Close Browser