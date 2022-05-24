# frozen_string_literal: true

require 'game'

describe 'tic tac toe Game' do
  attr_reader :board_index

  board = Board.new
  it 'has a strings value corresponding to number on board' do
    ttt_board = %w[1 2 3 4 5 6 7 8 9]
    expect(board.value_board).to eq(ttt_board)
  end

  it 'game class creates onject that allows player to select value on the board' do
    board = Board.new
    test = board.value_board[0].to_i
    allow_any_instance_of(Game).to receive(:gets).and_return(1)
    expect(test).to eq(1)
  end
end
