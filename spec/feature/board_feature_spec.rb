require 'capybara/rspec'
require 'ship'
require 'board'

feature 'Player can place a ship on the board' do
  scenario 'it places a ship on any cell of the board' do
    ship = Ship.new
    board = Board.new
    board.place(ship, :A2)
    expect(board.board_state).to eq ({ A1: 0, A2: ship })
  end

  scenario 'error is raised if placed outside board' do
    ship = Ship.new
    board = Board.new
    expect { board.place(ship, :D4) }.to raise_error 'Ship placed outside board'
  end
end

feature 'Player can hit the board' do
  scenario 'it hits the board and changes the state' do
    board = Board.new
    board.hit(:A2)
    expect(board.board_state).to eq ({ A1: 0, A2: 1 })
  end
end



