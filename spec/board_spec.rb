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
end

