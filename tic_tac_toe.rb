class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    marker = ''
    is_draw = false

    # runs through each win scenario to check if winner || draw || unfinished game
    if check_rows != nil
      marker =  check_rows
    elsif check_columns != nil
      marker = check_columns
    elsif check_diagonals != nil
      marker = check_diagonals
    else
      is_draw = is_finished?
    end

    # if there is not a winner return draw or unfinished game
    if marker.empty?
      return is_draw ? "draw" : "unfinished"
    end

    # return the marker of the game winner
    marker
  end

  # checks for horizontal wins on a scalable board
  def check_rows
    row_winner = nil

    # joins row and checks iteration count of x or o in strings to find winner
    @board.each do |row|
      row_str = row.join
      if row_str.count('x') == @board.size
        row_winner = 'x'
      elsif row_str.count('o') == @board.size
        row_winner = 'o'
      end
    end

    row_winner
  end

  # checks for vertical wins on a scalable board
  def check_columns
    column_winner = nil

    # index in arrays will be representations of board column
    x_arr =[]
    o_arr =[]
    # arrays will be the size of the board default value for each column will be 0
    @board.size.times do
      x_arr << 0
      o_arr << 0
    end

    # updates amount in x or o array as a column based on marker = x or o
    @board.each do |row|
      row.each_with_index do |marker, index|
        if marker == 'x'
          x_arr[index] += 1
          # checks if winner to break out of loop
          if x_arr[index] == @board.size
            column_winner = 'x'
            break
          end
        elsif marker == 'o'
          o_arr[index] += 1
          # checks if winner to break out of loop
          if o_arr[index] == @board.size
            column_winner = 'o'
            break
          end
        end

      end
    end

    column_winner
  end

  # checks for diagonal wins on a scalable board
  def check_diagonals
    diagonal_winner = nil
    # stores the markers
    backward_diagonal = ''
    forward_diagonal = ''

    # for a diagonal to be a winner it takes the row[n], row[n+1], row[n+2] and so on..
    @board.each_with_index do |row,index|

      # check if left to right diagonal is a winner
      row.each_with_index do |marker, position|
        if position == index
          backward_diagonal += marker
        end
      end

      # check if right to left diagonal is a winner
      reversed_row = row.reverse
      reversed_row.each_with_index do |marker, position|
        if position == index
          forward_diagonal += marker
        end
      end
    end

    # checks iteration count of x or o in strings to find winner
    if backward_diagonal.count('x') == @board.size || forward_diagonal.count('x') == @board.size
      diagonal_winner = 'x'
    elsif backward_diagonal.count('o') == @board.size || forward_diagonal.count('o') == @board.size
      diagonal_winner = 'o'
    end

    diagonal_winner
  end

  # to verify if game is draw or unfinished
  def is_finished?
    @board.each do |row|
      row_str = row.join.delete(' ')
      if row_str.length < @board.size
        return false
      end
    end

    true
  end

end
