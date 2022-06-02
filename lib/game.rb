# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :token, :current_player

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @finish = false
    @current_player = @player_1
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
    @board.new_board[index] = @current_player.token
  end

  def player_changes_board_on_turn
    puts "***Player #{@current_player.token}*** Select a value between 1 and 9!"
    position = @current_player.user_input
    index = input_to_index(position)
    valid_move(index)
    switch_player
  end

  def switch_player
    @current_player = if @current_player == @player_1
                        @player_2
                      else
                        @player_1
                      end
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
    if @board.new_board[8] == 'X' || @board.new_board[8] == 'O'
      @finish = true
      puts 'game over'
    else
      @finish = false
    end
  end
end
