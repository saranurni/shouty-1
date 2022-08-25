Feature: Hear shout

    Shouty allows users to hear shouts from other users as long as they are in range.

Rule: Shouts can be heard by everyone within range.

    Scenario: Listener is within range of a shout
        Given the range is 100
        And Sean is located at 0
        And Lucy is located at 50
        When Sean shouts "Hello"
        Then Lucy hears Sean's shout