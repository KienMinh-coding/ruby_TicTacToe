# "X | O | X\n---------\nX | O | X\n---------\nX | O | X"

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def get_player_input(board)
  move = gets.chomp.to_i
  check_player_input(move, board)
end

def check_player_input(move, board)
  if board.include?(move) == true || Array(1..9).include?(move) == false
    puts "You made a wrong move. Please try again"
    get_player_input(board)
  else
    pass_input_to_board(move, board)
  end
end

def pass_input_to_board(move, board)
  board[move - 1] = move
  puts board
end

get_player_input(board)
