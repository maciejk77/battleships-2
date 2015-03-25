require 'board'

describe Board do
  it 'when created, the board is empty' do
    expect(subject.empty?).to be true
  end
  it 'when hit outside the board returns an error' do
    expect { subject.hit([0, 5])}.to raise_error "You hit outside!"
  end
  it 'throws an error when ships overlap' do
    subject.place(:ship, [0, 0]) 
    expect { subject.place(:ship, [0, 0]) }.to raise_error "There is a ship here already"
  end
  it 'it can return the number of hits' do
    subject.place(:ship, [0, 0])
    subject.hit([0, 0])
    expect(subject.hits).to eq 1
  end
  # it 'given position should return coordinates' do
  #   expect(subject.hash_to_array(:A1)).to eq [0, 0] 
  # end

end

