Feature:  Tic Tac Toe game

    Select different boxes from 9x9 grid to play game

Rule: Players take turns to select boxes, when one player achieves three in a row, they win.

     Scenario: Player 1 (X) and Player 2 (O) are playing together
        Given the players take turns selecting a box from each grid
        And the players chooses one box from the grid
        When Player 1 has three in a row
        Then Player 1 wins and player 2 loses.