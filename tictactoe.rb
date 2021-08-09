require 'pry'

module PlayerMove
  def action(turn)
    this_move = ["","",""]
    puts "Player #{turn}'s turn, ~~MAKE YOUR MOVE~~\n"
    while !(1..3).include? this_move[0] do
      puts "What Row? Please Enter a Number from 1 to 3"
      this_move[0] = gets.chomp.to_i
    end
    while !(1..3).include? this_move[1] do
      puts "What Column? Please Enter a Number from 1 to 3"
      this_move[1] = gets.chomp.to_i
    end
    this_move[0]-=1
    this_move[1]-=1
    if turn == 1
      this_move[2] = "X"
    else
      this_move[2] = "O"
    end
    return this_move
    
  end
end

class PlayGame
  include PlayerMove
  attr_accessor :turn, :board, :win_cond, :turn_count, :playerMove, :this_board_move
  @board = [["[ ]","[ ]","[ ]"],["[ ]","[ ]","[ ]"],["[ ]","[ ]","[ ]"]]
  
  @this_board_move = ["","",""]
  def initialize
    @win_cond = "no"
    @turn_count = 0
    @playerMove = 1
    @board = [["[ ]","[ ]","[ ]"],["[ ]","[ ]","[ ]"],["[ ]","[ ]","[ ]"]]
    puts "\nLet's Play Some Fuckin' Tic-Tac-Toe!\n"
    PrintBoard()
  end

  def PrintBoard()
    puts "\nBoard:"
    puts "\n#{@board[0][0]} #{@board[0][1]} #{@board[0][2]}"
    puts "#{@board[1][0]} #{@board[1][1]} #{@board[1][2]}"
    puts "#{@board[2][0]} #{@board[2][1]} #{@board[2][2]}\n\n"
  end

  def CalculateWinCondition
    if ((@board[0][0]=="[X]" && @board[0][1]=="[X]" && @board[0][2]=="[X]") || (@board[0][0]=="[O]" && @board[0][1]=="[O]" && @board[0][2]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[1][0]=="[X]" && @board[1][1]=="[X]" && @board[1][2]=="[X]") || (@board[1][0]=="[O]" && @board[1][1]=="[O]" && @board[1][2]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[2][0]=="[X]" && @board[2][1]=="[X]" && @board[2][2]=="[X]") || (@board[2][0]=="[O]" && @board[2][1]=="[O]" && @board[2][2]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[0][0]=="[X]" && @board[1][0]=="[X]" && @board[2][0]=="[X]") || (@board[0][0]=="[O]" && @board[1][0]=="[O]" && @board[2][0]=="[O]"))
      @win_cond = "yes"
    elsif ((@board[0][1]=="[X]" && @board[1][1]=="[X]" && @board[2][1]=="[X]") || (@board[0][1]=="[O]" && @board[1][1]=="[O]" && @board[2][1]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[0][2]=="[X]" && @board[1][2]=="[X]" && @board[2][2]=="[X]") || (@board[0][2]=="[O]" && @board[1][2]=="[O]" && @board[2][2]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[0][0]=="[X]" && @board[1][1]=="[X]" && @board[2][2]=="[X]") || (@board[0][0]=="[O]" && @board[1][1]=="[O]" && @board[2][2]=="[O]")) 
      @win_cond = "yes"
    elsif ((@board[0][2]=="[X]" && @board[1][1]=="[X]" && @board[2][0]=="[X]") || (@board[0][2]=="[O]" && @board[1][1]=="[O]" && @board[2][0]=="[O]")) 
      @win_cond = "yes"
    end
  end

end

a = PlayGame.new()

while(a.turn_count< 9 && a.win_cond == "no") do
    if a.playerMove == 1
      a.this_board_move = a.action(1)
      if a.board["#{a.this_board_move[0]}".to_i]["#{a.this_board_move[1]}".to_i] != "[ ]"
        puts "\n~~Please Choose a New Space, That One is Already Taken, Dingus~~\n\n"
        redo
      end
      a.board["#{a.this_board_move[0]}".to_i]["#{a.this_board_move[1]}".to_i] = "[#{a.this_board_move[2]}]"
      a.turn_count+=1
      a.CalculateWinCondition
      if(a.win_cond=="yes")
        puts "\n\nPlayer #{a.playerMove} wins the game!\n\n"
      end
      a.playerMove = 2
      a.PrintBoard
    else
      a.this_board_move = a.action(2)
      if a.board["#{a.this_board_move[0]}".to_i]["#{a.this_board_move[1]}".to_i] != "[ ]"
        puts "\n~~Please Choose a New Space, That One is Already Taken, Dingus~~\n\n"
        redo
      end
      a.board["#{a.this_board_move[0]}".to_i]["#{a.this_board_move[1]}".to_i] = "[#{a.this_board_move[2]}]"
      a.turn_count+=1
      a.CalculateWinCondition
      if(a.win_cond=="yes")
        puts "\n\nPlayer #{a.playerMove} wins the game!\n\n"
      end
      a.playerMove = 1
      a.PrintBoard
    end
end