# frozen_string_literal: true

require_relative 'board'
require_relative 'player'


class Game
  attr_accessor = :token,
  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @count = 0
  end

  def new_game
    puts 'Tic Tac Toe Human versus Human'
    puts @board.display_board_to_console
    player_changes_board_on_turn
    puts @board.display_board_to_console
      
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
    post_player_position(index)
  end




end
