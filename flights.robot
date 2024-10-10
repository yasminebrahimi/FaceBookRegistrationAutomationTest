*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML


*** Test Cases ***
Assignment5

    #1. Siirry sivulle http://blazedemo.com/ 
    Open Browser    http://blazedemo.com    Chrome
    Maximize Browser Window
    Sleep    3

    #2. Tarkista, että sivulla lukee "Welcome to the Simple Travel Agency!"
    Page Should Contain    Welcome to the Simple Travel Agency!


    #3. Valitse lähtökaupungiksi "Boston" (kirjoita tämä tieto muuttujaan)
    Click Element    name:fromPort
    Select From List By Label    name:fromPort    Boston

    Sleep    3


    #4. Valitse määränpääksi "Cairo" (kirjoita tämä tieto muuttujaan)
     Click Element    name:toPort
    Select From List By Label    name:toPort    Cairo

    Sleep    3

    #5.Tarkista, että Find Flights nappi on valittavissa
    #6. Paina Find Flights nappia 
    Click Button    //input[@value='Find Flights']

    Sleep    5


    #7. Tarkista, että sivulla lukee Flights from Boston to Cairo: (anna kaupunkien nimet luomillasi muuttujilla)
    Page Should Contain    Flights from Boston to Cairo:

    Sleep    1

    #8. Tarkista, että sinulla on ainakin yksi osuma näkyvillä
    ${results}=    Get Element Count    //table/tbody/tr
    Should Be True    ${results} > 0

    #9. Valitse jokin lennoista -> kirjoita muuttujiin muistiin kyseisen lennon hinta, numero ja lentoyhtiö
    ${price}=    Get Text    xpath://table/tbody/tr[2]/td[6]
    ${airline}=    Get Text    xpath://table/tbody/tr[2]/td[3]
    ${flightNumber}=    Get Text    xpath://table/tbody/tr[2]/td[2]

    # Select the flight by clicking the "Choose This Flight" button
    Click Element    xpath://table/tbody/tr[2]/td[1]/input
    Sleep    3

    #10. Tarkista aukeavalta sivulta, että muuttujaan kirjoittamasi matkan hinta, lentoyhtiö ja lennon numero löytyvät sivulta (huomaa, että tässä joudut hieman muuttelemaan muuttujaan viemääsi tietoa (String-kirjasto(?))
    ${confirmPrice}=    Get Text    xpath://p[contains(text(), 'Total Cost')]/em
    ${confirmAirline}=    Get Text    xpath://p[contains(text(), 'Airline')]/em
    ${confirmFlightNumber}=    Get Text    xpath://p[contains(text(), 'Flight Number')]/em


    Should Be Equal As Strings    ${price}    ${confirmPrice}
    Should Be Equal As Strings    ${airline}    ${confirmAirline}
    Should Be Equal As Strings    ${flightNumber}    ${confirmFlightNumber}



    #11. tallena muuttujaan lennon kokonaishinta 



    #12. Täytä matkustajan tiedot kaavakkeelle (aseta kortin kuukausi ja vuosi globaaleiksi muuttujiksi)


    #13. Valitse luottokortiksi Diner's Club
    #Click Button    //input[@value='Find Flights']

    #14. Klikkaa "Remember me"
    #Click Button    //input[@value='Find Flights']

    #15. Klikkaa "Purchase Flight"
    #Click Button    //input[@value='Find Flights']

    #16. Tarkista, että aukeavalta sivulta löytyy teksti "Thank you for your purchase today!"
    #Page Should Contain    Thank you for your purchase today!

    #17. Tarkista, että vanhentumisaika on oikein

    #18. Tarkista, että kokonaishinta on oikein


    #19.Sulje selain
        #Close Browser




