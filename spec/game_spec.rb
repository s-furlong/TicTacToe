# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  context 'while player adds token to board'

  it 'allows player to select position and switches to the next player' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    next_player = game.player_changes_board_on_turn
    expect(next_player.token).to eq('O')
  end

  it 'does not allow a position on the baord to be selected twice' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    next_player = game.valid_move(1)
    expect(next_player).to eq('X')
  end

  it 'will validate the move as true or false' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    next_player = game.valid_move(1)
    expect(next_player).to be_truthy
  end

  it 'allows the game to end' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    next_player = game.end_game
    expect(next_player).to be false
  end

  it 'displays which player has a turn by their token in the console' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    next_player = game.player_changes_board_on_turn
    next_player = next_player.token
    expect(next_player).to eq('O')
  end

  it 'changes the player to the next token' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('9')
    next_player = game.switch_player.token
    expect(next_player).to eq('O')
  end

  it 'ends in a tie if all spots are taken and there is winning combo' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    first_move_check_for_tie = game.tie_end?
    expect(first_move_check_for_tie).to be false
  end

  it 'should return false when a player has made the first move' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    expect(game.horizontal_win?).to eq(false)
  end

  it 'should return false when a player has made the first move' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    expect(game.vertical_win?).to eq(false)
  end

  it 'should return false when a player has made the first move' do
    game = Game.new
    allow($stdin).to receive(:gets).and_return('1')
    expect(game.diagonal_win?).to eq(false)
  end
end
