module AttackModes
  class AvoidCrossfire
    class << self
      def attack(radars)
        radars.reject do |radar|
          radar.targets.map(&:target_type).include? "Human"
        end.map do |radar|
          {
            radar: radar,
            distance: radar.position.distance
          }
        end.sort_by do |radar_attr|
          radar_attr[:distance]
        end.map do |radar_attr|
          radar_attr[:radar]
        end.first
      end
    end
  end
end
