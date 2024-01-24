*** Settings ***
Documentation    This is the Generic Keyword resource file which stores all the keywords that are used in multiple files and folders to avoid duplication.
Library    Browser
Resource    ./Login_and_Logout./login.resource
Resource    ./Login_and_Logout./logout.resource

*** Variables ***


*** Keywords ***
Navigate to moxfield and sign-in
    [Documentation]    This keyword navigates to the moxfield website and logs in with a username and password. 
    ...    this keyword will be used in most if not all of the testcases
    [Arguments]    ${username}    ${password}
    navigate to website
    Log into website    ${username}    ${password} 

in moxfield Navigate to ${Location_Name}
    [Documentation]    This keyword navigates within the main menu tabs on Moxfield
    Click    //a[contains(text(), ${Location_Name})]

Log out of Moxfield and close the Browser
    Log out of Moxfield
    Close Browser