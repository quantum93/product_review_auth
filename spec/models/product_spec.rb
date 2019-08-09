require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  # product = Product.create(name: "OLIVE SALAD")
  # it { should validate_length_of(:content_body).is_at_most(250) }
  # it { should validate_length_of(:content_body).is_at_least(50) }
end
