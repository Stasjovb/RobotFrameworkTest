*** Settings ***
Documentation    This resource file contains the keywords to create decks on Moxfield
Library    Browser

*** Variables ***

*** Keywords ***
Create a Deck
    [Documentation]    this keyword allows the user to create a deck within moxfield
    [Arguments]    ${Name_of_the_deck}    ${Name_of_format}    ${Name_of_commander}=${EMPTY}
    ...        ${Name_of_signature_spell}=${EMPTY}    ${set}=${EMPTY}    
    ...    ${Folder}=${EMPTY}    ${deck_visibily_button}=input#visibility-public-13    ${Existing_Deck_List}=input#decklist-none
    Wait For Elements State    //a[contains(text(),'Home')]    
    Click    //a[contains(text(),'Home')]    
    Wait For Elements State    a#mainmenu-new    
    Click With Options    a#mainmenu-new    clickCount=2
    Fill Text    input#name    ${Name_of_the_deck}
    Select Options By    select#format    label    ${Name_of_format}
    IF  $Name_of_format == "Archon" or $Name_of_format == "Brawl" or $Name_of_format == "Centurion" or $Name_of_format == "Commander / EDH" or $Name_of_format == "Conquest" or $Name_of_format == "Duel Commander" or $Name_of_format == "Historic Brawl" or $Name_of_format == "Leviathan" or $Name_of_format == "Pauper EDH" or $Name_of_format == "PreDH" or $Name_of_format == "Commander / EDH" or $Name_of_format == "Russian Duel Commander" or $Name_of_format == "Tiny Leaders"
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
    Select Options By    select#deckFolderId    label    ${Folder}
    Click    selector=${deck_visibily_button}
    Click    ${Existing_Deck_List}
    Click    //span[contains(text(),'Create')]
    Wait For Elements State    //span[contains(text(),'Playtest')]    visible
    
    