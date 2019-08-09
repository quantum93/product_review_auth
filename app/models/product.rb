class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
   # validates_length_of :content_body, maximum: 250
   # validates_length_of :content_body, minimum: 50

  # scope for most reviewd product
  scope :most_reviewed, -> {(
    select("products.id, products.name, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  # scope for three recent products
  scope :three_recent_products, -> { order(created_at: :desc).limit(3)}
  # scope for country_of_origin query
  scope :local_product, -> { ( where(country_of_origin: "United States").limit(5)) }

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
