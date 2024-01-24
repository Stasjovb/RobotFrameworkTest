*** Settings ***
Documentation    This resource file contains the keywords to create decks on Moxfield
Library    Browser
Library    OperatingSystem
Library    JSONLibrary
Library    Collections
Library    String 
Variables    Decklist-Najeela.json
Resource    ../Generic_keywords.resource

*** Variables ***

*** Keywords ***
Click on the verticle Elipsis to edit a decks properties in Moxfield
    [Arguments]    ${Deck_name}    ${Edit_properties}
    in moxfield Navigate to "Your Decks"
    Click    //tr[.//*[contains(text(), '${Deck_name}')]]//a[contains(@class,"text-muted")][1]
    Wait For Elements State    //a[contains(text(),'${Edit_properties}')]
    Click    //a[contains(text(),'${Edit_properties}')]

Click on the pop-up to permanently delete your deck
    Wait For Elements State    //span[contains(text(),'Permanently Delete')]
    Click    //span[contains(text(),'Permanently Delete')]

Open decklist to add and remove cards
    [Arguments]     ${Deck_name}    ${Format_name}
    Wait For Elements State    (//tr[td/a[contains(text(),'${Deck_name}')] and td/span[contains(text(),'${Format_name}')]]/td/a)[1]
    Click    (//tr[td/a[contains(text(),'${Deck_name}')] and td/span[contains(text(),'${Format_name}')]]/td/a)[1]
    Wait For Elements State    //span[contains(text(),'${Deck_name}')]

Add a card to the Deck
    [Arguments]    ${card_name}
    Fill Text    input#deckbox-search    ${card_name}
    Wait For Elements State    //a[text()="${card_name}"]
    Click    //a[text()="${card_name}"]

Add lands to the deck
    [Arguments]    ${card_name}
    Add a card to the Deck    ${card_name}
    FOR  ${index}  IN RANGE  100
        ${value}=    Get Attribute    //span[text()="${card_name}"]/../../../..//input    Value
        Run Keyword If    ${value} <= 36    Add a card to the Deck    ${card_name}
        Exit For Loop If    ${value} >= 36
    END

Add cards from a Json file to the Deck
    [Arguments]    ${Decklist}    ${Index_Number}=0
    ${file}    Load Json From File    ${CURDIR}${/}Decklist-Najeela.json
    @{cardlist}    Get Value From Json    ${file}    $..name

    FOR  ${Card}  IN   @{cardlist}
        ${card_name} =    Replace String    ${Card}    " "    ""        # Remove spaces
        ${card_name} =    Replace String    ${card_name}    "/"    ""    # Remove slashes
        ${card_name} =    Replace String    ${card_name}    "["    ""    # Remove square brackets
        ${card_name} =    Replace String    ${card_name}    "]"    ""
        
        # Log the cleaned card name (optional, for debugging)
        Log    Adding card to the Deck: ${card_name}
        
        # Add the cleaned card name to the deck using the custom keyword
        Add a card to the Deck    ${card_name}
    END

    
remove a Card from Deck
    [Arguments]    ${Card_name}
    ${file}    Load Json From File    ${CURDIR}${/}Decklist-Najeela.json
    ${Moxfield-ID}    Get Value From Json    ${file}    $..cards[?(@.name == '${Card_Name}')].Moxfield-ID
    ${Moxfield-ID}    Convert Json To String    ${Moxfield-ID}
    ${Moxfield-ID}    Strip String   ${Moxfield-ID}    characters=[]""
    log    message=${Moxfield-ID}
    Click    //div[@data-hash="${Moxfield-ID}"]//a//span[@class="fa-stack-1x fa-solid fa-caret-down icon-stack-small"]
    Wait For Elements State    //span[contains(text(),"Remove")]
    Click    //span[contains(text(),"Remove")]


