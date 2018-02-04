require 'csv'
require 'json'

def load_csv(fname)
  csv_text = File.read(Rails.root.join('lib', 'seeds', fname))
  
  CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
end

def load_formulations
  csv = load_csv('formulations.csv')

  csv.each do |row|
    Formulation.find_or_create_by(id: row['id']) do |formulation|
      formulation.name = row['name']
    end
  end

  puts "#{csv.count} rows have been added in the formulations table"
end

def load_ingredients
  csv = load_csv('ingredients.csv')

  csv.each do |row|
    Ingredient.find_or_create_by(id: row['id']) do |ingredient|
      ingredient.name = row['name']
      ingredient.minimum_percentage = row['minimum_percentage']
      ingredient.maximum_percentage = row['maximum_percentage']
      ingredient.description = row['description']
      ingredient.classes = JSON.parse(row['classes'])
    end
  end

  puts "#{csv.count} rows have been added in the ingredients table"
end

def load_formulation_ingredients
  csv = load_csv('formulation_ingredients.csv')

  csv.each do |row|
    csv.each do |row|
      FormulationIngredient.create(row.to_hash)
    end
  end

  puts "#{csv.count} rows have been added in the formulation_ingredients table"
end

load_formulations
load_ingredients
load_formulation_ingredients
