# frozen_string_literal: true

require 'console'

describe 'tic tac toe console' do
  context 'when displaying in the console' do
    it 'will dispay welcome message to user' do
      console = Console.new
      welcome_test = 'Welcome to Tic Tac Toe'

      welcome_console = console.output(console.welcome)

      expect(welcome_console).to eq(welcome_test)
    end

    it 'will dispay the current board to the user' do
      console = Console.new
      board = Board.new
      welcome_test = "\n 1 | 2 | 3\n---+---+---\n 4 | 5 | 6\n---+---+---\n 7 | 8 | 9\n\n"

      welcome_console = console.output(console.game_board(board))

      expect(welcome_console).to eq(welcome_test)
    end

    it 'will display a message if move is invalid' do
      console = Console.new
      invalid_test = '**INVALID** Please select a number between 1 and 9.'

      invalid_console = console.output(console.invalid_move)

      expect(invalid_console).to eq(invalid_test)
    end

    it 'will prompt the player to select a postion on the board' do
      console = Console.new
      player = Player.new('X')
      input_test = '***Player X*** Select a value between 1 and 9!'

      input_console = console.output(console.input_selection(player.token))

      expect(input_console).to eq(input_test)
    end

    it 'will display a message if move is invalid' do
      console = Console.new
      invalid_test = '**INVALID** Please select a number between 1 and 9.'

      invalid_console = console.output(console.invalid_move)

      expect(invalid_console).to eq(invalid_test)
    end

    it 'will display a win message when a player has won' do
      console = Console.new
      player = Player.new('X')
      winner_test = 'CONGRATS!!, ***PLAYER X*** is the WINNER!!!'

      winner_console = console.output(console.win_game(player.token))

      expect(winner_console).to eq(winner_test)
    end

    it 'will display a win message when a player has won' do
      console = Console.new
      player = Player.new('X')
      winner_test = 'CONGRATS!!, ***PLAYER X*** is the WINNER!!!'

      winner_console = console.output(console.win_game(player.token))

      expect(winner_console).to eq(winner_test)
    end

    it 'will display a tie message if no one wins and game is full' do
      console = Console.new
      tie_test = 'game over, this game is a draw'

      tie_console = console.output(console.tie_game)

      expect(tie_console).to eq(tie_test)
    end
  end
end
