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
    ...    Before using this keyword, ensure that you have:
    ...    - Navigated to "Your Decks" in Moxfield
    ...    - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

Count the number of cards in your starting hand
    [Documentation]    This keyword ensures that Moxfield puts seven cards in your opening hand.
    ...    Before using this keyword, ensure that you have:
    ...    - Navigated to "Your Decks" in Moxfield
    ...    - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards
    ...    - Navigated to the Playtest simulator

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify

Verify that pressing the draw button puts another card into your hand
    [Documentation]    This test case verifies that pressing the "draw" button in the Playtest simulator adds another card to your hand.
    ...    Before running this test, ensure that you have:
    ...    - Navigated to "Your Decks" in Moxfield
    ...    - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards
    ...    - Navigated to the Playtest simulator
    ...    - Counted the number of cards in your hand

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify

    # Step 5: Clicking the draw button and verifying card count changes
    Click the draw button and verify card count changes

Verify that pressing the Next Turn button puts another card in your hand and increments the turn counter
    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify

    # Step 5: Clicking the Next Turn button and verifying that the card count changes and that the turn timer increments
    Click the Next Turn button and verify card count changes and that the turn timer increments

Verify that pressing the restart button resets all the information.
    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Counting the number of cards in hand
    Count the number of cards in hand and verify
    
    # Step 5: Loop through 7 turns where you draw and play a card
    FOR  ${i}  IN RANGE   7
       Click the Next Turn button and verify card count changes and that the turn timer increments
       Put a Card from your hand On the Battlefield
       Verify Card Count On Battlefield    expected_count=${i+1}
    END
    # Step 6: Restart the game and verify that all the data resets
    Restart the playtest by pressing the restart button and verify that all data resets
    
Press the Shuffle button to shuffle your deck
    [Documentation]    This keyword navigates to the Playtest simulator in Moxfield.
    ...    Before using this keyword, ensure that you have:
    ...    - Navigated to "Your Decks" in Moxfield
    ...    - Opened a decklist named ${NAME_OF_THE_DECK} for adding and removing cards

    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Shuffle the deck by pressing the shuffle button
    Shuffle the deck


verify and alter your life total in the playtest simulator
    [Documentation]    This keyword tests the functionality of verifying and altering the life total in the Playtest simulator on Moxfield.
...    It verifies that the lifetotal is correctly displayed and then alters it by subtracting 10.
...    Before using this keyword, ensure that you have navigated to "Your Decks" in Moxfield
...    and opened the desired decklist for adding and removing cards.
...    Explanation of Variables:
...    - ${NAME_OF_THE_DECK}: The name of the decklist you want to work with.
...    - ${NAME_OF_FORMAT}: The format of the decklist (e.g., Standard, Modern).
    # Step 1: Navigating to "Your Decks" in Moxfield
    In Moxfield Navigate to "Your Decks"

    # Step 2: Opening a decklist for adding and removing cards
    Open decklist to add and remove cards    ${NAME_OF_THE_DECK}    ${NAME_OF_FORMAT}

    # Step 3: Navigating to the Playtest simulator
    Navigate to the Playtest simulator

    # Step 4: Verifies that the lifetotal is correctly displayed in the Playtest simulator.
    Verify the lifetotal

    # Step 5: Alters the lifetotal in the Playtest simulator by subtracting 10 to simulate a change in life points.
    alter the lifetotal    minus     10