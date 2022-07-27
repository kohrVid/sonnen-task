class Radar < ApplicationRecord
  has_one :position, required: true
  has_many :targets
  accepts_nested_attributes_for :position, allow_destroy: true
  accepts_nested_attributes_for :targets, allow_destroy: true

  def as_json(options = { target_order: "damage DESC" })
    sanitized_sql_statement = ActiveRecord::Base.sanitize_sql_array(
      [options[:target_order]]
    )

    {
      position: position.as_json,
      targets: targets.where.not(damage: nil)
                      .order(Arel.sql(sanitized_sql_statement))
                      &.map(&:target_type)
    }
  end
end
