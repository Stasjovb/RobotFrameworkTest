*** Settings ***
Documentation       This test folder tests the Create deck functionality

Resource            Playtest.resource
Resource            ../Create_and_Modify/Modify.resource

Suite Setup         Navigate to moxfield and sign-in    ${VALID_USERNAME}    ${VALID_PASSWORD}


*** Variables ***
${VALID_USERNAME}       Stasjo_test
${VALID_PASSWORD}       testpartnerpassword1234
${NAME_OF_THE_DECK}     test_deck
${NAME_OF_FORMAT}       Commander / EDH

*** Test Cases ***
Open the Playtest simulator
    [Documentation]    This keyword navigates to the Playtest simulator in Moxfield.
    ...               Before using this keyword, ensure that you have:
    ...               - Navigated to "Your Decks" in Moxfield
    ...               - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"
    
    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards   ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    
    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    
Count the number of cards in your starting hand
    [Documentation]    This keyword ensures that Moxfield puts seven cards in your opening hand.
    ...               Before using this keyword, ensure that you have:
    ...               - Navigated to "Your Decks" in Moxfield
    ...               - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards
    ...               - Navigated to the Playtest simulator

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"
    
    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards   ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    
    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator
    
    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify


Verify that pressing the draw button puts another card into your hand
    [Documentation]    This test case verifies that pressing the "draw" button in the Playtest simulator adds another card to your hand.
    ...               Before running this test, ensure that you have:
    ...               - Navigated to "Your Decks" in Moxfield
    ...               - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards
    ...               - Navigated to the Playtest simulator
    ...               - Counted the number of cards in your hand
    
    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"
    
    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards   ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}
    
    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator
    
    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify
    
    # Step 5: Clicking the draw button and verifying card count changes
    Click the draw button and verify card count changes
