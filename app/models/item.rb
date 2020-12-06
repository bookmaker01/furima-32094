class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates_inclusion_of :price, in: 300..9_999_999
  with_options presence: true do
    validates :image
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :explanation
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :guideline
  belongs_to :status
  with_options numericality: { other_than: 0 } do
    validates :area_id
    validates :burden_id
    validates :category_id
    validates :guideline_id
    validates :status_id
  end
end
