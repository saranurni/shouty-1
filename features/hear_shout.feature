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

Rule: Message must be less than the maximum character length.

# TODO: Actually test for hearing and not the shouting so we can incorporate the network
    Scenario: Message is too long
        Given the range is 100
        And the maximum character length is 140
        And Sean is located at 0
        And Lucy is located at 50
        When Sean shouts,
            """
            This is a really long message
            so long in fact that I am not going to
            be allowed to send it, at least if I keep
            typing like this until the length is over
            the limit of 180 characters.
            """
        Then Lucy does not hear Sean's shout
            And an error message is received that states "Message is too long"

