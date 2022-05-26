# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor = :token,
                  def initialize
                    @board = Board.new
                    @player_1 = Player.new('X')
                    @finish = false
                  end

  def moves
    puts 'Welcome to Tic Tac Toe'
    puts @board.display_board_to_console
    while @finish == false
      player_changes_board_on_turn
      puts @board.display_board_to_console
      end_game
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def post_player_position(index)
    @board.new_board[index] = @player_1.token
  end

  def player_changes_board_on_turn
    position = @player_1.user_input
    index = input_to_index(position)
    valid_move(index)
  end

  def valid_move(index)
    if @board.new_board[index] == 'X' || @board.new_board[index] == 'O'
      puts 'already occupied, please make another selection'
      player_changes_board_on_turn
    else
      post_player_position(index)
    end
  end

  def end_game
    if @board.new_board[8] == 'X'
      @finish = true
      puts 'game over'
    else
      @finish = false
    end
  end
end
