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

class Ingredient < ApplicationRecord
  has_many :formulation_ingredients
  has_many :formulations, through: :formulation_ingredients
end
