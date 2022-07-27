class Target < ApplicationRecord
  alias_attribute :type, :target_type
  alias_attribute :number, :damage
  belongs_to :radar
end
