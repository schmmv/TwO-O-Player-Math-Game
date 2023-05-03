require './player'
require './question'

class Game

  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
  end

  def start
    while @player1.lives > 0 && @player2.lives > 0 do 
      ask_question
    end
    game_over
  end

  def ask_question
    @question = Question.new
    puts "#{@current_player.name}: #{@question.question}"
    response = gets.chomp.to_i
    
    if response == @question.answer 
      puts "#{@current_player.name}: YES! You are correct."
    else
      @current_player.lives -= 1
      puts "#{@current_player.name}: Seriously? No!"
    end

    @current_player = @current_player == @player1 ? @player2 : @player1
    tally_lives
  end

  def tally_lives
    puts "P1 lives: #{@player1.lives}/3 vs P2 lives: #{@player2.lives}/3"
  end

  def game_over
    puts "---- GAME OVER -----"
    if @player1.lives == 0
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    else
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    end 
    puts "Good bye!"
  end

end 

