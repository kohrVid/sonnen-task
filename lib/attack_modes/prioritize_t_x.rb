module AttackModes
  class PrioritizeTX
    class << self
      def attack(radars)
        radars.flat_map do |radar|
          radar.targets.select{ |target| target.target_type == "T-X" }
        end.map(&:radar).first
      end
    end
  end
end
