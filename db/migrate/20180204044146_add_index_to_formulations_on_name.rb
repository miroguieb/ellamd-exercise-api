class AddIndexToFormulationsOnName < ActiveRecord::Migration[5.1]
  def change
    add_index :formulations, :name, unique: true
  end
end
