# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  context 'while player adds token to board'

  it 'allows player to select position on the board and return assigned token' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    input = game.player_changes_board_on_turn
    expect(input).to eq('X')
  end
end
