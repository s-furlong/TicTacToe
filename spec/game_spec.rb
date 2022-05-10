# frozen_string_literal: true

require 'game'

describe 'tictactoe game' do
  it 'should make a new object' do
    game = Game.new
    expect(game).to be_instance_of(Game)
  end
end
