# frozen_string_literal: true

class Console
  def output(message)
    message
  end

  def welcome
    'Welcome to Tic Tac Toe'
  end

  def game_board(board)
    board.display_board_to_console
  end

  def input_selection(player)
    "***Player #{player}*** Select a value between 1 and 9!"
  end

  def invalid_move
    '**INVALID** Please select a number between 1 and 9.'
  end

  def win_game(player)
    "CONGRATS!!, ***PLAYER #{player}*** is the WINNER!!!"
  end

  def tie_game
    'game over, this game is a draw'
  end
end
