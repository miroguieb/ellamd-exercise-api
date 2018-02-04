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

  validates :percentage, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :formulation_id, uniqueness: { scope: :ingredient_id }
end
