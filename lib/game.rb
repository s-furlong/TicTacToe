# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'validator'
require_relative 'rules'

class Game
  attr_accessor :token, :current_player

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @finish = false
    @current_player = @player_1
    @validator = Validator.new(@board)
    @rules = Rules.new(@board)
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
          puts '**INVALID** Please select a number between 1 and 9.'
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

  def end_game
    if @rules.win?
      switch_player
      @finish = true
      puts "CONGRATS!!, ***PLAYER #{@current_player.token}*** is the WINNER!!!"
    elsif @rules.tie_end?
      @finish = true
      puts 'game over, this game is a draw'
    else
      @finish = false
    end
  end
end
