module AttackModes
  class Base
    class << self
      def attack(radars)
        raise "Not implemented"
      end

      def target_order
       "damage DESC"
      end
    end
  end
end

