module AttackModes
  class ClosestFirst
    class << self
      def attack(radars)
        radars.map do |radar|
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
