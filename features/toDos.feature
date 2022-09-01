Feature:  To Dos

    Able to add, delete and edit tasks to a list.

Rule: User can make a to do list using tasks

     Scenario: Eden wants to edit a task to add 'today'
        Given 'Learn Vue' is already a task listed on the app
        When Eden presses edit button
        Then Eden can add 'today'

    Scenario: Amy want to add a task to the list
        Given the app is loaded in the browser
        When Amy writes her task in the bar
        And clicks the 'add' button
        Then her task will appear on the list

    Scenario: Riley wants to remove a task
        Given there are tasks present in the list
        When Riley clicks 'remove' button
        Then the task disappears from the list

    Scenario: Cat wants to cross off a task
        Given Cat has completed the task
        When Cat presses the complete button
        Then the task disappears from the list
