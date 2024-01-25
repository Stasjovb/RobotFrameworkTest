*** Settings ***
Documentation       This resource file contains the keywords to allow the user to Test the Playtesting functionality 

Library             Browser
Resource            ../Generic_keywords.resource


*** Keywords ***
Navigate to the Playtest simulator
    [Documentation]     This keyword allows the user to navigate to the play testing functionality
    Wait For Elements State    //span[@class='d-none d-sm-inline' and text()='Playtest']
    Click    //span[@class='d-none d-sm-inline' and text()='Playtest']
    Wait For Elements State    //span[text()='Player']

Count the number of cards in hand
    [Documentation]    This keyword checks how many cards the user has in their hand. 
    Get Element Count    (//div[@class="bypJmZB_6FEXv4jeVecD"])[1]/div    equal    7

Navigate back to the decklist
    Wait For Elements State    //a[@aria-label="Go back to Deck"]
    Click    //a[@aria-label="Go back to Deck"]
    Log To Console    pressed the X button