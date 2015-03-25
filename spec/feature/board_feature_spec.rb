require 'capybara/rspec'
require 'ship'
require 'board'

feature 'Player can place a ship on the board' do
  let(:ship) {Ship.new}
  let(:board) {Board.new}

  scenario 'it places a ship on any cell of the board' do
    board.place(ship, [0, 1])
    expect(board.hash_board).to eq ({ [0, 0] => 0, [0, 1] => ship, [1, 0] => 0, [1, 1] => 0  })
  end

  scenario 'error is raised if placed outside board' do
    expect { board.place(ship, [0, 5]) }.to raise_error 'Ship placed outside board'
  end

  scenario 'it is placed on multiple spaces horizontally on the board' do
    board.place(ship, [0, 0])
    expect(board.hash_board).to eq ({ [0, 0] => 'ship', [0, 1] => 'ship', [1, 0] => 0, [1, 1] => 0 })
  end
end

feature 'Player can hit the board' do
  scenario 'it hits the board and changes the state' do
    board = Board.new
    board.hit([0, 1])
    expect(board.hash_board).to eq ({ [0, 0] => 0, [0, 1] => "miss", [1, 0] => 0, [1, 1] => 0  })
  end
end

feature 'Player can see their hits and misses' do
  let(:ship) {Ship.new}
  let(:board) {Board.new}

  scenario 'it returns all hits and misses' do
    board.place(ship, [0, 0])
    board.hit([0, 0])
    board.hit([0, 1])
    expect(board.hash_board).to eq ({ [0, 0] => "hit", [0, 1] => "miss", [1, 0] => 0, [1, 1] => 0  })
  end

  scenario 'it returns number of hits' do
    board.place(ship, [0, 0])
    board.hit([0, 0])
    expect(board.hits).to eq 1
  end

  scenario 'it return number of misses' do
    board.place(ship, [0, 0])
    board.hit([0, 1])
    expect(board.misses).to eq 1
  end
end
