class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :CartItems, dependent: :destroy
  has_one_attached :image
  has_many_attached :slider_images

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :name, :description, :quantity, presence: true
  scope :with_slider_images, -> {
      joins(:slider_images_attachments)
    }
end
