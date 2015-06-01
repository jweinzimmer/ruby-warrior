
class Player
  attr_accessor :warrior
  def play_turn(warrior)
    self.warrior = warrior
    actions?
  end
 def actions?
    if warrior.look[1].enemy? && warrior.look[2].stairs?
      warrior.shoot!
    elsif warrior.health == 20 && warrior.look[0].empty? && warrior.look[1].empty? && warrior.look[2].enemy? && warrior.look(:backward)[1].wall? && warrior.look(:backward)[0].empty?
      warrior.walk!
 		elsif warrior.feel.enemy?
 			warrior.attack!
 		elsif warrior.feel.captive?
    	warrior.rescue!
    elsif warrior.look[1].captive?
    	warrior.walk!
    elsif warrior.look[2].enemy?
			warrior.shoot!
    elsif warrior.feel(:backward).empty? && warrior.look[1].enemy? && warrior.look[2].empty? && warrior.look(:backward)[1].empty? == false
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).captive?
    	warrior.rescue!(:backward)
    elsif warrior.feel.wall?
      warrior.pivot!
    else
      warrior.walk! && warrior.attack!
    end
  end 
end
//adding a commit
