*** Settings ***
Documentation       This resource file contains the keywords to allow the user to Test the Playtesting functionality

Library             Browser
Resource            ../Generic_keywords.resource


*** Keywords ***
Navigate to the Playtest simulator
    [Documentation]    This keyword allows the user to navigate to the playtesting functionality.
    ...    Before using this keyword, ensure that you have:
    ...    - Navigated to "Your Decks" in Moxfield
    ...
    ...    This keyword performs the following steps:
    ...    1. Waits for the "Playtest" link to become visible
    ...    2. Clicks the "Playtest" link
    ...    3. Waits for the "Player" text to appear in the page

    # Step 1: Wait for the "Playtest" link to become visible
    Wait For Elements State    //span[@class='d-none d-sm-inline' and text()='Playtest']

    # Step 2: Click the "Playtest" link
    Click    //span[@class='d-none d-sm-inline' and text()='Playtest']

    # Step 3: Wait for the "Player" text to appear in the page
    Wait For Elements State    //span[text()='Player']

Count the number of cards in hand and verify
    [Documentation]    This test case verifies that you have a 7-card hand when you open the program.
    ...    Before running this test, make sure to:
    ...    - Select a deck and ensure it exists in the Moxfield database
    ...    - Fill the selected deck with at least 7 cards
    ...
    # Count the number of cards in your hand
    ${cards_in_hand}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Verify that the number of cards in your hand is 7
    Should Be Equal As Integers    ${cards_in_hand}    7

Click the draw button and verify card count changes
    [Documentation]    When you press the "draw" button, a card is put from your deck into your hand, and the deck count decreases
    ...    Before running this test, make sure to:
    ...    - Select a deck and make sure it exists in the Moxfield database
    ...    - Fill the selected deck with at least 8 cards
    ...
    # Ensure the user is on the correct page by verifying that the Element is visible on the page
    Wait For Elements State    div#button-draw

    # Get the initial count of cards in the deck
    ${initial_deck_count_text}    Get Text
    ...    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]

    # Extract the numerical value from the text and convert to an integer
    ${initial_deck_count}    Convert To Integer    ${initial_deck_count_text.split('(')[1].split(')')[0]}

    # Get the initial count of cards in your hand
    ${initial_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Click the "draw" button
    Click    div#button-draw

    # Wait for a moment (if needed) for the new card to be added and deck count to change

    # Get the updated count of cards in the deck
    ${new_deck_count_text}    Get Text
    ...    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]

    # Extract the numerical value from the updated text and convert to an integer
    ${new_deck_count}    Convert To Integer    ${new_deck_count_text.split('(')[1].split(')')[0]}

    # Verify that the new deck count is one less than the initial deck count
    Should Be Equal As Integers    ${new_deck_count}    ${initial_deck_count - 1}

    # Get the updated count of cards in your hand
    ${new_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Verify the user is notified about the new card put in their hand
    Wait For Elements State
    ...    //span[contains(text(),'A card was drawn. You now have ${new_hand_count} cards in hand.' )]

    # Verify that the hand count increased by 1
    Should Be Equal As Integers    ${new_hand_count}    ${initial_hand_count + 1}

Click the Next Turn button and verify card count changes and that the turn timer increments
    [Documentation]    When you press the "draw" button, a card is put from your deck into your hand, and the deck count decreases
    ...    Before running this test, make sure to:
    ...    - Select a deck and make sure it exists in the Moxfield database
    ...    - Fill the selected deck with at least 8 cards

    # Ensure the user is on the correct page by verifying that the Element is visible on the page
    Wait For Elements State    div#button-draw

    # Get the initial turn timer value
    ${initial_turn_timer_text}    Get Text    (//a[@class="navbar-text text-white cursor-pointer no-outline"])[1]

    # Extract the numeric value from the text
    ${initial_turn_timer}    Set Variable    ${initial_turn_timer_text.strip('Turn ')}

    # Convert the initial_turn_timer to an integer
    ${initial_turn_timer}    Convert To Integer    ${initial_turn_timer}

    # Get the initial count of cards in the deck
    ${initial_deck_count_text}    Get Text
    ...    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]
    # Extract the numerical value from the text and convert to an integer
    ${initial_deck_count}    Convert To Integer    ${initial_deck_count_text.split('(')[1].split(')')[0]}

    # Get the initial count of cards in your hand
    ${initial_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div
    # Click the "draw" button
    Click    //div[@class="nGNk1A9L6Dr58lM5Lt7W zUHtiLXHXuZW799kNEsM mb-2"]

    # Calculate the expected value after the increment (increment by 1)
    ${expected_turn_timer}    Evaluate    ${initial_turn_timer} + 1
    Log To Console    ${expected_turn_timer}

    # Get the new turn timer value
    ${new_turn_timer_text}    Get Text    (//a[@class="navbar-text text-white cursor-pointer no-outline"])[1]

    # Extract the numeric value from the text
    ${new_turn_timer}    Set Variable    ${new_turn_timer_text.strip('Turn ')}

    # Convert the new_turn_timer to an integer
    ${new_turn_timer}    Convert To Integer    ${new_turn_timer}

    Log To Console    ${new_turn_timer}

    # Compare the expected value with the new timer value
    Should Be Equal As Integers    ${new_turn_timer}    ${expected_turn_timer}

    # Get the updated count of cards in the deck
    ${new_deck_count_text}    Get Text
    ...    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]

    # Extract the numerical value from the updated text and convert to an integer
    ${new_deck_count}    Convert To Integer    ${new_deck_count_text.split('(')[1].split(')')[0]}

    # Verify that the new deck count is one less than the initial deck count
    Should Be Equal As Integers    ${new_deck_count}    ${initial_deck_count - 1}

    # Get the updated count of cards in your hand
    ${new_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Verify the user is notified about the new card put in their hand
    Wait For Elements State
    ...    //span[contains(text(),'A card was drawn. You now have ${new_hand_count} cards in hand.' )]

    # Verify that the hand count increased by 1
    Should Be Equal As Integers    ${new_hand_count}    ${initial_hand_count + 1}

Restart the playtest by pressing the restart button and verify that all data resets
    [Documentation]    Restart the playtest by pressing the restart button and verify that all data resets.
    Wait For Elements State    //span[text()='R']
    Click    //span[text()='R']
    Wait For Elements State    //p[text()='Are you sure you want to restart the game?']
    Click    //span[text()='Restart']
    # Verify that the turn timer is back to the initial number
    ${initial_turn_timer_text}    Get Text    (//a[@class="navbar-text text-white cursor-pointer no-outline"])[1]
    Should Be Equal As Strings    ${initial_turn_timer_text}    Turn 1
    # Verify that the hand count is back to the initial count
    ${initial_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div
    Should Be Equal As Integers    ${initial_hand_count}    7
    ${cards_on_battlefield}    Get Element Count    //div[contains(@class, 'battlefield')]//div[contains(@class, 'CBc0hpZC28HswCgpsi2l dropdown')]
    Should Be Equal As Integers    ${cards_on_battlefield}    0

  #  //div[contains(@class, 'battlefield')]
  #  //div[contains(@class, 'battlefield')]//div[contains(@class, 'CBc0hpZC28HswCgpsi2l dropdown')]

Put a Card On the Battlefield
    [Documentation]    Put a card from your hand onto the battlefield.
    Click With Options    ((//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div)[1]    clickCount=2

Verify Card Count On Battlefield
    [Documentation]    Verify the count of cards on the battlefield.
    [Arguments]    ${expected_count}
    ${cards_on_battlefield}    Get Element Count    //div[contains(@class, 'battlefield')]//div[contains(@class, 'CBc0hpZC28HswCgpsi2l dropdown')]
    Should Be Equal As Integers    ${cards_on_battlefield}    ${expected_count}
    