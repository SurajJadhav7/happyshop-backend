# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:sold_out).in_array([true, false]) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_inclusion_of(:under_sale).in_array([true, false]) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:sale_price) }
  it { is_expected.to validate_presence_of(:sale_text) }
end
