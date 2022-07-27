class Radar < ApplicationRecord
  has_one :position, required: true
  has_many :targets
  accepts_nested_attributes_for :position, allow_destroy: true
  accepts_nested_attributes_for :targets, allow_destroy: true

  def as_json(options={})
    {
      position: position.as_json,
      targets: targets.where.not(damage: nil)
        .order("damage desc")&.map(&:target_type)
    }
  end
end
