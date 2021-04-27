class Player
    attr_accessor :name, :life_points

    def initialize(name)
      @name = name.to_s
      @life_points = 10
    end

    def show_state
      puts "#{name} a #{life_points} points de vie."
    end

    def gets_damage(damage_points)
      @life_points -= damage_points
     puts "Le joueur #{name} a pris #{damage_points} de dégats ! Il a maintenant #{life_points} points de vie."

     if @life_points <= 0
      puts "Le joueur #{name} a #{life_points} points de vie, il a été tué !"
      end
    end

    def attacks(other_player)
      puts "#{name} attaque #{other_player.name} !"
      damage = compute_damage
      other_player.gets_damage(damage)
      
    end

    def compute_damage
      return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level, :name, :life_points

  def initialize(name)
    @name = name.to_s
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et a une arme de niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6)*@weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6) 
    puts "Tu as trouvé une arme de niveau : #{new_weapon} !"

    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! Elle est meilleure que ton arme actuelle, tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  
  def search_health_pack
    new_heal = rand(1..6)
    case new_heal
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points <= 50
      @life_points += 50
      puts show_state
      else
        @life_points = 100
        puts show_state
      end
    when 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points <= 20
        @life_points += 80
        puts show_state
        else
          @life_points = 100
          puts show_state
        end
  end
end
end



