class Position < ApplicationRecord
  belongs_to :radar

  def distance
    ((x ** 2) + (y ** 2)) ** 0.5
  end
end
