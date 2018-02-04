class Ingredient < ApplicationRecord
  has_many :formulation_ingredients
  has_many :formulations, through: :formulation_ingredients
end
