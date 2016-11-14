class Grain < ApplicationRecord
  validates :market_name, presence: true
  validates :mark_number, presence: true, uniqueness: true
end
