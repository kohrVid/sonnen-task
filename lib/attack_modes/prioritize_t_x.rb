module AttackModes
  class PrioritizeTX
    class << self
      def attack(radars)
        radars.flat_map do |radar|
          radar.targets.select{ |target| target.target_type == "T-X" }
        end.map(&:radar).first
      end

      def target_order
        <<-SQL
          CASE target_type
            WHEN 'T-X'
              THEN 0
            ELSE target_type
          END
        SQL
      end
    end
  end
end
