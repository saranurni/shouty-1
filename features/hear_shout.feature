Feature: Hear shout

    Shouty allows users to hear shouts from other users as long as they are in range.

Rule: Shouts can be heard by everyone within range.

    Scenario: Listener is within range of a shout
        Given the range is 100
        And Sean is located at 0
        And Lucy is located at 50
        When Sean shouts:
            | Hello     |
            | World     |
            | From Mars |
        Then Lucy hears Sean's shout

    Scenario: Listener is not within range of a shout
        Given the range is 100
        And Sean is located at 0
        And Lucy is located at 150
        When Sean shouts "Hello"
        Then Lucy does not hear Sean's shout

# TODO: Consider adding a Scenario with 3 folks - 2 shouters with only 1 in range