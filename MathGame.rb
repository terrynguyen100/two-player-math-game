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
    [num1, num2]
  end

  def game_over
    @players[0].lives == 0 || @players[1].lives == 0
  end

  def play
    puts "----- GAME START -----"
    until game_over
      puts "----- NEW TURN -----"
      num1, num2 = generate_question
      puts num1
      puts num2
      switch_player
      @players[@current_player].lose_life
    end
  end
end