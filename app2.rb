require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'


puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Quel est ton nom ?"
user = HumanPlayer.new(gets.chomp.to_s)
puts "Bienvenue dans l'arène #{user.name} !"

enemies = []
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

while user.life_points >0 && (player2.life_points > 0 || player1.life_points > 0)

    puts "Voici l'état de ton personnage :"
    puts user.show_state

    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts ""
    puts "attaquer un joueur en vue :"
    if player1.life_points > 0 
    puts "0 - Josiane a #{player1.life_points} points de vie"
    end
    if player2.life_points > 0 
    puts "1 - José a #{player2.life_points} points de vie"
    end
    menu = gets.chomp.to_s
    case menu
    when "a"
        user.search_weapon
    when "s"
        user.search_health_pack
    when "0"
        user.attacks(player1)
    when "1"
        user.attacks(player2)
    else 
    puts "Fallait choisir une vraie option, tant pis tu passes ton tour !"
    end
    gets.chomp

    if player1.life_points > 0 && player2.life_points > 0
    puts "Les autres joueurs attaquent !"
    end
    enemies.each do |enemy|
        if enemy.life_points > 0
            enemy.attacks(user)
        end
    end
end
puts "La partie est finie"
if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end