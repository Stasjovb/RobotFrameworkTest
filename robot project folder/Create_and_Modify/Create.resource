*** Settings ***
Documentation    This resource file contains the keywords to create decks on Moxfield
Library    Browser

*** Variables ***

*** Keywords ***
Create a Deck
    [Documentation]    This keyword allows the user to create a deck within Moxfield with customizable parameters.
    [Arguments]    ${Name_of_the_deck}    ${Name_of_format}    ${Name_of_commander}=${EMPTY}
    ...        ${Name_of_signature_spell}=${EMPTY}    ${set}=${EMPTY}
    ...    ${Folder}=${EMPTY}    ${deck_visibility_button}=input#visibility-public-13
    ...    ${Existing_Deck_List}=input#decklist-none

    # Step 1: Navigate to the Home page
    Wait For Elements State    //a[contains(text(),'Home')]
    Click    //a[contains(text(),'Home')]

    # Step 2: Open the "New Deck" page
    Wait For Elements State    a#mainmenu-new
    Click With Options    a#mainmenu-new    clickCount=2

    # Step 3: Fill in deck details
    Fill Text    input#name    ${Name_of_the_deck}
    Select Options By    select#format    label    ${Name_of_format}

    # Step 4: Handle specific format conditions
    IF  $Name_of_format == "Archon" or $Name_of_format == "Brawl" or ...
        Fill Text    input#commander    ${Name_of_commander}
        Click        //a[contains(text(),'${Name_of_commander}')]
    ELSE IF    $Name_of_format == "Oathbreaker"
        Fill Text    input#commander    ${Name_of_commander}
        Fill Text    input#signatureSpell    ${Name_of_signature_spell}
    ELSE IF    $Name_of_format == "Primordial"
        Select Options By    select.form-select    label    ${set}
    ELSE
        No Operation
    END

    # Step 5: Select deck folder and visibility
    Select Options By    select#deckFolderId    label    ${Folder}
    Click    selector=${deck_visibility_button}
    Click    ${Existing_Deck_List}

    # Step 6: Create the deck
    Click    //span[contains(text(),'Create')]

    # Step 7: Wait for the deck to be created
    Wait For Elements State    //span[contains(text(),'Playtest')]    visible