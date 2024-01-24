*** Settings ***
Documentation       This resource file contains the keywords to create decks on Moxfield

Library             Browser
Library             OperatingSystem
Library             JSONLibrary
Library             Collections
Library              String
Variables           Decklist-Najeela.json
Resource            ../Generic_keywords.resource


*** Keywords ***
Click on the verticle Elipsis to edit a decks properties in Moxfield
    [Documentation]    This keyword navigates to "Your Decks" on Moxfield, clicks on the vertical ellipsis menu for a specific deck to edit its properties, and selects the specified option.
    [Arguments]    ${Deck_name}    ${Edit_properties}

    # Step 1: Navigate to "Your Decks" on Moxfield
    in moxfield Navigate to "Your Decks"

    # Step 2: Click on the ellipsis menu for the specified deck
    Click    //tr[.//*[contains(text(), '${Deck_name}')]]//a[contains(@class,"text-muted")][1]

    # Step 3: Wait for the specified option (${Edit_properties}) to appear
    Wait For Elements State    //a[contains(text(),'${Edit_properties}')]

    # Step 4: Click on the specified option to edit the deck's properties
    Click    //a[contains(text(),'${Edit_properties}')]

Click on the pop-up to permanently delete your deck
    [Documentation]    This keyword waits for the "Permanently Delete" option to appear on a pop-up and then clicks on it to confirm the permanent deletion of your deck.

    # Step 1: Wait for the "Permanently Delete" option to appear on the pop-up
    Wait For Elements State    //span[contains(text(),'Permanently Delete')]

    # Step 2: Click on the "Permanently Delete" option on the pop-up
    Click    //span[contains(text(),'Permanently Delete')]

Open decklist to add and remove cards
    [Documentation]    This keyword opens a decklist for adding and removing cards by navigating to it based on the specified deck name and format.
    [Arguments]    ${Deck_name}    ${Format_name}

    # Step 1: Wait for the decklist element to be in the desired state
    Wait For Elements State
    ...    (//tr[td/a[contains(text(),'${Deck_name}')] and td/span[contains(text(),'${Format_name}')]]/td/a)[1]

    # Step 2: Click on the decklist to open it
    Click    (//tr[td/a[contains(text(),'${Deck_name}')] and td/span[contains(text(),'${Format_name}')]]/td/a)[1]

    # Step 3: Wait for the deck name element to be in the desired state
    Wait For Elements State    //span[contains(text(),'${Deck_name}')]

Add a card to the Deck
    [Documentation]    This keyword adds a specified card to the deck.
    [Arguments]    ${card_name}

    # Step 1: Fill in the search input with the card name
    Fill Text    input#deckbox-search    ${card_name}

    # Step 2: Wait for the card to appear in the search results
    Wait For Elements State    //a[text()="${card_name}"]

    # Step 3: Click on the card in the search results to add it to the deck
    Click    //a[text()="${card_name}"]

Add lands to the deck
    [Documentation]    This keyword adds multiple copies of a specified land card to the deck until there are 36 copies.
    [Arguments]    ${card_name}

    # Step 1: Add the initial card to the deck
    Add a card to the Deck    ${card_name}

    # Step 2: Loop to add more copies until there are 36 copies
    FOR    ${index}    IN RANGE    100
        ${value}    Get Attribute    //span[text()="${card_name}"]/../../../..//input    Value

        # Step 3: Check if there are already 36 copies in the deck
        IF    ${value} <= 36    Add a card to the Deck    ${card_name}
        IF    ${value} >= 36    BREAK
    END

Add cards from a Json file to the Deck
    [Documentation]    This test case reads card names from a JSON file, cleans them by removing spaces, slashes, and square brackets, and then adds them to the deck one by one.
    [Arguments]    ${Decklist}    ${Index_Number}=0

    # Step 1: Load card names from a JSON file
    ${file}    Load Json From File    ${CURDIR}${/}Decklist-Najeela.json

    # Step 2: Extract card names from the JSON data
    @{cardlist}    Get Value From Json    ${file}    $..name

    # Step 3: Loop through each card name and add it to the deck
    FOR    ${Card}    IN    @{cardlist}
        # Clean the card name by removing spaces, slashes, and square brackets
        ${card_name}    Replace String    ${Card}    " "    ""    # Remove spaces
        ${card_name}    Replace String    ${card_name}    "/"    ""    # Remove slashes
        ${card_name}    Replace String    ${card_name}    "["    ""    # Remove square brackets
        ${card_name}    Replace String    ${card_name}    "]"    ""

        # Log the cleaned card name (optional, for debugging)
        Log    Adding card to the Deck: ${card_name}

        # Add the cleaned card name to the deck using the custom keyword
        Add a card to the Deck    ${card_name}
    END

Remove a Card from Deck
    [Documentation]    This test case removes a card from the deck based on the provided card name.
    [Arguments]    ${Card_name}

    # Step 1: Load card data from a JSON file
    ${file}    Load Json From File    ${CURDIR}${/}Decklist-Najeela.json

    # Step 2: Get the Moxfield-ID of the card based on its name
    ${Moxfield-ID}    Get Value From Json    ${file}    $..cards[?(@.name == '${Card_name}')].Moxfield-ID

    # Step 3: Convert the Moxfield-ID to a string and remove square brackets
    ${Moxfield-ID}    Convert Json To String    ${Moxfield-ID}
    ${Moxfield-ID}    Strip String    ${Moxfield-ID}    characters=[]""

    # Step 4: Log the Moxfield-ID (optional, for debugging)
    Log    Removing card with Moxfield-ID: ${Moxfield-ID}

    # Step 5: Click on the card in the deck to open the card options
    Click    //div[@data-hash="${Moxfield-ID}"]//a//span[@class="fa-stack-1x fa-solid fa-caret-down icon-stack-small"]

    # Step 6: Wait for the "Remove" option to appear and click on it
    Wait For Elements State    //span[contains(text(),"Remove")]
    Click    //span[contains(text(),"Remove")]
