class Setting < ApplicationRecord
  def self.current
    first_or_create(rate: 0)
  end
end
