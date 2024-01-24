*** Settings ***
Documentation    This test folder tests the Create deck functionality
Resource    Modify.resource
Variables    Decklist-Najeela.json
Suite Setup    Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}
Suite Teardown    Log out of Moxfield and close the Browser
Test Teardown    in moxfield Navigate to "Home"

*** Variables ***
${VALID_USERNAME}    Stasjo_test
${VALID_PASSWORD}    testpartnerpassword1234
${NAME_OF_THE_DECK}    test_deck
${NAME_OF_FORMAT}    Commander / EDH
${NAME_OF_COMMANDER}   Najeela, the Blade-Blossom
${basic_land}    Mountain


*** Test Cases ***
Add cards to the deck
    in moxfield navigate to "Your Decks"
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    Add a card to the Deck    Mountain

Add all the Lands to the deck
    in moxfield navigate to "Your Decks"
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    Add lands to the deck    Scrubland

Add all the cards from a decklist to the deck
    [Tags]    suite_trail_run
    in moxfield navigate to "Your Decks"
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    Add cards from a Json file to the Deck    ${Najeela-decklist}

Remove a card from Deck
    [Documentation]    Removes any card that is found in the Json decklist
    [Tags]    suite_trail_run
    in moxfield navigate to "Your Decks"
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    remove a Card from Deck    Skullclamp


In moxfield navigate to your decks and delete a deck
    [Tags]    suite_trail_run   
    Click on the verticle Elipsis to edit a decks properties in Moxfield   ${NAME_OF_THE_DECK}    Delete Deck
    Click on the pop-up to permanently delete your deck
