# frozen_string_literal: true

require 'player'


describe 'tic tac toe Player' do
    it "are input by user with correspnding TTT position and converts to index position" do
        test = Player.new("X")
        allow_any_instance_of(Player).to receive(:gets).and_return(1)
        expect(test.select_position).to eq(0)
    end
    it "are input by user with correspnding position and converts to index position" do
        test = Player.new("X")
        allow_any_instance_of(Player).to receive(:gets).and_return(4)
        expect(test.select_position).to eq(3)
    end
    it "are input by user with correspnding TTT position and converts to index position" do
        test = Player.new("X")
        allow_any_instance_of(Player).to receive(:gets).and_return(9)
        expect(test.select_position).to eq(8)
    end

end