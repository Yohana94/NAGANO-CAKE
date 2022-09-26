class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre
  has_many :order_details

  paginates_per 25

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/cover/a.jpg')
      image.attach(io: File.open(file_path), filename: 'cake.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
