*** Settings ***
Documentation       This test folder tests the Create deck functionality

Resource            Playtest.resource
Resource            ../Create_and_Modify/Modify.resource

Suite Setup         Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}
#Suite Teardown      Log out of Moxfield and close the Browser
Test Teardown       Navigate back to the decklist


*** Variables ***
${VALID_USERNAME}       Stasjo_test
${VALID_PASSWORD}       testpartnerpassword1234
${NAME_OF_THE_DECK}     test_deck
${NAME_OF_FORMAT}       Commander / EDH

*** Test Cases ***
Open the Playtest simulator
    In Moxfield Navigate to "Your Decks"
    Open decklist to add and remove cards   ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}    
    Navigate to the Playtest simulator
    
    