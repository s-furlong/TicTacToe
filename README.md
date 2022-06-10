# TicTacToe
This is application is a simple tic tac toe game that is created utilizing ruby and Test Driven Development with rspec. This application will have different iterations and features that will be added as stories are released.

## Starting the Game
run the command  that are neccesary to run the gems in this program.
    `bundle install`

The game will launch through a runner file and will allow a human player to play against another human player and a computer with varying degrees of difficulty. The game will be launched in the console with the following command:
    `ruby lib/runner.rb`

## Playing the Game
The game will launch and will display the tic tac toe board.

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9

 Player One will be prompted to select a number between 1 and 9 that will mark an X on the board. Player two will then be prompted to do the same thing in the terminal to mark an O on the board. The game ends when a player has successfully mark three spaces in succession vertically, horizontally, or diagonally. If no player connects three spaces, then the game will end in a tie.

 ## Starting testing
For testing, `rpec` will used in the development process to test the desired behavior of the tic tac toe game. `rspec` will need to be launched a separate console.
    `bundle exec guard`
This will launch rspec will update tests continuously in real time that are created in the `spec` folder. Once this is operating, simply press <kbd>return</kbd> to launch all the tests.

To run individual test, in the console utilize the following commands for variety of specific tests
    `rspec` - will run all the tests
    `rspec spec/board_spec.rb` - will run all the tests for board
    `rspec spec/game_spec.rb` - will run all the tests for game
    `rspec spec/player_spec.rb` - will run all the tests for player
    `rspec spec/rules_spec.rb` - will run all the tests for rules
    `rspec spec/validator_spec.rb` - will run all the tests for validator

Testing is not essential to running the game but will give a glimpse into the development process.
