require_relative "tic_tac_toe"

@board_size = 0
@game_board = []
@current_player = ""
@is_winner = false

# main method for game play
def game_play
  create_board
  choose_marker
  print_board
  until @is_winner
    add_marker
    turn
  end
end

# allows player to create a dynamic board
def create_board
  # if yes gameboard size = player input else defaults to 3 x 3
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
    game_play
  end

  @board_size.times do
    row_to_add = []
    @board_size.times do
      row_to_add << " "
    end
    @game_board << row_to_add
  end
end

# allows player to decide what marker they want to use
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

# checks for a winner if no winner or draw switches player turn
def turn
  win_check
  @current_player = @current_player == "x" ? "o" : "x"
end

# checks for a winner using the TicTacToe class
def win_check
  winner = TicTacToe.new(@game_board).winner
  if winner == "x" || winner == "o"
    @is_winner = true
    p "Player "+@current_player + " wins!"
    reset_game
  elsif winner == "draw"
    p "Its a draw"
    reset_game
  end
end

# resets game and all vars
def reset_game
  p "Start new game?"
  response = gets.chomp.downcase
  if response.start_with?('y')
    @board_size = 0
    @game_board = []
    @current_player = ""
    @is_winner = false
    game_play
  end
  exit(true) # Exits with "success" code
end

# displays the current state of the board
def print_board
  p '=' * (@game_board.size * 5)
  @game_board.each do |row|
    p row
  end
  p '=' * (@game_board.size * 5)
end

# gets input for player to set the marker position
def add_marker
  p "Player " + @current_player +": Select Coordinates"
  row = validate_row
  update_col(row)
  print_board
end

# gets player to select a column and returns index of Game Board
def validate_row
  row = nil
  # ask user what row they want and relates to board array index
  while true
    p "Select Row :"
    p "1 - "+ @board_size.to_s
    row = gets.chomp.to_i
    if row <= @board_size && row >= 1
      row -= 1
      # test to see if any slots are left in row
      row_str = @game_board[row].join.delete(' ')
      if row_str.length != @board_size
        break
      else
        p "No Slots left in this Row"
      end
    end
  end
  row
end

# places the marker in row index if empty
def update_col(row)
  col = nil
  while true
    p "Select Column"
    p "1 - "+ @board_size.to_s
    col = gets.chomp.to_i
    if col <= @board_size && col >= 1
      col -= 1
      # test to see if any slots are left in column and sets it to that col if empty
      if @game_board[row][col] == " "
        @game_board[row][col] = @current_player
        break
      else
        p "Slot not empty"
      end
    end
  end
  col
end

game_play