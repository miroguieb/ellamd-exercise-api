# == Schema Information
#
# Table name: formulation_ingredients
#
#  id             :integer          not null, primary key
#  formulation_id :integer
#  ingredient_id  :integer
#  percentage     :float
#

class FormulationIngredient < ApplicationRecord
  belongs_to :formulation
  belongs_to :ingredient
end
