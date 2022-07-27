Dir[File.dirname(__FILE__) + '/attack_modes/*.rb'].each {|file| require file }

class AttackMode
  class << self
    MODES = {
      "closest-first" => AttackModes::ClosestFirst,
      "furthest-first" => AttackModes::FurthestFirst,
      "avoid-crossfire" => AttackModes::AvoidCrossfire,
      "prioritize-t-x" => AttackModes::PrioritizeTX
    }

    def call(mode, radars)
      MODES[mode].attack(radars)
    end
  end
end