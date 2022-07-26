class Radar < ApplicationRecord
  has_one :position, required: true
  has_many :targets
end
