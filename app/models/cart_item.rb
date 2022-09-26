class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  paginates_per 25

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('img/cake.jpg')
      image.attach(io: File.open(file_path), filename: 'cake.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def subtotal
    item.with_tax_price * amount
  end
end
