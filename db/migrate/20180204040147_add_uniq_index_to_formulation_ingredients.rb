class AddUniqIndexToFormulationIngredients < ActiveRecord::Migration[5.1]
  def change
    add_index :formulation_ingredients, [:formulation_id, :ingredient_id], unique: true, name: 'index_formulation_ingredients_on_ids'
  end
end
