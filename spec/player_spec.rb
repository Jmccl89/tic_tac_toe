# spec/player_spec.rb
require 'spec_helper'

module TicTacToe
  describe Player do
    describe '#initialize' do
      it 'raises a KeyError exception when initialized with {}' do
        expect { Player.new({}) }.to raise_error(KeyError)
      end

      it 'does not raise an error when initialized with a valid init hash' do
        input = { color: 'X', name: 'Someone' }
        expect { Player.new(input) }.to_not raise_error
      end
    end

    describe '#color' do
      it 'returns the color' do
        input = { color: 'X', name: 'Someone' }
        player = Player.new(input)
        expect(player.color).to eq 'X'
      end
    end

    describe '#name' do
      it 'returns the player name' do
        input = { color: 'X', name: 'Someone' }
        player = Player.new(input)
        expect(player.name).to eq 'Someone'
      end
    end
  end
end
