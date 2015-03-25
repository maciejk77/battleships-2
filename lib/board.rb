class Board
  attr_reader :board_state
  attr_reader :hash_board
  def initialize
    # @board_state = [[0, 0], [0, 0], [0, 0], [0, 0]]
    # @array_board = [[0, 0], [0, 1], [1, 0], [1, 1]]
    @hash_board = { [0, 0] => 0, [0, 1] => 0, [1, 0] => 0, [1, 1] => 0 }
  end

  def place(ship, position)
    # fail 'Ship placed outside board' unless @board_state.key?(position)
    fail 'There is a ship here already' unless @hash_board[position] == 0
    @hash_board[position] = ship
  end

  def empty?
    @hash_board == { [0, 0] => 0, [0, 1] => 0, [1, 0] => 0, [1, 1] => 0 }
  end

  def hit(position)
    # fail 'You hit outside!' unless @board_state.key?(position)
    @hash_board[position] != 0 ? @hash_board[position] = "hit" : @hash_board[position] = "miss"
    #   @board_state[position] = "hit"
    # else
    #   @board_state[position] = "miss"
    # end
  end

  def hits
    hits_hash = @hash_board.select{ |key,value| value == "hit" }
    hits_hash.count
  end

  def misses
    misses_hash = @hash_board.select{ |key, value| value == "miss" }
    misses_hash.count
  end

  # def hash_to_array(position)
  #   array = @hash_board[position]
  #   row = array[0]
  #   column = array[1]
  #   @board_state[row][column]
end

# we want hash of the array of array locations to give us an array location and do stuff with it, like 
# we used to do with the hash keys

# hash_board[A1] => gives [0,0]. Take first item, apply to board state, take second item and apply to board 
# state and then do something

# array = @hash_board[:A1]
# row = array[0]
# column = array[1]

# search array for row + column
# (i.e.) board_state[row+column]

# gives us what's in that location, and then we can proceed as normal

