*** Settings ***
Documentation    This test folder tests the Create deck functionality
Resource    Create.resource
Resource    ../Generic_keywords.resource
Suite Setup    Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}
Suite Teardown    Log out of Moxfield and close the Browser

*** Variables ***
${VALID_USERNAME}    Stasjo_test
${VALID_PASSWORD}    testpartnerpassword1234
${NAME_OF_THE_DECK}    test_deck
${NAME_OF_FORMAT}    Commander / EDH
${NAME_OF_COMMANDER}   Najeela, the Blade-Blossom

*** Test Cases ***
Create a new commander Decks
    [Tags]    suite_trail_run
    [Documentation]    This testcases test the creation of a commander deck
    Create a Deck    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}    ${NAME_OF_COMMANDER}    deck_visibily_button=input[id*="visibility-private"]
