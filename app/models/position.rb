class Position < ApplicationRecord
  belongs_to :radar

  def as_json(options={})
    super(only: [:x, :y])
  end

  def distance
    ((x ** 2) + (y ** 2)) ** 0.5
  end
end
