def init
  @board_size = 0
  @game_board = []
  @current_player = ""
  create_board
  choose_marker

end

def create_board
  p "Select custom board size?(y/N)"
  response = gets.chomp.downcase
  if response.start_with?('n')
    @board_size = 3
  elsif response.start_with?('y')
    p "Enter board size greater than 2"
    until @board_size > 2
      @board_size = gets.chomp.to_i
    end
  else
    init
  end

  @board_size.times do
    row_to_add = []
    @board_size.times do
      row_to_add << " "
    end
    @game_board << row_to_add
  end
end

def choose_marker
  p "Select marker (x/o)"
  response = gets.chomp.downcase
  if response.start_with?('x')
    @current_player = "x"
  elsif response.start_with?('o')
    @current_player = "o"
  else
    choose_marker
  end
end
init