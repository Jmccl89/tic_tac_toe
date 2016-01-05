# spec/board_spec.rb
require 'spec_helper'

module TicTacToe
  describe Board do
    describe '#initialize' do
      it 'initializes the board with a grid' do
        expect { Board.new(grid: 'grid') }.to_not raise_error
      end
    end

    describe '#default_grid' do
      it 'sets the grid with three rows by default' do
        board = Board.new
        expect(board.grid.length).to eq 3
      end

      it 'creates three things in each row by default' do
        board = Board.new
        board.grid.each do |row|
          expect(row.length).to eq 3
        end
      end
    end

    describe '#grid' do
      it 'returns the grid' do
        board = Board.new(grid: 'blah')
        expect(board.grid).to eq 'blah'
      end
    end

    describe '#get_cell' do
      it 'returns the cell based on the (x, y) coordinate' do
        grid = [['', '', ''], ['', '', 'something'], ['', '', '']]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq 'something'
      end
    end

    describe '#set_cell' do
      it 'updates the value of the cell object at a (x, y) coordinate' do
        Cat = Struct.new(:value)
        grid = [[Cat.new('cool'), '', ''], ['', '', ''], ['', '', '']]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, 'meow')
        expect(board.get_cell(0, 0).value).to eq 'meow'
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new('X') }
    let(:y_cell) { TestCell.new('Y') }
    let(:empty) { TestCell.new }

    describe '#game_over' do
      it 'returns :winner if winner? is true' do
        board = Board.new
        allow(board).to receive_messages(winner?: true)
        expect(board.game_over).to eq :winner
      end

      it 'returns :draw if winner? is false and draw? is true' do
        board = Board.new
        allow(board).to receive_messages(winner?: false, draw?: true)
        expect(board.game_over).to eq :draw
      end

      it 'returns false if winner? is false and draw? is false' do
        board = Board.new
        allow(board).to receive_messages(winner?: false, draw?: false)
        expect(board.game_over).to be false
      end

      it 'returns :winner when row has objects with same value' do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, y_cell, x_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :winner when column has objects with same value' do
        grid = [
          [y_cell, x_cell, x_cell],
          [x_cell, x_cell, empty],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :winner when diagonal has objects with same value' do
        grid = [
          [y_cell, y_cell, x_cell],
          [x_cell, x_cell, empty],
          [x_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it 'returns :draw when all spaces on the board are taken' do
        grid = [
          [y_cell, y_cell, x_cell],
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it 'returns false when there is no winner or draw' do
        grid = [
          [y_cell, empty, empty],
          [x_cell, empty, empty],
          [y_cell, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq false
      end
    end
  end
end
