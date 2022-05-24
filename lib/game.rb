# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor = :marker
  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
  end

  def new_game
    game_over = 0
    puts 'Tic Tac Toe Human versus Human'
    board = @board.value_board
    index = @player_1.select_position
    update_board(board, index)
  end

  def update_board(_board, index)
    player = @player_1.set_mark
    @board.value_board[index] = player
    @board.display_board
  end
end
