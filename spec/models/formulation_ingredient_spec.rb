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
  pending "add some examples to (or delete) #{__FILE__}"
end
