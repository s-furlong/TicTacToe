# frozen_string_literal: true

require 'board'
describe 'the tic tac toe board' do
  it 'has a strings value corresponding to number on board' do
    board = Board.new
    ttt_board = %w[1 2 3 4 5 6 7 8 9]
    expect(board.value_board).to eq(ttt_board)
  end

  it 'has 9 spaces that resemble a TTT board' do
    new_board = Board.new
    board_length = new_board.value_board.length
    expect(board_length).to eq(9)
  end
end
