require 'board'

describe Board do
  it 'when created, the board is empty' do
    board = Board.new
    expect(board.empty?).to be true
  end
  it 'when hit outside the board returns an error' do
    board = Board.new
    expect { board.hit(:D4) }.to raise_error "You hit outside!"
  end
  it 'throws an error when ships overlap' do
    board = Board.new
    board.place(:ship, :A2) 
    expect { board.place(:ship, :A2) }.to raise_error "There is a ship here already"
  end
end

