require './Player.rb'

class MathGame

  def initialize
    @players = [Player.new, Player.new]
    @current_player = 0
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "Player #{@current_player + 1}: What does #{num1} plus #{num2} equal?"
    num1 + num2
  end

  def game_over
    @players[0].lives == 0 || @players[1].lives == 0
  end

  def play
    puts "----- GAME START -----"
    until game_over
      puts ""
      puts "----- NEW TURN -----"
      question_answer = generate_question
      answer = gets.chomp.to_i

      if answer == question_answer
        puts "Player #{@current_player + 1}: YES! You are correct"
      else
        puts "Player #{@current_player + 1}: NO! You are wrong"
        @players[@current_player].lose_life

      end
      puts "P1: #{@players[0].lives}/3 vs. P2: #{@players[1].lives}/3"

      switch_player
      if game_over
        puts ""
        puts "Player #{@current_player + 1} wins with a score of #{@players[@current_player].lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end
      
    end
  end
end