# == Schema Information
#
# Table name: formulation_ingredients
#
#  id             :integer          not null, primary key
#  formulation_id :integer
#  ingredient_id  :integer
#  percentage     :float
#

require 'rails_helper'

RSpec.describe FormulationIngredient, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:percentage) }
    it { should validate_numericality_of(:percentage).is_greater_than(0).is_less_than_or_equal_to(100) }
  end

  describe "Associations" do
    it { should belong_to(:formulation) }
    it { should belong_to(:ingredient) }
  end
end
