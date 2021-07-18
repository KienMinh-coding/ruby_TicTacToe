# "X | O | X\n---------\nX | O | X\n---------\nX | O | X"
class Player
  @@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  @@move = 0
  @@moves_of_player = []

  def move
    puts "  1 2 3    _|_|_\n  4 5 6 →  _|_|_\n  7 8 9     | | "
    puts "\n#{@@board[0]} | #{@@board[1]} | #{@@board[2]}\n---------\n#{@@board[3]} | #{@@board[4]} | #{@@board[5]}\n---------\n#{@@board[6]} | #{@@board[7]} | #{@@board[8]}\n\n\n===========\n"
    if @@move.even? == true
      puts "You are X, make a move!"
    else
      puts "You are O, make a move!"
    end
    move = gets.chomp.to_i
    check_move(move)
  end

  private
  def check_move(move)
    if @@moves_of_player.include?(move) == true || Array(1..9).include?(move) == false
      puts "You made a wrong move. Please try again"
      self.move
    else
      @@move += 1
      @@moves_of_player << move
      pass_move_to_board(move)
    end
  end

  def pass_move_to_board(move)
    if @@move.odd? == true
      @@board[move - 1] = "X"
    else
      @@board[move - 1] = "O"
    end
    check_result
  end

  def check_result
    if (@@board[0] == @@board[1] && @@board[1] == @@board[2] && @@board[2] != " ") ||
       (@@board[3] == @@board[4] && @@board[4] == @@board[5] && @@board[4] != " ") ||
       (@@board[6] == @@board[7] && @@board[7] == @@board[8] && @@board[8] != " ") ||
       (@@board[0] == @@board[3] && @@board[3] == @@board[6] && @@board[6] != " ") ||
       (@@board[1] == @@board[4] && @@board[4] == @@board[7] && @@board[4] != " ") ||
       (@@board[2] == @@board[5] && @@board[5] == @@board[8] && @@board[2] != " ") ||
       (@@board[0] == @@board[4] && @@board[4] == @@board[8] && @@board[4] != " ") ||
       (@@board[2] == @@board[4] && @@board[4] == @@board[6] && @@board[6] != " ")
    then
      puts "\n#{@@board[0]} | #{@@board[1]} | #{@@board[2]}\n---------\n#{@@board[3]} | #{@@board[4]} | #{@@board[5]}\n---------\n#{@@board[6]} | #{@@board[7]} | #{@@board[8]}\n\n\n===========\n" 
      puts "End game. #{@@board[@@moves_of_player.last - 1]} win"
    else
      @@board.include?(" ") == true ? self.move : (puts "End game. Nobody win")
    end
  end
end
player = Player.new
player.move
