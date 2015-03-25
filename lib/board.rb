class Board
  attr_reader :board_state
  def initialize
    @board_state = { A1: 0, A2: 0, B1: 0, B2: 0 }
  end

  def place(ship, position)
    fail 'Ship placed outside board' unless @board_state.key?(position)
    fail 'There is a ship here already' unless @board_state[position] == 0
    @board_state[position] = ship
  end

  def empty?
    @board_state == { A1: 0, A2: 0, B1: 0, B2: 0 }
  end

  def hit(position)
    fail 'You hit outside!' unless @board_state.key?(position)
    @board_state[position] != 0 ? @board_state[position] = "hit" : @board_state[position] = "miss"
  end

  def hits
    hits_hash = @board_state.select{ |key,value| value == "hit" }
    hits_hash.count
  end

  def misses
    misses_hash = @board_state.select { |key, value| value == "miss" }
    misses_hash.count
  end
end