*** Settings ***
Documentation       This resource file contains the keywords to allow the user to Test the Playtesting functionality 

Library             Browser
Resource            ../Generic_keywords.resource


*** Keywords ***
Navigate to the Playtest simulator
    [Documentation]    This keyword allows the user to navigate to the playtesting functionality.
    ...               Before using this keyword, ensure that you have:
    ...               - Navigated to "Your Decks" in Moxfield
    ...
    ...               This keyword performs the following steps:
    ...               1. Waits for the "Playtest" link to become visible
    ...               2. Clicks the "Playtest" link
    ...               3. Waits for the "Player" text to appear in the page

    # Step 1: Wait for the "Playtest" link to become visible
    Wait For Elements State    //span[@class='d-none d-sm-inline' and text()='Playtest']
    
    # Step 2: Click the "Playtest" link
    Click    //span[@class='d-none d-sm-inline' and text()='Playtest']
    
    # Step 3: Wait for the "Player" text to appear in the page
    Wait For Elements State    //span[text()='Player']

Count the number of cards in hand and verify
    [Documentation]    This test case verifies that you have a 7-card hand when you open the program.
    ...               Before running this test, make sure to:
    ...               - Select a deck and ensure it exists in the Moxfield database
    ...               - Fill the selected deck with at least 7 cards
    ...               
    # Count the number of cards in your hand
    ${cards_in_hand}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Verify that the number of cards in your hand is 7
    Should Be Equal As Integers    ${cards_in_hand}    7


Click the draw button and verify card count changes
    [Documentation]    When you press the "draw" button, a card is put from your deck into your hand, and the deck count decreases
    ...                Before running this test, make sure to:
    ...               - Select a deck and make sure it exists in the Moxfield database
    ...               - Fill the selected deck with at least 8 cards
    ...
    Wait For Elements State    div#button-draw    

    # Get the initial count of cards in the deck
    ${initial_deck_count_text}    Get Text    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]

    # Extract the numerical value from the text and convert to an integer
    ${initial_deck_count}    Convert To Integer    ${initial_deck_count_text.split('(')[1].split(')')[0]}

    # Get the initial count of cards in your hand
    ${initial_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Click the "draw" button
    Click    div#button-draw

    # Wait for a moment (if needed) for the new card to be added and deck count to change

    # Get the updated count of cards in the deck
    ${new_deck_count_text}    Get Text    (//div[@class="Bg3czDxrK8jhqum7GG3Q small dropdown-toggle text-nowrap d-inline-block"])[2]

    # Extract the numerical value from the updated text and convert to an integer
    ${new_deck_count}    Convert To Integer    ${new_deck_count_text.split('(')[1].split(')')[0]}

    # Verify that the new deck count is one less than the initial deck count
    Should Be Equal As Integers    ${new_deck_count}    ${initial_deck_count - 1}

    Log To Console    ${new_deck_count}

    # Get the updated count of cards in your hand
    ${new_hand_count}    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div

    # Verify that the hand count increased by 1
    Should Be Equal As Integers    ${new_hand_count}    ${initial_hand_count + 1}
