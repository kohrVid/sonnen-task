class Target < ApplicationRecord
  alias_attribute :type, :target_type
  belongs_to :radar
end
