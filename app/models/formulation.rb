# == Schema Information
#
# Table name: formulations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Formulation < ApplicationRecord
  has_many :formulation_ingredients
  has_many :ingredients, through: :formulation_ingredients
end
