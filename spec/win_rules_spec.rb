# frozen_string_literal: true

require 'win_rules'
require 'board'

describe 'tic tac toe rules' do
  context 'when determining a win or a tie' do
    it 'should end the game with a wins horizontally on the first row' do
      board = Board.new
      board.mark(0, 'X')
      board.mark(1, 'X')
      board.mark(2, 'X')
      rules = WinRules.new(board)

      horizontal = rules.horizontal_win?

      expect(horizontal).to eq(true)
    end

    it 'should end the game with a wins horizontally on the second row' do
      board = Board.new
      board.mark(3, 'X')
      board.mark(4, 'X')
      board.mark(5, 'X')
      rules = WinRules.new(board)

      horizontal = rules.horizontal_win?

      expect(horizontal).to eq(true)
    end

    it 'should end the game with a wins horizontally on the third row' do
      board = Board.new
      board.mark(6, 'X')
      board.mark(7, 'X')
      board.mark(8, 'X')
      rules = WinRules.new(board)

      horizontal = rules.horizontal_win?

      expect(horizontal).to eq(true)
    end

    it 'should end the game with a wins vertical on the left column' do
      board = Board.new
      board.mark(0, 'X')
      board.mark(3, 'X')
      board.mark(6, 'X')
      rules = WinRules.new(board)

      vertical = rules.vertical_win?

      expect(vertical).to eq(true)
    end

    it 'should end the game with a wins vertical on the middle column' do
      board = Board.new
      board.mark(1, 'X')
      board.mark(7, 'X')
      board.mark(4, 'X')
      rules = WinRules.new(board)

      vertical = rules.vertical_win?

      expect(vertical).to eq(true)
    end

    it 'should end the game with a wins vertical on the right colum' do
      board = Board.new
      board.mark(2, 'X')
      board.mark(5, 'X')
      board.mark(8, 'X')
      rules = WinRules.new(board)

      vertical = rules.vertical_win?

      expect(vertical).to eq(true)
    end

    it 'should end the game with a wins vertical on the left diagonal' do
      board = Board.new
      board.mark(0, 'X')
      board.mark(4, 'X')
      board.mark(8, 'X')
      rules = WinRules.new(board)

      diagonal = rules.diagonal_win?

      expect(diagonal).to eq(true)
    end

    it 'should end the game with a wins vertical on the right diagonal' do
      board = Board.new
      board.mark(2, 'X')
      board.mark(4, 'X')
      board.mark(6, 'X')
      rules = WinRules.new(board)

      diagonal = rules.diagonal_win?

      expect(diagonal).to eq(true)
    end

    it 'should should output true if a horizontal game is won' do
      board = Board.new
      board.mark(6, 'X')
      board.mark(7, 'X')
      board.mark(8, 'X')
      rules = WinRules.new(board)

      win = rules.win?

      expect(win).to eq(true)
    end

    it 'should should output true if a vertical game is won' do
      board = Board.new
      board.mark(0, 'X')
      board.mark(3, 'X')
      board.mark(6, 'X')
      rules = WinRules.new(board)

      win = rules.win?

      expect(win).to eq(true)
    end

    it 'should output true and game ends in a tie' do
      board = Board.new
      board.mark(0, 'X')
      board.mark(1, 'O')
      board.mark(2, 'O')
      board.mark(3, 'X')
      board.mark(4, 'X')
      board.mark(5, 'O')
      board.mark(6, 'X')
      board.mark(7, 'X')
      board.mark(8, 'X')
      rules = WinRules.new(board)

      win = rules.tie_end?

      expect(win).to eq(true)
    end

    it 'will output true if board has a combo of all three tokens for one player' do
      board = Board.new
      three_match = WinRules.new(board)
      
      match = three_match.three_all_same_token(["X", "X", "X"])

      expect(match).to eq(true)
    end
  end
end
