# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  board = Board.new
  it 'has a strings value corresponding to number on board' do
    ttt_board = %w[1 2 3 4 5 6 7 8 9]
    expect(board.value_board).to eq(ttt_board)
  end

  it 'has a strings value corresponding to number on board' do
    test = Game.new
    allow($stdin).to receive(:gets).and_return(1)
    expect(test.new_game).to eq(1)
  end
end
