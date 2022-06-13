# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'validator'
require_relative 'win_rules'
require_relative 'console'

class Game
  attr_accessor :token, :current_player

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @finish = false
    @current_player = @player_1
    @validator = Validator.new(@board)
    @rules = WinRules.new(@board)
    @console = Console.new
  end

  def launch_game
    terminal(@console.welcome)
    terminal(@console.game_board(@board))
    until @finish
      valid_move = false
      until valid_move
        player_selection_index = ask_player_for_selection
        valid_move = @validator.selection_is_valid?(player_selection_index)
        if valid_move
          post_player_position(player_selection_index)
          switch_player
        else
          terminal(@console.invalid_move)
        end
      end
      terminal(@console.game_board(@board))
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
    terminal(@console.input_selection(@current_player.token))
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
      terminal(@console.win_game(@current_player.token))
    elsif @rules.tie_end?
      @finish = true
      terminal(@console.tie_game)
    else
      @finish = false
    end
  end

  private

  def terminal(message)
    puts @console.output(message)
  end
end
