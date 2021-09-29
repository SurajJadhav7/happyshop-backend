require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_inclusion_of(:sold_out).in_array([true, false]) }
  it { should validate_presence_of(:category) }
  it { should validate_inclusion_of(:under_sale).in_array([true, false]) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:sale_price) }
  it { should validate_presence_of(:sale_text) }
end
