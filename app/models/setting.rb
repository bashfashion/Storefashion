class Setting < ApplicationRecord
  has_one_attached :banner_1
  has_one_attached :banner_2
  has_one_attached :banner_3

  def self.current
    first_or_create(rate: 0)
  end
end
