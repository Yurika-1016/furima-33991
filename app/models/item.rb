class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days

  with_options presence: true do
    validates :name
    validates :content
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :shipping_area_id
      validates :shipping_days_id
    end
  end
end
