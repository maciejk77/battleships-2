require 'board'

describe Board do
  it 'when created, the board is empty' do
    expect(subject.empty?).to be true
  end
  it 'when hit outside the board returns an error' do
    expect { subject.hit(:D4) }.to raise_error "You hit outside!"
  end
  it 'throws an error when ships overlap' do
    subject.place(:ship, :A2)
    expect { subject.place(:ship, :A2) }.to raise_error "There is a ship here already"
  end
  it 'it can return the number of hits' do
    subject.place(:ship, :A1)
    subject.hit(:A1)
    expect(subject.hits).to eq 1
  end

  it 'item can take up to 2 cells on the board' do
    subject.place(:ship, :A1)
    expect(subject.board_state).to eq ({ A1: :ship, A2: :ship, B1: 0, B2: 0 })
  end

  xit 'throws an error when second (or more) part of ship is off the board' do
    expect { subject.place(:ship, :A2) }.to raise_error 'Ship placed outside board'
  end
end
