class Board
  attr_reader :board_state
  def initialize
    @board_state = { A1: 0, A2: 0, B1: 0, B2: 0 }
  end

  def place(ship, position, direction=1)
    fail 'Ship placed outside board' unless @board_state.key?(position) # position_check(position, ship) 
    fail 'There is a ship here already' unless @board_state[position] == 0
    @board_state[position] = ship
    next_cell(ship, position, direction) if ship.size > 1
  end
  
  def next_cell(ship, position, direction)
    case direction
    when 0
      letter = (position.to_s.split("")[0].ord-1).chr
      number = position.to_s.split("")[1]
      place_new_position(letter, number, ship)

    when 1
      @board_state[position.next] = ship
      # letter = position.to_s.split("")[0]
      # number = position.to_s.split("")[1].next
      # new_symbol = (letter + number).to_sym
      # @board_state[new_symbol] = ship

    when 2
      letter = position.to_s.split("")[0].next
      number = position.to_s.split("")[1]
      place_new_position(letter, number, ship)

    when 3
      number = (position.to_s.split("")[1].ord-1).chr
      letter = position.to_s.split("")[0]
      place_new_position(letter, number, ship)
    end

  end

  def place_new_position(letter, number, ship)
    new_symbol = (letter + number).to_sym
    @board_state[new_symbol] = ship
  end


  # def position_check(position, ship)
    
  #   next_position = position.next
  #   @board_state.key?(next_position)
  # end

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
