class Board
  attr_reader :board_state
  def initialize
    @board_state = { A1: 0, A2: 0 }
  end

  def place(ship, position)
    @board_state[position] = ship
  end

  def empty?
    @board_state == { A1: 0, A2: 0 }
  end

  def hit(position)
    fail 'You hit outside!' unless @board_state.key?(position)
    @board_state[position] = 1
  end
end
