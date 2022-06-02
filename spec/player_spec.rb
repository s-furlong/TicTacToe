# frozen_string_literal: true

require 'player'

describe 'tic tac toe Player' do
  it 'is assinged a token to mark the board' do
    @player = Player.new('X')
    expected_token = @player.token
    expect(expected_token).to eq('X')
  end

  it 'can input to interact with the board and is address player by token' do
    @player = Player.new('X')

    tokens = %w[X O]

    allow($stdin).to receive(:gets).and_return(tokens)
    expect(@player.user_input).to eq(tokens)
  end
end
