require 'capybara/rspec'
require 'battleship'
require 'submarine'

feature 'Ships can be different sizes' do
  scenario 'ships have a default size' do
    ship = Ship.new
    expect(ship.size).to eq 1
  end

  xscenario 'ship can have right size for its type' do
    # ship = Ship.new
  end

  scenario 'is battleship size 4' do
    battleship = Battleship.new
    expect(battleship.size).to eq 4
  end

  scenario 'is submarine size 2' do
    submarine = Submarine.new
    expect(submarine.size).to eq 2
  end
end
