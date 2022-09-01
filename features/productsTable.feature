Feature:  Products Table

    App allows consumers to search for fruits and vegetables to check their availability and price.

Rule: Consumer uses checkbox to check for 'in stock' products

     Scenario: Paul wants to check what products are in stock
        Given Apple, Dragonfruit, Spinach and Peas are in stock
        When Paul clicks the 'In Stock only' checkbox
        Then Apple, Dragonfruit, Spinach and Peas are listed on the app


Rule:  Consumer can only search for products presented on that list

    Scenario: Daniel wants to check price of Dragonfruit

        Given Dragonfruit is in stock
        And Dragonfruit is on the list
        When Daniel searched for Dragonfruit
        Then Dragonfruit search appeared with price

    Scenario:  Ben wants to search for blueberries

        Given blueberries are not on the list
        When Ben searches for blueberries
        Then the app appears with no results




