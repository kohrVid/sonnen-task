module AttackModes
  class FurthestFirst
    class << self
      def attack(radars)
        radars.map do |radar|
          {
            radar: radar,
            distance: radar.position.distance
          }
        end.sort_by do |radar|
          radar[:distance]
        end.map do |radar|
          radar[:radar]
        end.last
      end
    end
  end
end
