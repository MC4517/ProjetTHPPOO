require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'


puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quel est ton nom ?"
print "> "
user_name = gets.chomp


my_game = Game.new(user_name)
my_game.show_players


while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice(gets.chomp)
    my_game.show_players
    my_game.enemies_attack
end
my_game.end 
