class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
   # validates_length_of :content_body, maximum: 250
   # validates_length_of :content_body, minimum: 50

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
