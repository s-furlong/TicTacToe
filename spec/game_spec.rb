# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  context 'while player adds token to board' do
    it 'allows player to select position and switches to the next player' do
      game = Game.new
      allow($stdin).to receive(:gets).and_return('1')
      next_player = game.switch_player
      expect(next_player.token).to eq('O')
    end

    it 'allows the game to end' do
      game = Game.new
      allow($stdin).to receive(:gets).and_return('9')
      next_player = game.end_game
      expect(next_player).to be false
    end

    it 'allow the player to input selecion and converts to index position' do
      game = Game.new
      allow($stdin).to receive(:gets).and_return('9')
      selection_index = game.ask_player_for_selection
      expect(selection_index).to eq(8)
    end

    it 'changes the player to the next token' do
      game = Game.new
      allow($stdin).to receive(:gets).and_return('9')
      next_player = game.switch_player.token
      expect(next_player).to eq('O')
    end

    it 'will post the players token to the board when index is selected' do
      game = Game.new
      next_player = game.post_player_position(8)
      expect(next_player).to eq('X')
    end
  end
end
