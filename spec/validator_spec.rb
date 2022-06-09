# frozen_string_literal: true

require 'validator'
require 'board'

describe 'tic tac toe validation' do
  context 'while player adds token to board' do
    it 'should recieve a true output if the space is already taken my an X or an O' do
      board = Board.new
      board.mark(0, 'X')
      valid = Validator.new(board)

      valid_space = valid.space_occupied?(0)

      expect(valid_space).to eq(true)
    end

    it 'should return false if a validation test is true' do
      board = Board.new
      valid = Validator.new(board)

      board.mark(0, 'X')

      valid_space = valid.selection_is_valid?(0)

      expect(valid_space).to eq(false)
    end

    it 'should return true if a validation test is false' do
      board = Board.new
      valid = Validator.new(board)

      valid_space = valid.selection_is_valid?(0)

      expect(valid_space).to eq(true)
    end

    it 'should allow user to access indexes 0 to 8' do
      board = Board.new
      valid = Validator.new(board)

      valid_selection = valid.correct_index?(0)

      expect(valid_selection).to eq(true)
    end

    it 'should return false if user selects 10' do
      board = Board.new
      valid = Validator.new(board)

      valid_selection = valid.correct_index?(10)

      expect(valid_selection).to eq(false)
    end

    it 'should return false if a validation test is true' do
      board = Board.new
      valid = Validator.new(board)

      valid_space = valid.selection_is_valid?(9)

      expect(valid_space).to eq(false)
    end
  end
end
