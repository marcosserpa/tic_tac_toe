require 'byebug'

lib = File.expand_path(File.dirname(__FILE__))
Dir[lib + "/**/*.rb"].each { |file| require file }

begin
  puts ""
  puts "Enter the name of the first player "
  player_x_name = gets.chomp
  puts "Enter the name of the second player "
  player_o_name = gets.chomp
end while (player_x_name && player_o_name).nil?

player_x = TicTacToe::Player.new(player_x_name)
player_x.marker = 'X'
player_o = TicTacToe::Player.new(player_o_name)
player_o.marker = 'O'

puts "To play, you need to consider the positions below. Choose one and report to do the machine!!"
puts ""

puts " 1 | 2 | 3 "
puts " --------- "
puts " 4 | 5 | 6 "
puts " --------- "
puts " 7 | 8 | 9 "
puts ""

puts "==========================================================="

game = TicTacToe::Game.new(player_x, player_o)
game.play
