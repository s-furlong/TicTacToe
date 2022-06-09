# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'validator'

class Game
  attr_accessor :token, :current_player

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @finish = false
    @current_player = @player_1
    @validator = Validator.new(@board)
  end

  def launch_game
    puts 'Welcome to Tic Tac Toe'
    puts @board.display_board_to_console
    while @finish == false
      valid_move = false
      while valid_move == false
        player_selection_index = ask_player_for_selection
        valid_move = @validator.selection_is_valid?(player_selection_index)
        if valid_move
          post_player_position(player_selection_index)
          switch_player
        else
          puts 'Invalid Selection, Please selection 1 to 9'
        end
      end
      puts @board.display_board_to_console
      end_game
    end
  end

  def input_to_index(select_position)
    select_position.to_i - 1
  end

  def post_player_position(index)
    @board.mark(index, @current_player.token)
  end

  def ask_player_for_selection
    puts "***Player #{@current_player.token}*** Select a value between 1 and 9!"
    position = @current_player.select_position
    index = input_to_index(position)
  end

  def switch_player
    @current_player = if @current_player == @player_1
                        @player_2
                      else
                        @player_1
                      end
  end

  def horizontal_win?
    top_row_win = (@board.new_board[0] != '1') && three_all_same_token(@board.new_board[0, 3])
    middle_row_win = (@board.new_board[3] != '4') && three_all_same_token(@board.new_board[3, 3])
    bottom_row_win = (@board.new_board[6] != '7') && three_all_same_token(@board.new_board[6, 3])
    top_row_win || middle_row_win || bottom_row_win
  end

  def vertical_win?
    left_vert_win = (@board.new_board[0] != '1') && three_all_same_token([@board.new_board[0], @board.new_board[3],
                                                                          @board.new_board[6]])
    mid_vert_win = (@board.new_board[1] != '2') && three_all_same_token([@board.new_board[1], @board.new_board[4],
                                                                         @board.new_board[7]])
    right_vert_win = (@board.new_board[2] != '3') && three_all_same_token([@board.new_board[2], @board.new_board[5],
                                                                           @board.new_board[8]])
    left_vert_win || mid_vert_win || right_vert_win
  end

  def diagonal_win?
    top_left_to_bottom_win = (@board.new_board[0] != '1') && three_all_same_token([@board.new_board[0],
                                                                                   @board.new_board[4], @board.new_board[8]])
    top_right_to_bottom_win = (@board.new_board[2] != '3') && three_all_same_token([@board.new_board[2],
                                                                                    @board.new_board[4], @board.new_board[6]])

    top_left_to_bottom_win || top_right_to_bottom_win
  end

  def tie_end?
    @board.new_board.all? { |spot| %w[X O].include?(spot) }
  end

  def three_all_same_token(win_array)
    win_array.uniq.count <= 1
  end

  def end_game
    if horizontal_win? || vertical_win? || diagonal_win?
      switch_player
      @finish = true
      puts "CONGRATS!!, ***PLAYER #{@current_player.token}**** your a winner!!!"
    elsif tie_end?
      @finish = true
      puts 'game over, this game is a draw'
    else
      @finish = false
    end
  end
end

