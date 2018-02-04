# == Schema Information
#
# Table name: ingredients
#
#  id                 :integer          not null, primary key
#  name               :string
#  minimum_percentage :float
#  maximum_percentage :float
#  description        :text
#  classes            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:minimum_percentage) }
    it { should validate_numericality_of(:minimum_percentage).is_greater_than(0).is_less_than_or_equal_to(100) }
    it { should validate_presence_of(:maximum_percentage) }
    it { should validate_numericality_of(:maximum_percentage).is_greater_than(0).is_less_than_or_equal_to(100) }
    it { should validate_presence_of(:description) }
  end

  describe "Associations" do
    it { should have_many(:formulation_ingredients) }
    it { should have_many(:formulations).through(:formulation_ingredients) }
  end
end
