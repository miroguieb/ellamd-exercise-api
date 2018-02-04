class Formulation < ApplicationRecord
  has_many :formulation_ingredients
  has_many :ingredients, through: :formulation_ingredients
end
