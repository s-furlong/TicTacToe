# frozen_string_literal: true

require 'board'

describe 'the tic tac toe board' do
  it 'has a structure to store space values ont the board' do
    @board = Board.new

    board = @board.new_board
    expected_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    expect(board).to eq(expected_board)
  end

  it 'has nine spaces for a game board' do
    @board = Board.new

    board = @board.new_board.length

    expect(board).to eq(9)
  end

  it 'displays in the console to resemble a user friendly tic tac toe board' do
    @board = Board.new

    board_display = @board.display_board_to_console

    expect(board_display).to eq("\n 1 | 2 | 3\n---+---+---\n 4 | 5 | 6\n---+---+---\n 7 | 8 | 9\n\n")
  end

  it 'should record the postion on the selected by the player' do
    @board = Board.new

    marked = @board.mark(2, 'X')

    expect(marked).to eq('X')
  end
end
