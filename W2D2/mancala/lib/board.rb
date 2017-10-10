class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2  = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      cup << :stone
      cup << :stone
      cup << :stone
      cup << :stone
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(1..14).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    gems = @cups[start_pos]
    @cups[start_pos] = []

    i = 0
    while gems.length > 0
      current_cup = @cups[(start_pos + 1 + i) % 13]
      current_cup << gems.shift
      i += 1
    end

    if current_cup.count == 1
      render
      next_turn((start_pos + 1 + i) % 13)
    end

  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all? {|cup| cup.empty?} ||  @cups[7..12].all? { |cup| cup.empty?}
  end

  def winner
    if @cups[6].count > @cups[13].count
      @name1
    elsif @cups[13].count > @cups[6].count
      @name2
    else
      :draw
    end
  end
end
