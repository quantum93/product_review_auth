require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  # it { should validate_length_of(:content_body).is_at_most(250) }
  # it { should validate_length_of(:content_body).is_at_least(50) }
end

describe Product do
  it("titleizes the name of an product") do
    product = Product.create({name: "bibimbop", cost: 5, country_of_origin: "Republic of Korea"})
    expect(product.name()).to(eq("Bibimbop"))
    expect(product.cost()).to(eq(5))
    expect(product.country_of_origin()).to(eq("Republic of Korea"))
  end
end
