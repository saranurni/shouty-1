Feature:  Temoerature Converter

Allows users to convert temperatures from Celsius to Fahrenheit and vice versa.

Rule: Users can use up and down arrow button to change temperature
     Scenario: India wants to increase temperature by 1
        Given the celsius bar has input of 5
        And the fahrenheit bar has input of 41
        When India presses up button in celsisus bar
        Then celsius bar has input of 6
        And fahrenheit bar has input of 42.8


Rule: Users can input negative values and convert to the other temperature

     Scenario: Callum wants to find out how much -5C is in F
        Given the starting values are 0
        When Callum presses the down button in C box
        Then Callum sees 23F in the F box

