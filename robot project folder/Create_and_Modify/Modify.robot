*** Settings ***
Documentation       This test folder tests the Create deck functionality

Resource            Modify.resource
Variables           Decklist-Najeela.json

Suite Setup         Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}
Suite Teardown      Log out of Moxfield and close the Browser
Test Teardown       in moxfield Navigate to "Home"


*** Variables ***
${VALID_USERNAME}       Stasjo_test
${VALID_PASSWORD}       testpartnerpassword1234
${NAME_OF_THE_DECK}     test_deck
${NAME_OF_FORMAT}       Commander / EDH
${NAME_OF_COMMANDER}    Najeela, the Blade-Blossom
${basic_land}           Mountain


*** Test Cases ***
Add cards to the deck
    [Documentation]    This test case adds a card to a deck on Moxfield.
    [Tags]    smoke    deck-management

    # Step 1: Navigate to "Your Decks" on Moxfield
    in moxfield navigate to "Your Decks"

    # Step 2: Open the specified decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Add a specific card (in this case, a "Mountain") to the deck
    Add a card to the Deck    Mountain

Add all the Lands to the deck
    [Documentation]    This test case adds lands to a deck on Moxfield.
    [Tags]    deck-management

    # Step 1: Navigate to "Your Decks" on Moxfield
    in moxfield navigate to "Your Decks"

    # Step 2: Open the specified decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Add lands to the deck (in this case, "Scrubland")
    Add lands to the deck    Scrubland

Add all the cards from a decklist to the deck
    [Documentation]    This test case adds all the cards from a decklist to a deck on Moxfield.
    [Tags]    suite_trail_run    deck-management

    # Step 1: Navigate to "Your Decks" on Moxfield
    in moxfield navigate to "Your Decks"

    # Step 2: Open the specified decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Add all the cards from a JSON file to the deck
    Add cards from a Json file to the Deck    ${Najeela-decklist}

Remove a card from Deck
    [Documentation]    This test case removes a specific card from a deck on Moxfield.
    [Tags]    suite_trail_run    deck-management

    # Step 1: Navigate to "Your Decks" on Moxfield
    in moxfield navigate to "Your Decks"

    # Step 2: Open the specified decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Remove a specific card (in this case, "Skullclamp") from the deck
    Remove a card from Deck    Veil of Summer

Delete a Deck on Moxfield
    [Documentation]    This test case navigates to "Your Decks" on Moxfield, deletes a specific deck, and confirms the deletion.
    [Tags]    suite_trail_run    deck-management

    # Step 1: Navigate to "Your Decks" on Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Click on the vertical ellipsis to edit a deck's properties
    # and select "Delete Deck" for ${NAME_OF_THE_DECK}
    Click on the verticle Elipsis to edit a decks properties in Moxfield    ${NAME_OF_THE_DECK}    Delete Deck

    # Step 3: Click on the pop-up to permanently delete the deck
    Click on the pop-up to permanently delete your deck
