class Radar < ApplicationRecord
  has_one :position, required: true
  has_many :targets
  accepts_nested_attributes_for :position, allow_destroy: true
  accepts_nested_attributes_for :targets, allow_destroy: true
end
