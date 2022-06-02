# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  context 'while player adds token to board'

  it 'allows player to select position and switches to the next player' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    input = game.player_changes_board_on_turn
    expect(input.token).to eq('O')
  end

  it 'does not allow a position on the baord to be selected twice' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    input = game.valid_move(1)
    expect(input).to eq('X')
  end

  it 'will validate the move as true or false' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    input = game.valid_move(1)
    expect(input).to be_truthy
  end

  it 'allows the game to end' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    input = game.end_game
    expect(input).to be false
  end

  it 'displays which player has a turn by their token in the console' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    input = game.player_changes_board_on_turn
    input = input.token
    expect(input).to eq('O')
  end

  it 'changes the player to the next token' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    input = game.switch_player.token
    expect(input).to eq('O')
  end
end
