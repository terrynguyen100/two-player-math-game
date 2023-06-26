require './Player.rb'
require './MathGame.rb'

player = Player.new
puts player.lives
player.lose_life
puts player.lives
