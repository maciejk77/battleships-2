require 'capybara/rspec'
require 'ship'
require 'board'

feature 'Player can place a ship on the board' do
  let(:ship) {Ship.new}
  let(:board) {Board.new}

  scenario 'it places a ship on any cell of the board' do
    board.place(ship, :A2)
    expect(board.board_state).to eq ({ A1: 0, A2: ship })
  end

  scenario 'error is raised if placed outside board' do
    expect { board.place(ship, :D4) }.to raise_error 'Ship placed outside board'
  end
end

feature 'Player can hit the board' do
  scenario 'it hits the board and changes the state' do
    board = Board.new
    board.hit(:A2)
    expect(board.board_state).to eq ({ A1: 0, A2: "miss" })
  end
end

feature 'Player can see their hits and misses' do
  let(:ship) {Ship.new}
  let(:board) {Board.new}

  scenario 'it returns all hits and misses' do
    board.place(ship, :A1)
    board.hit(:A1)
    board.hit(:A2)
    expect(board.board_state).to eq ({ A1: "hit", A2: "miss" })
  end

  scenario 'it returns number of hits' do
    board.place(ship, :A1)
    board.hit(:A1)
    expect(board.hits).to eq 1
  end

  scenario 'it return number of misses' do
    board.place(ship, :A1)
    board.hit(:A2)
    expect(board.misses).to eq 1
  end
end
