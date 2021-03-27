class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    row1 = @board[0]
    row2 = @board[1]
    row3 = @board[2]

    # Step one check for wins in a row for the board
    # row checks
    if check_rows != nil
      puts check_rows
    end
    if row1[0] == "o" && row1[1] == "o" && row1[2] == "o"
      return "o"
    end

    if row2[0] == "o" && row2[1] == "o" && row2[2] == "o"
      return "o"
    end

    if row3[0] == "o" && row3[1] == "o" && row3[2] == "o"
      return "o"
    end

    if row1[0] == "x" && row1[1] == "x" && row1[2] == "x"
      return "x"
    end

    if row2[0] == "x" && row2[1] == "x" && row2[2] == "x"
      return "x"
    end

    if row3[0] == "x" && row3[1] == "x" && row3[2] == "x"
      return "x"
    end

    # column checks
    if check_columns != nil
      puts check_columns
    end
    if row1[0] == "o" && row2[0] == "o" && row3[0] == "o"
      return "o"
    end

    if row1[1] == "o" && row2[1] == "o" && row3[1] == "o"
      return "o"
    end

    if row1[2] == "o" && row2[2] == "o" && row3[2] == "o"
      return "o"
    end

    if row1[0] == "x" && row2[0] == "x" && row3[0] == "x"
      return "x"
    end

    if row1[1] == "x" && row2[1] == "x" && row3[1] == "x"
      return "x"
    end

    if row1[2] == "x" && row2[2] == "x" && row3[2] == "x"
      return "x"
    end

    # diagonal checks
    if row1[0] == "o" && row2[1] == "o" && row3[2] == "o"
      return "o"
    end

    if row1[2] == "o" && row2[1] == "o" && row3[0] == "o"
      return "o"
    end

    if row1[0] == "x" && row2[1] == "x" && row3[2] == "x"
      return "x"
    end

    if row1[2] == "x" && row2[1] == "x" && row3[0] == "x"
      return "x"
    end

    return "draw"
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
end
