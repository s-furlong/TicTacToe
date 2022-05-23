require 'board'
describe 'the tic tac toe board' do
    it 'has a strings value corresponding to number on board' do
        board = Board.new
        ttt_board = %w[1 2 3 4 5 6 7 8 9]
        expect(board.value_board).to eq(ttt_board)
    end

    it 'has variable that display string values as TTT board' do
        board = Board.new
        value_board = %w[1 2 3 4 5 6 7 8 9]
        # rubocop:disable Layout/LineLength
        console_ttt = " #{value_board[0]} | #{value_board[1]} | #{value_board[2]}\n___|___|___\n #{value_board[3]} | #{value_board[4]} | #{value_board[5]}\n___|___|___\n #{value_board[6]} | #{value_board[7]} | #{value_board[8]}"
        # rubocop:enable Layout/LineLength
        expect(board.new_board).to eq(console_ttt)
    end
end